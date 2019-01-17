import boto3, sys

def parseCLIArgs(cliArgs):
    if len(cliArgs) != 4:
        exit(1)
    
    try:
        ecrRepo = cliArgs[1]
        major = int(cliArgs[2])
        minor = int(cliArgs[3])
        return ecrRepo, major, minor
    except:
        exit(1)

def splitInts(imageTag):
    parts = imageTag.split(".")

    if len(parts) > 3:
        return 0, 0, 0, False

    try:
        maj = int(parts[0])
        min = int(parts[1])
        rev = int(parts[2])
        return maj, min, rev, True
    except:
        return 0, 0, 0, False

def maxVer(vL, vR):
    majL, minL, revL, _ = splitInts(vL)
    majR, minR, revR, successR = splitInts(vR)

    if successR == False:
        return vL
    elif majR > majL:
        return vR
    elif minR > minL:
        return vR
    elif revR > revL:
        return vR
    else:
        return vL

ecrRepo, major, minor = parseCLIArgs(sys.argv)
majminStr = str(major) + '.' + str(minor) + '.'

client = boto3.client('ecr')

response = client.list_images(
    repositoryName=ecrRepo,
    filter={'tagStatus':'TAGGED'}
)

if response['ResponseMetadata']['HTTPStatusCode'] != 200:
    exit(1)

imageTags = map(lambda each: each['imageTag'], response['imageIds'])
imageTags = filter(lambda each: each.startswith(majminStr), imageTags)

if len(imageTags) == 0:
    print(str(major) + "." + str(minor) + ".0")
else:
    maxVer = reduce(maxVer, imageTags)

    nextMaj, nextMin, nextRev, success = splitInts(maxVer)

    if success != True:
        exit(1)
    else:
        print(majminStr + str(nextRev + 1))

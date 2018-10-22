package main

import (
	"net/http"

	"github.com/aws/aws-lambda-go/events"
	"github.com/aws/aws-lambda-go/lambda"
)

func main() {
	lambda.Start(ProductListFunction)
}

//ProductListFunction - main entrypoint
func ProductListFunction(request events.APIGatewayProxyRequest) (response events.APIGatewayProxyResponse, err error) {
	return events.APIGatewayProxyResponse{
		StatusCode: http.StatusOK,
		Body:       request.PathParameters["productID"],
	}, nil
}

package orderrestapi

import "github.com/gin-gonic/gin"

func StartAPI() {
	ngn := buildEngine()

	ngn.Run(":8089")
}

func buildEngine() *gin.Engine {
	ngn := gin.Default()

	return ngn
}

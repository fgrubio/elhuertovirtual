package routers

import (
	"Plants/controllers"

	"github.com/astaxie/beego"
)

func init() {
	beego.Router("/", &controllers.MainController{})
	beego.Router("/inicio", &controllers.PlantController{})
	beego.Router("/crear", &controllers.PlantController{}, "get:Crear")
}

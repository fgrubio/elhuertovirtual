package routers

import (
	"Plants/controllers"

	"github.com/astaxie/beego"
)

func init() {
	beego.Router("/", &controllers.MainController{})
	beego.Router("/inicio", &controllers.PlantController{}, "get:Añade")
	beego.Router("/elim", &controllers.PlantController{}, "get:Elim")
	beego.Router("/crear", &controllers.PlantController{}, "get:Crear")
}

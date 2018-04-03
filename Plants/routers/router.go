package routers

import (
	"elhuertovirtual/Plants/controllers"

	"github.com/astaxie/beego"
)

func init() {
	beego.Router("/actual", &controllers.MainController{})
	beego.Router("/createtable", &controllers.MainController{}, "get:CreateTable")
	beego.Router("/", &controllers.MainController{}, "get:Ini")
	beego.Router("/anade", &controllers.PlantController{}, "get:Añade")
	beego.Router("/elim", &controllers.PlantController{}, "get:Elim")
	beego.Router("/elim2", &controllers.PlantController{}, "get:Elim2")
	beego.Router("/crear", &controllers.PlantController{}, "get:Crear")
	beego.Router("/edit", &controllers.PlantController{}, "get:Edit")
	beego.Router("/update", &controllers.PlantController{}, "get:Update")
	beego.Router("/erroralanadir", &controllers.PlantController{}, "get:ErrorUpdate")
	beego.Router("/historial", &controllers.PlantController{}, "get:Historial")
}

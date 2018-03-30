package routers

import (
	"elhuertovirtual/Plants/controllers"

	"github.com/astaxie/beego"
)

func init() {
	//beego.Router("/", &controllers.MainController{})
	beego.Router("/actual", &controllers.MainController{})
	beego.Router("/añade", &controllers.PlantController{}, "get:Añade")
	beego.Router("/elim", &controllers.PlantController{}, "get:Elim")
	beego.Router("/crear", &controllers.PlantController{}, "get:Crear")
	beego.Router("/edit", &controllers.PlantController{}, "get:Edit")
	beego.Router("/update", &controllers.PlantController{}, "get:Update")
	beego.Router("/erroralanadir", &controllers.PlantController{}, "get:ErrorUpdate")
	beego.Router("/historial", &controllers.PlantController{}, "get:Historial")
}

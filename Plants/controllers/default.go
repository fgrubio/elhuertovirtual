package controllers

import (
	"elhuertovirtual/Plants/models"
	"fmt"

	"github.com/astaxie/beego"
)

type MainController struct {
	beego.Controller
}

func (c *MainController) Get() {
	//c.Data["Website"] = "beego.me"
	//c.Data["Email"] = "astaxie@gmail.com"

	fmt.Println("entramos default")

	var taula []models.Tabla
	models.DB.Table("plantas").Select("tipo,cantidad,duracion").Scan(&taula)

	mapiTipo := make(map[int]string)
	mapiCant := make(map[int]int)
	mapiDur := make(map[int]int)

	for i := 0; i < 3; i++ {
		fmt.Println("funciono en la iteracion: ", i)
		mapiTipo[i] = taula[i].Tipo
		mapiDur[i] = taula[i].Duracion
		mapiCant[i] = taula[i].Cantidad
	}

	fmt.Println("he salido")
	c.Data["tipos"] = mapiTipo
	c.Data["cant"] = mapiCant
	c.Data["dur"] = mapiDur
	fmt.Println("aqui tambn")

	c.TplName = "index.tpl"

}

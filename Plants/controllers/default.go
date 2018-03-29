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
	/*
		mapiTipo := make(map[int]string)
		mapiCant := make(map[int]int)
		mapiDur := make(map[int]int)

		for i := 0; i < len(taula); i++ {
			fmt.Println("funciono en la iteracion: ", i, ", taula[i] = ", taula[i])
			mapiTipo[i] = taula[i].Tipo
			mapiDur[i] = taula[i].Duracion
			mapiCant[i] = taula[i].Cantidad
		}*/

	fmt.Println("Valores de la BD cargados")
	/*
		c.Data["tipos"] = mapiTipo
		c.Data["cant"] = mapiCant
		c.Data["dur"] = mapiDur*/

	c.Data["taula"] = &taula
	fmt.Println("Enviados al html")

	c.TplName = "indexx.tpl"

}

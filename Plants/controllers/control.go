package controllers

import (
	"elhuertovirtual/Plants/models"
	"fmt"

	"github.com/astaxie/beego"
)

type PlantController struct {
	beego.Controller
}

func (c *PlantController) Elim() {
	fmt.Println("he llegado al borrar")
	//c.TplName = "eliminar.tpl"
	models.Borrar(3)
	c.Redirect("/", 302)
}

func (c *PlantController) Añade() {
	//fmt.Println("hola he llegado al get")
	c.TplName = "añadir.tpl"
	var taula []models.Plantas
	models.DB.Table("plantas").Select("tipo,cantidad,duracion").Scan(&taula)

}

func (c *PlantController) Crear() {
	fmt.Println("he llegado al crear")

	var planta models.Plantas
	planta.Tipo = c.GetString("tipo")
	planta.Cantidad, _ = c.GetInt("cantidad")
	planta.Duracion, _ = c.GetInt("duracion")
	//planta.Fecha_ini =
	//planta.Fecha_fin =

	models.Afegir(planta)
	c.Redirect("/", 302)
}

func (c *PlantController) ActualitzaPlanta() {
	//models.Actualitzar(1, 2, 3)
}

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

	var taula []models.Plantas
	models.DB.Table("plantas").Select("id,deleted_at,tipo,cantidad,duracion,seleccio").Scan(&taula)
	//fmt.Println("tamaño de la tabla: ", len(taula))

	var taulab []models.Tabla
	//fmt.Println("empezamos bucle")
	//var taulainsert models.Tabla
	for i := 0; i < len(taula); i++ {
		//fmt.Println(i, ": Començem")
		//fmt.Println(taula[i].DeletedAt)
		if taula[i].DeletedAt == nil {
			//fmt.Println("No eliminat, metemos, valor a copiar: ", taula[i])
			var taulainsert models.Tabla
			taulainsert.ID = taula[i].ID
			taulainsert.Tipo = taula[i].Tipo
			taulainsert.Cantidad = taula[i].Cantidad
			taulainsert.Duracion = taula[i].Duracion
			taulainsert.Seleccio = taula[i].Seleccio
			//fmt.Println(taulainsert)
			//fmt.Println(taulab)

			taulab = append(taulab, taulainsert)
		}
		//fmt.Println(i, ": saltem")
	}

	fmt.Println("Valores de la BD cargados")
	c.Data["taula"] = &taulab
	fmt.Println("Enviados al html")

	flash := beego.ReadFromRequest(&c.Controller)
	if _, ok := flash.Data["notice"]; ok {
<<<<<<< HEAD
		// Display settings successful
		//c.Redirect("/actual", 302)
		c.TplName = "index.tpl"

	} else if _, ok = flash.Data["error"]; ok {
		// Display error messages
		c.TplName = "error_elim.tpl"
	}

=======
	}
>>>>>>> a6c2daece1f0cd6c59bd24b21c3b6ac8f5849e56
	c.TplName = "index.tpl"

}
func (c *MainController) Ini() {
	//c.Data["Website"] = "beego.me"
	//c.Data["Email"] = "astaxie@gmail.com"

	fmt.Println("entramos en el Inicio")
	if models.DB.HasTable("plantas") {
		fmt.Println("Se ha detectado tabla existente")
		c.TplName = "inicioCon.tpl"
	} else {
		c.TplName = "inicioSin.tpl"
	}
}
func (c *MainController) CreateTable() {
	if models.DB.HasTable("plantas") {
		fmt.Println("Eliminamos existente")
		models.DB.DropTable("plantas")
	}
	fmt.Println("CreamosTabla")
	var plantanueva models.Plantas
	models.DB.CreateTable(&plantanueva)
	c.Redirect("/actual", 302)
}

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
	models.DB.Table("plantas").Select("id,deleted_at,tipo,cantidad,duracion").Scan(&taula)
	fmt.Println("tamaño de la tabla: ", len(taula))

	var taulab []models.Tabla
	fmt.Println("empezamos bucle")
	//var taulainsert models.Tabla
	for i := 0; i < len(taula); i++ {
		fmt.Println(i, ": Començem")
		fmt.Println(taula[i].DeletedAt)
		if taula[i].DeletedAt == nil {
			fmt.Println("No eliminat, metemos, valor a copiar: ", taula[i])
			var taulainsert models.Tabla
			taulainsert.ID = taula[i].ID
			taulainsert.Tipo = taula[i].Tipo
			taulainsert.Cantidad = taula[i].Cantidad
			taulainsert.Duracion = taula[i].Duracion
			fmt.Println(taulainsert)
			fmt.Println(taulab)

			taulab = append(taulab, taulainsert)
		}
		fmt.Println(i, ": saltem")
	}

	fmt.Println("Valores de la BD cargados")
	c.Data["taula"] = &taulab
	fmt.Println("Enviados al html")

	c.TplName = "indexx.tpl"

}

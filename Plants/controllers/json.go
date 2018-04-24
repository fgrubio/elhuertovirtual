package controllers

import (
	"elhuertovirtual/Plants/models"
	"fmt"

	"github.com/astaxie/beego"
)

type JSONController struct {
	beego.Controller
}

func (c *JSONController) Get() {
	var tiempoviejo models.Cronos
	models.DB.Table("cronos").Select("actual,speed,horareal").Where("num = ?", "1").Scan(&tiempoviejo)
	dia := tiempoviejo.Horareal / 24
	hora := tiempoviejo.Horareal % 24
	c.Data["dia"] = &dia
	c.Data["hora"] = &hora
	c.TplName = "json.tpl"
}

func (c *JSONController) Imprimir() {
	fmt.Println("Enviamos el json")
	var taula []models.Plantas
	models.DB.Table("plantas").Select("id,deleted_at,tipo,cantidad,duracion,seleccio").Scan(&taula)
	var mystruct models.Todos
	for i := 0; i < len(taula); i++ {
		if taula[i].DeletedAt == nil {
			var taulainsert models.Todo
			taulainsert.Tipo = taula[i].Tipo
			taulainsert.Cantidad = taula[i].Cantidad
			taulainsert.Duracion = taula[i].Duracion
			taulainsert.Seleccio = taula[i].Seleccio
			//taulainsert.Temporizador = taula[i].Temporizador

			mystruct = append(mystruct, taulainsert)
		}
	}
	//var mystruct models.Todos
	//models.DB.Table("plantas").Select("tipo,cantidad,duracion,seleccio").Scan(&mystruct)
	c.Data["json"] = &mystruct
	c.ServeJSON()

}

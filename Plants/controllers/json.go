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
	fmt.Println("Seleccion del JSON")
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
	tipo, _ := c.GetInt("tipo")
	fecha, _ := c.GetInt("fecha")
	primera, _ := c.GetInt("primera")
	segunda, _ := c.GetInt("segunda")
	duracion, _ := c.GetInt("duracion")
	dia, _ := c.GetInt("dia")
	mes, _ := c.GetInt("mes")
	ano, _ := c.GetInt("ano")
	cantidad, _ := c.GetInt("cantidad")
	cinc, _ := c.GetInt("50")
	cien, _ := c.GetInt("100")
	doscien, _ := c.GetInt("200")
	var taula []models.Plantas
	models.DB.Table("plantas").Select("deleted_at,tipo,cantidad,duracion,seleccio,plantada").Scan(&taula)
	var mystruct models.Todos
	for i := 0; i < len(taula); i++ {
		if taula[i].DeletedAt == nil {
			imprime := true
			var taulainsert models.Todo
			if tipo == 1 {
				taulainsert.Tipo = taula[i].Tipo
			}
			if fecha == 1 {
				if (primera == 1 && taula[i].Plantada < 168) || (segunda == 1 && taula[i].Plantada < 336 && taula[i].Plantada > 167) || (primera == 0 && segunda == 0) {
					taulainsert.Fecha = taula[i].Plantada
				} else {
					imprime = false
				}
			}
			if imprime && duracion == 1 {
				if (dia == 1 && taula[i].Seleccio == "Dias") || (mes == 1 && taula[i].Seleccio == "Meses") || (ano == 1 && taula[i].Seleccio == "Años") || (dia == 0 && mes == 0 && ano == 0) {
					taulainsert.Duracion = taula[i].Duracion
					taulainsert.Seleccion = taula[i].Seleccio
				} else {
					imprime = false
				}
			}
			if imprime && cantidad == 1 {
				if (cinc == 1 && taula[i].Cantidad < 51) || (cien == 1 && taula[i].Cantidad < 101 && taula[i].Cantidad > 50) || (doscien == 1 && taula[i].Cantidad > 100) || (cinc == 0 && cien == 0 && doscien == 0) {
					taulainsert.Cantidad = taula[i].Cantidad
				} else {
					imprime = false
				}
			}
			if imprime {
				mystruct = append(mystruct, taulainsert)
			}
		}
	}
	c.Data["json"] = &mystruct
	c.ServeJSON()

}

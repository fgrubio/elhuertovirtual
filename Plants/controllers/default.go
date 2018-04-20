package controllers

import (
	"elhuertovirtual/Plants/models"
	"fmt"
	"time"

	"github.com/astaxie/beego"
)

type MainController struct {
	beego.Controller
}

func (c *MainController) Get() {
	fmt.Println("entramos default")

	var taula []models.Plantas
	models.DB.Table("plantas").Select("id,deleted_at,tipo,cantidad,duracion,seleccio,temporizador,plantada").Scan(&taula)

	var tiempoviejo models.Cronos
	models.DB.Table("cronos").Select("actual,speed,horareal").Where("num = ?", "1").Scan(&tiempoviejo)
	speed := tiempoviejo.Speed
	fmt.Println("Speed de", speed)
	templus := false
	tiempoactual := time.Now()
	if temp := time.Duration(60) * time.Second; temp < tiempoactual.Sub(tiempoviejo.Actual) {
		if temp := time.Duration(90) * time.Second; temp < tiempoactual.Sub(tiempoviejo.Actual) {
			fmt.Println(tiempoactual.Sub(tiempoviejo.Actual), "-> NO Actualizamos")
		} else {
			fmt.Println(tiempoactual.Sub(tiempoviejo.Actual), "-> Toca Actualizar")
			templus = true
			tiempoviejo.Horareal += speed
			models.ActualitzarHora(tiempoviejo.Horareal)
		}
		models.ActualitzarCrono(tiempoactual)
	} else {
		fmt.Println(tiempoactual.Sub(tiempoviejo.Actual), "-> NO Actualizamos")
	}

	var taulab []models.Tabla
	var taulac []models.Tabla
	for i := 0; i < len(taula); i++ {
		if taula[i].DeletedAt == nil {
			var taulainsert models.Tabla
			taulainsert.ID = taula[i].ID
			taulainsert.Tipo = taula[i].Tipo
			taulainsert.Cantidad = taula[i].Cantidad
			taulainsert.Duracion = taula[i].Duracion
			taulainsert.Seleccio = taula[i].Seleccio
			taulainsert.PlantadaDia = taula[i].Plantada / 24
			taulainsert.PlantadaHora = taula[i].Plantada % 24
			if templus {
				taula[i].Temporizador += speed
				models.ActualitzarTempo(taula[i].ID, taula[i].Temporizador)
			}
			mul := 0
			if taula[i].Seleccio == "Dias" {
				mul = 24
			} else if taula[i].Seleccio == "Meses" {
				mul = 24 * 30
			} else {
				mul = 24 * 30 * 12
			}
			taulainsert.Temporizador = taula[i].Duracion*mul - taula[i].Temporizador
			if taulainsert.Temporizador/720 > 1 {
				taulainsert.Temporizador /= 720
				taulainsert.SeleccioTemp = "Mes/es"
			} else if taulainsert.Temporizador/48 > 1 {
				taulainsert.Temporizador /= 24
				taulainsert.SeleccioTemp = "Dia/s"
			} else if taulainsert.Temporizador > 0 {
				taulainsert.SeleccioTemp = "Hora/s"
			}
			if taulainsert.Temporizador <= 0 {
				taulainsert.Temporizador = 0
				taulainsert.SeleccioTemp = "YA ESTA LISTO ;)"
				taulac = append(taulac, taulainsert)
			} else {
				taulab = append(taulab, taulainsert)
			}
		}
	}

	fmt.Println("Valores de la BD cargados")
	c.Data["taula"] = &taulab
	c.Data["recogida"] = &taulac
	c.Data["speed"] = &speed
	dia := tiempoviejo.Horareal / 24
	hora := tiempoviejo.Horareal % 24
	c.Data["dia"] = &dia
	c.Data["hora"] = &hora
	fmt.Println("Enviados al html")

	flash := beego.ReadFromRequest(&c.Controller)
	if _, ok := flash.Data["notice"]; ok {
		c.TplName = "index.tpl"

	} else if _, ok = flash.Data["error"]; ok {
		c.TplName = "error_elim.tpl"
	}

	c.TplName = "index.tpl"
}

func (c *MainController) Ini() {
	fmt.Println("entramos en el Inicio")
	if models.DB.HasTable("plantas") {
		fmt.Println("Se ha detectado tabla existente")
		c.TplName = "inicioCon.tpl"
	} else {
		c.TplName = "inicioSin.tpl"
	}
}

func (c *MainController) CreateTable() {
	flash := beego.NewFlash()
	if models.DB.HasTable("plantas") {
		fmt.Println("Eliminamos existente")
		models.DB.DropTable("plantas")
		models.DB.DropTable("cronos")
		models.DB.DropTable("plantas_recogidas")
		flash.Notice("Viciada Correctamente!")
	} else {
		flash.Notice("Creada Correctamente!")
	}
	flash.Store(&c.Controller)
	fmt.Println("CreamosTabla")

	var plantanueva models.Plantas
	models.DB.CreateTable(&plantanueva)

	var plantarecogida models.PlantasRecogidas
	models.DB.CreateTable(&plantarecogida)

	var hora models.Cronos
	models.DB.CreateTable(&hora)
	var actual models.Cronos
	actual.Num = 1
	actual.Actual = time.Now()
	actual.Speed = 1
	actual.Horareal = 24 //Empezamos por dia 1
	fmt.Println(actual)
	models.DB.Create(&actual)

	c.Redirect("/actual", 302)
}

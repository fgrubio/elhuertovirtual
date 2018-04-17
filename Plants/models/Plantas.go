package models

import (
	"github.com/jinzhu/gorm"
)

type Plantas struct {
	gorm.Model
	Tipo         string `gorm:"primary_key"`
	Cantidad     int
	Duracion     int
	Seleccio     string
	Temporizador int //es en horas
	//Fecha_ini int
	//Fecha_fin int
}

type Tabla struct {
	//gorm.Model
	ID           uint
	Tipo         string
	Cantidad     int
	Duracion     int
	Seleccio     string
	Temporizador int
}

func Actualitzar(pl Plantas) {
	//fmt.Println("Actualizamos")
	//fmt.Println(pl)
	DB.Model(&Plantas{}).Where("id = ?", pl.ID).Updates(map[string]interface{}{"tipo": pl.Tipo, "Cantidad": pl.Cantidad, "Duracion": pl.Duracion, "Seleccio": pl.Seleccio, "Temporizador": pl.Temporizador})
}

func Borrar(id int) {
	DB.Delete(&Plantas{}, id)
}

func Afegir(pl Plantas) {
	DB.Create(&pl)
}

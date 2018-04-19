package models

import (
	"time"

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

type PlantasRecogidas struct {
	gorm.Model
	Tipo     string `gorm:"primary_key"`
	Plantada time.Time
	Recogida time.Time
	Cantidad int
	Duracion int
	Seleccio string
}

type Tabla struct {
	//gorm.Model
	ID           uint
	Tipo         string
	Cantidad     int
	Duracion     int
	Seleccio     string
	Temporizador int
	SeleccioTemp string
}

func Actualitzar(pl Plantas) {
	DB.Model(&Plantas{}).Where("id = ?", pl.ID).Updates(map[string]interface{}{"tipo": pl.Tipo, "Cantidad": pl.Cantidad, "Duracion": pl.Duracion, "Seleccio": pl.Seleccio})
}
func ActualitzarTempo(idnew uint, tempnew int) {
	DB.Model(&Plantas{}).Where("id = ?", idnew).Updates(map[string]interface{}{"Temporizador": tempnew})
}

func Borrar(id int) {
	DB.Delete(&Plantas{}, id)
}

func Afegir(pl Plantas) {
	DB.Create(&pl)
}

func AfegirRecogida(pl PlantasRecogidas) {
	DB.Create(&pl)
}

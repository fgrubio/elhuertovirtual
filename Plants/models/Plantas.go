package models

import (
	"fmt"

	"github.com/jinzhu/gorm"
)

type Plantas struct {
	gorm.Model
	Tipo     string `gorm:"primary_key"`
	Cantidad int
	Duracion int
	//Fecha_ini int
	//Fecha_fin int
}

type Tabla struct {
	//gorm.Model
	ID       uint
	Tipo     string
	Cantidad int
	Duracion int
}

func Actualitzar(pl Plantas) {
	fmt.Println("Actualizamos")
	fmt.Println(pl)
	DB.Model(&Plantas{}).Where("id = ?", pl.ID).Updates(map[string]interface{}{"tipo": pl.Tipo, "Cantidad": pl.Cantidad, "Duracion": pl.Duracion})
}

func Borrar(id int) {
	DB.Delete(&Plantas{}, id)
}

func Afegir(pl Plantas) {
	DB.Create(&pl)
}

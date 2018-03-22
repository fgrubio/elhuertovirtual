package models

import (
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
	Tipo     string
	Cantidad int
	Duracion int
}

func Actualitzar(id int, quantitat int, duracio int) {

	DB.Model(&Plantas{}).Where("id = ?", id).Updates(map[string]interface{}{"Cantidad": quantitat, "Duracion": duracio})

}

func Borrar(id int) {
	DB.Delete(&Plantas{}, id)
}

func Afegir(pl Plantas) {

	//fmt.Println("dime el tipo:::", pl.Tipo)
	//fmt.Println("dime3 el tipo:::", DB)

	DB.Create(&pl)
}

package models

import (
	"fmt"

	"github.com/jinzhu/gorm"
	_ "github.com/jinzhu/gorm/dialects/mysql"
)

var DB *gorm.DB

func CreateDB() {

	db, err := gorm.Open("mysql", "root:goru@(localhost:3306)/dbphil?charset=utf8&parseTime=True&loc=Local")
	DB = db
	if err != nil {
		fmt.Println("ERROR EN CARGAR BD, codigo error: ", err)
	} else {
		fmt.Println("BD CARGADA SIN ERRORES")
	}

	db.AutoMigrate(&Plantas{})

	/* PARA INICIALIZAR*/ /*
		var p1 Plantas
		p1.Tipo = "Prueba"
		p1.Cantidad = 1
		p1.Duracion = 1
		DB.Create(&p1)
	*/
	//defer db.Close()
}

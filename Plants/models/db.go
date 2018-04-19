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

	db.AutoMigrate(&Cronos{})

	db.AutoMigrate(&PlantasRecogidas{})
}

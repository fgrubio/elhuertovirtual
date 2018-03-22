package main

import (
	"Plants/models"
	_ "Plants/routers"

	"github.com/astaxie/beego"
	_ "github.com/jinzhu/gorm/dialects/mysql"
)

func main() {
	models.CreateDB()
	//models.Afegir("Felipe", 1, 2, 3, 4)
	//models.Borrar(2)
	//models.Actualitzar(1, 25, 25, 25, 25)
	//models.Actualitzar(3, 25, 25, 25, 25)

	beego.Run()
}

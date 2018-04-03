package main

import (
	"elhuertovirtual/Plants/models"
	_ "elhuertovirtual/Plants/routers"

	"github.com/astaxie/beego"
	_ "github.com/jinzhu/gorm/dialects/mysql"
)

func main() {
	models.CreateDB()
	beego.Run()
}

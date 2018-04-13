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
	//var w http.ResponseWriter
	//var r *http.Request
	fmt.Println("Enviamos el json")
	/*
		todos := []models.Todo{
			models.Todo{ID: 123},
			models.Todo{ID: 321},
		}*/
	//var w io.Writer
	//json.NewEncoder(w).Encode(todos)

	var mystruct models.Todos
	models.DB.Table("plantas").Select("tipo,cantidad,duracion,seleccio").Scan(&mystruct)
	c.Data["json"] = &mystruct
	c.ServeJSON()
}

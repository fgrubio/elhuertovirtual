package controllers

import (
	"elhuertovirtual/Plants/models"
	"fmt"

	"github.com/astaxie/beego"
)

type PlantController struct {
	beego.Controller
}

func (c *PlantController) Elim() {
	fmt.Println("He llegado al borrar")
	//c.TplName = "eliminar.tpl"
	x, _ := c.GetInt("key")
	fmt.Println("LA X AHORA VALE ESTO: ", x)
	models.Borrar(x)
	c.Redirect("/actual", 302)
}

func (c *PlantController) Edit() {
	fmt.Println("He llegado al Editar")
	key, _ := c.GetInt("key")
	fmt.Println("Actualizaremos id = ", key)

	var taula models.Plantas
	models.DB.Table("plantas").Select("id,tipo,cantidad,duracion,seleccio").Where("id = ?", key).Scan(&taula)
	c.Data["taula"] = &taula
	fmt.Println(taula)
	c.TplName = "edit.tpl"
}

func (c *PlantController) Añade() {
	fmt.Println("hola he llegado al añadir")
	c.TplName = "añadir.tpl"
	var taula []models.Plantas
	models.DB.Table("plantas").Select("tipo,cantidad,duracion,seleccio").Scan(&taula)

}

func (c *PlantController) Crear() {
	fmt.Println("he llegado al crear")

	var planta models.Plantas
	planta.Tipo = c.GetString("tipo")
	planta.Cantidad, _ = c.GetInt("cantidad")
	planta.Duracion, _ = c.GetInt("duracion")
	planta.Seleccio = c.GetString("seleccio")
	fmt.Println("En seleccio esta esto:", planta.Seleccio)
	//planta.Fecha_ini =
	//planta.Fecha_fin =

	var count int
	var plantab []models.Plantas
	hayuno := false
	models.DB.Table("plantas").Select("id,tipo,deleted_at").Where("tipo = ?", planta.Tipo).Count(&count).Scan(&plantab)
	fmt.Println(planta.Tipo, count)
	if count == 0 {
		if planta.Cantidad == 0 {
			fmt.Println("No se ha encontrado pero cantidad 0")
			fmt.Println("Error de Update")
			c.Data["planta"] = &planta
			c.TplName = "error2.tpl"
		} else {
			models.Afegir(planta)
			c.Redirect("/actual", 302)
		}
	} else {
		for i := 0; i < len(plantab) && hayuno == false; i++ {
			if plantab[i].DeletedAt == nil {
				fmt.Println("Se ha encontrado, NO se añade")
				hayuno = true
				//c.Redirect("'/erroralanadir?key=' + plantab[i].ID", 302)
				fmt.Println("Error de Update")
				fmt.Println("id = ", plantab[i].ID)
				c.Data["planta"] = &plantab[i]
				c.TplName = "error.tpl"
			}
		}
		if hayuno == false {
			fmt.Println("No se ha encontrado ninguno igual, se añade")
			if planta.Cantidad == 0 {
				fmt.Println("No se ha encontrado pero cantidad 0")
				fmt.Println("Error de Update")
				c.Data["planta"] = &planta
				c.TplName = "error2.tpl"
			} else {
				models.Afegir(planta)
				c.Redirect("/actual", 302)
			}
		}
	}
}

func (c *PlantController) Update() {
	fmt.Println("he llegado al actualizar")

	var planta models.Plantas
	var integ int
	integ, _ = c.GetInt("key")
	planta.ID = uint(integ)
	planta.Tipo = c.GetString("tipo")
	planta.Cantidad, _ = c.GetInt("cantidad")
	planta.Duracion, _ = c.GetInt("duracion")
	planta.Seleccio = c.GetString("life")

	if planta.Cantidad == 0 {
		fmt.Println("Cantidad 0")
		fmt.Println("Error de Update")
		c.Data["planta"] = &planta
		c.TplName = "error3.tpl"
	} else {
		models.Actualitzar(planta)
		c.Redirect("/actual", 302)
	}
}
func (c *PlantController) ErrorUpdate() {
	fmt.Println("Error de Update")
	key, _ := c.GetInt("key")
	fmt.Println("id = ", key)

	var taula models.Plantas
	models.DB.Table("plantas").Select("id,tipo,cantidad,duracion,seleccio").Where("id = ?", key).Scan(&taula)
	c.Data["planta"] = &taula
	fmt.Println(taula)
	c.TplName = "error.tpl"
}
func (c *PlantController) Historial() {
	fmt.Println("Historial")
	var taula []models.Plantas
	models.DB.Table("plantas").Select("id,created_at,updated_at,deleted_at,tipo,cantidad,duracion,seleccio").Scan(&taula)

	//fmt.Println(taula[1].Cantidad)
	//fmt.Println(taula[1].Duracion)

	c.Data["taula"] = &taula
	fmt.Println("Enviados al html")
	c.TplName = "historial.tpl"
}

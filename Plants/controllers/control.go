package controllers

import (
	"elhuertovirtual/Plants/models"
	"fmt"
	"math/rand"
	"strconv"

	"github.com/astaxie/beego"
)

type PlantController struct {
	beego.Controller
}

func (c *PlantController) Elim() {
	fmt.Println("He llegado al borrar")
	flash := beego.NewFlash()
	x, _ := c.GetInt("key")
	fmt.Println("LA X AHORA VALE ESTO: ", x)
	models.Borrar(x)

	flash.Notice("Se ha eliminado correctamente!")
	flash.Store(&c.Controller)

	c.Redirect("/actual", 302)

}

func (c *PlantController) Elim2() {
	fmt.Println("He llegado al borrar y añadir")
	x, _ := c.GetInt("key")
	fmt.Println("Borramos con key = ", x)
	models.Borrar(x)

	var planta models.Plantas
	planta.Tipo = c.GetString("tipo")
	planta.Cantidad, _ = c.GetInt("cantidad")
	planta.Duracion, _ = c.GetInt("duracion")
	planta.Seleccio = c.GetString("seleccio")
	//planta.Fecha_ini =
	//planta.Fecha_fin =
	fmt.Println("añadimos: ", planta)

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

func (c *PlantController) Edit() {
	fmt.Println("He llegado al Editar")
	key, _ := c.GetInt("key")
	fmt.Println("Actualizaremos id = ", key)

	flash := beego.ReadFromRequest(&c.Controller)
	if man, ok := flash.Data["error"]; ok {
		// Display error messages
		//c.TplNames = "set_error.html"
		fmt.Println("Error, ok =", ok)

		fmt.Println("FLASH = ", man, flash.Data, flash.Data["ID"], flash.Data["Tipo"], flash.Data["Cantidad"], flash.Data["Duracion"], flash.Data["Seleccion"])
		var planta models.Plantas
		ID, _ := strconv.ParseInt(flash.Data["ID"], 10, 64)
		planta.ID = uint(ID)
		Tipo, _ := flash.Data["Tipo"]
		planta.Tipo = Tipo
		planta.Cantidad, _ = strconv.Atoi(flash.Data["Cantidad"])
		planta.Duracion, _ = strconv.Atoi(flash.Data["Duracion"])
		planta.Seleccio, _ = flash.Data["Seleccion"]
		fmt.Println(planta)
		c.Data["taula"] = &planta
		c.TplName = "edit2.tpl"
	} else {
		//CODI VELL
		fmt.Println("Via normal")
		var taula models.Plantas
		models.DB.Table("plantas").Select("id,tipo,cantidad,duracion,seleccio").Where("id = ?", key).Scan(&taula)
		var planta models.Plantas
		planta.Tipo = c.GetString("tipo")
		planta.Cantidad, _ = c.GetInt("cantidad")
		planta.Duracion, _ = c.GetInt("duracion")
		planta.Seleccio = c.GetString("seleccio")
		if planta.Tipo == "" {
			fmt.Println("Sin valores")
			c.Data["taula"] = &taula
		} else {
			c.Data["taula"] = &planta
		}
		fmt.Println(taula)
		c.TplName = "edit.tpl"
	}
}
func (c *PlantController) Añade() {
	fmt.Println("hola he llegado al añadir")
	flash := beego.ReadFromRequest(&c.Controller)
	if man, ok := flash.Data["error"]; ok {
		fmt.Println("Error, ok =", ok)

		fmt.Println("FLASH = ", man, flash.Data, flash.Data["ID"], flash.Data["Tipo"], flash.Data["Cantidad"], flash.Data["Duracion"], flash.Data["Seleccion"])
		var planta models.Plantas
		ID, _ := strconv.ParseInt(flash.Data["ID"], 10, 32)
		planta.ID = uint(ID)
		Tipo, _ := flash.Data["Tipo"]
		planta.Tipo = Tipo
		planta.Cantidad, _ = strconv.Atoi(flash.Data["Cantidad"])
		planta.Duracion, _ = strconv.Atoi(flash.Data["Duracion"])
		planta.Seleccio, _ = flash.Data["Seleccion"]
		c.Data["taula"] = &planta
		c.TplName = "añadir3.tpl"
	} else {
		var planta models.Plantas
		planta.Tipo = c.GetString("tipo")
		planta.Cantidad, _ = c.GetInt("cantidad")
		planta.Duracion, _ = c.GetInt("duracion")
		planta.Seleccio = c.GetString("seleccio")
		c.Data["taula"] = &planta
		fmt.Println(planta)
		if planta.Seleccio == "" {
			c.TplName = "añadir.tpl"
		} else {
			c.TplName = "añadir2.tpl"
		}
		var taula []models.Plantas
		models.DB.Table("plantas").Select("tipo,cantidad,duracion,seleccio").Scan(&taula)
	}
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
	if planta.Cantidad == 0 {
		fmt.Println("No se ha encontrado pero cantidad 0")
		fmt.Println("Error de Update")
		//c.Data["planta"] = &planta
		//c.TplName = "error2.tpl"
		flash := beego.NewFlash()
		fmt.Println("ERROR: Cantidad = 0")
		flash.Error("Mejor que pongas algo de cantidad ;)")
		flash.Data["ID"] = strconv.FormatUint(uint64(planta.ID), 10)
		flash.Data["Tipo"] = planta.Tipo
		flash.Data["Cantidad"] = strconv.Itoa(planta.Cantidad)
		flash.Data["Duracion"] = strconv.Itoa(planta.Duracion)
		flash.Data["Seleccion"] = planta.Seleccio
		flash.Store(&c.Controller)
		c.Redirect("/anade", 302)
		return
	} else {
		var count int
		var plantab []models.Plantas
		hayuno := false
		models.DB.Table("plantas").Select("id,tipo,deleted_at").Where("tipo = ?", planta.Tipo).Count(&count).Scan(&plantab)
		fmt.Println(planta.Tipo, count)
		if count == 0 {
			models.Afegir(planta)
			c.Redirect("/actual", 302)
		} else {
			for i := 0; i < len(plantab) && hayuno == false; i++ {
				if plantab[i].DeletedAt == nil {
					fmt.Println("Se ha encontrado, NO se añade")
					hayuno = true
					fmt.Println("Error de Update")
					fmt.Println("id = ", plantab[i].ID)
					c.Data["planta"] = &plantab[i]
					c.Data["plantanueva"] = &planta
					c.TplName = "error.tpl"
				}
			}
			if hayuno == false {
				fmt.Println("No se ha encontrado ninguno igual, se podria añadir")
				models.Afegir(planta)
				c.Redirect("/actual", 302)
			}
		}
	}
}

func (c *PlantController) Update() {
	fmt.Println("he llegado al actualizar")
	flash := beego.NewFlash()
	var planta models.Plantas
	var integ int
	integ, _ = c.GetInt("key")
	planta.ID = uint(integ)
	planta.Tipo = c.GetString("tipo")
	planta.Cantidad, _ = c.GetInt("cantidad")
	planta.Duracion, _ = c.GetInt("duracion")
	planta.Seleccio = c.GetString("seleccio")
	//NEWWWWW
	if planta.Cantidad == 0 {
		fmt.Println("ERROR: Cantidad = 0")
		flash.Error("Mejor que pongas algo de cantidad ;)")
		flash.Data["ID"] = strconv.FormatUint(uint64(planta.ID), 10)
		flash.Data["Tipo"] = planta.Tipo
		flash.Data["Cantidad"] = strconv.Itoa(planta.Cantidad)
		flash.Data["Duracion"] = strconv.Itoa(planta.Duracion)
		flash.Data["Seleccion"] = planta.Seleccio
		flash.Store(&c.Controller)
		c.Redirect("/edit", 302)
		return
	} else {
		var count int
		var plantab []models.Plantas
		hayuno := false
		models.DB.Table("plantas").Select("id,tipo,deleted_at").Where("tipo = ?", planta.Tipo).Count(&count).Scan(&plantab)
		fmt.Println(planta.Tipo, count)
		if count == 0 {
			models.Actualitzar(planta)
			flash.Notice("Settings saved!")
			flash.Store(&c.Controller)
			c.Redirect("/actual", 302)
		} else {
			for i := 0; i < len(plantab) && hayuno == false; i++ {
				if plantab[i].DeletedAt == nil && planta.ID != plantab[i].ID {
					fmt.Println("Se ha encontrado, NO se añade")
					//if(hayuno) haydos = true;
					hayuno = true
					fmt.Println("Error de Update")
					fmt.Println("id = ", plantab[i].ID)
					c.Data["planta"] = &plantab[i]
					c.Data["plantanueva"] = &planta
					c.TplName = "error5.tpl"
				}
			}
			if hayuno == false {
				fmt.Println("No se ha encontrado ninguno igual, se podria añadir")
				models.Actualitzar(planta)
				flash.Notice("Settings saved!")
				flash.Store(&c.Controller)
				c.Redirect("/actual", 302)
			}
		}
	}
	//NEWWW
	/*if planta.Cantidad == 0 {
		fmt.Println("Cantidad 0")
		fmt.Println("Error de Update")
		c.Data["taula"] = &planta
		c.TplName = "error4.tpl"
	} else {
		models.Actualitzar(planta)
		c.Redirect("/actual", 302)
	}*/
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
<<<<<<< HEAD

func (c *PlantController) Random() {

	var planta models.Plantas
	planta.Tipo = "A"
	planta.Cantidad = 2
	planta.Duracion = 3
	planta.Seleccio = "Meses"
	c.Data["taula"] = &planta
	c.Redirect("/crear", 302)
=======
func (c *PlantController) Random() {
	fmt.Println("Entramos en Random")
	var random int
	for igual := true; igual; {
		random = rand.Int()
		random %= 200
		var count int
		models.DB.Table("plantas").Select("tipo").Where("tipo = ?", random).Count(&count)
		if count == 0 {
			igual = false
		}
	}
	var planta models.Plantas
	planta.Tipo = strconv.Itoa(random) + "Plant"
	planta.Cantidad = 1
	planta.Duracion = 2
	planta.Seleccio = "Dias"
	fmt.Println("Se añade la planta:", planta)
	//planta.Fecha_ini =
	//planta.Fecha_fin =
	models.Afegir(planta)
	c.Redirect("/actual", 302)
>>>>>>> a6c2daece1f0cd6c59bd24b21c3b6ac8f5849e56
}

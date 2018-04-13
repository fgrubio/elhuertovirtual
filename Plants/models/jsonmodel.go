package models

/*
type Plantas struct {
	gorm.Model
	Tipo     string `gorm:"primary_key"`
	Cantidad int
	Duracion int
	Seleccio string
	//Fecha_ini int
	//Fecha_fin int
}*/

type Todo struct {
	//gorm.Model
	//ID   uint   `json:"id"`
	Tipo     string `json:"tipo"`
	Cantidad int    `json:"cantidad"`
	Duracion int    `json:"duracion"`
	Seleccio string `json:"seleccio"`
}

type Todos []Todo

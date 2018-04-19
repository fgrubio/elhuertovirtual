package models

type Todo struct {
	//gorm.Model
	//ID   uint   `json:"id"`
	Tipo     string `json:"tipo"`
	Cantidad int    `json:"cantidad"`
	Duracion int    `json:"duracion"`
	Seleccio string `json:"seleccio"`
	//Temporizador int    `json:"time"`
}

type Todos []Todo

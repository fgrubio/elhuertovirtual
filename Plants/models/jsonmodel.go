package models

type Todo struct {
	Tipo      string `json:"tipo,omitempty"`
	Fecha     int    `json:"fechaplantacion,omitempty"`
	Cantidad  int    `json:"cantidad,omitempty"`
	Duracion  int    `json:"duracion,omitempty"`
	Seleccion string `json:"seleccion,omitempty"`
}

type Todos []Todo

package models

import (
	"time"
)

type Cronos struct {
	//gorm.Model
	Num      int
	Actual   time.Time
	Speed    int //0 a 10
	Horareal int
}

func ActualitzarCrono(cr time.Time) {
	DB.Model(&Cronos{}).Where("num = ?", 1).Updates(map[string]interface{}{"num": 1, "actual": cr})
}
func ActualitzarSpeed(s int) {
	DB.Model(&Cronos{}).Where("num = ?", 1).Updates(map[string]interface{}{"num": 1, "speed": s})
}
func ActualitzarHora(s int) {
	DB.Model(&Cronos{}).Where("num = ?", 1).Updates(map[string]interface{}{"num": 1, "horareal": s})
}

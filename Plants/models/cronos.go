package models

import (
	"time"
)

type Cronos struct {
	//gorm.Model
	Num    int
	Actual time.Time
}

func ActualitzarCrono(cr time.Time) {
	DB.Model(&Cronos{}).Where("num = ?", 1).Updates(map[string]interface{}{"num": 1, "actual": cr})
}

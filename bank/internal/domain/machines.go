package domain

import "github.com/google/uuid"

type Machine struct {
	Id uuid.UUID `db:"id"`
}

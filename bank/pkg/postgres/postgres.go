package postgres

import (
	"fmt"

	"github.com/jmoiron/sqlx"
	"github.com/sirupsen/logrus"
)

type PostgresConfig struct {
	User     string
	Password string
	Host     string
	Port     string
	DBName   string
	SSLMode  string
}

func NewPostgresDB(cfg PostgresConfig) (*sqlx.DB, error) {
	strConn := fmt.Sprintf("host=%s port=%s user=%s password=%s dbname=%s sslmode=%s", cfg.Host,
		cfg.Port, cfg.User, cfg.Password, cfg.DBName, cfg.SSLMode)
	db, err := sqlx.Connect("postgres", strConn)
	if err != nil {
		logrus.Errorf("error connecting postgresdb in NewPostgresDB: %s", err)
		return nil, err
	}
	return db, nil
}

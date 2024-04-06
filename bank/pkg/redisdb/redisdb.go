package redisdb

import (
	"fmt"

	"github.com/redis/go-redis/v9"
)

type RedisConfig struct {
	Host     string
	Port     string
	Password string
	DB       int
}

func NewRedisDB(cfg RedisConfig) *redis.Client {
	rdb := redis.NewClient(&redis.Options{
		Addr:     fmt.Sprintf("%s:%s", cfg.Host, cfg.Port),
		DB:       cfg.DB,
		Password: cfg.Password,
	})

	return rdb
}

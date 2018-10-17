package config

import (
	"fmt"
	"log"
	"os"

	"database/sql"
	// sqlite3 driver
	_ "github.com/mattn/go-sqlite3"
)

var (
	dbPrefix = "test-echo-scaffold"
)

// InitDB returns the current db session.
func InitDB() (*sql.DB) {
	path := os.Getenv("DB_PATH")
	if path == "" {
		path = "sqlite3"
	}

	db, err := sql.Open("sqlite3", path)
	if err != nil {
		log.Fatalf("Cannot open Database: %s", err)
		return nil
	}

	return db
}

func setup(db *sql.DB) error {
	sql := `
	CREATE TABLE IF NOT EXISTS tasks(
		id INTEGER NOT NULL PRIMARY KEY,
		body TEXT NOT NULL,
		done INTEGER NOT NULL DEFAULT 0,
		created_ad INTEGER NOT NULL,
		updated_at INTEGER,
	)
	`

	_, err:= db.Exec(sql)
	if err != nil {
		return fmt.Errorf("Cannot exec query: %s", err)
	}

	return nil
}

// vi:syntax=go

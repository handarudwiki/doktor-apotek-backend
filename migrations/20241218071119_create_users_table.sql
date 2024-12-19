-- +goose Up
-- +goose StatementBegin

-- Buat ENUM Role terlebih dahulu
CREATE TYPE "Role" AS ENUM ('admin', 'user', 'pharmacist', 'patient');

-- Buat tabel users
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    role "Role" NOT NULL DEFAULT 'patient',
    dob DATE NULL,
    gender VARCHAR(255) NULL,
    phone VARCHAR(255) NULL,
    address VARCHAR(255) NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- +goose StatementEnd

-- +goose Down
-- +goose StatementBegin

-- Hapus tabel users
DROP TABLE IF EXISTS users CASCADE;

-- Hapus tipe ENUM Role
DROP TYPE IF EXISTS "Role";

-- +goose StatementEnd

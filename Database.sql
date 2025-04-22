-- 데이터베이스 생성
CREATE DATABASE IF NOT EXISTS chillcoder;
SHOW TABLES;
USE chillcoder_local;
select * from users;

-- truncate table users;

-- 사용자 테이블 (이메일과 전화번호 추가)
CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    name VARCHAR(255),
    email VARCHAR(255) NOT NULL UNIQUE,
    phone_number VARCHAR(20) NOT NULL,
    role VARCHAR(50) DEFAULT 'user'
);

-- 사고 테이블
CREATE TABLE IF NOT EXISTS incidents (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    location VARCHAR(255) NOT NULL,
    reported_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 작업 테이블
CREATE TABLE IF NOT EXISTS tasks (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    location VARCHAR(255) NOT NULL,
    reported_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status ENUM('PENDING', 'IN_PROGRESS', 'COMPLETED') NOT NULL DEFAULT 'PENDING'
);

-- CCTV 카메라 테이블
CREATE TABLE IF NOT EXISTS cameras (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    location VARCHAR(255) NOT NULL,
    status VARCHAR(50) NOT NULL,
    image_url TEXT
);






-- 외래 키 제약 조건이 있는 테이블들 먼저 삭제
DROP TABLE IF EXISTS incidents;
DROP TABLE IF EXISTS tasks;

-- 사용자 테이블 삭제
DROP TABLE IF EXISTS users;

-- CCTV 카메라 테이블 삭제
DROP TABLE IF EXISTS cameras;
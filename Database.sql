-- 데이터베이스 생성
CREATE DATABASE IF NOT EXISTS chillcoder;
SHOW TABLES;
USE chillcoder_local;
select * from users;
select * from cameras;
select * from incidents;
select * from tasks;
select * from help_request_entity;
 
TRUNCATE TABLE incidents;
ALTER TABLE tasks AUTO_INCREMENT = 1;
ALTER TABLE incidents AUTO_INCREMENT = 1;
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
CREATE TABLE incidents (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    camera_id BIGINT NOT NULL,
    title VARCHAR(255) NOT NULL,
    detection_type VARCHAR(50) NOT NULL,
    confidence FLOAT NOT NULL,
    location VARCHAR(255) NOT NULL,
    timestamp TIMESTAMP NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (camera_id) REFERENCES cameras(id)
); 

-- 작업 테이블
CREATE TABLE tasks (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    location VARCHAR(255) NOT NULL,
    detection_type VARCHAR(50) NOT NULL,
    timestamp TIMESTAMP NOT NULL,
    status VARCHAR(20) NOT NULL DEFAULT 'IN_PROGRESS',
    incident_id BIGINT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (incident_id) REFERENCES incidents(id)
);

CREATE TABLE IF NOT EXISTS cameras (
    id BIGINT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    location VARCHAR(255) NOT NULL,
    status VARCHAR(20) NOT NULL DEFAULT '온라인',
    image_url VARCHAR(255)
);




-- 외래 키 제약 조건이 있는 테이블들 먼저 삭제
DROP TABLE IF EXISTS incidents;
DROP TABLE IF EXISTS tasks;

-- 사용자 테이블 삭제
DROP TABLE IF EXISTS users;

-- CCTV 카메라 테이블 삭제
DROP TABLE IF EXISTS cameras;

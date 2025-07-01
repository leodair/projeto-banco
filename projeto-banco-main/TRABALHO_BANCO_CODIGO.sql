-- Configurações iniciais
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- Criação do banco
CREATE SCHEMA IF NOT EXISTS `projeto_banco` DEFAULT CHARACTER SET utf8 ;
USE `projeto_banco` ;

-- Tabela usuarios
CREATE TABLE `projeto_banco`.`usuarios` (
  `id_usuario` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NULL,
  `idade` DECIMAL NULL,
  `telefone` DECIMAL NULL,
  `email` VARCHAR(100) NULL,
  `data_criacao` DATE NULL,
  `senha` VARCHAR(45) NULL,
  PRIMARY KEY (`id_usuario`)
) ENGINE = InnoDB;

-- Tabela artista
CREATE TABLE `projeto_banco`.`artista` (
  `id_artista` INT NOT NULL,
  `nome` VARCHAR(45) NULL,
  `genero_musical` VARCHAR(45) NULL,
  `data_criacao` DATE NULL,
  PRIMARY KEY (`id_artista`)
) ENGINE = InnoDB;

-- Tabela musica
CREATE TABLE `projeto_banco`.`musica` (
  `id_musica` INT NOT NULL AUTO_INCREMENT,
  `nome_musica` VARCHAR(100) NULL,
  `compositor` VARCHAR(100) NULL,
  `tipo_de_musica` VARCHAR(50) NULL,
  `genero` VARCHAR(50),
  `id_albun` INT NULL,
  `id_artista` INT NOT NULL,
  PRIMARY KEY (`id_musica`),
  INDEX `fk_musica_artista1_idx` (`id_artista` ASC),
  CONSTRAINT `fk_musica_artista1`
    FOREIGN KEY (`id_artista`)
    REFERENCES `projeto_banco`.`artista` (`id_artista`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE = InnoDB;

-- Tabela albun
CREATE TABLE `projeto_banco`.`albun` (
  `id_albun` INT NOT NULL,
  `id_artista` INT NULL,
  `titulo` VARCHAR(45) NULL,
  `ano_lancamento` VARCHAR(45) NULL,
  `capa_albun` VARCHAR(45) NULL,
  `albuncol` VARCHAR(45) NULL,
  `artista_id_artista` INT NOT NULL,
  PRIMARY KEY (`id_albun`),
  INDEX `fk_albun_artista_idx` (`artista_id_artista` ASC),
  CONSTRAINT `fk_albun_artista`
    FOREIGN KEY (`artista_id_artista`)
    REFERENCES `projeto_banco`.`artista` (`id_artista`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE = InnoDB;

-- Tabela Playlists
CREATE TABLE `projeto_banco`.`Playlists` (
  `id_Playlists` INT NOT NULL,
  `nome_playlists` VARCHAR(45) NULL,
  `id_usuario` INT NULL,
  `data_criacao` DATE NULL,
  `usuarios_id_usuario` INT NOT NULL,
  PRIMARY KEY (`id_Playlists`),
  INDEX `fk_Playlists_usuarios1_idx` (`usuarios_id_usuario` ASC),
  CONSTRAINT `fk_Playlists_usuarios1`
    FOREIGN KEY (`usuarios_id_usuario`)
    REFERENCES `projeto_banco`.`usuarios` (`id_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE = InnoDB;

-- Tabela musica_has_Playlists
CREATE TABLE `projeto_banco`.`musica_has_Playlists` (
  `musica_id_musica` INT NOT NULL,
  `Playlists_id_Playlists` INT NOT NULL,
  PRIMARY KEY (`musica_id_musica`, `Playlists_id_Playlists`),
  INDEX `fk_musica_has_Playlists_Playlists1_idx` (`Playlists_id_Playlists` ASC),
  INDEX `fk_musica_has_Playlists_musica1_idx` (`musica_id_musica` ASC),
  CONSTRAINT `fk_musica_has_Playlists_musica1`
    FOREIGN KEY (`musica_id_musica`)
    REFERENCES `projeto_banco`.`musica` (`id_musica`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_musica_has_Playlists_Playlists1`
    FOREIGN KEY (`Playlists_id_Playlists`)
    REFERENCES `projeto_banco`.`Playlists` (`id_Playlists`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE = InnoDB;

-- Restaurando configurações
SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


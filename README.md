# TRABALHO CRIADO POR MIM, LEODAIR ERIK PALHANO JOAQUIM DO 3°D SISTEMA

> com fins de objetivo educacional da matéria, de banco de dados, do professor, Mateus Maidel

# 🎵 Banco de Dados Musical 

Este é um projeto de banco de dados relacional desenvolvido em **MySQL**, com o objetivo de representar um sistema de gerenciamento musical. Ele permite armazenar e organizar dados relacionados a **usuários**, **músicas**, **artistas**, **álbuns** e **playlists**, utilizando conceitos de modelagem e integridade referencial.


![Captura de tela 2025-07-01 103624](https://github.com/user-attachments/assets/cd869ba1-bdf5-4a18-ad68-7df7157eb93c)

---

## 📌 Objetivo

O objetivo deste banco de dados é simular a estrutura de um sistema de música, como os utilizados por serviços de streaming, onde:
- Usuários podem criar playlists;
- Artistas lançam músicas e álbuns;
- Músicas pertencem a álbuns e podem ser adicionadas a várias playlists.

---

## 🗃️ Estrutura das Tabelas

### 1. `usuarios`
Armazena informações dos usuários do sistema:
- `id_usuario`, `nome`, `idade`, `telefone`, `email`, `data_criacao`, `senha`

```sql
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

```


### 2. `artista`
Contém dados dos artistas:
- `id_artista`, `nome`, `genero_musical`, `data_criacao`

```sql
  CREATE TABLE `projeto_banco`.`artista` (
  `id_artista` INT NOT NULL,
  `nome` VARCHAR(45) NULL,
  `genero_musical` VARCHAR(45) NULL,
  `data_criacao` DATE NULL,
  PRIMARY KEY (`id_artista`)
) ENGINE = InnoDB;

```

### 3. `musica`
Lista de músicas, associadas a artistas e álbuns:
- `id_musica`, `nome_musica`, `compositor`, `tipo_de_musica`, `genero`, `id_albun`, `id_artista`

```sql
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
 ```

### 4. `albun`
Armazena informações dos álbuns:
- `id_albun`, `titulo`, `ano_lancamento`, `capa_albun`, `id_artista`

```sql
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
```

### 5. `Playlists`
Representa as playlists criadas por usuários:
- `id_Playlists`, `nome_playlists`, `id_usuario`, `data_criacao`

```sql
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
```

### 6. `musica_has_Playlists`
Tabela intermediária para relacionar músicas e playlists (muitos-para-muitos):
- `musica_id_musica`, `Playlists_id_Playlists`

```sql
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
```
---

## 🔗 Relacionamentos

- **artista → albun**: 1:N
- **artista → musica**: 1:N
- **usuarios → playlists**: 1:N
- **musica ↔ playlists**: N:M (via tabela `musica_has_Playlists`)

Todos os relacionamentos são implementados com **chaves estrangeiras** (`FOREIGN KEY`) com restrições para manter a integridade dos dados.

---

## ▶️ Como usar

1. Execute o script `.sql` no MySQL Workbench ou outro gerenciador MySQL.
2. O banco `projeto_banco` será criado com todas as tabelas e relações.
3. Você pode inserir dados e fazer consultas SQL, como por exemplo:

```sql
-- Exemplo: listar todas as músicas de um artista
SELECT m.nome_musica
FROM musica m
JOIN artista a ON m.id_artista = a.id_artista
WHERE a.nome = 'Seu Artista Favorito';
```

# ESSE É MEU TRABALHO

---

![download](https://github.com/user-attachments/assets/8e94a539-dcac-4e62-b4ad-4b1e963e81c2)



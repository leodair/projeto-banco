# TRABALHO CRIADO POR MIM, LEODAIR ERIK PALHANO JOAQUIM DO 3°D SISTEMA

> com fins de objetivo educacional da matéria, de banco de dados, do professor, Mateus Maidel

# 🎵 Banco de Dados Musical 

Este é um projeto de banco de dados relacional desenvolvido em **MySQL**, com o objetivo de representar um sistema de gerenciamento musical. Ele permite armazenar e organizar dados relacionados a **usuários**, **músicas**, **artistas**, **álbuns** e **playlists**, utilizando conceitos de modelagem e integridade referencial.


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

### 2. `artista`
Contém dados dos artistas:
- `id_artista`, `nome`, `genero_musical`, `data_criacao`

### 3. `musica`
Lista de músicas, associadas a artistas e álbuns:
- `id_musica`, `nome_musica`, `compositor`, `tipo_de_musica`, `genero`, `id_albun`, `id_artista`

### 4. `albun`
Armazena informações dos álbuns:
- `id_albun`, `titulo`, `ano_lancamento`, `capa_albun`, `id_artista`

### 5. `Playlists`
Representa as playlists criadas por usuários:
- `id_Playlists`, `nome_playlists`, `id_usuario`, `data_criacao`

### 6. `musica_has_Playlists`
Tabela intermediária para relacionar músicas e playlists (muitos-para-muitos):
- `musica_id_musica`, `Playlists_id_Playlists`

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

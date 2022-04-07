CREATE DATABASE botdiscord;

CREATE TABLE IF NOT EXISTS usuario(
    id INTEGER NOT NULL,
    nome VARCHAR(100) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NO EXISTS grupo(
    id INTEGER NOT NULL,
    nome VARCHAR(100) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS evento(
    id INTEGER NOT NULL,
    nome VARCHAR(100) NOT NULL,
    inicio DATETIME NOT NULL,
    fim DATETIME NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS tipo(
    id INTEGER NOT NULL,
    nome VARCHAR(100) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS mensagem(
    id INTEGER NOT NULL,
    conteudo TEXT NOT NULL,
    spanTime TIMESTAMP NOT NULL,
    idTipo INTEGER NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY(idTipo) REFERENCES tipo(id)
);

CREATE TABLE IF NOT EXISTS mensagemUsuario(
    idMensagem INTEGER NOT NULL,
    idUsuario INTEGER NOT NULL,
    FOREIGN KEY(idMensagem) REFERENCES mensagem(id),
    FOREIGN KEY(idUsuario) REFERENCES usuario(id),
);

CREATE TABLE IF NOT EXISTS grupoUsuario(
    idGrupo INTEGER NOT NULL,
    idUsuario INTEGER NOT NULL,
    FOREIGN KEY(idGrupo) REFERENCES grupo(id),
    FOREIGN KEY(idUsuario) REFERENCES usuario(id),
);

CREATE TABLE IF NOT EXISTS grupoEvento(
    idGrupo INTEGER NOT NULL,
    idEvento INTEGER NOT NULL,
    FOREIGN KEY(idGrupo) REFERENCES grupo(id),
    FOREIGN KEY(idEvento) REFERENCES evento(id),
);

INSERT INTO tipo(id, nome) VALUES(01, "alerta");
INSERT INTO tipo(id, nome) VALUES(02, "moderação");
INSERT INTO tipo(id, nome) VALUES(03, "status");
USE Supervisorio;
GO

-- Iniciamos criando as tabelas da aplicacao

CREATE TABLE [dbo].[TipoUsuario]
(
    [id] INT IDENTITY (1, 1) PRIMARY KEY,
    [descricao] CHAR (10) NOT NULL
);

CREATE TABLE [dbo].[Usuario]
(
    [id] INT IDENTITY (1, 1) PRIMARY KEY,
    [email] CHAR (50) NOT NULL,
    [senha] CHAR (50) NOT NULL,
    [tipo] INT NOT NULL FOREIGN KEY REFERENCES [dbo].[TipoUsuario] ([id])
);

-- Entao definimos as estruturas da planta

CREATE TABLE [dbo].[Inversor]
(
    [id] INT IDENTITY (1, 1) PRIMARY KEY,
    [descricao] VARCHAR (50) NULL
);

CREATE TABLE [dbo].[Tracker]
(
    [id] INT IDENTITY (1, 1) PRIMARY KEY,
    [controleUFPB] BIT NOT NULL,
    [inversorId] INT NOT NULL FOREIGN KEY REFERENCES [dbo].[Inversor] ([id])
);

CREATE TABLE [dbo].[String]
(
    [id] INT IDENTITY (1, 1) PRIMARY KEY,
    [trackerId] INT NOT NULL FOREIGN KEY REFERENCES [dbo].[Tracker] ([id])
);

-- E por fim adicionamos as tabelas de leituras

CREATE TABLE [dbo].[LeituraControleTracker]
(
    [id] INT IDENTITY (1, 1) PRIMARY KEY,
    [createdAt] DATETIME DEFAULT GETDATE() NOT NULL,
    [anguloLido] FLOAT NOT NULL,
    [anguloDefinido] FLOAT NOT NULL,
    [trackerId] INT NOT NULL FOREIGN KEY REFERENCES [dbo].[Tracker] ([id])
);

CREATE TABLE [dbo].[LeituraEstacao]
(
    [id] INT IDENTITY (1, 1) PRIMARY KEY,
    [createdAt] DATETIME DEFAULT GETDATE() NOT NULL,
    [ghi] INT NOT NULL,
    [precipitacao] INT NOT NULL,
    [velocidadeVento] INT NOT NULL,
    [direcaoVento] INT NOT NULL,
    [temperaturaAmbiente] INT NOT NULL,
    [temperaturaPlaca] INT NOT NULL,
    [humidade] INT NOT NULL
);

CREATE TABLE [dbo].[LeituraInversor]
(
    [id] INT IDENTITY (1, 1) PRIMARY KEY,
    [createdAt] DATETIME DEFAULT GETDATE() NOT NULL,
    [tensao] FLOAT NOT NULL,
    [corrente] FLOAT NOT NULL,
    [inversorId] INT NOT NULL FOREIGN KEY REFERENCES [dbo].[Inversor] ([id])
);

CREATE TABLE [dbo].[LeituraString]
(
    [id] INT IDENTITY (1, 1) NOT NULL PRIMARY KEY,
    [createdAt] DATETIME DEFAULT GETDATE() NOT NULL,
    [tensao] FLOAT NOT NULL,
    [corrente] FLOAT NOT NULL,
    [stringId] INT NOT NULL FOREIGN KEY REFERENCES [dbo].[String] ([id])
);

CREATE TABLE [dbo].[LeituraTracker]
(
    [id] INT IDENTITY (1, 1) NOT NULL PRIMARY KEY,
    [createdAt] DATETIME DEFAULT GETDATE() NOT NULL,
    [tensao] FLOAT NOT NULL,
    [corrente] FLOAT NOT NULL,
    [trackerId] INT NOT NULL FOREIGN KEY REFERENCES [dbo].[Tracker] ([id])
);

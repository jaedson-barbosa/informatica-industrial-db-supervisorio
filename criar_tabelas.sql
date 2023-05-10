-- Iniciamos criando as tabelas da aplicacao
USE Supervisorio;
GO

CREATE TABLE [dbo].[TipoUsuario]
(
    [id] INT IDENTITY (1, 1) NOT NULL,
    [descricao] CHAR (10) NOT NULL,
    CONSTRAINT [PK_TipoUsuario] PRIMARY KEY CLUSTERED ([id] ASC)
);

CREATE TABLE [dbo].[Usuario]
(
    [id] INT IDENTITY (1, 1) NOT NULL,
    [email] CHAR (50) NOT NULL,
    [senha] CHAR (50) NOT NULL,
    [tipoId] INT NOT NULL,
    CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED ([id] ASC),
    CONSTRAINT [FK_Usuario_TipoUsuario] FOREIGN KEY ([tipoId]) REFERENCES [dbo].[TipoUsuario] ([id])
);

-- Entao definimos as estruturas da planta

CREATE TABLE [dbo].[Inversor]
(
    [id] INT IDENTITY (1, 1) NOT NULL,
    [descricao] VARCHAR (50) NULL,
    CONSTRAINT [PK_Inversor] PRIMARY KEY CLUSTERED ([id] ASC)
);

CREATE TABLE [dbo].[Tracker]
(
    [id] INT IDENTITY (1, 1) NOT NULL,
    [inversorId] INT NOT NULL,
    [controleUFPB] BIT NOT NULL,
    CONSTRAINT [PK_Tracker] PRIMARY KEY CLUSTERED ([id] ASC),
    CONSTRAINT [FK_Tracker_Inversor] FOREIGN KEY ([inversorId]) REFERENCES [dbo].[Inversor] ([id])
);

CREATE TABLE [dbo].[String]
(
    [id] INT IDENTITY (1, 1) NOT NULL,
    [trackerId] INT NOT NULL,
    CONSTRAINT [PK_String] PRIMARY KEY CLUSTERED ([id] ASC),
    CONSTRAINT [FK_String_Tracker] FOREIGN KEY ([trackerId]) REFERENCES [dbo].[Tracker] ([id])
);

-- E por fim adicionamos as tabelas de leituras

CREATE TABLE [dbo].[LeituraControleTracker]
(
    [id] INT IDENTITY (1, 1) NOT NULL,
    [createdAt] DATETIME DEFAULT GETDATE() NOT NULL,
    [trackerId] INT NOT NULL,
    [anguloLido] FLOAT NOT NULL,
    [anguloDefinido] FLOAT NOT NULL,
    CONSTRAINT [PK_LeituraControleTracker] PRIMARY KEY CLUSTERED ([id] ASC),
    CONSTRAINT [FK_LeituraControleTracker_Tracker] FOREIGN KEY ([trackerId]) REFERENCES [dbo].[Tracker] ([id])
);

CREATE TABLE [dbo].[LeituraEstacao]
(
    [id] INT IDENTITY (1, 1) NOT NULL,
    [createdAt] DATETIME DEFAULT GETDATE() NOT NULL,
    [ghi] INT NOT NULL,
    [precipitacao] INT NOT NULL,
    [velocidadeVento] INT NOT NULL,
    [direcaoVento] INT NOT NULL,
    [temperaturaAmbiente] INT NOT NULL,
    [temperaturaPlaca] INT NOT NULL,
    [humidade] INT NOT NULL,
    CONSTRAINT [PK_LeituraEstacao] PRIMARY KEY CLUSTERED ([id] ASC)
);

CREATE TABLE [dbo].[LeituraInversor]
(
    [id] INT IDENTITY (1, 1) NOT NULL,
    [createdAt] DATETIME DEFAULT GETDATE() NOT NULL,
    [tensao] FLOAT NOT NULL,
    [corrente] FLOAT NOT NULL,
    [inversorId] INT NOT NULL,
    CONSTRAINT [PK_LeituraInversor] PRIMARY KEY CLUSTERED ([id] ASC),
    CONSTRAINT [FK_LeituraInversor_Inversor] FOREIGN KEY ([inversorId]) REFERENCES [dbo].[Inversor] ([id])
);

CREATE TABLE [dbo].[LeituraString]
(
    [id] INT IDENTITY (1, 1) NOT NULL,
    [createdAt] DATETIME DEFAULT GETDATE() NOT NULL,
    [tensao] FLOAT NOT NULL,
    [corrente] FLOAT NOT NULL,
    [stringId] INT NOT NULL,
    CONSTRAINT [PK_LeituraString] PRIMARY KEY CLUSTERED ([id] ASC),
    CONSTRAINT [FK_LeituraString_String] FOREIGN KEY ([stringId]) REFERENCES [dbo].[String] ([id])
);

CREATE TABLE [dbo].[LeituraTracker]
(
    [id] INT IDENTITY (1, 1) NOT NULL,
    [createdAt] DATETIME DEFAULT GETDATE() NOT NULL,
    [tensao] FLOAT NOT NULL,
    [corrente] FLOAT NOT NULL,
    [trackerId] INT NOT NULL,
    CONSTRAINT [PK_LeituraTracker] PRIMARY KEY CLUSTERED ([id] ASC),
    CONSTRAINT [FK_LeituraTracker_Tracker] FOREIGN KEY ([trackerId]) REFERENCES [dbo].[Tracker] ([id])
);

USE Supervisorio;
GO

-- Comecamos inserindo alguns dados estruturais

INSERT INTO [dbo].[TipoUsuario]
    (descricao)
VALUES
    ('admin'),
    ('professor'),
    ('aluno');

INSERT INTO [dbo].[Usuario]
    (email, senha, tipo)
VALUES
    ('aluno@test.com', '123456', 3);

INSERT INTO [dbo].[Inversor]
    (descricao)
VALUES
    ('inversor da esquerda'),
    ('inversor da direita');

INSERT INTO [dbo].[Tracker]
    (inversorId, controleUFPB)
VALUES
    (1, 1),
    (2, 0);

INSERT INTO [dbo].[String]
    (trackerId)
VALUES
    (1),
    (1);

-- E depois colocamos algumas leituras

INSERT INTO [dbo].[LeituraControleTracker]
    (trackerId, anguloLido, anguloDefinido)
VALUES
    (1, 10.0, 10.0);

INSERT INTO [dbo].[LeituraEstacao]
    (ghi, precipitacao, velocidadeVento, direcaoVento, temperaturaAmbiente, temperaturaPlaca, humidade)
VALUES
    (100, 1, 10, 180, 30, 50, 70);

INSERT INTO [dbo].[LeituraInversor]
    (tensao, corrente, inversorId)
VALUES
    (220, 100, 1);

INSERT INTO [dbo].[LeituraString]
    (tensao, corrente, stringId)
VALUES
    (100, 10, 1);

INSERT INTO [dbo].[LeituraTracker]
    (tensao, corrente, trackerId)
VALUES
    (12, 1, 1);

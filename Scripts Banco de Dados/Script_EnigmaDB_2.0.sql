Create DataBase EnigmaDB --Cria��o do Banco de Dados
go
use EnigmaDB -- utilizando Banco de Dados
go
-- Cria��o de Tabelas 
Create Table Usuario
(
ID_Usuario int identity not null primary key,
Nome_Usuario Varchar(100) not null,
Email_Usuario Varchar(150) not null,
Senha_Usuario varchar(100) not null,
TipoConta_Usuario Char(2) not null,
Foto_Usuario Varbinary(MAX) null
)
go
Create Table Materia
(
ID_Materia int identity not null primary key,
Nome_Materia Varchar(100) not null,
Descricao_Materia Varchar(200) not null,
Imagem_Materia VarBinary(MAX)  null,
ID_Usuario int not null
)
go
Create Table Desempenho
(
ID_Desempenho int identity not null primary key,
ID_Usuario int not null,
ID_Materia int not null,
Porcentagem_Desempenho Decimal(10,2) not null,
HorasEstudas_Desempenho Decimal(10,2) not null
)
go
Create Table Conteudo
(
ID_Conteudo int identity not null primary key,
ID_Materia int not null,
Nome_Conteudo Varchar(100) not null,
Imagem_Conteudo VarBinary(MAX) null,
ID_Usuario int not null
)
go
Create Table Texto 
(
ID_Texto int identity not null primary key,
Tamanho_Texto Decimal(3,2) not null,
Cor_Texto Char(7) not null,
Texto_Texto Text not null,
Negrito_Texto Bit not null,
Italico_Texto Bit not null,
ID_Usuario int not null
)
go
Create Table Video
(
ID_Video int Identity not null primary key,
Nome_Video Varchar(100) not null,
Link_Video Varchar(MAX) not null,
Duracao_Video Decimal(4,2) not null,
InicioConteudo_Video Decimal(4,2) not null,
FimConteudo_Video Decimal(4,2) not null,
ID_Usuario int not null
)
go
Create Table ConteudoTexto
(
ID_ConteudoTexto int identity not null primary key,
ID_Conteudo int not null,
ID_Texto int null,
ID_Video int null,
ID_Imagem int null,
Ordem_ControleTexto int not null,
ID_Usuario int not null
)
go
Create Table Exercicio 
(
ID_Exercicio int identity not null primary key,
ID_Conteudo int not null,
Tipo_Exercicio Char(1) not null,
AleatorioQuestao_Exercicio Bit not null,
ID_Usuario int not null
)
go
Create Table Questao
(
ID_Questao int identity not null primary key,
ID_Exercicio int not null,
Ordem_Questao int not null,
AleatorioAlternativa_Questao Bit not null,
Pergunta_Questao Text not null,
ID_Usuario int not null
)
go
Create Table Alternativa
(
ID_Alternativa int identity not null primary key,
ID_Questao int not null,
Tipo_Alternativa Char(1) not null,
Conteudo_Alternativa Varchar(150) not null,
ID_Usuario int not null
)
go
Create Table Pergunta 
(
ID_Pergunta int identity not null primary key,
Titulo_Pergunta Varchar(50) not null,
Texto_Pergunta Text not null,
Visibilidade_Pergunta Bit not null,
ID_Usuario int not null
)
go
Create Table Resposta 
(
ID_Resposta int identity not null primary key,
ID_Pergunta Int not null,
Titulo_Resposta Varchar(50) not null,
Texto_Resposta Text not null,
Visibilidade_Resposta Bit not null,
ID_Usuario int not null
)
Create Table Imagem
(
ID_Imagem int identity not null primary key,
Nome_Imagem Varchar(60) not null,
Imagem_Imagem VarBinary(MAX) not null,
Extensao_Imagem Char(4) not null
)
go
Create Table ImagemPergunta 
(
ID_ImagemPergunta int identity not null primary key,
ID_Imagem int not null,
ID_Pergunta int not null,
Ordem_ImagemPergunta int not null 
)
go
Create Table ImagemResposta 
(
ID_ImagemResposta int identity not null primary key,
ID_Imagem int not null,
ID_Resposta int not null,
Ordem_ImagemResposta int not null 
)
go
Create Table AvaliacaoResposta
(
ID_AvaliacaoResposta int identity not null primary key,
ID_Usuario int not null,
ID_Resposta int not null,
Avaliacao_AvaliacaoResposta Bit null,
Denuncia_AvaliacaoResposta Bit not null default 0
)
go
Create Table AvaliacaoPergunta
(
ID_AvaliacaoPergunta int identity not null primary key,
ID_Usuario int not null,
ID_Pergunta int not null,
Avaliacao_AvaliacaoPergunta Bit null,
Denuncia_AvaliacaoPergunta Bit not null default 0
)
go
--Cria��o do Relacionamento entre tabelas
--Tabela Desempenho
Alter Table Desempenho add Constraint [FK_Desempenho_Usuario] foreign key (ID_Usuario) references Usuario(ID_Usuario)
Alter Table Desempenho add Constraint [FK_Desempenho_Materia] foreign key (ID_Materia) references Materia(ID_Materia)
------------------------------------------------------------------------------------------------------------------------------------
--Tabela Conteudo
Alter Table Conteudo add Constraint [FK_Conteudo_Materia] foreign key (ID_Materia) references Materia(ID_Materia)
------------------------------------------------------------------------------------------------------------------------------------
--Tabela Exercicio
Alter Table Exercicio add Constraint [FK_Exercicio_Conteudo] foreign key (ID_Conteudo) references Conteudo(ID_Conteudo)
------------------------------------------------------------------------------------------------------------------------------------
--Tabela Questao
Alter Table Questao add Constraint [FK_Questao_Exercicio] foreign key (ID_Exercicio) references Exercicio(ID_Exercicio)
------------------------------------------------------------------------------------------------------------------------------------
--Tabela Alternativa
Alter Table Alternativa add Constraint [FK_Alternativa_Questao] foreign key (ID_Questao) references Questao(ID_Questao)
------------------------------------------------------------------------------------------------------------------------------------
--Tabela ConteudoTexto
Alter Table ConteudoTexto add Constraint [FK_ConteudoTexto_Conteudo] foreign key (ID_Conteudo) references Conteudo(ID_Conteudo)
Alter Table ConteudoTexto add Constraint [FK_ConteudoTexto_Texto] foreign key (ID_Texto) references Texto(ID_Texto)
Alter Table ConteudoTexto add Constraint [FK_ConteudoTexto_Video] foreign key (ID_Video) references Video(ID_Video)
Alter Table ConteudoTexto add Constraint [FK_ConteudoTexto_Imagem] foreign key (ID_Imagem) references Imagem(ID_Imagem)
------------------------------------------------------------------------------------------------------------------------------------
--Tabela ImagemPergunta
Alter Table ImagemPergunta add Constraint [FK_ImagemPergunta_Pergunta] foreign key (ID_Pergunta) references Pergunta(ID_Pergunta)
Alter Table ImagemPergunta add Constraint [FK_ImagemPergunta_Imagem] foreign key (ID_Imagem) references Imagem(ID_Imagem)
------------------------------------------------------------------------------------------------------------------------------------
--Tabela ImagemResposta
Alter Table ImagemResposta add Constraint [FK_ImagemResposta_Resposta] foreign key (ID_Resposta) references Resposta(ID_Resposta)
Alter Table ImagemResposta add Constraint [FK_ImagemResposta_Imagem] foreign key (ID_Imagem) references Imagem(ID_Imagem)
------------------------------------------------------------------------------------------------------------------------------------
--Tabela Resposta
Alter Table Resposta add Constraint [FK_Resposta_Pergunta] foreign key (ID_Pergunta) references Pergunta(ID_Pergunta)
------------------------------------------------------------------------------------------------------------------------------------
--Tabela AvaliacaoResposta
Alter Table AvaliacaoResposta add Constraint [FK_AvaliacaoResposta_Usuario] foreign key (ID_Usuario) references Usuario(ID_Usuario)
Alter Table AvaliacaoResposta add Constraint [FK_AvaliacaoResposta_Resposta] foreign key (ID_Resposta) references Resposta(ID_Resposta)
------------------------------------------------------------------------------------------------------------------------------------
--Tabela AvaliacaoPergunta
Alter Table AvaliacaoPergunta add Constraint [FK_AvaliacaoPergunta_Usuario] foreign key (ID_Usuario) references Usuario(ID_Usuario)
Alter Table AvaliacaoPergunta add Constraint [FK_AvaliacaoPergunta_Pergunta] foreign key (ID_Pergunta) references Pergunta(ID_Pergunta)
------------------------------------------------------------------------------------------------------------------------------------
--Cria��o de Procedure
--Tabela Usuario 
go
Create Procedure InserirUsuario 
@Nome varchar(100),
@Email varchar(150),
@Senha varchar(100),
@TipoConta char(2),
@Foto VarBinary(MAX) = null
as
Insert into Usuario values (@Nome,@Email,@Senha,@TipoConta,@Foto)
go
Create Procedure AlterarUsuario 
@ID int,
@Nome varchar(100),
@Email varchar(150),
@Senha varchar(100),
@TipoConta char(2),
@Foto VarBinary(MAX) = null
as
Update Usuario set Nome_Usuario = @Nome, Email_Usuario = @Email, Senha_Usuario= @Senha, TipoConta_Usuario = @TipoConta,Foto_Usuario = @Foto
Where ID_Usuario = @ID
go
------------------------------------------------------------------------------------------------------------------------------------
-- Tabela Materia 
Create Procedure InserirMateria
@Nome varchar(100) ,
@Descricao Varchar(200),
@Imagem VarBinary(Max) = null,
@Usuario int
as
Insert Into Materia Values (@Nome,@Descricao,@Imagem,@Usuario)
go
Create Procedure AlterarMateria
@ID int,
@Nome varchar(100),
@Descricao Varchar(200),
@Imagem VarBinary(Max) = null,
@Usuario int
as
Update Materia set Nome_Materia = @Nome,Descricao_Materia =  @Descricao, Imagem_Materia =  @Imagem, ID_Usuario = @Usuario
Where ID_Materia = @ID
go
------------------------------------------------------------------------------------------------------------------------------------
-- Tabela Conteudo 
Create Procedure InserirConteudo
@Materia int,
@Nome varchar(100),
@Imagem VarBinary(Max) = null,
@Usuario int
as 
Insert Into Conteudo Values (@Materia,@Nome,@Imagem,@Usuario)
go
Create Procedure AlterarConteudo
@ID int,
@Materia int,
@Nome varchar(100) ,
@Imagem VarBinary(Max) = null,
@Usuario int
as 
Update Conteudo set ID_Materia = @Materia,Nome_Conteudo = @Nome,Imagem_Conteudo = @Imagem, ID_Usuario = @Usuario
Where ID_Conteudo = @ID
go
------------------------------------------------------------------------------------------------------------------------------------
-- Tabela Exercicio
Create Procedure InserirExercicio
@Conteudo int,
@Tipo Char(1),
@AleatorioQuestao Bit,
@Usuario int
as
Insert Into Exercicio Values (@Conteudo,@Tipo,@AleatorioQuestao,@Usuario)
go
Create Procedure AlterarExercicio
@ID int,
@Conteudo int,
@Tipo Char(1),
@AleatorioQuestao Bit,
@Usuario int
as
Update Exercicio set ID_Conteudo =  @Conteudo,Tipo_Exercicio =  @Tipo,AleatorioQuestao_Exercicio = @AleatorioQuestao,ID_Usuario = @Usuario
Where ID_Exercicio = @ID
go
------------------------------------------------------------------------------------------------------------------------------------
-- Tabela Questao
Create Procedure InserirQuestao
@Exercicio int,
@Ordem int,
@AleatorioAlternativa Bit,
@Pergunta Text,
@Usuario int
as
Insert Into Questao Values (@Exercicio,@Ordem,@AleatorioAlternativa,@Pergunta,@Usuario)
go
Create Procedure AlterarQuestao
@ID int,
@Exercicio int,
@Ordem int,
@AleatorioAlternativa Bit,
@Pergunta Text,
@Usuario int
as
Update Questao set ID_Exercicio = @Exercicio,Ordem_Questao = @Ordem,AleatorioAlternativa_Questao = @AleatorioAlternativa,Pergunta_Questao = @Pergunta,ID_Usuario =  @Usuario
Where ID_Questao = @ID
go
------------------------------------------------------------------------------------------------------------------------------------
-- Tabela Alternativa
Create Procedure InserirAlternativa
@Questao int,
@Tipo Char(1),
@Conteudo varchar(150),
@Usuario int
as
Insert Into Alternativa values (@Questao,@Tipo,@Conteudo,@Usuario)
go
Create Procedure AlterarAlternativa
@ID int,
@Questao int,
@Tipo Char(1),
@Conteudo varchar(150),
@Usuario int
as
Update Alternativa set ID_Questao = @Questao,Tipo_Alternativa = @Tipo, Conteudo_Alternativa =  @Conteudo, ID_Usuario = @Usuario
Where ID_Alternativa = @ID
go
------------------------------------------------------------------------------------------------------------------------------------
--Tabela Imagem 
Create Procedure InserirImagem
@Nome varchar(60),
@Imagem Varbinary(Max),
@Extensao Char(4)
as
Insert into Imagem Values (@Nome,@Imagem,@Extensao)
go
Create Procedure AlterarImagem
@ID int,
@Nome varchar(60),
@Imagem Varbinary(Max),
@Extensao Char(4)
as
Update Imagem set Nome_Imagem = @Nome,Imagem_Imagem =  @Imagem, Extensao_Imagem = @Extensao
where ID_Imagem = @ID
go
------------------------------------------------------------------------------------------------------------------------------------
--Tabela Pergunta 
Create Procedure InserirPergunta
@Titulo varchar(50),
@Texto Text,
@Visibilidade bit,
@Usuario int
as
Insert into Pergunta values (@Titulo,@Texto,@Visibilidade,@Usuario) 
go
Create Procedure AlterarPergunta
@ID int,
@Titulo varchar(50),
@Texto Text,
@Visibilidade bit,
@Usuario int
as
Update Pergunta set Titulo_Pergunta = @Titulo,Texto_Pergunta = @Texto, Visibilidade_Pergunta = @Visibilidade, ID_Usuario = @Usuario
where ID_Pergunta = @ID
go
------------------------------------------------------------------------------------------------------------------------------------
--Tabela Resposta
 Create Procedure InserirResposta
@Pergunta int,
@Titulo varchar(50),
@Texto Text,
@Visibilidade bit,
@Usuario int
as
Insert into Resposta values (@Pergunta,@Titulo,@Texto,@Visibilidade,@Usuario) 
go
Create Procedure AlterarResposta
@ID int,
@Pergunta int,
@Titulo varchar(50),
@Texto Text,
@Visibilidade bit,
@Usuario int
as
Update Resposta set ID_Pergunta = @Pergunta, Titulo_Resposta = @Titulo,Texto_Resposta = @Texto, Visibilidade_Resposta = @Visibilidade, ID_Usuario = @Usuario
where ID_Resposta = @ID
go
------------------------------------------------------------------------------------------------------------------------------------
--Tabela Texto
Create Procedure InserirTexto
@Tamanho decimal(3,2),
@Cor char(7),
@Texto Text,
@Negrito bit,
@Italico bit,
@Usaurio int
as
Insert into Texto values (@Tamanho,@Cor,@Texto,@Negrito,@Italico,@Usaurio)
go
Create Procedure AlterarTexto
@ID int,
@Tamanho decimal(3,2),
@Cor char(7),
@Texto Text,
@Negrito bit,
@Italico bit,
@Usaurio int
as
Update Texto set Tamanho_Texto = @Tamanho, Cor_Texto = @Cor,Texto_Texto = @Texto,Negrito_Texto = @Negrito, Italico_Texto = @Italico, ID_Usuario = @Usaurio
where ID_Texto = @ID
go
------------------------------------------------------------------------------------------------------------------------------------
--Tabela Video
Create Procedure InserirVideo
@Nome varchar(100),
@Link varchar(max),
@Duracao decimal(4,2),
@InicioConteudo Decimal(4,2),
@FimConteudo Decimal(4,2),
@Usuario int
as
Insert Into Video Values (@Nome,@Link,@Duracao,@InicioConteudo,@FimConteudo,@Usuario)
go
Create Procedure AlterarVideo
@ID int,
@Nome varchar(100),
@Link varchar(max),
@Duracao decimal(4,2),
@InicioConteudo Decimal(4,2),
@FimConteudo Decimal(4,2),
@Usuario int
as
Update Video set Nome_Video = @Nome,Link_Video = @Link, Duracao_Video = @Duracao, InicioConteudo_Video = @InicioConteudo,FimConteudo_Video = @FimConteudo, ID_Usuario = @Usuario
Where ID_Video = @ID
go
------------------------------------------------------------------------------------------------------------------------------------
--Tabela ImagemPergunta
Create Procedure InserirImagemPergunta
@Imagem int,
@Pergunta int,
@Ordem int
as
Insert into ImagemPergunta values (@Imagem,@Pergunta,@Ordem)
go
Create Procedure AlterarImagemPergunta
@ID int,
@Imagem int,
@Pergunta int,
@Ordem int
as
Update ImagemPergunta set ID_Imagem = @Imagem,ID_Pergunta = @Pergunta,Ordem_ImagemPergunta = @Ordem
Where ID_ImagemPergunta = @ID
go
------------------------------------------------------------------------------------------------------------------------------------
--Tabela ImagemResposta
Create Procedure InserirImagemResposta
@Imagem int,
@Resposta int,
@Ordem int
as
Insert into ImagemResposta values (@Imagem,@Resposta,@Ordem)
go
Create Procedure AlterarImagemResposta
@ID int,
@Imagem int,
@Resposta int,
@Ordem int
as
Update ImagemResposta set ID_Imagem = @Imagem,ID_Resposta = @Resposta,Ordem_ImagemResposta = @Ordem
Where ID_ImagemResposta = @ID
go
------------------------------------------------------------------------------------------------------------------------------------
--Tabela ConteudoTexto
Create Procedure InserirConteudoTexto
@Conteudo int,
@Texto int = null,
@Video int = null,
@Imagem int = null,
@Ordem int,
@Usuario int
as
Insert Into ConteudoTexto values (@Conteudo,@Texto,@Video,@Imagem,@Ordem,@Usuario)
go
Create Procedure AlterarConteudoTexto
@ID int,
@Conteudo int,
@Texto int = null,
@Video int = null,
@Imagem int = null,
@Ordem int,
@Usuario int
as
Update ConteudoTexto set ID_Conteudo = @Conteudo, ID_Texto = @Texto,ID_Video = @Video,ID_Imagem = @Imagem,Ordem_ControleTexto = @Ordem,ID_Usuario = @Usuario
Where ID_ConteudoTexto = @ID
go
------------------------------------------------------------------------------------------------------------------------------------
--Tabela AvaliacaoPergunta
Create Procedure InserirAvaliacaoPergunta
@Usuario int,
@Pergunta int,
@Avalicao bit = null,
@Denuncia bit
as 
Insert Into AvaliacaoPergunta values (@Usuario,@Pergunta,@Avalicao,@Denuncia)
go
Create Procedure AlterarAvaliacaoPergunta
@ID int,
@Usuario int,
@Pergunta int,
@Avalicao bit = null,
@Denuncia bit
as 
Update AvaliacaoPergunta set ID_Usuario = @Usuario,ID_Pergunta = @Pergunta,Avaliacao_AvaliacaoPergunta = @Avalicao,Denuncia_AvaliacaoPergunta = @Denuncia
where ID_AvaliacaoPergunta = @ID
go
------------------------------------------------------------------------------------------------------------------------------------
--Tabela AvaliacaoResposta
Create Procedure InserirAvaliacaoResposta
@Usuario int,
@Resposta int,
@Avalicao bit = null,
@Denuncia bit
as 
Insert Into AvaliacaoResposta values (@Usuario,@Resposta,@Avalicao,@Denuncia)
go
Create Procedure AlterarAvaliacaoResposta
@ID int,
@Usuario int,
@Resposta int,
@Avalicao bit = null,
@Denuncia bit
as 
Update AvaliacaoResposta set ID_Usuario = @Usuario,ID_Resposta = @Resposta,Avaliacao_AvaliacaoResposta = @Avalicao,Denuncia_AvaliacaoResposta = @Denuncia
where ID_AvaliacaoResposta = @ID
go
------------------------------------------------------------------------------------------------------------------------------------
--Tabela Desempenho
Create Procedure InserirDesempenho
@Usuario int,
@Materia int,
@Porcentagem decimal(10,2),
@HorasEstudas decimal(10,2)
as
Insert Into Desempenho values (@Usuario,@Materia,@Porcentagem,@HorasEstudas)
go
Create Procedure AlterarDesempenho
@ID int,
@Usuario int,
@Materia int,
@Porcentagem decimal(10,2),
@HorasEstudas decimal(10,2)
as
Update Desempenho set ID_Usuario = @Usuario,ID_Materia = @Materia, Porcentagem_Desempenho =  @Porcentagem, HorasEstudas_Desempenho = @HorasEstudas
Where ID_Desempenho = @ID
go
Create DataBase EnigmaDB --Criação do Banco de Dados
go
use EnigmaDB -- utilizando Banco de Dados
go
-- Criação de Tabelas 
Create Table Usuario
(
ID_Usuario int identity not null,
Nome_Usuario Varchar(100) not null,
Email_Usuario Varchar(150) not null,
Senha_Usuario varchar(100) not null,
TipoConta_Usuario Char(2) not null,
Foto_Usuario Varbinary(MAX) null
)
go
Create Table Materia
(
ID_Materia int identity not null,
Nome_Materia Varchar(100) not null,
Descricao_Materia Varchar(200) not null,
Imagem_Materia VarBinary(MAX) not null,
ID_Usuario int not null
)
go
Create Table Desempenho
(
ID_Usuario int not null,
ID_Materia int not null,
Porcentagem_Desempenho Decimal(10,2) not null,
HorasEstudas_Desempenho Decimal(10,2) not null
)
go
Create Table Conteudo
(
ID_Conteudo int identity not null,
ID_Matria int not null,
Nome_Conteudo Varchar(100) not null,
Imagem_Conteudo VarBinary(MAX) null,
ID_Usuario int not null
)
go
Create Table Texto 
(
ID_Texto int identity not null,
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
ID_Video int Identity not null,
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
ID_Conteudo int identity not null,
ID_Texto int null,
ID_Video int null,
ID_Imagem int null,
Ordem_ControleTexto int not null,
ID_Usuario int not null
)
go
Create Table Exercicio 
(
ID_Exercicio int identity not null,
ID_Conteudo int not null,
Tipo_Exercicio Char(1) not null,
AleatorioQuestao_Exercicio Bit not null,
ID_Usuario int not null
)
go
Create Table Questao
(
ID_Questao int identity not null,
ID_Exercicio int not null,
Ordem_Questao int not null,
AleatorioAlternativa_Questao Bit not null,
Pergunta_Questao Varchar(150) not null,
ID_Usuario int not null
)
go
Create Table Alternativa
(
ID_Alternativa int identity not null,
ID_Questao int not null,
Tipo_Alternativa Char(1) not null,
Conteudo_Alternativa Varchar(100) not null,
ID_Usuario int not null
)
go
Create Table Pergunta 
(
ID_Pergunta int identity not null,
Titulo_Pergunta Varchar(50) not null,
Texto_Pergunta Text not null,
Visibilidade_Pergunta Bit not null,
ID_Usuario int not null
)
go
Create Table Resposta 
(
ID_Resposta int identity not null,
ID_Pergunta Int not null,
Titulo_Resposta Varchar(50) not null,
Texto_Resposta Text not null,
Visibilidade_Resposta Bit not null,
ID_Usuario int not null
)
Create Table Imagem
(
ID_Imagem int identity not null,
Nome_Imagem Varchar(60) not null,
Imagem_Imagem VarBinary(MAX) not null,
Extensao_Imagem Char(4) not null
)
go
Create Table ImagemPergunta 
(
ID_Imagem int not null,
ID_Pergunta int not null,
Ordem_ImagemPergunta int not null 
)
go
Create Table ImagemResposta 
(
ID_Imagem int not null,
ID_Resposta int not null,
Ordem_ImagemResposta int not null 
)
go
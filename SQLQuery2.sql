USE [total]
GO
/****** Object:  StoredProcedure [dbo].[abastecimento_veiculo]    Script Date: 07/09/2022 15:25:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure [dbo].[abastecimento_veiculo]
(@Operador_Fk smallint, @veiulo_Fk smallint, @bomba_Fk smallint, @litro varchar(50))
as
insert into abasteciimentos
(Operador_Fk, Veiculo_Fk, Bomba_Fk, Litro) 
values(@Operador_Fk, @veiulo_Fk,@bomba_Fk, @litro)
USE [total]
GO
/****** Object:  StoredProcedure [dbo].[abastecimento]    Script Date: 07/09/2022 17:09:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure [dbo].[abastecimento] (@Operador_Fk smallint, @matricula varchar(50), @bomba_Fk smallint, @litro varchar(50))
as
	declare @select varchar(60)

	  select @select=Matricula from veiculos where Matricula = @matricula
if  @select =  @matricula
	begin
		select * from veiculos
	end
else
	begin
		insert into abasteciimentos(Operador_Fk,Bomba_Fk, Litro) values(@Operador_Fk,@bomba_Fk, @litro)
	end
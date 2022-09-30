/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [OperationID]
      ,[OperationCodID]
      ,[BalcaoCod]
      ,[ClienteTipo]
      ,[ClienteIBAN]
      ,[ClienteConta]
      ,[ClienteNome]
      ,[ClienteMorada]
      ,[ClienteGenero]
      ,[ClienteNif]
      ,[ClienteEstadoCivil]
      ,[ClienteRegimeBens]
      ,[ClienteEmail]
      ,[ClienteTelefone]
      ,[ClienteDocTipo]
      ,[ClienteDocIdentificacao]
      ,[ClienteDocData]
      ,[ClienteIDCredEntEmpregProtoc]
      ,[ClienteEntEmpregadora]
      ,[ClienteFuncaoCargo]
      ,[ClienteSalarioMensalLiq]
      ,[ClienteOutroRendimento_ID]
      ,[ClienteOutroRendimento_Valor]
      ,[ClienteConjConta]
      ,[ClienteConjNome]
      ,[ClienteConjDocTipo]
      ,[ClienteConjDocIdentificacao]
      ,[ClienteConjDocData]
      ,[ClienteConjMorada]
      ,[ClienteConjGenero]
      ,[ClienteConjNif]
      ,[ClienteConjEstadoCivil]
      ,[ClienteConjRegimeBens]
      ,[ClienteConjEmail]
      ,[ClienteConjTelefone]
      ,[ClienteConjEntEmpregadora]
      ,[ClienteConjSalarioMensalLiq]
      ,[AvalistaIBAN]
      ,[AvalistaDoctipo]
      ,[AvalistaDocIdentificacao]
      ,[AvalistaDocData]
      ,[AvalistaEntEmpregadora]
      ,[AvalistaConta]
      ,[AvalistaNome]
      ,[AvalistaMorada]
      ,[AvalistaGenero]
      ,[AvalistaNif]
      ,[AvalistaEstadoCivil]
      ,[AvalistaRegimeBens]
      ,[AvalistaEmail]
      ,[AvalistaTelefone]
      ,[AvalistaSalarioMensalLiq]
      ,[AvalistaValorDepositoPrazo]
      ,[AvalistaPrazoAplicacao]
      ,[AvalistaConjConta]
      ,[AvalistaConjNome]
      ,[AvalistaConjDocTipo]
      ,[AvalistaConjDocIdentificacao]
      ,[AvalistaConjDocData]
      ,[AvalistaConjMorada]
      ,[AvalistaConjGereno]
      ,[AvalistaConjNif]
      ,[AvalistaConjEstadoCivil]
      ,[AvalistaConjRegimeBens]
      ,[AvalistaConjTelefone]
      ,[AvalistaConjEmail]
      ,[AvalistaConjEntEmpregadora]
      ,[AvalistaConjSalarioMensalLiq]
      ,[SalarioMensalLiq]
      ,[CreditoPedidoMontante]
      ,[CreditoPedidoNumPrestacoes]
      ,[Step]
      ,[LastUpdate]
      ,[IDuser]
      ,[CreditoPedidoValorPremio]
      ,[CreditoPedidoValorCredito]
      ,[IDCreditoValorPremio]
      ,[ClienteTipoConta]
      ,[ClienteDataNascimento]
      ,[PedidoImportado]
      ,[SeguroCredito]
  FROM [SOPMN].[Cred].[Pedido]

-- =============================================
-- Author: Tiago Mabango
-- Create date: 27/09/2022
-- Description:	Reporting 
/*

-- RUN 
	exec [spr_ReporteInterfaceBanka] @operanId = 2200000002								
*/
-- =============================================

go
  alter  procedure spr_ReporteInterfaceBanka(@operanId bigint)
as

 begin
	  select [tabelaPedido].[OperationID], [tabelaPedido].[ClienteConta], [tabelaPedido].[ClienteNome], 
		[tabelaContrato].[MontanteCredito], [tabelaContrato].[NumeroPrestacoes], 
		A.description Utilizador
		from [SOPMN].[Cred].[Pedido]  as [tabelaPedido] (nolock) 
		join [SOPMN].[Cred].[Contrato] as tabelaContrato (nolock)
		 on [tabelaPedido].[OperationID] = [tabelaContrato].[IDOperacao] 
		 CROSS APPLY (
			select top 1
				[OperationID],
				[UserID]
			from HUB_MSG.msg.vw_OperationWorkflowHistAll [A]
			where [A].[OperationID] = [tabelaPedido].[OperationID] and [Step] = 30 -- Step Valida DOP
			order by [lastupdate] desc
		) [W] 
		inner join HUB_Admin.dbo.AdminAccount [A] (nolock)
			on [A].[IDAccount] = [W].[UserId]
		where [tabelaPedido].[OperationID] = @operanId
end

exec spr_ReporteInterfaceBanka @operanId = 2200000002

select [tabelaPedido].[OperationID], [tabelaPedido].[ClienteConta], [tabelaPedido].[ClienteNome], 
		[tabelaContrato].[MontanteCredito], [tabelaContrato].[NumeroPrestacoes], 
		A.description Utilizador
		from [SOPMN].[Cred].[Pedido]  as [tabelaPedido] (nolock) 
		join [SOPMN].[Cred].[Contrato] as tabelaContrato (nolock)
		 on [tabelaPedido].[OperationID] = [tabelaContrato].[IDOperacao] 
		 CROSS APPLY (
			select top 1
				[OperationID],
				[UserID]
			from HUB_MSG.msg.vw_OperationWorkflowHistAll [A]
			where [A].[OperationID] = [tabelaPedido].[OperationID] and [Step] = 30 -- Step Valida DOP
			order by [lastupdate] desc
		) [W] 
		inner join HUB_Admin.dbo.AdminAccount [A] (nolock)
			on [A].[IDAccount] = [W].[UserId]
		where [tabelaPedido].[OperationID] = 2200000009
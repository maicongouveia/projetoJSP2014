<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="to.*"
	import='java.util.*'
 	import="java.util.ResourceBundle"
%>
<% ResourceBundle bundle = (ResourceBundle)session.getAttribute("linguagem");%>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title><%out.print(bundle.getString("lblDadosPassagem"));%></title>
</head>

<body>
					<%
						
					//Pega a Sess�o
					HttpSession sessao = request.getSession();
				
					CheckinTO checkinTO = (CheckinTO) sessao.getAttribute("checkinTO");
					int codigoPassagem = checkinTO.getCodigo();
					ClienteTO clienteTO = checkinTO.getClienteTO();
					VooTO vooTO = checkinTO.getVooTO();
					ResponsavelTO responsavelTO = checkinTO.getResponsavelTO();
					String status = checkinTO.getStatus();				
					

					if(clienteTO.getNome() == null){
						request.setAttribute("mensagem", "erro");
						request.getRequestDispatcher("checkin_passagem.jsp").forward(request, response);;
					}
					%>
<div style="margin: auto; width: 940px; height: 350px; display: table;">
	<jsp:include page="header.jsp"></jsp:include>
	<fieldset style="border: 1px;border-radius: 10px;border-style: solid; width: 300px; min-height: 150px; margin: auto; margin-top: 100px;">
				<legend style="color: red;"><%out.print(bundle.getString("lblDadosPassagem"));%></legend>
				
				<fieldset style='border: 1px solid black; border-radius: 10px; width: 300px; margin: auto;'>
				<legend><%=bundle.getString("tela.cadDCliente.cliente")%></legend>
				
					<table style='margin: auto;'>
					<tr>					
						<td style='text-align: right;'><%=bundle.getString("tela.cadDCliente.tipo")%></td>
							<td>:</td>
						<td>
							<% out.print(clienteTO.getTipo());%>
						</td>
					</tr>
					<tr>					
						<td style='text-align: right;'><%=bundle.getString("tela.cadDCliente.nome")%></td>
							<td>:</td>
						<td>
							<% out.print(clienteTO.getTratamento());%> <% out.print(clienteTO.getNome());%> <% out.print(clienteTO.getSobrenome());%>
						</td>
					</tr>
					<tr>
						<td style='text-align: right;'><%=bundle.getString("tela.cadDCliente.dataDeNascimento")%></td>
						<td>:</td>
						<td>
							<% out.print(clienteTO.getDataNascimento());%>
						</td>
					</tr>
				</table>
				</fieldset>
				<fieldset style='border: 1px solid black; border-radius: 10px; width: 250px;margin: auto;'>
				<legend><%out.print(bundle.getString("tela.header.voo"));%></legend>
				
					<table style='margin: auto;'>
					<tr>					
						<td style='text-align: right;'><%out.print(bundle.getString("voo.lblorigem"));%></td>
							<td>:</td>
						<td>
							<% out.print(vooTO.getOrigem());%>
							
						</td>
					</tr>
					<tr>					
						<td style='text-align: right;'><%out.print(bundle.getString("voo.lbldestino"));%></td>
							<td>:</td>
						<td>
							<% out.print(vooTO.getDestino());%>
						</td>
					</tr>
					<tr>
						<td style='text-align: right;'><%out.print(bundle.getString("voo.lbldata"));%> - <%out.print(bundle.getString("voo.lblhora"));%></td>
						<td>:</td>
						<td>
							<% out.print(vooTO.getData() + " - " + vooTO.getHora());%>
						</td>
					</tr>
					<tr>
						<td style='text-align: right;'><%out.print(bundle.getString("voo.lblstatus"));%></td>
						<td>:</td>
						<td>
							<% out.print(vooTO.getSituacao());%>							
						</td>
					</tr>
					<%if(!(vooTO.getEscala1().equals(""))){%>
					<tr>
						<td style='text-align: right;'><%out.print(bundle.getString("voo.lblescalas1"));%></td>
						<td>:</td>
						<td>
							<% out.print(vooTO.getEscala1());%>							
						</td>
					</tr>
					<%} %>
					<%if(!(vooTO.getEscala2().equals(""))){%>
					<tr>
						<td style='text-align: right;'><%out.print(bundle.getString("voo.lblescalas2"));%></td>
						<td>:</td>
						<td>
							<% out.print(vooTO.getEscala2());%>							
						</td>
					</tr>
					<%} %>
				</table>
				</fieldset>
				<fieldset style='border: 1px solid black; border-radius: 10px; width: 300px; margin: auto;'>
				<legend><%=bundle.getString("lblResponsavelCompra")%></legend>
				
					<table style='margin: auto;'>
					<tr>					
						<td style='text-align: right;'><%=bundle.getString("tela.cadDCliente.nome")%></td>
							<td>:</td>
						<td>
							<% out.print(responsavelTO.getNome()); %>
						</td>
					</tr>
					<tr>					
						<td style='text-align: right;'><%=bundle.getString("rotulo.telefone")%></td>
							<td>:</td>
						<td>
							<% out.print(responsavelTO.getTelefone()); %>
						</td>
					</tr>
					<tr>					
						<td style='text-align: right;'><%=bundle.getString("rotulo.email")%></td>
							<td>:</td>
						<td>
							<% out.print(responsavelTO.getEmail()); %>
						</td>
					</tr>
				</table>				
				</fieldset>
				<table>
				
					<tr>
						<td><a href='checkin_passagem.jsp' style='text-align: left;'><%=bundle.getString("lblVoltar")%></a></td>
						<td><a href='checkin_escolherLugar.jsp' style='margin-left: 230px;'><%=bundle.getString("lblProximo")%></a></td>
					</tr>
				
				</table>	
			</fieldset>
			</div>
			
	
</body>
</html>

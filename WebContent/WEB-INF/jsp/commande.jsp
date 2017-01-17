<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="/WEB-INF/jsp/include.jsp"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<html>
<head>
<title>Commander</title>
<link rel="stylesheet" href="/Project/css/style.css" />
</head>
<body>

<form action="http://localhost:8080/Noel/actions/cadeaux/commande" method="post">
	<table>
		<tr>
			<td><span style="font-weight: bold">Nom :</span></td>
			<td>${produit.nom}</td>
		</tr>
		<tr>
			<td><span style="font-weight: bold">Prix :</span></td>
			<td>${produit.prix}</td>
		</tr>
		
			<tr>

				<td><span style="font-weight: bold">Quantité :</span></td>
				
				<td><input name="qtCom" />
				<input type="hidden"  id="idProd" name="idProd" value="${produit.idProd}" /></td>
				
			</tr>
		
		<tr>
			<td></td>
			<td><button type="submit">Commander</button></td>
		</tr>
	</table>
	</form>


</body>
</html>
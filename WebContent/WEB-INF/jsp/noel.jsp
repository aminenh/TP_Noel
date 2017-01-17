<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ include file="/WEB-INF/jsp/include.jsp"%>
<c:url var="commande" value="/actions/cadeaux/commande"></c:url>
<c:url var="edit" value="/actions/cadeaux/edit" />
<c:url var="supp" value="/actions/cadeaux/supp" />


<html>
<head>
<title>Bienvenue</title>
<link rel="stylesheet" href="/Project/css/style.css" />
<title>Liste des produits</title>
</head>
<body>
	<h1>Bienvenue dans notre application</h1>
	<c:if test="${auth != null}">
		<h2>Espace Responsable :</h2>
		<table border="1">
			<tr>
				<td>ID</td>
				<td>Nom</td>
				<td>Prix</td>
				<td>Quantité disponible</td>
			</tr>
			<c:forEach items="${oProduits}" var="prd">
				<tr>
					<td>${prd.idProd}</td>
					<td>${prd.nom}</td>
					<td>${prd.prix}</td>
					<td>${prd.qtProd}</td>

					<td><a href="${edit}?idProd=${prd.idProd}">Modifier</a></td>
					<td><a href="${sup}?idProd=${prd.idProd}">Supprimer</a></td>
				</tr>
			</c:forEach>
		</table>
		<button type="button" name="Ajout" value="Ajout"
			onclick="self.location.href='http://localhost:8080/Noel/actions/cadeaux/edit'">
			Ajouter Produit</button>
	</c:if>
	<c:if test="${auth == null}">
			<h2>Espace Clients :</h2>
		<table border="1">
			<tr>
				<td>ID</td>
				<td>Nom</td>
				<td>Prix</td>
				<td>Quantité disponible</td>
			</tr>
			<c:forEach items="${oProduits}" var="prd">
				<tr>
					<td>${prd.idProd}</td>
					<td>${prd.nom}</td>
					<td>${prd.prix}</td>
					<td>${prd.qtProd}</td>
					<td><a href="${commande}?idProd=${prd.idProd}">Commander</a></td>
				</tr>
			</c:forEach>
		</table>
	</c:if>
</body>
</html>
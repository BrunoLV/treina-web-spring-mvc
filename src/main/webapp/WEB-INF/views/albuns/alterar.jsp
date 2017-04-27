<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<h2>Alteração do álbum ${album.nome}</h2>
<c:url var="actionAlterar" value="/albuns/alterar"/>
<form:form action="${actionAlterar}" method="post" modelAttribute="album">

    <div class="row">
        <div class="col-md-6">
            <div class="form-group">
                <label class="form-label">ID: </label>
                <form:input path="id" cssClass="form-control" readonly="true"/>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-md-6">
            <div class="form-group">
                <label class="form-label">Nome: </label>
                <form:input path="nome" cssClass="form-control"/>
                <form:errors path="nome" cssStyle="color: red;"/>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-md-6">
            <div class="form-group">
                <label class="form-label">Ano de lançamento</label>
                <form:input path="anoDeLancamento" cssClass="form-control"/>
                <form:errors path="anoDeLancamento" cssStyle="color: red;"/>
            </div>
        </div>
    </div>

    <input type="submit" value="Salvar!" class="btn btn-default"/>
</form:form>

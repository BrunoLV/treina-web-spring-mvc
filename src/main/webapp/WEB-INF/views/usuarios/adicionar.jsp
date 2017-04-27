<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<h2>Inserção de novo usuário...</h2>
<c:url var="actionAdicionar" value="/usuarios/adicionar"/>
<form:form action="${actionAdicionar}" method="post"
           modelAttribute="usuario">

    <div class="row">
        <div class="col-md-6">
            <div class="form-group">
                <label class="form-label">Nome de usuário: </label>
                <form:input path="username" cssClass="form-control"/>
                <form:errors path="username" cssStyle="color: red;"/>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-md-6">
            <div class="form-group">
                <label class="form-label">Senha: </label>
                <form:password path="password" cssClass="form-control"/>
                <form:errors path="password" cssStyle="color: red;"/>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-md-6">
            <div class="form-group">
                <label class="form-label">Perfil: </label>
                <select name="role" class="form-control">
                    <option value="ROLE_ADMIN">Administrador</option>
                    <option value="ROLE_USER">Usuário comum</option>
                </select>
            </div>
        </div>
    </div>

    <input type="submit" value="Salvar!" class="btn btn-default"/>
</form:form>

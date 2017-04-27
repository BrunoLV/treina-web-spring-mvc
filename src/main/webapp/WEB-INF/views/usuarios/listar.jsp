<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<h2>Listagem de usuários</h2>

<hr/>
<table class="table" id="tbl-usuarios">
    <thead>
    <th>ID</th>
    <th>Nome de usuário</th>
    <th>Role</th>
    </thead>
    <tbody>
    <c:if test="${!empty usuarios}">
        <c:forEach items="${usuarios}" var="usuario">
            <tr>
                <td>${usuario.id}</td>
                <td>${usuario.username}</td>
                <td>${usuario.role}</td>
            </tr>
        </c:forEach>
    </c:if>
    </tbody>
</table>
<br/>
<a href="/TreinaWebSpringMVC/usuarios/adicionar" class="btn btn-default">Adicionar novo usuário</a>

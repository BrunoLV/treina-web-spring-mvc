<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<h2>Listagem de músicas</h2>
<br/>
<div class="row">
    <div class="col-md-10">
        <div class="form-group">
            <label>Música a ser pesquisada: </label>
            <input type="text" id="txt-pesquisa" class="form-control">
        </div>
        <button class="btn btn-default" id="btn-pesquisa">Pesquisar</button>
    </div>
</div>
<hr/>
<table class="table" id="tbl-musicas">
    <thead>
    <th>ID</th>
    <th>Nome da música</th>
    <th>Data de criação</th>
    <th>Nome do álbum</th>
    <th>Ações</th>
    </thead>
    <tbody>
    <c:if test="${!empty musicas}">
        <c:forEach items="${musicas}" var="musica">
            <tr>
                <td>${musica.id}</td>
                <td>${musica.nome}</td>
                <fmt:formatDate value="${musica.dataCriacao}" pattern="dd/MM/yyyy" var="dataFormatada" timeZone="UTC"/>
                <td>${dataFormatada}</td>
                <td>${musica.album.nome}</td>
                <td>
                    <a href="/TreinaWebSpringMVC/musicas/alterar/${musica.id}">Alterar</a> |
                    <a href="/TreinaWebSpringMVC/musicas/excluir/${musica.id}">Excluir</a>
                </td>
            </tr>
        </c:forEach>
    </c:if>
    </tbody>
</table>
<br/>
<a href="/TreinaWebSpringMVC/musicas/adicionar" class="btn btn-default">Adicionar nova música</a>

<script type="text/javascript">
    $(document).ready(function () {
        $('#btn-pesquisa').click(function () {
            var nomeMusica = $('#txt-pesquisa').val();
            $.ajax({
                method: 'GET',
                url: '/TreinaWebSpringMVC/musicas/porNome?nome=' + nomeMusica,
                success: function (data) {
                    $('#tbl-musicas tbody > tr').remove();
                    $.each(data, function (index, musica) {
                        $('#tbl-musicas tbody').append(
                            '<tr>' +
                            '   <td>' + musica.id + '</td>' +
                            '   <td>' + musica.nome + '</td>' +
                            '   <td>' +
                            '       <a href="/TreinaWebSpringMVC/musicas/alterar/' + musica.id + '">Alterar</a> |' +
                            '       <a href="/TreinaWebSpringMVC/musicas/excluir/' + musica.id + '">Excluir</a> ' +
                            '   </td>' +
                            '</tr>'
                        );
                    });
                },
                error: function () {
                    alert("Houve um erro na requisição.");
                }
            });
        });
    });
</script>
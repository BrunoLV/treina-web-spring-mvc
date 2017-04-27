<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<h2>Listagem de álbuns</h2>
<br/>
<div class="row">
    <div class="col-md-10">
        <div class="form-group">
            <label>Álbum a ser pesquisado: </label>
            <input type="text" id="txt-pesquisa" class="form-control">
        </div>
        <button class="btn btn-default" id="btn-pesquisa">Pesquisar</button>
    </div>
</div>
<hr/>
<table class="table" id="tbl-albuns">
    <thead>
    <th>ID</th>
    <th>Nome do álbum</th>
    <th>Ano do lançamento</th>
    <th>Ações</th>
    </thead>
    <tbody>
    <c:if test="${!empty albuns}">
        <c:forEach items="${albuns}" var="album">
            <tr>
                <td>${album.id}</td>
                <td>${album.nome}</td>
                <td>${album.anoDeLancamento}</td>
                <td>
                    <a href="/TreinaWebSpringMVC/albuns/alterar/${album.id}">Alterar</a> |
                    <a href="/TreinaWebSpringMVC/albuns/excluir/${album.id}">Excluir</a>
                </td>
            </tr>
        </c:forEach>
    </c:if>
    </tbody>
</table>
<br/>
<a href="/TreinaWebSpringMVC/albuns/adicionar" class="btn btn-default">Adicionar novo álbum</a>

<script type="text/javascript">
    $(document).ready(function () {
        $('#btn-pesquisa').click(function () {
            var nomeAlbum = $('#txt-pesquisa').val();
            $.ajax({
                method: 'GET',
                url: '/TreinaWebSpringMVC/albuns/porNome?nome=' + nomeAlbum,
                success: function (data) {
                    $('#tbl-albuns tbody > tr').remove();
                    $.each(data, function (index, album) {
                        $('#tbl-albuns tbody').append(
                            '<tr>' +
                            '   <td>' + album.id + '</td>' +
                            '   <td>' + album.nome + '</td>' +
                            '   <td>' + album.anoDeLancamento + '</td>' +
                            '   <td>' +
                            '       <a href="/TreinaWebSpringMVC/albuns/alterar/' + album.id + '">Alterar</a> |' +
                            '       <a href="/TreinaWebSpringMVC/albuns/excluir/' + album.id + '">Excluir</a> ' +
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
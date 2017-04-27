<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<h2>Login</h2>

<form action="/TreinaWebSpringMVC/login" method="post">

    <div class="row">
        <div class="col-md-6">
            <div class="form-group">
                <label class="form-label">Nome de usuário: </label>
                <input type="text" name="username" class="form-control">
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-md-6">
            <div class="form-group">
                <label class="form-label">Senha: </label>
                <input type="password" name="password" class="form-control">
            </div>
        </div>
    </div>

    <input type="submit" value="Fazer login" class="btn btn-default"/>
</form>

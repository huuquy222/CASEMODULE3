<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>The gioi di dong</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
          integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
          crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="/logintted/style.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css"
          integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
</head>

<body>
    <div class="Container">
        <form action="/login" method="post" class="form-login">
            <h1>Đăng Nhập</h1>
            <div class="form-text">
                <label>Email</label>
                <input type="text" name="email">
            </div>
            <div class="form-text" >
                <label>Password</label>
                <i class="fa-solid fa-key"></i>
                <input type="password" name="password">
            </div>
            <button  type="submit">Đăng Nhập</button>
            <span>Bạn Chưa Có Tài Khoản? Đăng Ký <a href="">Tai Đây</a></span>

        </form>
    </div>
    <script>
        // const formoLgin = document.querySelectorAll('.form-text input')
        // const formLabel = document.querySelectorAll('.form-text label')
        // for (let i = 0; i < 2; i++) {
        //     formoLgin[i].addEventListener("mouseover", function () {
        //         formLabel[i].classList.add("focus")
        //     })
        //     formoLgin[i].addEventListener("mouseout", function () {
        //         if (formoLgin[i].value = "") {
        //             formLabel[i].classList.remove("focus")
        //         }
        //
        //     })
        // }
    </script>
</body>

</html>
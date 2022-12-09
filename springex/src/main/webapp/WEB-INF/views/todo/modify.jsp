<%--
  Created by IntelliJ IDEA.
  User: lsh
  Date: 2022-12-07
  Time: 오후 5:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
    <title>Title</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>
<body>


<div class="container-fluid">
  <div class="row">
    <div class="col">
      <nav class="navbar navbar-expand-lg bg-light">
        <div class="container-fluid">
          <a class="navbar-brand" href="#">Navbar</a>
          <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>
          <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
            <div class="navbar-nav">
              <a class="nav-link active" aria-current="page" href="#">Home</a>
              <a class="nav-link" href="#">Features</a>
              <a class="nav-link" href="#">Pricing</a>
              <a class="nav-link disabled">Disabled</a>
            </div>
          </div>
        </div>
      </nav>
    </div>
  </div>
  <div class="row content">
    <div class="col">
      <div class="card">
        <div class="card-header">
          Featured
        </div>
        <div class="card-body">
          <form action="/todo/modify"  method="podt">



          <div class="input-group mb-3">
            <span class="input-group-text">TNO</span>
            <input type="text" name="tno" class="form-control"
                   value=<c:out value="${dto.tno}"></c:out> readonly>
          </div>
          <div class="input-group mb-3">
            <span class="input-group-text">Titme</span>
            <input type="text" name="title" class="form-control"
                   value=<c:out value="${dto.title}"></c:out> >
          </div>
          <div class="input-group mb-3">
            <span class="input-group-text">DueDate</span>
            <input type="text" name="dueDate" class="form-control"
                   value=<c:out value="${dto.dueDate}"></c:out> >
          </div>
          <div class="input-group mb-3">
            <span class="input-group-text">Write</span>
            <input type="text" name="write" class="form-control"
                   value=<c:out value="${dto.writer}"></c:out> readonly>
          </div>

          <div class="form-check">
            <label class="form-check-lavel">
              Finished &nbsp;&nbsp
            </label>
            <input class="form-check-input" type="checkbox" name="finished" ${dto.finished?"checked":""}>
          </div>

          <div class="my-4">
            <div class="float-end">
              <button type="button" class="btn btn-danger">Remove</button>
              <button type="button" class="btn btn-primary">Modify</button>
              <button type="button" class="btn btn-secondary">List</button>
            </div>
          </div>
          </form>
        </div>

      </div>

    </div>
  </div>
  <div class="row footer">
    <div class="row fixed-bottom" style="z-index: -100">
      <footer class="py-1 mt-1">
        <p class="text-center text-muted">Footer</p>
      </footer>
    </div>
  </div>
</div>

<script>
  //수정 버튼 클릭 시
  document.querySelector(".btn-primary").addEventListener("click",function(e){
    e.preventDefault()
    e.stopPropagation()

    formObj.action = "/todo/modify"
    formObj.method="post"

    formObj.submit()
  },false);

  //리스크 버튼 클릭 시
  document.querySelector(".btn-secondary").addEventListener("click",function (e){
    e.preventDefault()
    e.stopPropagation()

    self.location = `/todo/list?${pageRequestDTO.link}`

  },false);

  //삭제 버튼 클릭 시
  const formObj = document.querySelector("form")

  document.querySelector(".btn-danger").addEventListener("click",function(e) {
    e.preventDefault()
    e.stopPropagation()

    formObj.action =`/todo/remove?${pageRequestDTO.link}`
    formObj.method ="post"

    formObj.submit()

  },false);
  //수정 버튼 클릭 시




  //@Valid에서 문제가 발생했다면 이를 자바스크립트 객체로 필요할 때 사용할 수 있도록 합니다.

  const serverValidResult = {}
  <c:forEach items="${errors}" var="error">
  serverValidResult['${error.getField()}'] = '${error.defaultMessage}'
  </c:forEach>
  console.log(serverValidResult)

</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html>

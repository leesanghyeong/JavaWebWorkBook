<%--
  Created by IntelliJ IDEA.
  User: lsh
  Date: 2022-12-07
  Time: 오후 4:44
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
            <div class = "card">
                <div class="card-body">
                    <h5 class="card-title">Search</h5>
                    <form action="/todo/list" method="get">
                        <input type="hidden" name="size" value="${pageRequestDTO.size}">
                        <div class="mb-3">
                            <input type="checkbox" name="finished" ${pageRequestDTO.finished?"checked":""}> 완료여부
                        </div>
                        <div class="mb-3">
                            <input type="checkbox" name="types" value="t" ${pageRequestDTO.checkType("t")?"checked":""}> 제목
                            <input type="checkbox" name="types" value="w"${pageRequestDTO.checkType("w")?"checked":""}> 작성자
                            <input type="text" name="keyword"  class="form-control" value='<c:out value="${pageRequestDTO.keyword}"/>'>
                        </div>
                        <div class="input-group mb-3 dueDateDiv">
                            <input type="date" name="from" class="form-control" value="${pageRequestDTO.from}">
                            <input type="date" name="to" class="form-control" value="${pageRequestDTO.to}">
                        </div>
                        <div class="input-group mb-3">
                            <div class="float-end">
                                <button class="btn btn-primary" type="submit">Search</button>
                                <button class="btn btn-info clearBtn" type="reset">Clear</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <div class="row content">
        <div class="col">
            <div class="card">
                <div class="card-header">
                    Featured
                </div>
                <div class="card-body">
                    <h5 class="card-title">Special title treatment</h5>
                    <table class="table">
                        <thead>
                        <tr>
                            <th scope="col">Tno</th>
                            <th scope="col">Title</th>
                            <th scope="col">Writer</th>
                            <th scope="col">DueDate</th>
                            <th scope="col">Finished</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${responseDTO.dtoList}" var="dto">
                            <tr>
                                <th scope="row"><c:out value="${dto.tno}"/> </th>
                                <td><a href="/todo/read?tno=${dto.tno}&${pageRequestDTO.link}" class="text-decoration-none"><c:out value="${dto.title}"/></a></td>
                                <td><c:out value="${dto.writer}"/></td>
                                <td><c:out value="${dto.dueDate}"/></td>
                                <td><c:out value="${dto.finished}"/></td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                    <div class="float-end">
                        <nav aria-label="Page navigation example">
                            <ul class="pagination">
                                <c:if test="${responseDTO.prev}">
                                <li class="page-item"><a class="page-link" data-num="${responseDTO.start-1}" href="#">Previous</a></li>
                                </c:if>
                                <c:forEach begin="${responseDTO.start}" end="${responseDTO.end}" var="num">
                                    <li class="page-item ${responseDTO.page == num ? "active": ""}"><a class="page-link" data-num="${num}" href="#">${num}</a></li>
                                </c:forEach>
                                <li class="page-item"><a class="page-link" data-num="${responseDTO.end +1}" href="#">Next</a></li>
                            </ul>
                        </nav>
                    </div>
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
    document.querySelector(".pagination").addEventListener("click",function(e){
        e.preventDefault()
        e.stopPropagation()

        const target = e.target

        if(target.tagName !== 'A'){
            return
        }
        const num = target.getAttribute("data-num")

        const formObj = document.querySelector("form")

        formObj.innerHTML += `<input type='hidden' name='page' value='\${num}'>`

        formObj.submit();

    },false)

    document.querySelector(".clearBtn").addEventListener("click",function (e){
        e.preventDefault()
        e.stopPropagation()

        self.location = '/todo/list'
    },false)
</script>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html>

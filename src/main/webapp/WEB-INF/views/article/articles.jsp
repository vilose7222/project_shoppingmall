<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!doctype html>
<html lang="ko">

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">


  <!-- Favicon -->
    <link href="/img/favicon.ico" rel="icon">


    <!-- CSS Libraries -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <link href="lib/slick/slick.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">

<%-- CSS 파일 포함 --%>
<jsp:include page="/WEB-INF/views/modules/styles.jsp" />
<script defer src="/js/replys.js"></script>
<script defer src="/js/article-reply.js"></script>
<title>D & C memo</title>

<!-- icon -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <style>
        body {
            font-family:'cookie', sans-serif;
        }

        header {

            color: black;
            padding: 10px;
            border-bottom: 2px solid black;
        }

        main {
            margin: 20px;
        }

        .review {
            border: 1px solid #ccc;
            padding: 10px;
            margin-bottom: 10px;
            background-color: #f9f9f9;
            position: relative;
        }

        .review-title {
            font-weight: bold;
            display: flex;
            justify-content: flex-end;
            
        }

        .review-rating {
            color: #ff9900;
            margin-top: 5px;
        }

        .review-content {
            margin-top: 10px;
        }

        form {
            margin-top: 20px;
        }

        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }

        input[type="text"],
        textarea {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
        }

       

        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }

        .input-container {
            display: flex;
            align-items: center;
            margin-bottom: 10px;
            border-bottom: 2px solid black ;
        }


        textarea {
            flex: 1;
            /* Take remaining width */
            padding: 5px;
            margin-bottom: 10px;
        }

        .submit-btn {
            font-size: 24px;
            background-color: white;
            color: #fff;
            border: 1px solid black;
            border-left: none;
            padding: 16px 18px;
            cursor: pointer;
            margin-top: -10px;
        }
        textarea {
    resize: none;
  }

 .hidden {
    display: none;
  }
  .review{
  margin: 15px 0px;
  }
  .btn-div,
  .replyView{
  	display:flex;
  	justify-content: flex-end;

  
  }

  #replyBtn{
  border-radius:20% 0% 20% 0%;
  border:none;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.5);
  
  }
  
  #replyBtn:hover{
  	background:black;
  	color:white;
  	transition: 0.5s;
  	 
  }
  

  
    </style>
</head>

<body>

		<!-- ======================================== Header Start ======================================== -->
		<jsp:include page="/WEB-INF/views/modules/header.jsp" />
		<!-- ======================================== Header End ======================================== -->

	

	


   

    <!-- Breadcrumb Start -->
    <div class="breadcrumb-wrap">
        <div class="container">
            <ul class="breadcrumb">
                <li class="breadcrumb-item"><a href="#">Home</a></li>
                <li class="breadcrumb-item active">Contact</li>
            </ul>
        </div>
    </div>
    <!-- Breadcrumb End -->


    <!-- Contact Start -->
    <div class="container">
        <header>
            <h1>자유 게시판</h1>
        </header>
        <main>
        <form action="${path}/article" method="post" role="form" novalidate>
               <label for="content">리뷰 내용</label>
               <div class="input-container">
                  <textarea id="content" name="content"
                     <c:choose>
        <c:when test="${empty loginCustomer}">
            placeholder="로그인 하여야 게시글을 입력할 수 있습니다...."
        </c:when>
        <c:otherwise>
            placeholder="작성하실 글을 입력하세요!"
        </c:otherwise>
    </c:choose>
                     required <c:if test="${empty loginCustomer}">disabled</c:if>></textarea>
                  <button class="submit-btn" type="submit">
                     <i class="fa-solid fa-pen-to-square"></i>
                  </button>
               </div>
            </form>

       
  <c:forEach var="memo" items="${list}">
    <div class="review">${memo.memoId }
        <div class="review-title">${memo.customerId}님 / ${memo.datecreated}</div>
        <div class="review-content">
            <p class="form-control text-start bg-gray-200">${memo.contents}</p>
   <div class="btn-div">
   
   
   <%-- 댓글 입력 --%>
<textarea id="reple-${memo.memoId}" 
                     <c:choose>
        <c:when test="${empty loginCustomer}">
            placeholder="로그인 하여야 댓글을 입력할 수 있습니다...."
        </c:when>
        <c:otherwise>
            placeholder="댓글을 입력 해 주세요!"
        </c:otherwise>
    </c:choose>
                     required <c:if test="${empty loginCustomer}">disabled</c:if>></textarea>
                     <button id="sendReplyBtn" value="${memo.memoId}">전송</button>
                     
                     
                     
    </div>
     <button id="replyBtn" style="display : inline-block" value="${memo.memoId}">댓글</button>
        <div id="replyView" data-id="${memo.memoId}"></div>
        </div>
    </div>
    
</c:forEach>



			 <!-- 페이징 처리 -->
         <nav class="mt-3">
            <ul class="pagination justify-content-center">
               <%-- 처음으로 보여주기 여부 --%>
               <c:if test="${pagination.showFirst}">
                  <li class="page-item"><a class="page-link" href="?page=1"
                     aria-label="First"> <span aria-hidden="true">처음으로</span>
                  </a></li>
               </c:if>

               <%-- 이전 목록 보여주기 여부 --%>
               <c:if test="${pagination.showPrevious}">
                  <li class="page-item"><a class="page-link"
                     href="?page=${pagination.previousStartPage}"
                     aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
                  </a></li>
               </c:if>

               <c:forEach var="i" begin="${pagination.startPage }"
                  end="${pagination.endPage }">
                  <c:choose>
                     <c:when test="${i == pagination.params.requestPage}">
                        <li class="page-item active"><a class="page-link">${i}</a></li>
                     </c:when>
                     <c:otherwise>
                        <li class="page-item"><a class="page-link"
                           href="?page=${i}">${i}</a></li>
                     </c:otherwise>
                  </c:choose>
               </c:forEach>

               <%-- 다음 목록 보여주기 여부 --%>
               <c:if test="${pagination.showNext}">
                  <li class="page-item"><a class="page-link"
                     href="?page=${pagination.nextStartPage}" aria-label="Next"> <span
                        aria-hidden="true">&raquo;</span>
                  </a></li>
               </c:if>

               <%-- 마지막으로 보여주기 여부 --%>
               <c:if test="${pagination.showLast}">
                  <li class="page-item"><a class="page-link"
                     href="?page=${pagination.totalPages}" aria-label="First"> <span
                        aria-hidden="true">마지막으로</span>
                  </a></li>
               </c:if>
            </ul>
         </nav>
			

        </main>
    </div>
    <!-- Contact End -->

	<!-- JavaScript Start -->
	<jsp:include page="/WEB-INF/views/modules/scripts.jsp" />
	
	<!-- Footer 모듈 삽입 -->
<jsp:include page="/WEB-INF/views/modules/footer.jsp"/>
	<!-- JavaScript End -->
</body>

</html>
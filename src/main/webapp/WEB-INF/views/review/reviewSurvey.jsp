<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <jsp:include page="../assets/layout/user/lib.jsp" />  
    <!-- golgolz start -->
    <!-- golgolz end -->
    <style text="text/css">
        <!-- golgolz start -->
           body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
        }
        form {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            font-size: 15px;
            width: 500px; /* 폼의 너비 설정 */
            margin: 0 auto; /* 좌우 가운데 정렬 */
        }
        h1 {
            text-align: center;
            font-size: 25px;
            margin-bottom: 20px;
        }
        .item {
            margin-bottom: 20px;
            padding-bottom: 10px;
            border-bottom: 1px solid #ccc;
        }
        .item:last-child {
            border-bottom: none;
        }
        .options label {
            display: inline-block;
             margin-bottom: 5px; 
            margin-right: 10px;
        }
        .options input[type="radio"] {
            margin-right: 5px;
        }
        .button-survey {
            display: block;
            width: 100%;
            padding: 10px;
            font-size: 18px;
            background-color: #007BFF;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        button:hover {
            background-color: #0056b3;
        }
        <!-- golgolz end -->
    </style>
    <script text="text/javascript">
        $(function(){
            <!-- golgolz start -->
            <!-- golgolz end -->
        });
    </script>
</head>
<body>
    <div id="__next" data-reactroot="">
        <jsp:include page="../assets/layout/user/header.jsp" />
        <main class="JobsFeed_Jobsfeed__DpeV9">  
            <section class="Section_Section__P1hhc">
           <form action="${pageContext.request.contextPath}/review/reviewSurvey.do" method="post">
    <h1>설문조사</h1>
    <input type="hidden" name="companyCode" value="${companyCode}">
    <input type="hidden" name="userId" value="${userId}">
    <input type="hidden" name="reviewNum" value="${reviewNum}">
                    <div class="item">
                        <label for="question1" style="margin-bottom: 20px; display: block;">1. 이직 시 나의 커리어에 도움이 될까요?</label>
                        <div class="options">
                            <input type="radio" id="question1_yes" name="question1" value="2">
                            <label for="question1_yes">예</label><br>
                            <input type="radio" id="question1_maybe" name="question1" value="1">
                            <label for="question1_maybe">글쎄요</label><br>
                            <input type="radio" id="question1_no" name="question1" value="0">
                            <label for="question1_no">아니오</label>
                        </div>
                    </div>
                    <div class="item">
                        <label for="question2" style="margin-bottom: 20px; display: block;">2. 연차를 마음대로 사용할 수 있나요?</label><br>
                        <div class="options">
                            <input type="radio" id="question2_yes" name="question2" value="2">
                            <label for="question2_yes">예</label><br>
                            <input type="radio" id="question2_maybe" name="question2" value="1">
                            <label for="question2_maybe">글쎄요</label><br>
                            <input type="radio" id="question2_no" name="question2" value="0">
                            <label for="question2_no">아니오</label>
                        </div>
                    </div>
                    <div class="item">
                        <label for="question3" style="margin-bottom: 20px; display: block;">3. 급여는 만족스럽나요?</label><br>
                        <div class="options">
                            <input type="radio" id="question3_yes" name="question3" value="2">
                            <label for="question3_yes">예</label><br>
                            <input type="radio" id="question3_maybe" name="question3" value="1">
                            <label for="question3_maybe">글쎄요</label><br>
                            <input type="radio" id="question3_no" name="question3" value="0">
                            <label for="question3_no">아니오</label>
                        </div>
                    </div>
                    <div class="item">
                        <label for="question4" style="margin-bottom: 20px; display: block;">4. 직원을 위한 복지 혜택이 충분한가요?</label><br>
                        <div class="options">
                            <input type="radio" id="question4_yes" name="question4" value="2">
                            <label for="question4_yes">예</label><br>
                            <input type="radio" id="question4_maybe" name="question4" value="1">
                            <label for="question4_maybe">글쎄요</label><br>
                            <input type="radio" id="question4_no" name="question4" value="0">
                            <label for="question4_no">아니오</label>
                        </div>
                    </div>
                    <button class="button-survey" type="submit">제출</button>
                </form>
            </section>
            <jsp:include page="../assets/layout/user/footer.jsp" />
        </main>
    </div>
</body>
</html>

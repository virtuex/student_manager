<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title></title>

    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- 引入bootstrap -->
    <link rel="stylesheet" type="text/css" href="/css/bootstrap.min.css">
    <!-- 引入JQuery  bootstrap.js-->
    <script src="/js/jquery-3.2.1.min.js"></script>
    <script src="/js/bootstrap.min.js"></script>
    <script>
        function computeTotal() {
            var common = $("#common").val();
            if(common>100){
                $("#common").val(100);
                common=100;
            }
            var exam =  $("#exam").val();
            if(exam>100){
                $("#exam").val(100);
                exam=100;
            }
            var total = 0.2 * common + 0.8 * exam;
            $("#final").attr("value", total);
        }
    </script>
</head>
<body>
<!-- 顶栏 -->
<jsp:include page="top.jsp"></jsp:include>
<!-- 中间主体 -->
<div class="container" id="content">
    <div class="row">
        <jsp:include page="menu.jsp"></jsp:include>
        <div class="col-md-10">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <div class="row">
                        <h1 style="text-align: center;">学生打分</h1>
                    </div>
                </div>
                <div class="panel-body">
                    <form name="reset" class="form-horizontal" role="form" action="/teacher/mark" id="editfrom"
                          method="post" onsubmit="return check()">
                        <div class="form-group">
                            <div class="col-sm-10">
                                <input readonly="readonly" type="hidden" class="form-control" name="courseid"
                                       id="inputEmail3" value="${selectedCourse.courseid}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-2 control-label">学号</label>
                            <div class="col-sm-10">
                                <input readonly="readonly" type="text" class="form-control" name="studentid"
                                       id="inputEmail4" value="${selectedCourse.studentid}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputPassword3" class="col-sm-2 control-label">姓名</label>
                            <div class="col-sm-10">
                                <input readonly="readonly" type="text" name="name" class="form-control"
                                       id="inputPassword3" value="${selectedCourse.studentCustom.username}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputPassword3" class="col-sm-2 control-label">平时成绩</label>
                            <div class="col-sm-10">
                                <input type="number" max="100" class="form-control" id="common" placeholder="请平时成绩"
                                       oninput="computeTotal()">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputPassword3" class="col-sm-2 control-label">卷面成绩</label>
                                <div class="col-sm-10">
                                    <input type="number" max="100" class="form-control" id="exam" placeholder="请考试成绩"
                                           oninput="computeTotal()">
                                </div>
                        </div>
                        <div class="form-group">
                            <label for="inputPassword3" class="col-sm-2 control-label">最终成绩</label>
                            <div class="col-sm-10">
                                <input type="number" name="mark" class="form-control" id="final" placeholder="请输入成绩">
                                <span style="color: red">总成绩计算规则：平时成绩*20%+卷面成绩*80%</span>
                            </div>
                        </div>
                        <div class="form-group" style="text-align: center">
                            <button class="btn btn-default" type="submit">提交</button>
                            <button class="btn btn-default">重置</button>
                        </div>
                    </form>
                </div>

            </div>

        </div>
    </div>
</div>
<div class="container" id="footer">
    <div class="row">
        <div class="col-md-12"></div>
    </div>
</div>
</body>
<script>
    $("#nav li:nth-child(1)").addClass("active")

    function check() {
        if (reset.mark.value == "" || reset.mark.value == null) {
            alert("请输入成绩");
            return false;
        }
    }
</script>
</html>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/11/28 0028
  Time: 下午 2:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link href="static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="static/js/jquery-3.3.1.js"></script>
    <script src="static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<body>

<div class="container">

    <%--标题--%>
    <div class="row">
        <div class="col-md-12">
            <h1>新闻列表</h1>
        </div>
    </div>

    <%--按钮--%>
    <div class="row">
        <div class="col-md-4 col-md-offset-8">
            <button type="button" class="btn btn-success" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo" id="add">新增</button>
            <button class="btn btn-danger">删除</button>
        </div>
    </div>

    <%--显示数据--%>
    <div class="row">
        <div class="col-md-12">
            <table class="table table-hover" id="emps_table">
                <thead>
                <tr>
                    <td>#</td>
                    <td>新闻标题</td>
                    <td>新闻摘要</td>
                    <td>作者</td>
                    <td>创建时间</td>
                    <td>操作</td>
                </tr>
                </thead>
                <tbody>


                </tbody>

            </table>

        </div>

    </div>

    <%--分页--%>
    <div class="row">
        <%--分页描述--%>
        <div class="col-md-3" id="emps_page_info">

        </div>

        <%--分页按钮--%>
        <div class="col-md-9" id="emps_page_nav">

        </div>

    </div>

</div>


<%--新增--%>

<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="exampleModalLabel">新增</h4>
            </div>
            <div class="modal-body">
                <form>
                    <div class="form-group">
                        <label for="recipient-name" class="control-label">新闻标题:</label>
                        <input type="text" class="form-control" id="recipient-name">
                    </div>
                    <div class="form-group">
                        <label for="message-text" class="control-label">新闻摘要:</label>
                        <textarea class="form-control" id="message-text"></textarea>
                    </div>
                    <div class="form-group">
                        <label for="message-text" class="control-label">作者:</label>
                        <textarea class="form-control" id="auth"></textarea>
                    </div>
                    <%--<div class="form-group">
                        <label for="message-text" class="control-label">创建时间:</label>
                        <textarea class="form-control" id="time"></textarea>
                    </div>--%>
                    <input type="hidden"  onload="getNowDate();" id="ti"/>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="tijiao">提交</button>
            </div>
        </div>
    </div>
</div>

<%--评论--%>
<div class="modal fade" id="updata" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="pinglun">评论</h4>
            </div>
            <div class="modal-body">
                <form>

                    <div class="form-group">
                        <label for="message-text" class="control-label">评论:</label>
                        <textarea class="form-control" id="updata-pinglun"></textarea>
                    </div>
                    <div class="form-group">
                        <label for="message-text" class="control-label">评论人:</label>
                        <textarea class="form-control" id="updata-auth"></textarea>
                    </div>
                    <input type="hidden"  onload="getNowDate();" id="ti2"/>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="updata-tijiao">提交</button>
            </div>
        </div>
    </div>
</div>
</body>


<script type="text/javascript">

        function getNowDate() {
            var date = new Date();
            var year = date.getFullYear();
            var month = date.getMonth() + 1;
            var day  = date.getDate();
             if (month >= 1 && month <= 9) {
                month = "0" + month;
                }
            if (day >= 0 && day <= 9) {
                day = "0" + day;
            }
            document.getElementById("ti2").innerHTML = year + "-" + month + "-" + day ;
        }

    $(function(){
        pages(1);
    });

    function pages(pn){
        $.ajax({
            url:"/all",
            data:"pn="+pn,
            type:"GET",
            success:function (result) {
                newDetail(result);
                page(result);
                pageNav(result);
            }
        })
    }

    //显示表格中的数据
    function  newDetail(result) {

        function formatDate(time) {
            var $time=new Date(time);
            var year=$time.getFullYear();
            var month=$time.getMonth()+1;
            var date=$time.getDate();
            return year+"-"+month+"-"+date;
        }
        $("#emps_table tbody").empty();
        $.each(result.extend.pageInfo.list,function (index,item) {  //index  下标  item: 元素

            var newIdTd=$("<td></td>").append(item.id);
            var newTilteTd=$("<td></td>").append(item.title);
            var newSummaryTd=$("<td></td>").append(item.summary);
            var newAuthorTd=$("<td></td>").append(item.author);
            var newCreatedateTd=$("<td></td>").append(formatDate(item.createdate));


            var editBtn=$("<td></td>").append($("<button></button>").addClass("btn btn-success btn-sm")
                .append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("评论"));


            var but=$("<button></button>").addClass("btn btn-danger btn-sm");


            var delBtn=$("<td></td>").append(but.append($("<span></span>").addClass("glyphicon glyphicon-trash")).append("删除"));

            var btntd=$("<td></td>").append(editBtn).append(" ").append(delBtn);


            $("<tr></tr>").append(newIdTd)
                .append(newTilteTd)
                .append(newSummaryTd)
                .append(newAuthorTd)
                .append(newCreatedateTd)
                .append(btntd)
                .appendTo($("#emps_table tbody"));

        })


    }

    function  page(result) {
        $("#emps_page_info").empty();

        $("#emps_page_info").append("当前第"+result.extend.pageInfo.pageNum+"页，共"+result.extend.pageInfo.pages+"页，共"+result.extend.pageInfo.total+"记录");
    }

    function pageNav(result) {

        $("#emps_page_nav").empty();
        var ul=$("<ul></ul>").addClass("pagination");
        var firstPageLi =$("<li></li>").append($("<a></a>").append("首页").attr("href","#"));
        var prePageLi=$("<li></li>").append($("<a></a>").append("&laquo;"));


        ul.append(firstPageLi).append(prePageLi);

        if(result.extend.pageInfo.hasPreviousPage==false){
            firstPageLi.addClass("disabled");
            prePageLi.addClass("disabled");
        }else{
            firstPageLi.click(function () {
                pages(1);
            });
            prePageLi.click(function () {
                pages(result.extend.pageInfo.pageNum-1);
            })
        }

        $.each(result.extend.pageInfo.navigatepageNums,function (index,item) {   // index  下标   item  元素
            var numLi=$("<li></li>").append($("<a></a>").append(item));
            if(result.extend.pageInfo.pageNum==item){
                numLi.addClass("active");
            }

            numLi.click(function () {
                pages(item);
            });



            ul.append(numLi);
        });

        var nextPageLi=$("<li></li>").append($("<a></a>").append("&raquo;"));
        var lastPageLi =$("<li></li>").append($("<a></a>").append("末页").attr("href","#"));

        //判断：没有下一页的时候，按钮禁用  disabled
        if(result.extend.pageInfo.hasNextPage==false){
            nextPageLi.addClass("disabled");
            lastPageLi.addClass("disabled");
        }else{
            nextPageLi.click(function () {
                pages(result.extend.pageInfo.pageNum+1);
            });
            lastPageLi.click(function () {
                pages(result.extend.pageInfo.pages);
            })

        }
        ul.append(nextPageLi).append(lastPageLi);
        var navEle= ul.appendTo($("<nav></nav>"));
        $("#emps_page_nav").append(navEle);

    }

    $("#add").click(function () {

      $("#exampleModal").show();

    });

    $("#tijiao").click(function () {
        $.ajax({
            url:"add",
            type:"POST",
            data:$("#exampleModal form").serialize(),
            success:function (result) {
                alert("a");
              /* $("#exampleModal").modal('hide');*/
                $("#exampleModal").hide();
                pages(1);
            }
        });
    });
   $(document).on("click","#updata",function () {
       /*    $('#updata').modal({
                 backdrop:"static"
            });*/
       $("#updata").show();
    });







</script>



</html>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>薅羊毛</title>
    <link rel="stylesheet" type="text/css" href="${base}/dist/vendors/taobao/css/main.css">
    <link rel="stylesheet" type="text/css" href="${base}/dist/vendors/layui/css/layui.css">
    <script type="text/javascript" src="${base}/dist/js/jquery.min.js"></script>
    <script type="text/javascript" src="${base}/dist/vendors/layui/layui.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
</head>
<body>

<div class="site-nav-bg">
    <div class="site-nav w1200">

    </div>
</div>


<div class="header">
    <div class="headerLayout w1200">
        <div class="headerCon">
            <h1 class="mallLogo">
                <a href="#" title="薅羊毛">
                    <img width="50" height="52"   src="${base}/dist/images/taobao/s_img1.jpg" />
                    <span style="color: #cfb2f6" >薅羊毛</span>
                </a>
            </h1>
            <div class="mallSearch">
                <form action="${base}/taobao/index" class="layui-form" novalidate>
                    <input type="text" name="q" value="${entity.q}"  id="key" required lay-verify="required" autocomplete="off" class="layui-input" placeholder="请输入需要的商品">
                    <button class="layui-btn"  lay-filter="formDemo">
                        <i class="layui-icon layui-icon-search"></i>
                    </button>
                    <input type="hidden" name="" value="">
                </form>
            </div>
        </div>
    </div>
</div>


<div class="content content-nav-base buytoday-content">
    <div id="list-cont">


        <div class="product-list-box">
            <div class="product-list w1200">

                <div class="list-cont" cont = 'tuangou'>
                    <div class="item-box layui-clear">
                        <#list result.resultList as r>
                            <div class="item">
                                <img width="280" height="280" src="${r.pictUrl}" alt="">
                                <div class="text-box">
                                    <p class="title">${r.title}</p>
                                    <p class="plic">
                                        券后：<span class="ciur-pic">￥<em style="color: #FB5413; ">${r.zkFinalPrice}</em></span>
                                        <span class="Ori-pic">1元券</span>
                                        <span class="discount"><a href="${r.couponShareUrl}" target="_blank" >领劵</a></span>
                                    </p>
                                </div>
                            </div>
                        </#list>
                    </div>
                    <div id="pageDiv" style="text-align: center;"></div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="footer">

    <div class="mod_help w1200">
        <p>
            <a href="javascript:;">关于我们</a>
            <span>|</span>
            <a href="javascript:;">帮助中心</a>
            <span>|</span>

        </p>

        <p class="coty">一起薅吧 版权所有 Copyright © 2019 All Right Reserved    <a href="http://beian.miit.gov.cn/" target="_blank" >渝ICP备19000011号</a></p>
    </div>
</div>


<script type="text/javascript">
    var table;
    layui.use(['layer', 'laypage'], function () {
        var laypage = layui.laypage;
        var $ =layui.$;

        var curr="${entity.pageNo}"==undefined?0:"${entity.pageNo}";
        var count="${result.totalResults}";
        curr=Number(curr);
        //执行一个laypage实例
        laypage.render({
            elem: 'pageDiv' //注意，这里的 test1 是 ID，不用加 # 号
            ,curr: curr
            ,count: count //数据总数，从服务端得到
            ,limit: 40
            ,jump: function(obj, first){
                //首次不执行
                if(!first){
                    var key=$("#key").val();
                    window.location.href="${base}/taobao/index"+"?pageNo="+obj.curr+"&q="+key;
                }
            }
        });

    });
</script>

</body>
</html>

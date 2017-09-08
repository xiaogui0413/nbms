<%--
  Created by IntelliJ IDEA.
  User: hgq
  Date: 2016/7/25
  Time: 18:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title>jQuery饼状图表数据分布插件DEMO演示</title>

  <script type="text/javascript" src="${pageContext.request.contextPath }/Js/js/jquery.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath }/Js/js/jsapi.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath }/Js/js/corechart.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath }/Js/js/jquery.gvChart-1.0.1.min.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath }/Js/js/jquery.ba-resize.min.js"></script>

  <script type="text/javascript">
    gvChartInit();
    $(document).ready(function(){
      $('#myTable5').gvChart({
        chartType: 'PieChart',
        gvSettings: {
          vAxis: {title: 'No of players'},
          hAxis: {title: 'Month'},
          width: 600,
          height: 350
        }
      });
    });
  </script>

  <script type="text/javascript">
    gvChartInit();
    $(document).ready(function(){
      $('#myTable1').gvChart({
        chartType: 'PieChart',
        gvSettings: {
          vAxis: {title: 'No of players'},
          hAxis: {title: 'Month'},
          width: 600,
          height: 350
        }
      });
    });
  </script>

</head>
<body>
<div style="text-align:center;clear:both;">
  <%--<script src="/gg_bd_ad_720x90.js" type="text/javascript"></script>--%>
  <%--<script src="/follow.js" type="text/javascript"></script>--%>
</div>
<div style="width:600px;margin:0 auto;">

  <table id='myTable5'>
    <caption>物资分布</caption>
    <thead>
    <tr>
      <th></th>
      <th>北京</th>
      <th>武汉</th>
      <th>上海</th>
      <th>广州</th>
      <th>深圳</th>

    </tr>
    </thead>
 
    <tbody>
    	<tr>
   			<th></th>
    			<td>200</td>
    			<td>100</td>
    			<td>100</td>
    			<td>150</td>
    			<td>100</td>
		</tr>
    </tbody>
  </table>

</div>

</body>
</html>

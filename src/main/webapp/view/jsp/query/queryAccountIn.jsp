<%--
  Created by IntelliJ IDEA.
  User: 12732
  Date: 12/22 0022
  Time: 17:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script>
    var tableIn = layui.table;
    tableIn.render({
        id: 'accountId',
        elem: "#recent-account-in",
        method: "post",
        url: "/koala-platform/account/getAccount?accountType=1",
        height: 430,
        cols: [[
            {
                field: '', title: '序号', width: 60, fixed: 'left', templet: function (d) {
                return d.LAY_INDEX;
            }
            }
            , {field: "accountId", hide: true}
            , {field: 'accountName', title: "账单", width: 150}
            , {field: 'tradeTarget', title: "交易对象", width: 200}
            , {
                field: 'createTime', title: "入账时间", width: 110, templet: function (d) {
                    return timeFomatter(d.createTime, "yyMMdd");
                }
            }
            , {
                field: '', title: "操作", templet: function (d) {
                    return "<input type='button' class='btn-default btn-default-light' onclick=seeDetails('" + d.accountId + "','" + d.accountType + "') value='明细'>";
                }
            }
        ]]

    });
</script>


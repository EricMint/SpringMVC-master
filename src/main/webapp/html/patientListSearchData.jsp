<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<tbody>
    <%--<#if employeeListResponse.employeeResponseList??>--%>
        <%--<#list employeeListResponse.employeeResponseList as employee>--%>
        <%--<tr>--%>
            <%--<td>${(employee.username)!}</td>--%>
            <%--<td>--%>
                <%--<a href="/management/employee/${(employee.id)!}" >${(employee.name)!}</a>--%>
            <%--</td>--%>
            <%--<td>${(employee.phoneNumber)!}</td>--%>
            <%--<td>${(employee.companyName)!}</td>--%>
            <%--<td>${(employee.departmentName)!}</td>--%>
            <%--<td>${(employee.roleNames)!}</td>--%>
            <%--<td>${(employee.email)!}</td>--%>
            <%--<td>--%>
                <%--<#--<a href="/management/employee/resetPwd/${(employee.id)!}" class="btn btn-primary btn-xs" >重置密码</a>-->--%>
                    <%--<input type="hidden" id="employeeId" value="${(employee.id)!}" >--%>
                    <%--<input type="hidden" id="employeeId" value="${(employee.id)!}" >--%>
                    <%--<button class="btn btn-primary btn-outline btn-xs resetClass" data-employee-id="${(employee.id)!}" data-username="${(employee.username)!}"--%>
                            <%--data-toggle="modal" data-target="#resetPassword">重置密码</button>--%>
                    <%--<a href="/management/employee/edit/${(employee.id)!}" class="btn btn-primary btn-xs" >编辑</a>--%>
                    <%--<button class="btn btn-primary btn-outline btn-xs copyClass" data-employee-id="${(employee.id)!}" data-role-names="${(employee.roleNames)!}"--%>
                            <%--data-employee-name="${(employee.name)!}"--%>
                            <%-->复制账号</button>--%>
                <%--<#--<a href="/management/employee/copy/${(employee.id)!}" class="btn btn-primary btn-xs" >复制账号</a>-->--%>
                <%--<a href="javascript:void(0);"--%>
                   <%--data-username="${employee.username!}"--%>
                   <%--data-permissioncode="design.graphic.design.user"--%>
                   <%--data-employee-id="${employee.id!}"--%>
                   <%--data-roles="${(employee.roleNames)!}"--%>
                   <%--onclick="deleteHandle(this)" class="btn btn-default btn-xs btn-remove" >删除</a>--%>

            <%--</td>--%>
        <%--</tr>--%>
        <%--</#list>--%>
    <%--</#if>--%>

    <c:if test="${!empty patientList}">
            <c:forEach items="${patientList}" var="patient">
                <tr>
                    <td>${patient.id}</td>
                    <td>${patient.patientNumber}</td>
                    <td>${patient.realName}</td>
                    <td>${patient.disease}</td>
                    <td>${patient.ethnicity}</td>
                    <td>${patient.gender}</td>
                    <td>${patient.age}</td>
                    <td>${patient.height}</td>
                    <td>${patient.weight}</td>
                    <td>
                        <c:if test="${isManager}">
                            <a href="/hospital/patient/detail/isManager/${patient.id}" type="button"
                               class="btn btn-sm btn-success">详情</a>
                            <a href="/hospital/patient/update/${patient.id}" type="button"
                               class="btn btn-sm btn-warning">修改</a>
                            <a href="/hospital/patient/delete/${patient.id}" type="button"
                               class="btn btn-sm btn-danger">删除</a>
                        </c:if>
                        <c:if test="${!isManager}">
                            <a href="/hospital/patient/detail/notManager/${patient.id}" type="button"
                               class="btn btn-sm btn-success">详情</a>
                        </c:if>
                    </td>
                </tr>
            </c:forEach>
    </c:if>

    <%--<input type="hidden" id="totalCount" value="${(employeeListResponse.totalCount)!}">--%>
    <%--<input type="hidden" id="pageCount" value="${(employeeListResponse.pageCount)!}">--%>
</tbody>
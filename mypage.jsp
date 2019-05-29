<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- ＣＣＳの設定は各cssファイルに書いてる設定が反映されるようにしています。 -->
<link rel="stylesheet" href="./css/confirm.css">
<link rel="stylesheet" href="./css/orion.css">
<link rel="stylesheet" href="./css/error.css">
<link rel="stylesheet" type="text/css" href="./css/header.css">
<title>マイページ</title>
</head>
<body>
<!-- ↓ヘッダーのデザインは"header.jsp"の設定を反映されるようにしています。 -->
<jsp:include page="header.jsp"/>

<div class="main-container" id="contents">
	<div class ="page-title">
		<h1>マイページ画面</h1>
	</div>
<!-- UserInfoDTOの中に情報があるかを調べて、あった場合以下の処理を行っています。 -->
	<s:if test="#session.loginUserId != null">
            <s:form action="PurchaseHistoryAction">

<!-- 		マイページ画面の各情報を表示できるように設定しています。 -->
<!-- 変数(userInfoDTO.familynameなど)に値がない場合、それぞれ空欄になるようにしています。 -->
		<table class="vertical-list-table">
			<tr>
				<th><s:label value="姓" /></th>
				<td><s:property value="userInfoDTO.familyName" /></td>
			</tr>
			<tr>
				<th><s:label value="名" /></th>
				<td><s:property value="userInfoDTO.firstName" /></td>
			</tr>
			<tr>
				<th><s:label value="ふりがな" /></th>
				<td><s:property value="userInfoDTO.familyNameKana" /><span>　</span><s:property value="userInfoDTO.firstNameKana"/></td>
			</tr>
<!-- 設計書より、ＤＢの会員情報テーブルの性別が0の場合は男性、1の場合は女性を表示できるようにしています。 -->
			<tr>
				<th><s:label value="性別" /></th>
				<td>
				<s:if test="userInfoDTO.sex == 0">男性</s:if>
				<s:elseif test="userInfoDTO.sex == 1">女性</s:elseif>
				</td>
			</tr>
			<tr>
				<th><s:label value="メールアドレス" /></th>
				<td><s:property value="userInfoDTO.email" /></td>
			</tr>
		</table>
            <div class="submit_btn_box">
			<s:submit value="購入履歴" class="submit_btn btn-field"/>
			</div>
	</s:form>
	</s:if>

<!-- 	もし、#session.loginUserIdの中に情報が無かった場合の処理が以下になります。 -->
	<s:else>
	<div class="error">
		ユーザー情報がありません。
	</div>
	</s:else>
</div>
</body>
</html>
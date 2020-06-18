<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="android-header mdl-layout__header mdl-layout__header--waterfall">
		<div class="mdl-layout__header-row">
			<span class="android-title mdl-layout-title"> 
				<a class="mdl-navigation__link mdl-typography--text-uppercase" href=""><font color="yellow" style="font-size: 20px;">Stiftung DDIT</font></a>
			</span>
			<!-- Add spacer, to align navigation to the right in desktop -->
			<div class="android-header-spacer mdl-layout-spacer"></div>
			<div
				class="android-search-box mdl-textfield mdl-js-textfield mdl-textfield--expandable mdl-textfield--floating-label mdl-textfield--align-right mdl-textfield--full-width">
				<label class="mdl-button mdl-js-button mdl-button--icon"
					for="search-field"><i class="material-icons">search</i>
				</label>
				<div class="mdl-textfield__expandable-holder">
					<input class="mdl-textfield__input" type="text" id="search-field">
				</div>
			</div>
			<!-- Navigation -->
			<div class="android-navigation-container">
				<nav class="android-navigation mdl-navigation"> 
					<a class="mdl-navigation__link mdl-typography--text-uppercase" href="">공지사항</a>
					<a class="mdl-navigation__link mdl-typography--text-uppercase"	href="">자유게시판</a> 
					<a class="mdl-navigation__link mdl-typography--text-uppercase" href="">자료실</a>
					<a class="mdl-navigation__link mdl-typography--text-uppercase" href="">QnA</a> 
					<a class="mdl-navigation__link mdl-typography--text-uppercase" href="">메뉴1</a>
					<a class="mdl-navigation__link mdl-typography--text-uppercase" href="">메뉴2</a> 
					<a class="mdl-navigation__link mdl-typography--text-uppercase" href="">메뉴3</a>
				</nav>
			</div>
			<button
				class="android-more-button mdl-button mdl-js-button mdl-button--icon mdl-js-ripple-effect"
				id="more-button">
				<i class="material-icons">more_vert</i>
			</button>
			<ul	class="mdl-menu mdl-js-menu mdl-menu--bottom-right mdl-js-ripple-effect" for="more-button">
				<li class="mdl-menu__item" id="info">개인정보수정</li>
				<li class="mdl-menu__item" id="myhome">마이홈</li>
				<li disabled class="mdl-menu__item" id="message">쪽지보기</li>
				<li disabled class="mdl-menu__item" id="schedule">스케줄관리</li>
				<li class="mdl-menu__item" id="logout">로그아웃</li>
			</ul>
		</div>
	</div>
</body>
</html>
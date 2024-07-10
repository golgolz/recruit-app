<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info=""%>
<div class="formWrap formWrapSkill" id="formSkill"
	style="display: block">
	<h2 class="header">스킬</h2>
	<div class="form">
		<div class="chip-group">
			<div class="chip" data-value="C">C</div>
			<div class="chip" data-value="Java">Java</div>
			<div class="chip" data-value="C++">C++</div>
			<div class="chip" data-value="C#">C#</div>
			<div class="chip" data-value="Spring">Spring</div>
			<div class="chip" data-value="JavaScript">JavaScript</div>
			<div class="chip" data-value="TypeScript">TypeScript</div>
			<div class="chip" data-value="React">React</div>
			<div class="chip" data-value="Vue.js">Vue.js</div>
			<div class="chip" data-value="Node.js">Node.js</div>
		</div>
		<button id="resetButton">초기화</button>
	</div>
	<div class="popup popupSkill hidden" aria-hidden="true">
		<div class="popupContainerWrap">
			<div class="popupHeader">
				<span class="dev-all-skill-title">백엔드개발자</span> 스킬 전체보기<span
					class="pagination"><em class="current">9</em>/20</span>
				<!-- <p>자신을 대표하는 스킬을 선택하세요.</p> -->
			</div>
			<div class="popupContainer">
				<div class="plus-keyword-wrap">
					<div class="keyword-list"></div>
				</div>
			</div>
			<div class="popupFooter">
				<div class="btn-wrap">
					<button type="button" class="btn cancel">취소</button>
					<button type="button" class="btn check">확인</button>
				</div>
			</div>
			<button type="button"
				class="button buttonClose is-event is-popup-hidden"
				data-target=".popupSkill">닫기</button>
		</div>
	</div>
</div>
<!-- <script type="text/template" id="tplSkillAutoComplete"></script>
<script type="text/template" id="tplSkillTabMenuItem"></script>
<script type="text/template" id="tplSkillItem"></script>
<script type="text/template" id="tplSelectedSkillItem"></script> -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info=""%>
<div class="formWrap formWrapCareer" id="formCareer" style="">
	<div class="header">
		<h2 class="header">경력</h2>
		<div class="term" style="display: none">
			<span id="spn_Career_Term_Year">0</span> 년 <span
				id="spn_Career_Term_Month">0</span> 개월
		</div>
		<div class="options"></div>
	</div>
	<div class="form formCareer">
		<div id="career_containers">
			<!-- content will be added -->
		</div>
		<button type="button" class="button buttonAddField">
			<img src="http://localhost/recruit-app/assets/images/btns/plus_btn.png"" style="width: 25px; height: 25px;"/>
			<span>추가</span>
		</button>
	</div>
</div>
<script type="text/template" id="tplCareerItem">
<div class="container container3">
	<div class="row">
		<input type="hidden" name="Career.index" value="c14" /> 
		<input type="hidden" name="Career[c14].Index_Name" value="c14" />
		<div class="input input-career-name is-label">
			<label for="Career_C_Name_c14">회사명 <span class="star">*</span></label> 
			<input type="text" id="Career_C_Name_c14"data-type="Co_Name" value="" maxlength="50" autocomplete="off" />
			<div class="validation hidden" aria-hidden="true"></div>
			<div class="autocomplete hidden"></div>
		</div>
		<div class="input input-career-part is-label">
			<label for="Career_C_Part_c14">부서명</label>
			<div class="validation hidden" aria-hidden="true"></div>
			<input type="text" name="Career[c14].C_Part" id="Career_C_Part_c14" value="" maxlength="25" />
		</div>
		<div class="input input-career-joindate is-label">
			<label for="Career_CSYM_c14">입사년월 <span class="star">*</span></label> 
			<input type="text" name="Career[c14].CSYM" id="Career_CSYM_c14" value="" data-format-type="month" placeholder="2016.03" />
			<div class="validation hidden" aria-hidden="true"></div>
		</div>
		<div class="input input-career-leavedate is-label">
			<label for="Career_CEYM_c14">퇴사년월 <span class="star">*</span></label> 
			<input type="text" name="Career[c14].CEYM" id="Career_CEYM_c14" value="" data-format-type="month" class="devCareerCEYM" placeholder="2016.06" />
			<div class="validation hidden" aria-hidden="true"></div>
		</div>
		<div class="input input-career-duty is-label">
			<label>직급</label> 
			<input type="text" name="position_field" id="Career_position_field" value="" maxlength="7" />
		</div>
		<div class="input input-career-salary is-label salaryInput">
			<label for="Career_M_MainPay_User_c14">연봉</label> 
			<input type="text" name="Career[c14].M_MainPay_User" id="Career_M_MainPay_User_c14" value="" data-format-type="price" maxlength="7" />
			<div class="unit hidden" aria-hidden="true">만원</div>
		</div>
	</div>
	<div class="row workInputRow">
		<div class="textarea is-label workInput">
			<label for="lbl_o_experience_contents">담당업무</label>
			<textarea name="Career[c14].Prfm_Prt" cols="30" rows="2" id="Career_Prfm_Prt_c14" class="textarea-career" placeholder="담당하신 업무와 성과에 대해 간단명료하게 적어주세요." style="height: 40px"></textarea>
		</div>
	</div>
	<button type="button" class="button buttonDeleteField"></button>
</div>
</script>
<script type="text/template" id="tplCompanyAutoComplete"></script>
<script type="text/template" id="tplCompanyNotFound"></script>
<script type="text/template" id="tplSelectedKeywordNew"></script>
<script type="text/template" id="tplKeywordAutocomplete"></script>
<script type="text/template" id="tplFrgnWorkItem"></script>
<script type="text/template" id="tplSelectedJobType"></script>
<script type="text/javascript" src="http://localhost/recruit-app/assets/js/user/resume/career1.js"></script>
<script type="text/javascript" src="http://localhost/recruit-app/assets/js/user/resume/career2.js"></script>
<script type="text/javascript" src="http://localhost/recruit-app/assets/js/user/resume/career3.js"></script>

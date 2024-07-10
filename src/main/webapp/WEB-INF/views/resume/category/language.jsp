<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info=""%>
<div class="formWrap formWrapLanguage" id="formLanguage" style="">
	<h2 class="header">어학</h2>
	<div class="form formLanguage">
		<div id="language_containers">
		</div>
		<button type="button" class="button buttonAddField">
			<img src="http://localhost/recruit-app/assets/images/btns/plus_btn.png"" style="width: 25px; height: 25px;"/>
			<span>어학 추가</span>
		</button>
	</div>
</div>
<script type="text/template" id="tplLanguageItem">
	<div class="container container1">
		<div class="row">
			<div class="dropdown dropdown-category is-label">
				<div class="label hidden" aria-hidden="true">
					<span><span>구분 <span class="star">*</span></span></span>
				</div>
				<button type="button" class="button buttonChoose">
					<span><span>구분 <span class="star">*</span></span></span>
				</button>
				<div class="list hidden">
					<ul>
						<li>
							<button type="button" class="button" data-value="1"><span>회화능력</span></button>
						</li>
						<li>
							<button type="button" class="button" data-value="2"><span>공인시험</span></button>
						</li>
					</ul>
				</div>
				<input type="hidden" id="Language_Eval_Category_c508" value="" name="Language[c508].Eval_Category" />
			</div>
			<div class="dropdown dropdown-language-name is-label devLanguageDropdown">
				<div class="label hidden" aria-hidden="true">
					<span><span>외국어명<span class="star">*</span></span></span>
				</div>
				<button type="button" class="button buttonChoose">
					<span><span>외국어명<span class="star">*</span></span></span>
				</button>
				<div class="validation hidden" aria-hidden="true"></div>
				<div class="list hidden is-scroll">
					<ul>
						<li>
							<button type="button" class="button" data-value="16"><span>영어</span></button>
						</li>
						<li>
							<button type="button" class="button" data-value="20"><span>일본어</span></button>
						</li>
						<li>
							<button type="button" class="button" data-value="21"><span>중국어</span></button>
						</li>
						<li>
							<button type="button" class="button" data-value="4"><span>독일어</span></button>
						</li>
						<li>
							<button type="button" class="button" data-value="27"><span>프랑스어</span></button>
						</li>
					</ul>
				</div>
				<input type="hidden" name="Language[c508].Lang1_Name" value="" id="Language_Lang1_Name_c508" />
			</div>
			<div class="input input-language-name is-label devLanguageInput" style="display: none">
				<label for="Language_Lang_Etc_c508">외국어명 <span class="star">*</span></label>
				<input type="text" name="Language[c508].Lang_Etc" id="Language_Lang_Etc_c508" maxlength="25" value="" />
				<input type="hidden" name="Language[c508].Lang1_Name" value="" id="Language_Lang1_Name_c508" />
			</div>
			<span class="devExamArea" style="display: none">
				<div class="dropdown dropdown-language-category is-label devExamDropdown">
					<div class="label hidden" aria-hidden="true">
						<span><span>공인시험<span class="star">*</span></span></span>
					</div>
					<button type="button" class="button buttonChoose">
						<span><span>공인시험<span class="star">*</span></span></span>
					</button>
					<div class="list hidden is-scroll">
						<ul></ul>
					</div>
					<input type="hidden" name="Language[c508].Test1_Name" id="Language_Test1_Name_c508" value="" />
				</div>
				<div class="input input-language is-label devExamInput">
					<label for="Language_Test_Etc_c508">공인시험<span class="star">*</span></label> 
					<input type="text" name="Language[c508].Test_Etc" id="Language_Test_Etc_c508" value="" maxlength="50" />
				</div> 
				<!--점수/급수 input-->
				<div class="input input-grade is-label devExamGradeInput">
					<label for="Language_Test1_Point_I_c508">급수/점수<span class="star">*</span></label> 
					<input type="text" name="Language[c508].Test1_Point" id="Language_Test1_Point_I_c508" maxlength="3" value="" data-format-type="score" />
				</div>
				<!-- 점수/급수 dropdown-->
				<div class="dropdown dropdown-language-grade is-label devExamGradeDropdown">
					<div class="label hidden" aria-hidden="true">
						<span><span>급수<span class="star">*</span></span></span>
					</div>
					<button type="button" class="button buttonChoose">
						<span><span>급수<span class="star">*</span></span></span>
					</button>
					<div class="list hidden">
						<ul></ul>
					</div>
					<input type="hidden" name="Language[c508].Test1_Point" id="Language_Test1_Point_D_c508" value="" />
				</div> 
				<!--점수/급수 카테고리 dropdown-->
				<div class="dropdown dropdown-grade-category devExamGradeCategoryDropdown" style="display: none">
					<div class="label hidden" aria-hidden="true">
						<span><span>선택<span class="star">*</span></span></span>
					</div>
					<button type="button" class="button buttonChoose">
						<span><span>선택<span class="star">*</span></span></span>
					</button>	
					<div class="list hidden">
						<ul>
							<li>
								<button type="button" class="button" data-value="1">
									<span>점</span>
								</button>
							</li>
							<li>
								<button type="button" class="button" data-value="2">
									<span>급</span>
								</button>
							</li>
							<li>
								<button type="button" class="button" data-value="3">
									<span>취득</span>
								</button>
							</li>
						</ul>
					</div>
					<input type="hidden" name="Language[c508].Point_Grade_Type_Code" id="Language_Point_Grade_Type_Code_D_c508" value="" />
				</div> 
				<!--취득년월-->
				<div class="input input-passdate is-label">
					<label for="Language_Test_YYMM_c508">취득년월</label> 
					<input type="text" name="Language[c508].Test_YYMM" id="Language_Test_YYMM_c508" placeholder="2016.03" data-format-type="month" value="" />
					<div class="validation hidden" aria-hidden="true"></div>
				</div>
			</span> 
			<span class="devConversationArea">
			<div class="dropdown dropdown-language-grade is-label">
				<div class="label hidden" aria-hidden="true">
					<span><span>회화능력<span class="star">*</span></span></span>
				</div>
					<button type="button" class="button buttonChoose">
						<span><span>회화능력<span class="star">*</span></span></span>
					</button>
					<div class="list hidden">
						<ul>
							<li>
								<button type="button" class="button" data-value="1"><span>일상회화 가능</span></button>
							</li>
							<li>
								<button type="button" class="button" data-value="2"><span>비즈니스 회화가능</span></button>
							</li>
							<li>
								<button type="button" class="button" data-value="3"><span>원어민 수준</span></button>
							</li>
						</ul>
					</div>
					<input type="hidden" name="Language[c508].Lang1_Stat" id="Language_Lang1_Stat_c508" value="" />
				</div>
			</span>
		</div>
		<button type="button" class="button buttonDeleteField"></button>
	</div>
</script>
<script type="text/javascript"src="http://localhost/recruit-app/assets/js/user/resume/language.js"></script>
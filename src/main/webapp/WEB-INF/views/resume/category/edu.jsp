<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info=""%>
<div class="formWrap formWrapEducation" id="formEducation" style="">
	<h2 class="header">학력</h2>
	<div class="checkbox check-education-under-highschool">
		<input type="checkbox" id="LowLastEduLevel" data-checked-value="true" data-non-checked-value="false" /> 
		<label for="LowLastEduLevel">고등학교 미만 졸업</label> 
		<input type="hidden" name="LowLastEduLevel" value="false" />
	</div>
	<div class="form formEducation">
		<div id="school_containers">
			<!-- content will be added -->
		</div>
		<button type="button" class="button buttonAddField" id="school_addbutton">
			<img src="http://localhost/recruit-app/assets/images/btns/plus_btn.png"" style="width: 25px; height: 25px;"/>
			<span>추가</span>
		</button>
		<div class="popup popupMajor hidden" aria-hidden="true"
			id="otherMajorDeletePop">
			<div class="popupHeader">이력서에서 삭제할 전공을 선택해주세요</div>
			<div class="popupContainer">
				<ul class="list"></ul>
			</div>
			<div class="popupFooter">
				<div class="buttons alignCenter">
					<button type="button" class="button buttonConfirm">
						<span>확인</span>
					</button>
					<button type="button" class="button is-event is-popup-hidden"
						data-target=".popupMajor">
						<span>취소</span>
					</button>
				</div>
			</div>
			<button type="button"
				class="button buttonClose is-event is-popup-hidden"
				data-target=".popupMajor">닫기</button>
			<input type="hidden" class="devUnivCid" />
		</div>
	</div>
</div>
<script type="text/template" id="tplSchoolAutoComplete">
</script>
<script type="text/template" id="tplOtherMajorDeleteViewItem"></script>
<script type="text/template" id="tplSchool">
  <div class="container container1">
      <div class="row">
          <div class="dropdown dropdown-education-category selected is-label">
              <div class="label" aria-hidden="false">학교구분</div>
              <button type="button" class="button buttonChoose" aria-haspopup="true"><span id="selectedOption"></span></button>
              <div class="list hidden" aria-hidden="true">
                  <ul>
                      <li><button type="button" class="button eduItem" data-schltypecode="1"><span>대학교(원)</span></button></li>
                      <li><button type="button" class="button eduItem" data-schltypecode="0"><span>고등학교</span></button></li>
                  </ul>
              </div>
          </div>
          <div class="input input-education-name search is-label">
              <label for="lbl_education_school">학교명 <span class="star">*</span></label>
              <input type="text" id="lbl_education_school">
          </div>
      </div>
      <button type="button" class="button buttonDeleteField"></button>
  </div>
</script>
<script type="text/template" id="tplGed">
</script>
<script type="text/template" id="tplHighSchool">
<div class="container container1">
      <div class="row">
          <div class="dropdown dropdown-education-category selected is-label">
              <div class="label" aria-hidden="false">학교구분</div>
              <button type="button" class="button buttonChoose" aria-haspopup="true"><span id="selectedOption">고등학교</span></button>
              <div class="list hidden" aria-hidden="true">
                  <ul>
                      <li><button type="button" class="button eduItem" data-schltypecode="1"><span>대학교(원)</span></button></li>
                      <li><button type="button" class="button eduItem" data-schltypecode="0"><span>고등학교</span></button></li>
                  </ul>
              </div>
          </div>
          <div class="input input-education-name search is-label is-ellipsis" id="highSchoolAutocomplete" data-comp_type="jkAc">
              <label for="HighSchool_Schl_Name_Search">학교명 <span class="star">*</span></label>
              <input type="text" id="HighSchool_Schl_Name_Search" data-type="School_Name" data-comp_type="jkAcInput" value="" autocomplete="off" maxlength="50" />
              <input type="hidden" name="HighSchool.Schl_Name" data-type="School_Name" value="" />
              <input type="hidden" name="HighSchool.School_Code" data-type="School_Code" value="" />
              <input type="hidden" name="HighSchool.Area_Code" data-type="GG_Area_Code" value="" />
              <div class="validation hidden" aria-hidden="true"></div>
              <div class="autocomplete hidden" aria-hidden="true" data-comp_type="jkAcResultWrap"></div>
              <i class="icon icon-search" aria-hidden="true"></i>
          </div>
          <div class="input input-education-enddate is-label">
              <label for="HighSchool_Grad_Year">졸업년도 <span class="star">*</span></label>
              <input type="text" name="HighSchool.Grad_Year" id="HighSchool_Grad_Year" placeholder="2016" data-format-type="year" value="" autocomplete="off">
              <div class="validation hidden" aria-hidden="true"></div>
          </div>
          <div class="dropdown dropdown-edcation-state is-label">
              <div class="label hidden" aria-hidden="true">졸업상태</div>
              <button type="button" class="button buttonChoose"><span><span>졸업상태 <span class="star">*</span></span></span></button>
              <div class="list hidden">
                  <ul>
                      <li><button type="button" class="button" data-value="10"><span>졸업</span></button></li>
                      <li><button type="button" class="button" data-value="5"><span>졸업예정</span></button></li>
                      <li><button type="button" class="button" data-value="4"><span>재학중</span></button></li>
                  </ul>
              </div>
              <input type="hidden" name="HighSchool.Grad_Type_Code" id="HighSchool_Grad_Type_Code" value="" />
              <div class="validation hidden" aria-hidden="true"></div>
          </div>
      </div>
	  <button class="button buttonDeleteField" >
	  </button>
</script>
      <!-- <button type="button" class="button buttonDeleteField"><span>삭제</span></button> -->
<script type="text/template" id="tplUnivSchool">
    <div class="container container1" data-cid="1">
      <div class="row">
        <input type="hidden" name="UnivSchool.index" value="1" />
        <input type="hidden" name="UnivSchool[1].Index_Name" value="1" />
        <div class="dropdown dropdown-education-category selected is-label">
              <div class="label" aria-hidden="false">학교구분</div>
              <button type="button" class="button buttonChoose" aria-haspopup="true"><span id="selectedOption">대학교(원)</span></button>
              <div class="list hidden" aria-hidden="true">
                  <ul>
                      <li><button type="button" class="button eduItem" data-schltypecode="1"><span>대학교(원)</span></button></li>
                      <li><button type="button" class="button eduItem" data-schltypecode="0"><span>고등학교</span></button></li>
                  </ul>
              </div>
        </div>
        <div class="input input-education-name is-label is-ellipsis" id="UnivSchoolautoComplete_1" data-comp_type="jkAc" >
          <label for="UnivSchool_Schl_Name_1" >학교명 <span class="star">*</span></label >
          <input
            type="text"
            id="UnivSchool_Schl_Name_1"
            data-type="School_Name"
            data-comp_type="jkAcInput"
            value=""
            autocomplete="off"
            maxlength="50"
          />
          <div class="validation hidden" aria-hidden="true">
            학교명을 입력해주세요
          </div>
          <div
            class="autocomplete hidden"
            aria-hidden="true"
            data-comp_type="jkAcResultWrap"
          ></div>
          <input
            type="hidden"
            name="UnivSchool[1].Schl_Name"
            data-type="School_Name"
            value=""
          />
          <input
            type="hidden"
            name="UnivSchool[1].School_Code"
            data-type="School_Code"
            value=""
          />
          <input
            type="hidden"
            name="UnivSchool[1].Area_Code"
            data-type="GG_Area_Code"
            value=""
          />
          <i class="icon icon-search" aria-hidden="true"></i>
        </div>
        <div class="dropdown dropdown-edcation-degree is-label" style="width: 150px;">
          <div class="label hidden" aria-hidden="false">학위</div>
          <button type="button" class="button buttonChoose">
            <span>학위</span>
          </button>
          <div class="list hidden">
            <ul>
              <li>
                <button type="button" class="button" data-value="1">
                  <span>(2,3년제)학사</span>
                </button>
              </li>
              <li>
                <button type="button" class="button" data-value="2">
                  <span>(4년제)학사</span>
                </button>
              </li>
              <li>
                <button type="button" class="button" data-value="3">
                  <span>석사</span>
                </button>
              </li>
              <li>
                <button type="button" class="button" data-value="4">
                  <span>박사</span>
                </button>
              </li>
            </ul>
            <input
              type="hidden"
              name="UnivSchool[1].Mstr_Dctr_Type_Code"
              id="UnivSchool_Mstr_Dctr_Type_Code_1"
              value=""
            />
          </div>
        </div>
        <input type="hidden" name="UnivSchool[1].Schl_Type_Code" value="" />
			<div class="input input-education-startdate is-label">
            	<label for="UnivSchool_Entc_YM_1" >입학년월 <span class="star">*</span></label >
          		<input type="text" name="UnivSchool[1].Entc_YM" id="UnivSchool_Entc_YM_1" data-format-type="month" value="" placeholder="2012.03" />
          		<div class="validation hidden" aria-hidden="true"></div>
        	</div>
        	<div class="input input-education-enddate is-label">
          		<label for="UnivSchool_Grad_YM_1" >졸업년월 <span class="star">*</span></label >
          		<input type="text" name="UnivSchool[1].Grad_YM" id="UnivSchool_Grad_YM_1" data-format-type="month" value="" placeholder="2016.02" />
          		<div class="validation hidden" aria-hidden="true"></div>
        	</div>
        	<input type="hidden" name="UnivSchool[1].Mstr_Dctr_Type_Code" />
        	<div class="dropdown dropdown-edcation-state is-label">
          		<div class="label hidden" aria-hidden="true">졸업상태</div>
          		<button type="button" class="button buttonChoose"><span><span>졸업상태 <span class="star">*</span></span></span></button>
          		<div class="list hidden">
            		<ul>
              		<li><button type="button" class="button" data-value="10"><span>졸업</span></button></li>
              		<li><button type="button" class="button" data-value="5"><span>졸업예정</span></button></li>
              		<li><button type="button" class="button" data-value="4"><span>재학중</span></button></li>
              		<li><button type="button" class="button" data-value="2"><span>중퇴</span></button></li>
              		<li><button type="button" class="button" data-value="9"><span>수료</span></button></li>
              		<li><button type="button" class="button" data-value="3"><span>휴학</span></button></li>
            		</ul>
          		</div>
          		<input type="hidden" name="UnivSchool[1].Grad_Type_Code" value="" id="UnivSchool_Grad_Type_Code_1" />
        	</div>
      </div>
      <div class="row">
        <span class="devMainMajorTemplateArea" style="margin-right: 10px;">
			<div
              class="input input-education-major-name-multiple search is-label"
              id="UnivMajorAutoComplete_2_1"
              data-comp_type="jkAc"
            >
              <label for="univmajor_1_1">전공명</label>
              <input
                type="text"
                id="univmajor_1_1"
                data-type="Major_Name"
                data-comp_type="jkAcInput"
                value=""
                autocomplete="off"
                maxlength="50"
              />
			</div>
		</span>
        <div class="input input-education-grades is-label">
          <label for="UnivSchool_Grade_1">학점</label>
          <input
            type="text"
            name="UnivSchool[1].Grade"
            id="UnivSchool_Grade_1"
            value=""
            maxlength="4"
            data-format-type="score"
          />
          <div class="validation hidden" aria-hidden="true"></div>
        </div>
        <div class="dropdown dropdown-education-total is-label">
          <div class="label hidden" aria-hidden="true">총점</div>
          <button type="button" class="button buttonChoose">
            <span>총점</span>
          </button>
          <div class="list hidden">
            <ul>
              <li>
                <button type="button" class="button" data-value="4.5">
                  <span>4.5</span>
                </button>
              </li>
              <li>
                <button type="button" class="button" data-value="4.0">
                  <span>4.0</span>
                </button>
              </li>
              <li>
                <button type="button" class="button" data-value="100">
                  <span>100</span>
                </button>
              </li>
            </ul>
          </div>
          <input
            type="hidden"
            name="UnivSchool[1].Grade_Prft_Scr"
            id="UnivSchool_Grade_Prft_Scr_1"
            value=""
          />
        </div>
      </div>
      <span class="devOtherUnivMajorTemplateArea"></span>
      <button type="button" class="button buttonDeleteField"></button>
    </div>
</script>
<script type="text/template" id="tplUnivMajorItem">
</script>
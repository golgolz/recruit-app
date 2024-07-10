<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info=""%>
<div class="formWrap formWrapProfile">
	<h2 class="header">
		인적사항
		<div class="description">
			<span class="star">*</span> 필수 입력 정보입니다.
		</div>
	</h2>
	<div class="form formProfile">
		<div class="row">
			<div class="input is-label input-profile-name is-value">
				<label for="UserInfo_M_Name">이름 <span class="star">*</span></label>
				<input type="text" class="dev-essential" name="UserInfo.M_Name" id="UserInfo_M_Name" value="우미연" data-format-type="name" />
				<div class="validation hidden" aria-hidden="true"></div>
			</div>
			<div class="input is-label input-profile-birth is-value">
				<label for="UserInfo_M_Born">생년월일 <span class="star">*</span></label> 
				<input class="dev-essential" data-format-type="birth" data-max-date="2009.06.01" data-val="true" data-val-date="생년월일 필드는 날짜여야 합니다." id="UserInfo_M_Born"name="UserInfo.M_Born" placeholder="1988.03.01" type="text" value="1996-08-21" />
				<div class="validation hidden" aria-hidden="true"></div>
			</div>
			<div class="dropdown dropdown-profile-sex is-label selected">
				<div class="label" aria-hidden="true">성별 <span class="star">*</span>
				</div>
				<select class="button buttonChoose dev-essential" id="genderSelect" style="font-size: 16px; padding: 0px 15px; padding-top: 15px;">
					<option value="여자" style="font-size: 16px;">여자</option>
					<option value="남자" style="font-size: 16px;">남자</option>
				</select>
				<!-- <div class="validation hidden" aria-hidden="true">성별을 입력해주세요</div>
				<input class="dev-essential" id="UserInfo_M_Gender" name="UserInfo.M_Gender" type="hidden" value="True" /> -->
			</div>
			<div class="input input-profile-email is-label is-value">
				<label for="UserInfo_M_Email">이메일 <span class="star">*</span></label>
				<input type="email" name="UserInfo.M_Email" id="UserInfo_M_Email" data-format-type="email" value="yeon.dev.8@gmail.com" autocomplete="off" spellcheck="false" class="dev-essential" data-privacy="이메일" />
			</div>
		</div>
		<div class="row">
			<div class="input is-label input-profile-tel is-value">
				<label for="UserInfo_M_Hand_Phone">전화번호 <span class="star">*</span></label> 
				<input type="text" name="UserInfo.M_Hand_Phone" id="UserInfo_M_Hand_Phone" placeholder="010-1234-1234" value="010-1234-1234" maxlength="30" autocomplete="off" data-format-type="hp" class="dev-essential" />
				<div class="validation hidden" aria-hidden="true"></div>
			</div>
			<div class="input is-label input-profile-hp is-value">
				<label for="UserInfo_M_Hand_Phone">휴대폰번호 <span class="star">*</span></label> 
				<input type="text" name="UserInfo.M_Hand_Phone" id="UserInfo_M_Hand_Phone" placeholder="010-1234-1234" value="010-1234-1234" maxlength="30" autocomplete="off" data-format-type="hp" class="dev-essential" />
				<div class="validation hidden" aria-hidden="true"></div>
			</div>
			<div class="input is-label input-profile-addr"> 
				<label for="temp_M_Addr_Text">주소</label> 
				<!-- <input type="text" id="temp_M_Addr_Text" class="dev-optional" data-privacy="주소" />  -->
				<div style="height: 60px; position:absolute; top:10px; left: 60px;">
					<select name="sido1" id="sido1" style="width: 250px; height: 40px; font-size: 15px; border: 0px; border-bottom: 0.5px solid #c8c8c8; margin-right: 15px;"></select>
					<select name="gugun1" id="gugun1" style="width: 250px; height: 40px; font-size: 15px; border: 0px; border-bottom: 0.5px solid #c8c8c8;"></select>
				</div>
			</div>
		</div>
		<div class="picture dropped" style="">
			<div class="guide">사진추가</div>
			<a href="javascript:;" class="buttonAddFile"> 사진등록 </a>
		</div>
	</div>
</div>

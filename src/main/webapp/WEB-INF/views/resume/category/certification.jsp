<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info=""%>
<div class="formWrap formWrapCertificate" id="formLicense" style="">
	<div class="header devNaverElement">
		<h2 class="header">자격증</h2>
	</div>
	<div class="form formCertificate">
		<div id="license_containers">
			<!-- content will be added -->
		</div>
		<button type="button" class="button buttonAddField">
			<img src="https://doberman-ready-termite.ngrok-free.app/recruit-app/assets/images/btns/plus_btn.png"" style="width: 25px; height: 25px;"/>
			<span>자격증 추가</span>
		</button>
	</div>
</div>
<script type="text/template" id="tplLicenseItem">
	<div class="container container1" data-cid="c23">
		<div class="row">
			<div class="input input-certificate-name is-label" data-comp_type="jkAc">
				<label for="License_Search_c23">자격증 명 <span class="star">*</span></label>
				<input type="text" id="License_Search_c23" data-type="Lc_Name" value="" maxlength="50" />
				<div class="autocomplete hidden" aria-hidden="true"></div>
				<div class="validation hidden" aria-hidden="true"></div>
				<i class="icon icon-search" aria-hidden="true"></i>
			</div>
			<div class="input input-certificate-agency is-label">
				<label for="License_Lc_Pub_c23">발행처</label> 
				<input type="text" name="License[c23].Lc_Pub" id="License_Lc_Pub_c23" value="" data-type="Lc_Pub" maxlength="50" />
				<div class="validation hidden" aria-hidden="true"></div>
			</div>
			<div class="input input-certificate-term is-label">
				<label for="License_Lc_YYMM_c23">취득월</label> 
				<input type="text" name="License[c23].Lc_YYMM" id="License_Lc_YYMM_c23" value="" data-format-type="month" placeholder="2017.10" />
				<div class="validation hidden" aria-hidden="true"></div>
			</div>
		</div>
		<button type="button" class="button buttonDeleteField dev-btn-del-license"></button>
	</div>
</div>
</script>
<script type="text/javascript"src="https://doberman-ready-termite.ngrok-free.app/recruit-app/assets/js/user/resume/certification.js"></script>

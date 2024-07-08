<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info=""%>
<div class="formWrap formWrapIntroduction" id="formIntroduction"
	style="">
	<div class="header">
		<h2 class="header">자기소개서</h2>
	</div>
	<div class="form formIntroduction">
		<div id="introduceContainers">
			<div class="row">
				<div class="container" style="width:1260px">
					<input type="hidden" name="ResumeProfile.Index" value="">
					<div class="input">
						<label for="ResumeProfile_Header_" class="skip">제목</label> 
						<input type="text" name="ResumeProfile[].Header" id="ResumeProfile_Header_" placeholder="항목 제목을 입력하세요." value='' maxlength="50">
						<div class="validation validation-title hidden">단락 제목을 입력해주세요</div>
						<div class="autocomplete hidden" aria-hidden="true">
							<div class="list">
								<ul>
									<li>
										<button type="button" class="button">
											<span><em>한양</em>대학교 (서울)</span>
										</button>
									</li>
								</ul>
							</div>
						</div>
					</div>
					<label for="" class="skip">내용</label>
					<div class="textarea textarea-introduction is-value">
						<div class="backdrop">
							<div class="highlights"></div>
						</div>
						<div class="clickable"></div>
						<textarea name="ResumeProfile[].Contents" id="ResumeProfile_Contents_" cols="30" rows="10" placeholder="해당내용을 입력하세요." class="spellcheck"></textarea>
						<div class="validation validation-content hidden">자기소개서 내용을 입력해주세요</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script type="text/template" id="tplIntroduceItem"></script>
<!-- <script type="text/javascript"
	src="https://doberman-ready-termite.ngrok-free.app/recruit-app/assets/js/user/resume/introduction.js"></script> -->
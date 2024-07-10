$(function () {
    var CareerModel = Backbone.Model.extend({});
    var CareerCollection = Backbone.Collection.extend({
      model: CareerModel,
    });
    var careerCollection = new CareerCollection(
	  JSON.parse(
	    '[{"IDX":194159993,"M_ID":"GL_44288030","C_Code":0,"C_Name":null,"C_Part":null,"M_MainCate":"0","M_MainField":"0","Job_BizJobtype_Code":null,"M_MainField_Ctgr":null,"M_MainJob":null,"CSYM":"","CEYM":"","M_MainJob_Jikwi":null,"M_MainPay":0,"M_MainJob_Level":null,"OrdNo":1,"OpenStat":"1","RegDate":"\\/Date(1717223556393)\\/","RetireSt":"1","CNameHold":"0","R_No":26455495,"Posn_Code":null,"Retire_Rsn_Code":null,"Retire_Rsn":null,"Prfm_Prt":null,"Old_Idx":null,"Co_Code":null,"M_MainPay_User":null,"Cname_Code":0,"Job_Type_Code":null,"Rank_Sub_Code":null,"Index_Name":null,"M_MainJob_Jikwi_Name":null,"Posn_Name":null,"Co_Name":null,"Rank_Sub_Name":null,"Biz_No":null,"C_ID":null,"Job_Field_Name":"","Job_Field_Direct":"","NHIS_LINKED_STAT":0,"Mem_Sys_No":0}]'
	  )
	);
    var CompanySearchCollection = Backbone.Collection.extend({
      //url: "/User/Resume/CompanySearchJson",
      url: "/User/Resume/CompanySearchUcoJson",
      titleColumn: "Co_Name",
    });

    var CareerView = Backbone.View.extend({
      initialize: function (options) {
        var that = this;

        _.extend(this, options);
        this.render();
        this.initSetting(true);
        if (that.collection.size() == 0) {
          that.addRowClick();
        }
        this.$el
          .closest(".form")
          .find(".buttonAddField")
          .click(function (e) {
            that.addRowClick(e);
          });
        this.searchCollection.on(
          "sync",
          this.searchCollectionRefresh,
          this
        );
      },
      events: {
        "click .dropdown-career-position .buttonChoose":
          "positionOpenClick",
        "click .dropdown-career-position .buttonConfirm":
          "positionConfirmClick",
        "click .dropdown-career-position .buttonCancel":
          "positionCancelClick",

        "click .buttonDeleteField": "removeItemClick",
        "click .popupSearchDuty": "searchDutyClick",
        "click .devBtnDutyPopup": "popupOpenClick", //직무 선택하기
        "click .devButtonSalary": "salaryInputToggle", //연봉 입력여부 버튼 클릭
        "click .devButtonWork": "workInputToggle", //담당업무 입력여부 버튼 클릭
        "click .devRetireStCheck": "retireStToggle", //재직중 클릭
        "click .devRetireStText": "retireStTextClick", //재직중문구 클릭(Tooltip)
        "click .tooltip .buttonClose": "toolTipClose", //재직중 설명 문구 팝업 숨기기
        "click .listPosition .freelancer":
          "freelancerCheckboxClick",
        "click .listPosition .cols label": "posnClick",
        "focusout [id^='Career_CSYM_']": "careerPeriodCalc",
        "focusout [id^='Career_CEYM_']": "careerPeriodCalc",
        // 이력서 회사명 공개 설정 => 툴팁 상태 변경 2018-04-10 LMJ
        "change input[name='private']": "holdTooltipToggle",
        "click .checkbox-private-person .button-tooltip, .checkbox-private-person .button-close":
          "holdTooltipToggle",
      },
      holdTooltipToggle: function (e) {
        var popClass = "div.popup-tooltip",
          $btn = $(e.currentTarget),
          isOpen = true, // 레이어 오픈 여부
          isClose = $btn.hasClass("button-close"), // 레이어
          $pop = $btn
            .closest(".checkbox-private-person")
            .find(popClass);
        // 비공개 상태로 변경시에만 레이어 오픈
        if (e.currentTarget.tagName === "INPUT") {
          isOpen = $btn.is(":checked");
        }
        //console.log(isOpen)
        //if ($pop.length === 1 && isOpen) {
        //    $pop.toggleClass('attached', !isClose);
        //}
        if (e.currentTarget.tagName === "BUTTON") {
          if ($pop.hasClass("attached")) {
            $pop.removeClass("attached");
          } else {
            $pop.addClass("attached");
          }
        }
      },
      getRowNo: function () {
        return this.$(".container").size() + 1;
      },
      addRowClick: function (e) {
        var newItem = new this.collection.model();
        this.collection.add(newItem);
        this.rowRender(newItem);
      },
      rowRender: function (model) {
        var no = this.getRowNo();
        this.$el.append(
          this.template({
            data: model.toJSON(),
            cid: model.cid,
            no: no,
          })
        );
        // 회사명 비공개 중 최신 툴팁 영역 보임처리 2018-04-10 LMJ
        // 2018-08-22 수정페이지 로딩될때 툴팁 안뜨게 수정(기획팀 황시현선임 요청)
        //if (typeof model.attributes !== 'undefined') {
        //    if (model.attributes.CNameHold == 1 && typeof this.isHoldLayerOn === 'undefined') {
        //        $('.container' + no + ' div.popup-tooltip').addClass('attached');
        //        this.isHoldLayerOn = true;
        //    }
        //}

        this.$el.find("[data-comp_type='jkAc']:last").jkAc2({
          collection: this.searchCollection,
          containerQuery: ".row",
          timeDelay: 300,
        });
      },
      render: function () {
        var that = this;
        this.collection.each(function (item) {
          that.rowRender(item);
        }, this);
        this.careerPeriodCalc();
        //경력 없을시 경력 부분 숨김
        window.ResumeForm.Career.CareerTermMsgVisible();
      },
      removeItemClick: function (e) {
        var $btn = $(e.currentTarget),
          $container = $btn.closest(".container"),
          cid = $container.data("cid");

        this.collection.remove(this.collection.get(cid));
        $container.remove();
        this.careerPeriodCalc();
      },
      searchCollectionRefresh: function (collection) {
        var that = this,
          $curInputEle = this.$(
            "[data-comp_type='jkAcInput']:focus"
          ),
          $curResultWrapEle = $curInputEle
            .closest("[data-comp_type='jkAc']")
            .find("[data-comp_type='jkAcResultWrap']");

        var titleColumn = collection.titleColumn;
        $curResultWrapEle.html(
          "<div class='list listCompany'><ul></ul><div>"
        );
        $curResultWrapEle.addClass("hidden");

        if (collection.length > 0) {
          collection.each(function (item) {
            var templateData = _.extend(
              item.toJSON(),
              {
                Highlight_Name: item
                  .get(titleColumn)
                  .replace(
                    $curInputEle.val(),
                    "<em>" + $curInputEle.val() + "</em>"
                  ),
              },
              { itemJson: JSON.stringify(item.toJSON()) }
            );
            $curResultWrapEle
              .find(".list ul")
              .append(that.searchTemplate(templateData));
          }, this);
        } else {
          $curResultWrapEle.html(
            that.searchFailTemplate({
              searchText: $curInputEle.val(),
            })
          );
        }

        $curResultWrapEle.append(
          that.searchDirectTemplate({
            searchText: $curInputEle.val(),
            itemJson: JSON.stringify(
              JSON.parse(
                '{ "' +
                  titleColumn +
                  '":"' +
                  $curInputEle.val() +
                  '" }'
              )
            ),
          })
        );
        $curResultWrapEle.removeClass("hidden");
      },
      popupOpenClick: function (e) {
        var $source = $(e.currentTarget),
          $target = $source.data("target");
        this.keywordSelectView.init($source);
        //this.keywordSelectView.applyKeywordCnt();

        Resume.Utilities.popupVisibleCenter($($target), $source);
      },
      salaryInputToggle: function (e) {
        var $source = $(e.currentTarget),
          $container = $source.closest(".container");

        if ($source.hasClass("selected")) {
          $source.removeClass("selected");
          $container.find(".salaryInput").hide();
          Resume.Utilities.clearValueInput(
            $container.find(".salaryInput")
          );
        } else {
          $source.addClass("selected");
          $container.find(".salaryInput").show();
        }
      },
      workInputToggle: function (e) {
        var $source = $(e.currentTarget),
          $container = $source.closest(".container");

        if ($source.hasClass("selected")) {
          $source.removeClass("selected");
          $container.find(".workInputRow").hide();
          Resume.Utilities.clearValueInput(
            $container.find(".workInput")
          );
        } else {
          $source.addClass("selected");
          $container.find(".workInputRow").show();
        }
      },
      retireStToggle: function (e) {
        var $source = $(e.currentTarget),
          $checkboxEle = $source.closest(".checkbox"),
          $container = $source.closest(".container"),
          $index = $container.find("[name='Career.index']"),
          $target = $container.find(".input-career-leavedate");

        if ($source.is(":checked")) {
          $target
            .find(":text")
            .val("202406")
            .trigger("input")
            .trigger("blur");
          $target.hide();
          //$container.find("[id^='Career_CNameHold']").val("1");
          //$container.find("[id^='Check_Career_CNameHold']").attr("checked", true).prop("checked", true);
          $checkboxEle.addClass("is-toggleClass");
        } else {
          $target.show();
          //var inputStat = $('#UserResume_R_Input_Stat').val();
          //var openStat = $('#UserInfo_M_Want_Job_Stat').val();
          //if (inputStat == 3 && openStat == 1) {
          //    $container.find("[id^='Career_CNameHold']").val("0");
          //    $container.find("[id^='Check_Career_CNameHold']").attr("checked", false).prop("checked", false);
          //}
          $checkboxEle.removeClass("is-toggleClass");
        }
      },
      retireStTextClick: function (e) {
        var $source = $(e.currentTarget),
          $warp = $source.closest(".is-inoffice");

        $warp.find(".tooltip").toggleClass("hidden");
      },
      toolTipClose: function (e) {
        var $source = $(e.currentTarget),
          $toolTip = $source.closest(".tooltip");

        $toolTip.addClass("hidden");

        //console.log('close')
      },
      posnClick: function (e) {
        var $source = $(e.currentTarget),
          $positionContainer = $source.closest(".listPosition"),
          $checkbox = $positionContainer.find(":checkbox");

        if ($checkbox.is(":checked")) {
          $checkbox.trigger("click");
        }
      },
      freelancerCheckboxClick: function (e) {
        var $source = $(e.currentTarget),
          $checkbox = $source.find(":checkbox"),
          $positionContainer = $source.closest(".listPosition"),
          checkedValue = $checkbox.data("checked-value"),
          nonCheckedValue = $checkbox.data("non-checked-value"),
          $synEle = $source
            .closest(".freelancer")
            .find("input:hidden");

        if ($checkbox.is(":checked")) {
          $positionContainer
            .find(":radio:checked")
            .attr("checked", false);
          $synEle.val(checkedValue);
        } else {
          $synEle.val(nonCheckedValue);
        }
      },
      careerPeriodCalc: function (e) {
        var totalPeriod = 0,
          totalYear = 0,
          totalMonth = 0;
        var duplMonth = 0,
          sMonth = 0,
          eMonth = 0;
        var lYear = 0,
          lMonth = 0,
          careerTime = [];
        var checkStat = true;
        $checkBox = $(".Career_Dupl_Remove_Stat");

        this.$(".container").each(function () {
          //경력 비공개의 경우 경력 기간 산정에서 제외
          if (
            $(this).find("[id^='Career_OpenStat_']").val() == "1"
          ) {
            var $sym = $(this).find("[id^='Career_CSYM_']");
            var $eym = $(this).find("[id^='Career_CEYM_']");
            sMonth =
              parseInt($sym.val().substring(0, 4), 10) * 12 +
              parseInt($sym.val().substring(5, 7), 10);
            eMonth =
              parseInt($eym.val().substring(0, 4), 10) * 12 +
              parseInt($eym.val().substring(5, 7), 10);

            if (
              Resume.Utilities.isValidYearMonth($sym.val()) &&
              Resume.Utilities.isValidYearMonth($eym.val())
            ) {
              var monthDiff = Resume.Utilities.getMonthCnt(
                $sym.val(),
                $eym.val()
              );
              if (monthDiff > 0) {
                totalPeriod = totalPeriod + monthDiff;
              }
            }

            // 중복 경력 제거

            for (sMonth; sMonth <= eMonth; sMonth++) {
              lYear = Math.floor(sMonth / 12);
              lMonth = Math.ceil(sMonth % 12);
              if (lMonth == 0) {
                lYear = lYear - 1;
                lMonth = 12;
              }

              var loopDate =
                lYear.toString() +
                (parseInt(lMonth, 10) < 10 ? "0" : "") +
                lMonth.toString();

              if (careerTime.indexOf(loopDate) < 0) {
                careerTime.push(loopDate);
              } else {
                duplMonth++;
              }
            }
          }
        });

        //if ($checkBox.is(":checked")) {
        //    totalPeriod = totalPeriod - duplMonth;
        //}

        //중복제거를 디폴트로 처리 <-2021.09.24 중복제거 버튼 뺴고 중복제거를 디폴트로 변경
        totalPeriod = totalPeriod - duplMonth;

        if (totalPeriod > 0) {
          totalYear = Math.floor(totalPeriod / 12);
          totalMonth = totalPeriod % 12;
        }
        $("#spn_Career_Term_Year").html(totalYear);
        $("#spn_Career_Term_Month").html(totalMonth);

        window.ResumeForm.Career.CareerTermMsgVisible();
      },
      initEvent: function () {
        var that = this;

        $("#careerDescriptionWrite .buttonDelete").click(
          function () {
            that.careerDescriptionDeleteClick();
          }
        );

        $("#careerDescriptionNotice .buttonWrite").click(
          function () {
            that.careerDescriptionWriteClick();
          }
        );

        //해외근무경험 입력 버튼
        this.$el
          .closest(".formWrapCareer")
          .find(".buttonIsOExperience.devBtnForeignWork")
          .click(function () {
            $(".popupOWorkExperience")
              .removeClass("hidden")
              .attr("aria-hidden", "false");
          });
        //경력 불러오기 버튼
        this.$el
          .closest(".formWrapCareer")
          .find(".buttonIsOExperience.devBtnCareerHealth")
          .click(function () {
            GA_Event(
              "이력서작성_PC",
              "경력",
              "모든 경력 한번에 불러오기"
            );
            jk.user.resume.write.careerhealth.master
              .methods()
              .OpenPopup();
          });
      },
      initSetting: function (initEvent = true) {
        var that = this;

        if (initEvent) {
          this.initEvent();
        }

        this.$(".checkbox, .freelancer").each(function () {
          Resume.Utilities.setCheckedCheckbox($(this));
        });
        this.$(".dropdown-career-position").each(function () {
          var checkbox = $(this).find(".freelancer :checkbox");
          if (checkbox.is(":checked")) {
            Resume.Utilities.setTextDropdown($(this), "프리랜서");
          } else {
            var subCode = $(this)
              .find("[id^='Career_Rank_Sub_Code_']:checked")
              .val();
            var jikwiCode = $(this)
              .find("[id^='Career_M_MainJob_Jikwi_']")
              .val();

            if (!subCode && jikwiCode) {
              var posnText = $(this)
                .find("[id^='Career_Posn_Code_']:checked")
                .data("text");
              var jikwiName = that.getJikwiName(jikwiCode);
              var resultText = "";
              if (jikwiName) {
                resultText = jikwiName + " ";
              }
              if (posnText) {
                resultText = resultText + posnText;
              }
              if (resultText) {
                Resume.Utilities.setTextDropdown(
                  $(this),
                  resultText
                );
              }
            } else {
              Resume.Utilities.setTextDropdownRadio($(this));
            }
          }
        });
        this.$el
          .find(".devRetireStCheck:checked")
          .each(function () {
            var $container = $(this).closest(".container"),
              $target = $container.find(".devCareerCEYM"),
              $checkbox = $(this).closest(".checkbox");

            if ($(this).is(":checked")) {
              $target.val("2024.06");
              var $input = $target.closest(".input");
              $input.trigger("input").trigger("blur").hide();
              $checkbox.addClass("is-toggleClass");
            }
          });
      },
      careerDescriptionDeleteClick: function (e) {
        $("#careerDescriptionWrite").hide();
        $("#careerDescriptionWrite").find("textarea").val("");
        $("#careerDescriptionNotice").show();
      },
      careerDescriptionWriteClick: function (e) {
        $("#careerDescriptionWrite").show();
        $("#careerDescriptionNotice").hide();
      },
      positionOpenClick: function (e) {
        var $dropdown = $(e.currentTarget).closest(".dropdown");
        $dropdown.find(":radio").removeData("prevchecked");
        $dropdown.find(":checkbox").removeData("prevchecked");

        $dropdown.find(":radio:checked").data("prevchecked", true);
        $dropdown
          .find(":checkbox:checked")
          .data("prevchecked", true);
      },
      positionConfirmClick: function (e) {
        var that = this,
          $source = $(e.currentTarget),
          $dropdown = $source.closest(".dropdown"),
          $freelancer = $dropdown.find(".freelancer :checkbox");

        if ($freelancer.is(":checked")) {
          $dropdown
            .find("[id^='Career_M_MainJob_Jikwi_']")
            .val(null);
          Resume.Utilities.setTextDropdown($dropdown, "프리랜서");
        } else {
          var subCode = $dropdown
            .find("[id^='Career_Rank_Sub_Code_']:checked")
            .val();
          var jikwiCode = $dropdown
            .find("[id^='Career_M_MainJob_Jikwi_']")
            .val();

          if (!subCode && jikwiCode) {
            var posnText = $dropdown
              .find("[id^='Career_Posn_Code_']:checked")
              .data("text");
            var jikwiName = that.getJikwiName(jikwiCode);
            var resultText = "";
            if (jikwiName) {
              resultText = jikwiName + " ";
            }
            if (posnText) {
              resultText = resultText + posnText;
            }
            if (resultText) {
              Resume.Utilities.setTextDropdown(
                $dropdown,
                resultText
              );
            }
          } else {
            Resume.Utilities.setTextDropdownRadio($dropdown);
          }
        }

        Resume.Utilities.unsetExpandedDropdown();
      },
      positionCancelClick: function (e) {
        var $source = $(e.currentTarget),
          $dropdown = $source.closest(".dropdown");

        var $prevCheckedEle = $dropdown
          .find(":radio, :checkbox")
          .filter(function () {
            return $(this).data("prevchecked") == true;
          });

        $dropdown.find(":radio:checked").prop("checked", false);
        $dropdown.find(":checkbox:checked").prop("checked", false);
        $prevCheckedEle.prop("checked", true);

        var $checkbox = this.$el.find(".freelancer :checkbox"),
          checkedValue = $checkbox.data("checked-value"),
          nonCheckedValue = $checkbox.data("non-checked-value"),
          $synEle = $checkbox
            .closest(".freelancer")
            .find("input:hidden");

        if ($checkbox.is(":checked")) {
          $synEle.val(checkedValue);
        } else {
          $synEle.val(nonCheckedValue);
        }

        Resume.Utilities.unsetExpandedDropdown();
      },
      getJikwiName: function (JikwiCode) {
        switch (JikwiCode) {
          case "1":
            return "사원(연구원)";
          case "2":
            return "주임/계장(연구원)";
          case "3":
            return "대리(주임연구원)";
          case "4":
            return "과장(선임연구원)";
          case "5":
            return "차장(수석연구원)";
          case "6":
            return "부장(연구소장)";
          case "7":
            return "임원";
          default:
            return "";
        }
      },
    });

    window.ResumeForm.CareerView = new CareerView({
      collection: careerCollection,
      searchCollection: new CompanySearchCollection(),
      searchTemplate: _.template(
        $("#tplCompanyAutoComplete").html()
      ),
      searchFailTemplate: _.template(
        $("#tplCommonNotFound").html()
      ),
      searchDirectTemplate: _.template(
        $("#tplCommonDirectInput").html()
      ),
      el: "#career_containers",
      template: _.template($("#tplCareerItem").html()),
      keywordSelectView:
        new window.ResumeForm.Career.DutySelectView({
          keywordSearchCollection:
            new window.ResumeForm.Career.KeywordSearchCollection(),
        }),
    });

    //중복기간 체크
    $(".Career_Dupl_Remove_Stat").on("change", function () {
      $("[id^='Career_CEYM_']").trigger("focusout");
    });

    // 이력서 생성은 디폴트로 체크
    if (
      $(location)
        .attr("href")
        .toLowerCase()
        .indexOf("/resume/write") > -1
    ) {
      $("#lbl_career_delete_duplicate_period").attr(
        "checked",
        "checked"
      );
    }
  });
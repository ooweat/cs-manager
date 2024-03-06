<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="UTF-8">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no"
          name="viewport">
    <script type="text/javascript" src="/assets/js/jquery.js"></script>
    <script type="text/javascript" src="/assets/js/fancyTable.js"></script>
    <title>Coupon</title>
    <script type="text/javascript">
    </script>
</head>
<body>
<!-- Main Content -->
<div class="main-content">
    <!-- 커스텀 이벤트 -->
    <!-- 2024.02.23 twkim 임시구현 -->
    <div class="xans-product-detail" style="display: table;">
        <div class="keyImg ">
            <div class="thumbnail">
                <a alt="P00000YK"
                   href="/product/image_zoom2.html?product_no=634&cate_no=140&display_group=1"
                   onclick="window.open(this.href, 'image_zoom2', 'toolbar=no,scrollbars=auto,resizable=yes,width=750,height=950,left=0,top=0', this);return false;">
                    <img src="//freewill-one.com/web/product/big/202402/5a53c3b369b31a04426456c560107873.jpg"
                         alt="SIDE.B-ONE [MULTI COLOR] 1EA" class="BigImage"
                         style="max-width: 300px;"> </a>
                <div id="zoom_wrap"></div>
            </div>
        </div>
        <div class="customInfoArea">
            <div class="fix_option">
                <div class="fix_option">
                    <table class="th_icon" border="1" summary="">
                        <caption>상품 옵션</caption>
                        <tbody class="xans-element- xans-product xans-product-option xans-record-">
                        <!-- 참고 : 뉴상품관리 전용 변수가 포함되어 있습니다. 뉴상품관리 이외의 곳에서 사용하면 일부 변수가 정상동작하지 않을 수 있습니다. -->
                        <tr class="xans-element- xans-product xans-product-option xans-record-">
                            <th scope="row"><span>BODY</span></th>
                            <td><select option_product_no="634"
                                        option_select_element="ec-option-select-finder"
                                        option_sort_no="1" option_type="T" item_listing_type="S"
                                        option_title="BODY" product_type="product_option"
                                        product_option_area="product_option_634_0" name="option1"
                                        id="product_option_id1" class="ProductOption0"
                                        option_style="select" required="true">
                                <option value="*" selected="" link_image="">- [필수] 옵션을 선택해 주세요 -
                                </option>
                                <option value="**" disabled="" link_image="">-------------------
                                </option>
                                <option value="B_BLACK" link_image="">B_BLACK</option>
                                <option value="B_DARK_GREEN" link_image="">B_DARK_GREEN</option>
                                <option value="B_LIGHT_BEIGE" link_image="">B_LIGHT_BEIGE</option>
                                <option value="B_DAISY" link_image="">B_DAISY</option>
                                <option value="B_80S" link_image="">B_80S</option>
                                <option value="B_PURPLE_CHECKER" link_image="">B_PURPLE_CHECKER
                                </option>
                                <option value="B_WHITE_CHECKER" link_image="">B_WHITE_CHECKER
                                </option>
                            </select>
                                <p class="value"></p>
                            </td>
                        </tr>
                        <tr class="xans-element- xans-product xans-product-option xans-record-">
                            <th scope="row"><span>PORKET</span></th>
                            <td><select option_product_no="634"
                                        option_select_element="ec-option-select-finder"
                                        option_sort_no="2" option_type="T" item_listing_type="S"
                                        option_title="PORKET" product_type="product_option"
                                        product_option_area="product_option_634_0" name="option2"
                                        id="product_option_id2" class="ProductOption0"
                                        option_style="select" required="true">
                                <option value="*" selected="" link_image="">- [필수] 옵션을 선택해 주세요 -
                                </option>
                                <option value="**" link_image="">-------------------</option>
                                <option value="P_BLACK" link_image="">P_BLACK</option>
                                <option value="P_DARK_GREEN" link_image="">P_DARK_GREEN</option>
                                <option value="P_LIGHT_BEIGE" link_image="">P_LIGHT_BEIGE</option>
                                <option value="P_DAISY" link_image="">P_DAISY</option>
                                <option value="P_80S" link_image="">P_80S</option>
                                <option value="P_PURPLE_CHECKER" link_image="">P_PURPLE_CHECKER
                                </option>
                                <option value="P_WHITE_CHECKER" link_image="">P_WHITE_CHECKER
                                </option>
                            </select>
                                <p class="value"></p>
                            </td>
                        </tr>
                        <tr class="displaynone" id="">
                            <td colspan="2" class="selectButton"><a href="#none" onclick=""><img
                                    src="//img.echosting.cafe24.com/skin/base_ko_KR/product/btn_manual_select.gif"
                                    alt="옵션 선택"></a></td>
                        </tr><!-- //참고 -->
                        </tbody>
                    </table>
                </div>

            </div>
        </div>
    </div>
    <!-- 2024.02.23 twkim 임시구현 끝 -->
    <!-- 수정금지 -->

    <p><img src="//freewillone.godohosting.com/goods/frside/2024side1.jpg"></p>

    <%--<section class="section">
            <div class="section-body">
                <div class="row">
                    <div class="col-12 col-md-8 col-lg-8 col-xl-8">
                        <div class="card card-primary custom-card">
                            <div class="card-body">
                                <div class="form-divider text-primary">
                                    공지사항
                                </div>
    &lt;%&ndash;                            <form method="POST" action="#">&ndash;%&gt;
    &lt;%&ndash;                                <div class="container-fluid border">&ndash;%&gt;
    &lt;%&ndash;                                    <div class="row border-bottom">&ndash;%&gt;
    &lt;%&ndash;                                        <div class="col-lg-2 col-sm-12 col-md-12 bg-light p-3">그룹명</div>&ndash;%&gt;
    &lt;%&ndash;                                        <div class="col-lg-4 col-sm-12 col-md-12 py-2">&ndash;%&gt;
    &lt;%&ndash;                                            <div class="">&ndash;%&gt;
    &lt;%&ndash;                                                <select id="paramGroupSeq" name="paramGroupSeq"&ndash;%&gt;
    &lt;%&ndash;                                                        class="form-control select2 select2-hidden-accessible" tabindex="-1" aria-hidden="true">>&ndash;%&gt;
    &lt;%&ndash;                                                    <c:if test="${role =='system'}">&ndash;%&gt;
    &lt;%&ndash;                                                        <option value="0" selected>-전체-</option>&ndash;%&gt;
    &lt;%&ndash;                                                        <c:forEach var="getGroupList" items="${getGroupList}">&ndash;%&gt;
    &lt;%&ndash;                                                            <option value="${getGroupList.groupSeq}"&ndash;%&gt;
    &lt;%&ndash;                                                                    <c:if test="${hmap.paramGroupSeq != null ?&ndash;%&gt;
    &lt;%&ndash;                                                                    getGroupList.groupSeq==hmap.paramGroupSeq : getGroupList.groupSeq==0}">selected</c:if>&ndash;%&gt;
    &lt;%&ndash;                                                            >&ndash;%&gt;
    &lt;%&ndash;                                                                    ${getGroupList.groupName}&ndash;%&gt;
    &lt;%&ndash;                                                            </option>&ndash;%&gt;
    &lt;%&ndash;                                                        </c:forEach>&ndash;%&gt;
    &lt;%&ndash;                                                    </c:if>&ndash;%&gt;
    &lt;%&ndash;                                                    <c:if test="${role !='system'}">&ndash;%&gt;
    &lt;%&ndash;                                                        <c:forEach var="getGroupList" items="${getGroupList}">&ndash;%&gt;
    &lt;%&ndash;                                                            <option value="${getGroupList.groupSeq}" <c:if test="${getGroupList.groupSeq==hmap.paramGroupSeq}">selected</c:if>>&ndash;%&gt;
    &lt;%&ndash;                                                                    ${getGroupList.groupName}&ndash;%&gt;
    &lt;%&ndash;                                                            </option>&ndash;%&gt;
    &lt;%&ndash;                                                        </c:forEach>&ndash;%&gt;
    &lt;%&ndash;                                                    </c:if>&ndash;%&gt;
    &lt;%&ndash;                                                </select>&ndash;%&gt;
    &lt;%&ndash;                                            </div>&ndash;%&gt;
    &lt;%&ndash;                                        </div>&ndash;%&gt;

    &lt;%&ndash;                                        <div class="col-lg-2 col-md-12 bg-light p-3">기간검색</div>&ndash;%&gt;
    &lt;%&ndash;                                        <div class="col-lg-4 col-sm-12 col-md-12 py-2">&ndash;%&gt;
    &lt;%&ndash;                                            <div class="input-group daterange-btn form-inline col-lg-12 col-sm-5 col-md-12">&ndash;%&gt;
    &lt;%&ndash;                                                <div class="input-group-prepend">&ndash;%&gt;
    &lt;%&ndash;                                                    <div class="input-group-text">&ndash;%&gt;
    &lt;%&ndash;                                                        <i class="fas fa-calendar"></i>&ndash;%&gt;
    &lt;%&ndash;                                                    </div>&ndash;%&gt;
    &lt;%&ndash;                                                </div>&ndash;%&gt;
    &lt;%&ndash;                                                <input type="text" name="sDate" class="form-control daterange-sdate"&ndash;%&gt;
    &lt;%&ndash;                                                       value="${today}" readonly="readonly" placeholder="시작일자">&ndash;%&gt;
    &lt;%&ndash;                                                <div class="date-hypen"> ~</div>&ndash;%&gt;
    &lt;%&ndash;                                                <input type="text" name="eDate" class="form-control daterange-edate"&ndash;%&gt;
    &lt;%&ndash;                                                       value="${today}" readonly="readonly" placeholder="종료일자">&ndash;%&gt;
    &lt;%&ndash;                                            </div>&ndash;%&gt;
    &lt;%&ndash;                                        </div>&ndash;%&gt;
    &lt;%&ndash;                                    </div>&ndash;%&gt;
    &lt;%&ndash;                                </div>&ndash;%&gt;

    &lt;%&ndash;                            </form>&ndash;%&gt;
    &lt;%&ndash;                            <div class="col-lg-12 text-center mt-4">&ndash;%&gt;
    &lt;%&ndash;                                <button type="submit" class="btn btn-primary btn-lg">&ndash;%&gt;
    &lt;%&ndash;                                    조회&ndash;%&gt;
    &lt;%&ndash;                                </button>&ndash;%&gt;
    &lt;%&ndash;                            </div>&ndash;%&gt;
                            </div>
                        </div>
                        <div class="card">
                            <div class="row p-4">
                                <div class="col-md-6 col-xs-6">
                                    <h6 class="pt-2">조회결과 <span class="text-muted">( <fmt:formatNumber value="${searchCount}" pattern="#,###" /> 건 )</span></h6>
                                </div>
                                &lt;%&ndash;<div class="col-md-6 col-xs-6">
                                    <div class="justify-content-md-end float-right">
                                        <a href="#" class="btn btn-outline-primary"><i class="fas fa-trash-alt lh-0"></i> 선택삭제</a>
                                        <a href="/notice/noticeRegist.do" class="btn btn-outline-primary ml-2"><i class="fas fa-edit lh-0"></i> 글쓰기</a>
                                    </div>
                                </div>&ndash;%&gt;
                            </div>
                            <div class="card-body pt-0">
                                <div class="table-responsive">
                                    <table class="table table-striped table-md fancy-table">
                                        <thead>
                                        <tr>
                                            <th>번호</th>
                                            <th>그룹명</th>
                                            <th>분류</th>
                                            <th>제목</th>
                                            <th>게시기간</th>
                                            <c:if test="${role} == 'system'">
                                            <th>여부</th>
                                            <th>관리</th>
                                            </c:if>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach var="searchList" items="${searchList}">
                                            <tr onclick="postParams('/notice/noticeInfo.do',
                                                    params={paramSeq : ${searchList.noticeSeq}, page : 'noticeInfo'});">
                                                <td>${searchList.noticeSeq}</td>
                                                <td>${searchList.groupName}</td>
                                                <td>${searchList.noticeType}</td>
                                                <td>${searchList.noticeTitle}</td>
                                                <td>${searchList.regDate} ~ ${searchList.expiryDate}</td>
                                                <c:if test="${role} == 'system'">
                                                <td>${searchList.useYN}</td>
                                                <td onclick="postParams('/notice/noticeInfo.do',
                                                        params={paramSeq : ${searchList.noticeSeq}, page : 'noticeInfo'});">
                                                    <a href="#" class="btn btn-primary"><span>관리</span></a>
                                                </td>
                                                </c:if>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>--%>
</div>
<script type="text/javascript">
  $(".fancy-table").fancyTable({
    sortColumn: 10, // column number for initial sorting
    sortOrder: 'descending', // 'desc', 'descending', 'asc', 'ascending', -1 (descending) and 1 (ascending)
    sortable: true,
    pagination: true, // default: false
    searchable: true,
    globalSearch: true,
    globalSearchExcludeColumns: [0, 20] // exclude column 2 & 5
  });
  $('#summernote').summernote({
    height: 300,                 // 에디터 높이
    minHeight: null,             // 최소 높이
    maxHeight: null,             // 최대 높이
    focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
    lang: "ko-KR",					// 한글 설정
    placeholder: '최대 2048자까지 쓸 수 있습니다',	//placeholder 설정
    callbacks: {	//여기 부분이 이미지를 첨부하는 부분
      onImageUpload: function (files) {
        uploadSummernoteImageFile(files[0], this);
      },
      onPaste: function (e) {
        var clipboardData = e.originalEvent.clipboardData;
        if (clipboardData && clipboardData.items && clipboardData.items.length) {
          var item = clipboardData.items[0];
          if (item.kind === 'file' && item.type.indexOf('image/') !== -1) {
            e.preventDefault();
          }
        }
      }
    }
  });
</script>
</body>
</html>

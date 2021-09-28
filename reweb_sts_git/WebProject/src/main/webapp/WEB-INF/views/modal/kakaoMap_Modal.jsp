<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- kakaoMap Api + js + css -->
<!-- link rel="stylesheet" href="../resources/css/kakaoMap.css"-->
<style>
.map_wrap, .map_wrap * {margin:0;padding:0;font-family:'Malgun Gothic',dotum,'돋움',sans-serif;font-size:12px;}
.map_wrap a, .map_wrap a:hover, .map_wrap a:active{color:#000;text-decoration: none;}
.map_wrap {position:relative;width:100%;height:500px;}
#menu_wrap {position:absolute;top:0;left:0;bottom:0;width:250px;margin:10px 0 30px 10px;padding:5px;overflow-y:auto;background:rgba(255, 255, 255, 0.7);z-index: 1;font-size:12px;border-radius: 10px;}
.bg_white {background:#fff;}
#menu_wrap hr {display: block; height: 1px;border: 0; border-top: 2px solid #5F5F5F;margin:3px 0;}
#menu_wrap .option{text-align: center;}
#menu_wrap .option p {margin:10px 0;}  
#menu_wrap .option button {margin-left:5px;}
#placesList li {list-style: none;}
#placesList .item {position:relative;border-bottom:1px solid #888;overflow: hidden;cursor: pointer;min-height: 65px;}
#placesList .item span {display: block;margin-top:4px;}
#placesList .item h5, #placesList .item .info {text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
#placesList .item .info{padding:10px 0 10px 55px;}
#placesList .info .gray {color:#8a8a8a;}
#placesList .info .jibun {padding-left:26px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png) no-repeat;}
#placesList .info .tel {color:#009900;}
#placesList .item .markerbg {float:left;position:absolute;width:36px; height:37px;margin:10px 0 0 10px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png) no-repeat;}
#placesList .item .marker_1 {background-position: 0 -10px;}
#placesList .item .marker_2 {background-position: 0 -56px;}
#placesList .item .marker_3 {background-position: 0 -102px}
#placesList .item .marker_4 {background-position: 0 -148px;}
#placesList .item .marker_5 {background-position: 0 -194px;}
#placesList .item .marker_6 {background-position: 0 -240px;}
#placesList .item .marker_7 {background-position: 0 -286px;}
#placesList .item .marker_8 {background-position: 0 -332px;}
#placesList .item .marker_9 {background-position: 0 -378px;}
#placesList .item .marker_10 {background-position: 0 -423px;}
#placesList .item .marker_11 {background-position: 0 -470px;}
#placesList .item .marker_12 {background-position: 0 -516px;}
#placesList .item .marker_13 {background-position: 0 -562px;}
#placesList .item .marker_14 {background-position: 0 -608px;}
#placesList .item .marker_15 {background-position: 0 -654px;}
#pagination {margin:10px auto;text-align: center;}
#pagination a {display:inline-block;margin-right:10px;}
#pagination .on {font-weight: bold; cursor: default;color:#777;}
</style>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e0ca20a32e17caba9fe0222b2414c5e0&libraries=services"></script>
 
<script src="../resources/js/kakaoMap.js" defer></script>



							<!-- -------------- modal ------------------ -->
							<!--kakaoMap Modal -->
							<div id="kakaoMapModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
								<div class="modal-dialog" role="document" style="width:100%; display:table">
									<div class="modal-content">
										
										<div class="modal-header">
										
											<button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
												<span aria-hidden="true">×</span>
											</button>
											
											<h4 class="modal-title" style="color:#004ba0;">위치 찾기</h4>
											
											<!------------------------------------------------->	
											<!--=====================지도 Test========================-->
											<div class="map_wrap">
												<div id="map" style="width:100%;height:100%;position:relative;overflow:auto;"></div>
													
													    <div id="menu_wrap" class="bg_white">
													        <div class="option">
													            <div>
													                <form onsubmit="searchPlaces(); return false;">
													                    키워드 : <input type="text" value="이태원 맛집" id="keyword" size="15"> 
													                    <button type="submit">검색하기</button> 
													                </form>
													            </div>
													        </div>
													        <hr>
													        <ul id="placesList"></ul>
													        <div id="pagination"></div>
													    </div>
													</div>
										           
										            <!--=====================지도 끝========================-->

													</div>
								        	</div>
								      		</div>
								
											
										</div>
											
							<script>
								var thisModal = document.getElementById("kakaoMapModal");
								
								thisModal.addEventListener('show.bs.modal', function(e){
									
									var button = event.relatedTarget // 모달 윈도우를 오픈하는 버튼
									  
									var keyword = document.getElementById('findPlace').value;
									document.querySelector("#keyword").value = keyword;
									
									console.log(keyword);
									 
								});
									
							
							</script>
            
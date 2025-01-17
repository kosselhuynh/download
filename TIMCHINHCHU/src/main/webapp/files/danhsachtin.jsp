<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/fmt" prefix = "fmt" %>
<%@ page import="java.io.*,java.util.*" %>
<!DOCTYPE html>
<html lang="zxx">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="shortcut icon" href="<c:url value="/images/logo.png" />"
	type="image/png">
    
    <link rel="stylesheet"	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet"	href="http://cdn.datatables.net/1.10.20/css/jquery.dataTables.min.css">
 <script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script> 
 <script	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
 <script	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href=" https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.min.css">


<script	src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
<script	src="http://cdnjs.cloudflare.com/ajax/libs/moment.js/2.8.4/moment.min.js"></script>
<script	src="http://cdn.datatables.net/plug-ins/1.10.20/sorting/datetime-moment.js"></script>

    <title>TIM CHINH CHU</title>
    <!-- CSS -->
    <link rel="stylesheet" href="<c:url value = "/assets/css/app.css" />" >
    <style>
        .loader {
            position: fixed;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            background-color: #F5F8FA;
            z-index: 9998;
            text-align: center;
        }

        .plane-container {
            position: absolute;
            top: 50%;
            left: 50%;
        }
        #filestable thead {
		  display:none;
		}
		.dataTables_wrapper .dataTables_paginate .paginate_button {
		    padding: 0em 0em!important;
		    margin-left: 0px!important;
		}
		body {
		    color: #101010;
		    font-family: Tahoman;
		    font-size: 15px;

		}
		h5, h6 {
		    font-weight: 400;
		    color: #004bf5;
		
		}
		
    </style>
    
<script type="text/javascript">

$(document).ready(function() {
	var table = $('#filestable').DataTable( {
		order : [[4,"desc"]],
		searching:false,
		pageLength: 15,
 		bInfo: false,
		lengthChange: false,
	    ajax: {
	        url: '/fileshome',
	        dataSrc: ''
	    },
	    columns: [
	    	{
                data:           "id",
    			render: function (data, type, row, meta ) {
					return '<a href = "'+data+'"><i class="icon-save"></i></a>';
		  		}
            },
			{
    			data:'subject',//<div class="text-nowrap" style="width: 8rem;">
    			render: function (data, type, row, meta ) {
					return '<a data-href="'+row["phone"]+'" data-toggle="modal" data-songay= "'+row["songay"]+'" data-sobaidang= "'+row["sobaidang"]+'" data-legal= "'+row["propertyLegalDocument"]+'" data-road= "'+row["propertyRoadCondition"]+'" data-huongnha= "'+row["direction"]+'" data-tinhthanhpho= "'+row["regionName"]+'" data-quanhuyen= "'+row["areaName"]+'" data-danhmuc= "' +row["catalogyName"]+ '" data-ngay= "'+moment(row["dateUploadConvert"]).format('DD-MM-YYYY')+'" data-accountname= "'+row["accountName"]+'" data-pricestring= "' +row["priceString"]+ '" data-id="'+row["id"]+'" data-phone="'+row["phone"] +'" data-subject="' + row["subject"] + '" data-body = "'+row["body"] + '" data-target="#confirm-delete"> '+data+'</a>';
   				}
			},
			{
				data:'priceString',//icon-attach_money
				render: function (data, type, row, meta ) {
					var result = '<span><i class="icon icon-attach_money"></i>'+data+' </span>';
					return  result;
				}

			},
			{
				data:'phone',
				render: function (data, type, row, meta ) {
					var result = '<span><i class="icon icon-phone_iphone"></i>'+data+' </span>';
					return  result;
				}

			},
			{
				data:'dateUploadConvert',
				render: function (data, type, row, meta ) {
					var result = '<span><i class="icon icon-data_usage"></i>'+moment(data).format('HH:mm:ss')+' </span><br>' +
					'<span><i class="icon icon-timer"></i>'+moment(data).format('DD-MMM-YYYY')+'</span>';
					return  result;//moment(data).format('YYYY-MM-DD HH:mm:ss');
 		  		}

			}
	     ],
	     columnDefs:[
	         {
	           
	           targets:1, render:function(data, type, row){
	        	   var result = '<h6>' + row["subject"] + '</h6>  <small class="text-muted">Người đăng : ' + row["accountName"] +'</small>';
                   console.log(result);
                   return result;
               }
	         }
	          
	       ]

	} );
	

    $('#btnDelete').click(function() {
        bootbox.confirm("Are you sure want to delete?", function(result) {
          alert("Confirm result: " + result);
        });
      });
    
} );






</script>
  
 
</head>
<div class="modal fade bd-example-modal-lg" id="confirm-delete" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="modalTitle"></h5>
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			          <span aria-hidden="true">&times;</span>
			        </button>
                </div>
                <div class="modal-body">
                    <div class="container-fluid">
				          <div class="row">
				            <div class="col-md-6 col-example">
				            		<h2 style = "font-style: bold" id="pricestring"></h2>
						      		<h5 id="accountname"></h5>
						      		<h5 id="phone"></h5>
						      		<h5 id="ngay"></h5>
				            </div>
				            <div class="col-md-6 ml-auto col-example">
				            		<h5 id="huongnha"></h5>
					          		<h5 id="phaplyRoad"></h5>
					            	<h5 id="danhmuc"></h5>
						      		<h5 id="quanhuyen"></h5>
						      		<h5 id="tinhthanhpho"></h5>
				            </div>
				          </div>
						<br>
					    <div class="row">
					      <h5 id="body"></h5>
					    </div>
					    <br>
					  
					    <div class="row">
				            <div class="col-md-4 col-example">
				            	<h3>Đánh giá : </h3>
				            	<h5 id="sobaidang"></h5>
				            	<span class="badge badge-danger r-3 blink">
						        	<h5 id="ts"></h5>
						        </span>
						       
				            </div>
				            
				          </div>
					  </div>
                </div>
                <div class="modal-footer">
                 	<a class="btn btn-danger btn-ok" style="padding: 6px 10px;">Môi giới</a>
                 	<button type="button" class="btn btn-default" data-dismiss="modal">
                    	Đóng
                    </button>
                </div>
            </div>
        </div>
</div> 
<script>
 $('#confirm-delete').on('show.bs.modal', function(e) {
	
	 var triggerLink = $(e.relatedTarget);
	    var id = triggerLink.data("id");//ok
	    var subject = triggerLink.data("subject");
	    var phone = triggerLink.data("phone");//ok priceString
	    var pricestring = triggerLink.data("pricestring");
	    $("#pricestring").text("Giá : " + pricestring);
	    $("#accountname").text("Người đăng : " + triggerLink.data("accountname"));
	    $("#body").text("Thông tin : " + triggerLink.data("body"));
	    $("#ngay").text("Ngày đăng : " + triggerLink.data("ngay"));
	    $("#phone").text("Số điện thoại : " + triggerLink.data("phone"));
	    var phaply = triggerLink.data("legal");
		if(triggerLink.data("legal") == null){
			phaply = "Chưa biết";
		}
		var road = triggerLink.data("road");
		if(triggerLink.data("road") == null){
			road = "Chưa biết";
		}
	    $("#phaplyRoad").text("Pháp lý/Vị trí : " + phaply +"-"+ road);
	    $("#huongnha").text("Hướng nhà : " + triggerLink.data("huongnha"));
	    $("#danhmuc").text("Danh mục : " + triggerLink.data("danhmuc"));
	    $("#quanhuyen").text("Quận, huyện : " + triggerLink.data("quanhuyen"));
	    $("#tinhthanhpho").text("Tỉnh, thành phố : " + triggerLink.data("tinhthanhpho"));
	    $("#modalTitle").text(subject);

	    $("#sobaidang").text("Tổng số bài đăng :" + triggerLink.data("sobaidang") + " tin/ " + triggerLink.data("songay") + " ngày");
	    var bai =  new Number(triggerLink.data("sobaidang"));
	    var ngay = new Number(triggerLink.data("songay"));
	    var ts;
	    if(ngay > 0){
	    	ts = Math.ceil(bai/ngay)*10 + "%";
		 }
	    else{
			ts = "Chưa xác định";
			}
	   
	    $("#ts").text("Khả năng môi giới là :" + ts);
		 
	//   var data = $(e.relatedTarget).data("bookId");
	    $(this).find('.btn-ok').attr('href', $(e.relatedTarget).data('href'));
 });
    </script>

<body class="light">
<!-- Pre loader -->
<div id="loader" class="loader">
    <div class="plane-container">
        <div class="preloader-wrapper small active">
            <div class="spinner-layer spinner-blue">
                <div class="circle-clipper left">
                    <div class="circle"></div>
                </div><div class="gap-patch">
                <div class="circle"></div>
            </div><div class="circle-clipper right">
                <div class="circle"></div>
            </div>
            </div>

            <div class="spinner-layer spinner-red">
                <div class="circle-clipper left">
                    <div class="circle"></div>
                </div><div class="gap-patch">
                <div class="circle"></div>
            </div><div class="circle-clipper right">
                <div class="circle"></div>
            </div>
            </div>

            <div class="spinner-layer spinner-yellow">
                <div class="circle-clipper left">
                    <div class="circle"></div>
                </div><div class="gap-patch">
                <div class="circle"></div>
            </div><div class="circle-clipper right">
                <div class="circle"></div>
            </div>
            </div>

            <div class="spinner-layer spinner-green">
                <div class="circle-clipper left">
                    <div class="circle"></div>
                </div><div class="gap-patch">
                <div class="circle"></div>
            </div><div class="circle-clipper right">
                <div class="circle"></div>
            </div>
            </div>
        </div>
    </div>
</div>
<div id="app">
<aside class="main-sidebar fixed offcanvas shadow">
    <section class="sidebar">
        <div class="w-80px mt-3 mb-3 ml-3">
            <img src="assets/img/basic/logo.png" alt="">
        </div>
        <div class="relative">
            <a data-toggle="collapse" href="#userSettingsCollapse" role="button" aria-expanded="false"
               aria-controls="userSettingsCollapse" class="btn-fab btn-fab-sm fab-right fab-top btn-primary shadow1 ">
                <i class="icon icon-cogs"></i>
            </a>
            <div class="user-panel p-3 light mb-2">
                <div>
                    <div class="float-left image">
                        <img class="user_avatar" src="assets/img/dummy/u2.png" alt="User Image">
                    </div>
                    <div class="float-left info">
                        <h6 class="font-weight-light mt-2 mb-1">Alexander Pierce</h6>
                        <a href="#"><i class="icon-circle text-primary blink"></i> Online</a>
                    </div>
                </div>
                <div class="clearfix"></div>
                <div class="collapse multi-collapse" id="userSettingsCollapse">
                    <div class="list-group mt-3 shadow">
                        <a href="index.html" class="list-group-item list-group-item-action ">
                            <i class="mr-2 icon-umbrella text-blue"></i>Profile
                        </a>
                        <a href="#" class="list-group-item list-group-item-action"><i
                                class="mr-2 icon-cogs text-yellow"></i>Settings</a>
                        <a href="#" class="list-group-item list-group-item-action"><i
                                class="mr-2 icon-security text-purple"></i>Change Password</a>
                    </div>
                </div>
            </div>
        </div>
        <ul class="sidebar-menu">
            <li class="header"><strong>MAIN NAVIGATION</strong></li>
            <li class="treeview">
            <a href="index">
                <i class="icon icon-sailing-boat-water purple-text s-18"></i> <span>Dashboard</span> <i
                    class="icon icon-angle-left s-18 pull-right"></i>
            </a>
                
            </li>
            <li class="treeview"><a href="#">
                <i class="icon icon icon-package blue-text s-18"></i>
                <span>Tin mới</span>
                <span class="badge r-3 badge-primary pull-right">4</span>
            </a>
                <ul class="treeview-menu">
                    <li>
                    	<a href="danhsachtin_hochiminh"><i class="icon icon-circle-o"></i>TP. Hồ Chí Minh</a>
                    </li>
                    <li>
                    	<a href="danhsachtin_hanoi"><i class="icon icon-circle-o"></i>TP. Hà Nội</a>
                    </li>
                    <li>
                    	<a href="danhsachtin_danang"><i class="icon icon-circle-o"></i>TP. Đà Nẵng </a>
                    </li>
                </ul>
            </li>
            <li class="treeview"><a href="#"><i class="icon icon-account_box light-green-text s-18"></i>Users<i
                    class="icon icon-angle-left s-18 pull-right"></i></a>
                <ul class="treeview-menu">
                    <li><a href="backupsdtco"><i class="icon icon-circle-o"></i>BK SDT</a>
                    </li>
                    <li><a href="backuptansuat"><i class="icon icon-add"></i>BK TAN SUAT</a>
                    </li>
                    <li><a href="profile"><i class="icon icon-user"></i>User Profile </a>
                    </li>
                </ul>
            </li>
           
          
        </ul>
    </section>
</aside>
<!--Sidebar End-->
<div class="has-sidebar-left">
    <div class="pos-f-t">
    <div class="collapse" id="navbarToggleExternalContent">
        <div class="bg-dark pt-2 pb-2 pl-4 pr-2">
            <div class="search-bar">
                <input class="transparent s-24 text-white b-0 font-weight-lighter w-128 height-50" type="text"
                       placeholder="start typing...">
            </div>
            <a href="#" data-toggle="collapse" data-target="#navbarToggleExternalContent" aria-expanded="false"
               aria-label="Toggle navigation" class="paper-nav-toggle paper-nav-white active "><i></i></a>
        </div>
    </div>
</div>
    <div class="sticky">
        <div class="navbar navbar-expand navbar-dark d-flex justify-content-between bd-navbar blue accent-3">
            <div class="relative">
                <a href="#" data-toggle="offcanvas" class="paper-nav-toggle pp-nav-toggle">
                    <i></i>
                </a>
            </div>
        </div>
    </div>
</div>
<div class="page has-sidebar-left">
    <header class="blue accent-3 relative">
        <div class="container-fluid text-white">
            <div class="row p-t-b-10 ">
                <div class="col">
                    <h4>
                        <i class="icon-package"></i>
                       TIMCHINHCHU.VN
                    </h4>
                </div>
            </div>
            <div class="row">
                <ul class="nav responsive-tab nav-material nav-material-white">
                    <li>
                        <a class="nav-link active" href="#"><i class="icon icon-list"></i>Danh sách tin : ${regionName}</a>
                    </li>
                </ul>
            </div>
        </div>
    </header>
    <div class="container-fluid animatedParent animateOnce my-3">
        <div class="animated fadeInUpShort">
           <form action="actionFormSearch" method="GET" novalidate="novalidate">
        	    <div class="row my-3">
                   <div class="col-md-3">
                       <ul class="list-unstyled">
	                        <li class="my-1">
	                            <div class="card no-b p-3">
	                                <div>
	                                    <select class="form-control search-slt custom-select select2" id="quanhuyen" name="quanhuyen">
			                                <option> ${quanhuyen}</option>
			                                	<c:if test="${listAreaName.size() > 0}">
					                                <c:forEach var = "i" begin = "0" end = "${listAreaName.size() - 1}">
												          <option>${listAreaName.get(i)}</option>
												      </c:forEach>
										      </c:if>
			                            </select>
	                                </div>
	                            </div>
	                        </li>
	                    </ul>
	               </div>         
	                <div class="col-md-3">
                       <ul class="list-unstyled">         
	                        <li class="my-1">
	                            <div class="card no-b p-3">
	                                <div>
	                                    <select class="form-control selectpicker custom-select select2" id="loai" name="loai">
		                            <option>${loai}</option>
									  <optgroup label="Cần bán">
									    <c:if test="${arrayNhatDat_CanBan.size() > 0}">
				                                <c:forEach var = "i" begin = "0" end = "${arrayNhatDat_CanBan.size() - 1}">
											          <option>${arrayNhatDat_CanBan.get(i)}</option>
											      </c:forEach>
									      </c:if>
									  </optgroup>
									  <optgroup label="Cần mua">
									    <c:if test="${arrayNhatDat_CanMua.size() > 0}">
				                                <c:forEach var = "i" begin = "0" end = "${arrayNhatDat_CanMua.size() - 1}">
											          <option>${arrayNhatDat_CanMua.get(i)}</option>
											      </c:forEach>
									      </c:if>
									  </optgroup>
									  <optgroup label="Cho thuê">
									    <c:if test="${arrayNhatDat_ChoThue.size() > 0}">
				                                <c:forEach var = "i" begin = "0" end = "${arrayNhatDat_ChoThue.size() - 1}">
											          <option>${arrayNhatDat_ChoThue.get(i)}</option>
											      </c:forEach>
									      </c:if>
									  </optgroup>
									  <optgroup label="Cần thuê">
									    <c:if test="${arrayNhatDat_CanThue.size() > 0}">
				                                <c:forEach var = "i" begin = "0" end = "${arrayNhatDat_CanThue.size() - 1}">
											          <option>${arrayNhatDat_CanThue.get(i)}</option>
											      </c:forEach>
									      </c:if>
									  </optgroup>
									</select>
	                                </div>
	                            </div>
	                        </li>
	                  </ul>
	              </div>
	               <div class="col-md-3">
                       <ul class="list-unstyled">
	                        <li class="my-1">
	                            <div class="card no-b p-3">
	                                <div>
	                                    <input type="text" class="form-control search-slt" placeholder="Nhập thông tin cần tìm" id="tutimkiem" name="tutimkiem">
	                                </div>
	                            </div>
	                        </li>
	                   </ul>
	                </div>
	                 <div class="col-md-3">
                       <ul class="list-unstyled">
	                        <li class="my-1">
	                            <div class="card no-b p-3">
	                                <div>
	                                	<input type="hidden" name="tinhthanhpho" value="${regionName}" />
	                                    <button type="submit" class="btn btn-danger wrn-btn">
				                            <i class="fas fa-search" aria-hidden="true"></i>
				                            Tìm kiếm
				                        </button>
	                                </div>
	                            </div>
	                        </li>
	                 	</ul>
	                 </div>   
                    
                
            <!--     <div class="col-md-8">
                    <ul class="list-unstyled">
                        	 
	                       
	                        
	                        
                    </ul>
                </div> -->
            </div>
            
            </form>
            <div class="row">
                <div class="col-md-12">
                    <div class="card no-b shadow">
                        <div class="card-body p-0">
                            <div class="table-responsive">
                            	<table class="table table-bordered table-hover"  id="filestable">
									
								</table>
                              </div>
                        </div>
                    </div>
                </div>
            </div>
           
        </div>
    </div>
</div>
<!-- Right Sidebar -->
<aside class="control-sidebar fixed white ">
    <div class="slimScroll">
        <div class="sidebar-header">
            <h4>Activity List</h4>
            <a href="#" data-toggle="control-sidebar" class="paper-nav-toggle  active"><i></i></a>
        </div>
        <div class="p-3">
            <div>
                <div class="my-3">
                    <small>25% Complete</small>
                    <div class="progress" style="height: 3px;">
                        <div class="progress-bar bg-success" role="progressbar" style="width: 25%;" aria-valuenow="25"
                             aria-valuemin="0" aria-valuemax="100"></div>
                    </div>
                </div>
                <div class="my-3">
                    <small>45% Complete</small>
                    <div class="progress" style="height: 3px;">
                        <div class="progress-bar bg-info" role="progressbar" style="width: 45%;" aria-valuenow="45"
                             aria-valuemin="0" aria-valuemax="100"></div>
                    </div>
                </div>
                <div class="my-3">
                    <small>60% Complete</small>
                    `
                    <div class="progress" style="height: 3px;">
                        <div class="progress-bar bg-warning" role="progressbar" style="width: 60%;" aria-valuenow="60"
                             aria-valuemin="0" aria-valuemax="100"></div>
                    </div>
                </div>
                <div class="my-3">
                    <small>75% Complete</small>
                    <div class="progress" style="height: 3px;">
                        <div class="progress-bar bg-danger" role="progressbar" style="width: 75%;" aria-valuenow="75"
                             aria-valuemin="0" aria-valuemax="100"></div>
                    </div>
                </div>
                <div class="my-3">
                    <small>100% Complete</small>
                    <div class="progress" style="height: 3px;">
                        <div class="progress-bar" role="progressbar" style="width: 100%;" aria-valuenow="100"
                             aria-valuemin="0" aria-valuemax="100"></div>
                    </div>
                </div>
            </div>
        </div>
        <div class="p-3 bg-primary text-white">
            <div class="row">
                <div class="col-md-6">
                    <h5 class="font-weight-normal s-14">Sodium</h5>
                    <span class="font-weight-lighter text-primary">Spark Bar</span>
                    <div> Oxygen
                        <span class="text-primary">
                                                    <i class="icon icon-arrow_downward"></i> 67%</span>
                    </div>
                </div>
                <div class="col-md-6">
                    <canvas width="100" height="70" data-chart="spark" data-chart-type="bar"
                            data-dataset="[[28,68,41,43,96,45,100,28,68,41,43,96,45,100,28,68,41,43,96,45,100,28,68,41,43,96,45,100]]"
                            data-labels="['a','b','c','d','e','f','g','h','i','j','k','l','m','n','a','b','c','d','e','f','g','h','i','j','k','l','m','n']">
                    </canvas>
                </div>
            </div>
        </div>
        <div class="table-responsive">
            <table id="recent-orders" class="table table-hover mb-0 ps-container ps-theme-default">
                <tbody>
                <tr>
                    <td>
                        <a href="#">INV-281281</a>
                    </td>
                    <td>
                        <span class="badge badge-success">Paid</span>
                    </td>
                    <td>$ 1228.28</td>
                </tr>
                <tr>
                    <td>
                        <a href="#">INV-01112</a>
                    </td>
                    <td>
                        <span class="badge badge-warning">Overdue</span>
                    </td>
                    <td>$ 5685.28</td>
                </tr>
                <tr>
                    <td>
                        <a href="#">INV-281012</a>
                    </td>
                    <td>
                        <span class="badge badge-success">Paid</span>
                    </td>
                    <td>$ 152.28</td>
                </tr>
                <tr>
                    <td>
                        <a href="#">INV-01112</a>
                    </td>
                    <td>
                        <span class="badge badge-warning">Overdue</span>
                    </td>
                    <td>$ 5685.28</td>
                </tr>
                <tr>
                    <td>
                        <a href="#">INV-281012</a>
                    </td>
                    <td>
                        <span class="badge badge-success">Paid</span>
                    </td>
                    <td>$ 152.28</td>
                </tr>
                </tbody>
            </table>
        </div>
        <div class="sidebar-header">
            <h4>Activity</h4>
            <a href="#" data-toggle="control-sidebar" class="paper-nav-toggle  active"><i></i></a>
        </div>
        <div class="p-4">
            <div class="activity-item activity-primary">
                <div class="activity-content">
                    <small class="text-muted">
                        <i class="icon icon-user position-left"></i> 5 mins ago
                    </small>
                    <p>Lorem ipsum dolor sit amet conse ctetur which ascing elit users.</p>
                </div>
            </div>
            <div class="activity-item activity-danger">
                <div class="activity-content">
                    <small class="text-muted">
                        <i class="icon icon-user position-left"></i> 8 mins ago
                    </small>
                    <p>Lorem ipsum dolor sit ametcon the sectetur that ascing elit users.</p>
                </div>
            </div>
            <div class="activity-item activity-success">
                <div class="activity-content">
                    <small class="text-muted">
                        <i class="icon icon-user position-left"></i> 10 mins ago
                    </small>
                    <p>Lorem ipsum dolor sit amet cons the ecte tur and adip ascing elit users.</p>
                </div>
            </div>
            <div class="activity-item activity-warning">
                <div class="activity-content">
                    <small class="text-muted">
                        <i class="icon icon-user position-left"></i> 12 mins ago
                    </small>
                    <p>Lorem ipsum dolor sit amet consec tetur adip ascing elit users.</p>
                </div>
            </div>
        </div>
    </div>
</aside>
<!-- /.right-sidebar -->
<!-- Add the sidebar's background. This div must be placed
         immediately after the control sidebar -->
<div class="control-sidebar-bg shadow white fixed"></div>
</div>
<!--/#app -->
<script src= "<c:url value = "/assets/js/app.js" />" ></script>
</body>
</html>
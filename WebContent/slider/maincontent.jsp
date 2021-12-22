<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<head>

<title>이미지 슬라이드</title>

<link href="slider/style.css" rel="stylesheet" type="text/css">

</head>

<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">

<div id="wrapper">
     <div id="slider-wrap">
        <ul id="slider">
           <li>                
				<img src="slider/sample1.jpg">
             </li>
             
             <li>
				<img src="slider/sample2.jpg">
             </li>
             
             <li>
				<img src="slider/sample3.jpg">
             </li>
             
             <li>
				<img src="slider/sample4.jpg">
             </li>
             
             <li>
				<img src="slider/sample5.jpg">
             </li>    
          </ul>
          
           <!--controls-->
          <div class="btns" id="next"><i class="fa fa-arrow-right"></i></div>
          <div class="btns" id="previous"><i class="fa fa-arrow-left"></i></div>
          <div id="counter"></div>
          
          <div id="pagination-wrap">
            <ul>
            </ul>
          </div>
          <!--controls-->  
         
      </div>
  
   </div>

<script type="text/javascript" src="slider/javascript.js"></script>



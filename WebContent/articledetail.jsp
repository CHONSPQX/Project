<%@page import="Comment.Comment"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%request.setCharacterEncoding("UTF-8");%>
<!DOCTYPE html>
<html>

<head></head>

<body>
<!--
Author: W3layouts
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
  <title>Blog Magazine Flat UI Kit website for high end mobiles,like samsung nokia mobile website templates for free | Home :: w3layouts</title>
  <link href="./css/style.css" rel="stylesheet" type="text/css" media="all">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="./css/jquery.bxslider.css" rel="stylesheet">
  <%
      String context=(String)request.getAttribute("readContext");
      String filename=(String)request.getAttribute("filename");
      ArrayList<Comment> comments=(ArrayList<Comment>)request.getAttribute("commentTable");
      
  %>
  <link rel="stylesheet" href="./css/clndr.css" type="text/css">
  <script src="./js/underscore-min.js"></script>
  <script src="./js/moment-2.2.1.js"></script>
  <script src="./js/clndr.js"></script>
  <script src="./js/site.js"></script>
  
  <div class="wrap">
    <div class="clear"> </div>
    <div class="clear"> </div>
    <div class="grids-slider">
      <div class="blog-tabs">
      <h1 id="filename">
          <%=filename %>
          </h1>
        <div class="blog-section">
          <div class="blog-artical">
          
            <div class="artical-info">
            <%=context %>
            </div>
            <div class="artical-related-info">
              <div class="artical-related-info-row">
                <div class="clear"> </div>
              </div>
            </div>
          </div>
          <!---//Blog comments and news----->
          <div class="clear"> </div>
          <%
              for(Comment com:comments)
              {
          %>
          <div class="comment-section">
            <div class="comment-box">
              <div class="comment-people-pic">
                <a href="#">
                  <img src="./images/comment-people1.png" alt="">
                </a>
              </div>
              <div class="comment-info">
                <div class="comment-info-head">
                  <div class="comment-info-head-left">
                    <%=com.getOwner()%>
                  </div>
                  <div class="comment-info-head-right">
                    <ul>
                      <li>
                       <%=com.getCommentTime() %>
                      </li>
                      
                    </ul>
                  </div>
                  <div class="clear"> </div>
                  <div class="comment-place">
                    <p><%=com.getMessage() %></p>
                  </div>
                  <div class="clear"> </div>
                </div>
              </div>
              <div class="clear"> </div>
            </div>          
          </div>
          <%
              }
          %>
        </div>
        <!----->
        <div class="tabs-cal-social">
          <div class="tabs-right">
          </div>
          <!---//End-blog and tabs-section---->
          <!---start-calender---->
          <div class="column_right_grid calender">
            <div class="cal1">
              <div class="clndr">
                <div class="clndr-controls">
                  <div class="clndr-control-button">
                    <p class="clndr-previous-button">previous</p>
                  </div>
                  <div class="month">December 2013</div>
                  <div class="clndr-control-button rightalign">
                    <p class="clndr-next-button">next</p>
                  </div>
                </div>
                <table class="clndr-table" border="0" cellspacing="0" cellpadding="0">
                  <tbody>
                    <tr>
                      <td class="day past calendar-day-2013-12-01">
                        <div class="day-contents">1</div>
                      </td>
                      <td class="day past calendar-day-2013-12-02">
                        <div class="day-contents">2</div>
                      </td>
                      <td class="day past calendar-day-2013-12-03">
                        <div class="day-contents">3</div>
                      </td>
                      <td class="day past calendar-day-2013-12-04">
                        <div class="day-contents">4</div>
                      </td>
                      <td class="day past calendar-day-2013-12-05">
                        <div class="day-contents">5</div>
                      </td>
                      <td class="day past calendar-day-2013-12-06">
                        <div class="day-contents">6</div>
                      </td>
                      <td class="day past calendar-day-2013-12-07">
                        <div class="day-contents">7</div>
                      </td>
                    </tr>
                    <tr>
                      <td class="day past calendar-day-2013-12-08">
                        <div class="day-contents">8</div>
                      </td>
                      <td class="day past calendar-day-2013-12-09">
                        <div class="day-contents">9</div>
                      </td>
                      <td class="day past event calendar-day-2013-12-10">
                        <div class="day-contents">10</div>
                      </td>
                      <td class="day past event calendar-day-2013-12-11">
                        <div class="day-contents">11</div>
                      </td>
                      <td class="day past event calendar-day-2013-12-12">
                        <div class="day-contents">12</div>
                      </td>
                      <td class="day past event calendar-day-2013-12-13">
                        <div class="day-contents">13</div>
                      </td>
                      <td class="day past event calendar-day-2013-12-14">
                        <div class="day-contents">14</div>
                      </td>
                    </tr>
                    <tr>
                      <td class="day past calendar-day-2013-12-15">
                        <div class="day-contents">15</div>
                      </td>
                      <td class="day past calendar-day-2013-12-16">
                        <div class="day-contents">16</div>
                      </td>
                      <td class="day past calendar-day-2013-12-17">
                        <div class="day-contents">17</div>
                      </td>
                      <td class="day past calendar-day-2013-12-18">
                        <div class="day-contents">18</div>
                      </td>
                      <td class="day past calendar-day-2013-12-19">
                        <div class="day-contents">19</div>
                      </td>
                      <td class="day past calendar-day-2013-12-20">
                        <div class="day-contents">20</div>
                      </td>
                      <td class="day past event calendar-day-2013-12-21">
                        <div class="day-contents">21</div>
                      </td>
                    </tr>
                    <tr>
                      <td class="day past event calendar-day-2013-12-22">
                        <div class="day-contents">22</div>
                      </td>
                      <td class="day past event calendar-day-2013-12-23">
                        <div class="day-contents">23</div>
                      </td>
                      <td class="day today calendar-day-2013-12-24">
                        <div class="day-contents">24</div>
                      </td>
                      <td class="day calendar-day-2013-12-25">
                        <div class="day-contents">25</div>
                      </td>
                      <td class="day calendar-day-2013-12-26">
                        <div class="day-contents">26</div>
                      </td>
                      <td class="day calendar-day-2013-12-27">
                        <div class="day-contents">27</div>
                      </td>
                      <td class="day calendar-day-2013-12-28">
                        <div class="day-contents">28</div>
                      </td>
                    </tr>
                    <tr>
                      <td class="day calendar-day-2013-12-29">
                        <div class="day-contents">29</div>
                      </td>
                      <td class="day calendar-day-2013-12-30">
                        <div class="day-contents">30</div>
                      </td>
                      <td class="day calendar-day-2013-12-31">
                        <div class="day-contents">31</div>
                      </td>
                      <td class="day adjacent-month next-month calendar-day-2014-01-01">
                        <div class="day-contents">1</div>
                      </td>
                      <td class="day adjacent-month next-month calendar-day-2014-01-02">
                        <div class="day-contents">2</div>
                      </td>
                      <td class="day adjacent-month next-month calendar-day-2014-01-03">
                        <div class="day-contents">3</div>
                      </td>
                      <td class="day adjacent-month next-month calendar-day-2014-01-04">
                        <div class="day-contents">4</div>
                      </td>
                    </tr>
                  </tbody>
                </table>
              </div>
            </div>
          </div>
          <!---//End-calender---->
          <!---start-contact-form--->
          <div class="contact-form">
              <div class="text-box textarea-box"> 
              <textarea id="comment" rows="2" cols="70" onfocus="if(this.value == 'Your Message') this.value='';" onblur="if(this.value == '') this.value='Your Message';">Your Message</textarea> <span>*</span> </div>
              <button id="sendcomment" value="Send Message" onclick="sendComment();">Send Message</button>
          </div>
          <!---End-contact-form--->
        </div>
        <!---start-related-tags-social-icons---->
        <div class="r-tags-social-icons">
          <div class="clear"> </div>
        </div>
        <div class="clear"> </div>
        <!---//End-related-tags-social-icons---->
        <!---start-big-apgenate---->
        <div class="big-pagenate">
          
          <div class="clear"> </div>
        </div>
        <div class="clear"> </div>
        <!---End-big-apgenate---->
        <!---start-copy-right---->
        <div class="copy-right">
          <p>Template By
            <a href="http://w3layouts.com/">W3layouts</a>
          </p>
        </div>
        <!---END-copy-right---->
      </div>
      <!---//End-wrap---->
    </div>
  </div>
</body>

<script src="./js/jquery.min.js"></script>
<script src="./js/bootstrap.min.js"></script>
<script src="./js/jquery.js"></script>
<script>
   
    function AlertMessage()
    {
      alert('test');
    }
    function sendComment(){
    	  var file=document.getElementById("filename").innerText;
    	  alert(file);
    	  var comment=document.getElementById("comment").value;
    	  alert(comment);
        var data={filename:file,
        		      commentcontext:comment};
          $.ajax({
            url:"AjaxAction!sendComment",
            type: "POST",
            data: data,
            dataType:"json"
          })
          .done(function(data){
           alert("send comment success");
          })
          .fail( function(){
            alert("send comment error");
          })
    }
  </script>
</html>
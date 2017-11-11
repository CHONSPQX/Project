<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="UTF-8">
    <meta name="description" content="表严肃 - 不要水，讲干货，一个极品课程站，主要体现在老师很极品，学生很极品，课程很极品。">
    <meta name="keywords" content="表严肃,表站,教程,前端,开发,HTML5,CSS3,JavaScript,jQuery,PHP,Laravel">
    <meta id="pagedata" data-pagedata="">
    <meta name="viewport" content="width=device-width, user-scalable=yes, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta name="site" content="http://biaoyansu.com">
    <title>不要水，讲干货 • 表严肃</title>
    <script>window.DEBUG = false</script>
    <link rel="stylesheet" href="dist/bundle.min.css">
    <link rel="icon" type="image/png" href="http://biaoyansu.com/img/biaoyansu_logo_small.png"/>
    <link rel="stylesheet" href="css/big_command.css">
    <link rel="stylesheet" href="css/home.css">
</head>
<body id="body" ng-controller="CPage" class="clearfix">
<div id="body-container">
    <div ng-if="_base.d.msg.length">
    <div ng-repeat="msg_item in _base.d.msg track by $index" msg-item="msg_item"></div>
</div>
  <div class="na">
  <div class="container clearfix">
  <div class="pull-left">
          </div>
    <div class="pull-right">
      <a class="na-item"
         ng-if="_base.d.update.list.length"
         ng-click="_base.ui.show_update=!_base.ui.show_update;_base.confirm_update_read()"
         href="">更新
        <span ng-if="_base.d.update.unread_list.length"
              class="badge">[: _base.d.update.unread_list.length :]</span>
      </a>
      
      <span ng-if="_base.device != 'phone'">
                <a class="na-item" href="/#roadmap">学习路径</a>
                <a class="na-item" href="/event">表唠嗑</a>
            </span>
              <span uib-dropdown keyboard-nav="true" dropdown-append-to-body="true" class="dropdown ">
                        <button uib-dropdown-toggle ng-click="_base.ui.na.show_sub.me=true"
                                class="btn btn-default dropdown-toggle"
                                type="button"
                        >
                            工蚁
                          <span class="caret"></span>
                        </button>
                        <ul style="margin-top: 12px;" uib-dropdown-menu dropdown-append-to-body="true"
                            class="dropdown-menu nav-dropdown-menu dropdown-menu-right">
                            <li ng-if="_base.device == 'phone'"><a href="/event">表唠嗑</a></li>
                            <li ng-if="_base.device == 'phone'"><a href="/#roadmap">学习路径</a></li>
                            <li ng-if="_base.device == 'phone'" role="separator" class="divider"></li>
                                                                              <li><a href="/dash/me">设置</a></li>
                            <li><a href="/dash/ppost">我的课程</a></li>
                            <li><a href="/dash/pycoin">我的PY币</a></li>
                                                    <li role="separator" class="divider"></li>
                            <li><a href="/download">下载</a></li>
                            <li><a class="danger" href="/logout">登出</a></li>
                        </ul>
                    </span>
        
          </div>
  </div>
  <div ng-if="_base.ui.show_update" class="update">
    <div class="container clearfix">
      <div class="fr toolbar">
        <span ng-click="_base.ui.show_update=false" class="anchor">关闭</span>
      </div>
      <div class="fl">
        <div ng-if="_base.d.update.list.length">
          <div class="head">[: _base.d.update.list.length :]条更新</div>
          <a ng-repeat="item in _base.d.update.list | orderBy:'-noticeably_updated_at'" ng-href="/[: item.mmid :]" class="item clearfix">
            <div>
              <div class="thumb">
                <img ng-src="[: item.cover_url :]?x-oss-process=image/resize,h_150">
              </div>
              <div class="text">
                                        <span class="title">[: item.title :]<span
                                                  mid="item.mmid"></span></span>
                <div class="detail">
                  更新于 <span am-time-ago="item.noticeably_updated_at"></span>
                  <div ng-if="item.desc">
                    [: item.desc :]
                  </div>
                </div>
              </div>
            </div>
          </a>
        </div>
      </div>
    </div>
  </div>
</div>
        <div class="header">
        <div id="home" command-bar></div>
        <div class="course-list clearfix">
            <div class="block-title">课程列表</div>
                            <div title="PHP精讲 - 表严肃讲PHP"
                     class="col-xs-12 col-sm-6 item">
                    <a tooltip-placement="top"
                       tooltip-popup-delay="200"
                       uib-tooltip="PHP精讲 - 表严肃讲PHP 表/24.x"
                       ng-class="{new: moment('2017-11-09 09:54:22').diff(moment(), 'days') >= -10}"
                       ng-href="/24.x"><span>PHP精讲 - 表严肃...</span> <span
                                mid="'24.x'"></span></a>
                </div>
                            <div title="玩转Javascript DOM接口"
                     class="col-xs-12 col-sm-6 item">
                    <a tooltip-placement="top"
                       tooltip-popup-delay="200"
                       uib-tooltip="玩转Javascript DOM接口 表/23.x"
                       ng-class="{new: moment('2017-10-10 15:48:48').diff(moment(), 'days') >= -10}"
                       ng-href="/23.x"><span>玩转Javascript D...</span> <span
                                mid="'23.x'"></span></a>
                </div>
                            <div title="做个Vue.js清单应用 - 表严肃讲Vue.js实战"
                     class="col-xs-12 col-sm-6 item">
                    <a tooltip-placement="top"
                       tooltip-popup-delay="200"
                       uib-tooltip="做个Vue.js清单应用 - 表严肃讲Vue.js实战 表/22.x"
                       ng-class="{new: moment('2017-09-12 23:40:24').diff(moment(), 'days') >= -10}"
                       ng-href="/22.x"><span>做个Vue.js清单应...</span> <span
                                mid="'22.x'"></span></a>
                </div>
                            <div title="Webpack精讲 - 表严肃讲Webpack"
                     class="col-xs-12 col-sm-6 item">
                    <a tooltip-placement="top"
                       tooltip-popup-delay="200"
                       uib-tooltip="Webpack精讲 - 表严肃讲Webpack 表/21.x"
                       ng-class="{new: moment('2017-09-05 21:40:46').diff(moment(), 'days') >= -10}"
                       ng-href="/21.x"><span>Webpack精讲 - 表...</span> <span
                                mid="'21.x'"></span></a>
                </div>
                            <div title="npm火速上手 - 表严肃讲npm"
                     class="col-xs-12 col-sm-6 item">
                    <a tooltip-placement="top"
                       tooltip-popup-delay="200"
                       uib-tooltip="npm火速上手 - 表严肃讲npm 表/20.x"
                       ng-class="{new: moment('2017-08-26 03:57:35').diff(moment(), 'days') >= -10}"
                       ng-href="/20.x"><span>npm火速上手 - 表...</span> <span
                                mid="'20.x'"></span></a>
                </div>
                            <div title="Vue.js生态之vue-router"
                     class="col-xs-12 col-sm-6 item">
                    <a tooltip-placement="top"
                       tooltip-popup-delay="200"
                       uib-tooltip="Vue.js生态之vue-router 表/19.x"
                       ng-class="{new: moment('2017-08-19 05:00:07').diff(moment(), 'days') >= -10}"
                       ng-href="/19.x"><span>Vue.js生态之vue-...</span> <span
                                mid="'19.x'"></span></a>
                </div>
                            <div title="Vue.js精讲 - 表严肃讲Vue.js"
                     class="col-xs-12 col-sm-6 item">
                    <a tooltip-placement="top"
                       tooltip-popup-delay="200"
                       uib-tooltip="Vue.js精讲 - 表严肃讲Vue.js 表/18.x"
                       ng-class="{new: moment('2017-08-05 17:11:57').diff(moment(), 'days') >= -10}"
                       ng-href="/18.x"><span>Vue.js精讲 - 表...</span> <span
                                mid="'18.x'"></span></a>
                </div>
                            <div title="jQuery三步搞定表单验证 - 表严肃jQuery实战"
                     class="col-xs-12 col-sm-6 item">
                    <a tooltip-placement="top"
                       tooltip-popup-delay="200"
                       uib-tooltip="jQuery三步搞定表单验证 - 表严肃jQuery实战 表/17.x"
                       ng-class="{new: moment('2017-07-22 18:25:38').diff(moment(), 'days') >= -10}"
                       ng-href="/17.x"><span>jQuery三步搞定表...</span> <span
                                mid="'17.x'"></span></a>
                </div>
                            <div title="玩转JQuery - 表严肃讲JQuery"
                     class="col-xs-12 col-sm-6 item">
                    <a tooltip-placement="top"
                       tooltip-popup-delay="200"
                       uib-tooltip="玩转JQuery - 表严肃讲JQuery 表/16.x"
                       ng-class="{new: moment('2017-05-31 18:48:11').diff(moment(), 'days') >= -10}"
                       ng-href="/16.x"><span>玩转JQuery - 表...</span> <span
                                mid="'16.x'"></span></a>
                </div>
                            <div title="Bootstrap新闻站开发 - Bootstrap实战"
                     class="col-xs-12 col-sm-6 item">
                    <a tooltip-placement="top"
                       tooltip-popup-delay="200"
                       uib-tooltip="Bootstrap新闻站开发 - Bootstrap实战 表/15.x"
                       ng-class="{new: moment('2017-05-27 10:55:22').diff(moment(), 'days') >= -10}"
                       ng-href="/15.x"><span>Bootstrap新闻站...</span> <span
                                mid="'15.x'"></span></a>
                </div>
                            <div title="玩转Bootstrap - 表严肃讲Bootstrap"
                     class="col-xs-12 col-sm-6 item">
                    <a tooltip-placement="top"
                       tooltip-popup-delay="200"
                       uib-tooltip="玩转Bootstrap - 表严肃讲Bootstrap 表/14.x"
                       ng-class="{new: moment('2017-05-27 10:42:42').diff(moment(), 'days') >= -10}"
                       ng-href="/14.x"><span>玩转Bootstrap -...</span> <span
                                mid="'14.x'"></span></a>
                </div>
                            <div title="响应式布局到底怎么玩？- 表严肃讲响应式布局"
                     class="col-xs-12 col-sm-6 item">
                    <a tooltip-placement="top"
                       tooltip-popup-delay="200"
                       uib-tooltip="响应式布局到底怎么玩？- 表严肃讲响应式布局 表/13.x"
                       ng-class="{new: moment('2017-05-27 10:34:23').diff(moment(), 'days') >= -10}"
                       ng-href="/13.x"><span>响应式布局到底怎...</span> <span
                                mid="'13.x'"></span></a>
                </div>
                            <div title="JavaScript精讲 - 表严肃讲JavaScript"
                     class="col-xs-12 col-sm-6 item">
                    <a tooltip-placement="top"
                       tooltip-popup-delay="200"
                       uib-tooltip="JavaScript精讲 - 表严肃讲JavaScript 表/12.x"
                       ng-class="{new: moment('2017-05-27 10:11:32').diff(moment(), 'days') >= -10}"
                       ng-href="/12.x"><span>JavaScript精讲 -...</span> <span
                                mid="'12.x'"></span></a>
                </div>
                            <div title="电商站首页布局 - 表严肃HTML&amp;CSS实战"
                     class="col-xs-12 col-sm-6 item">
                    <a tooltip-placement="top"
                       tooltip-popup-delay="200"
                       uib-tooltip="电商站首页布局 - 表严肃HTML&amp;CSS实战 表/11.x"
                       ng-class="{new: moment('2017-05-27 10:06:42').diff(moment(), 'days') >= -10}"
                       ng-href="/11.x"><span>电商站首页布局 -...</span> <span
                                mid="'11.x'"></span></a>
                </div>
                            <div title="极简博客开发 - 表严肃HTML&amp;CSS实战"
                     class="col-xs-12 col-sm-6 item">
                    <a tooltip-placement="top"
                       tooltip-popup-delay="200"
                       uib-tooltip="极简博客开发 - 表严肃HTML&amp;CSS实战 表/10.x"
                       ng-class="{new: moment('2017-05-27 09:44:17').diff(moment(), 'days') >= -10}"
                       ng-href="/10.x"><span>极简博客开发 -...</span> <span
                                mid="'10.x'"></span></a>
                </div>
                            <div title="CSS火速入门 - 表严肃讲CSS"
                     class="col-xs-12 col-sm-6 item">
                    <a tooltip-placement="top"
                       tooltip-popup-delay="200"
                       uib-tooltip="CSS火速入门 - 表严肃讲CSS 表/9.x"
                       ng-class="{new: moment('2017-05-27 09:21:03').diff(moment(), 'days') >= -10}"
                       ng-href="/9.x"><span>CSS火速入门 - 表...</span> <span
                                mid="'9.x'"></span></a>
                </div>
                            <div title="TypeScript精讲 - 表严肃讲TypeScript"
                     class="col-xs-12 col-sm-6 item">
                    <a tooltip-placement="top"
                       tooltip-popup-delay="200"
                       uib-tooltip="TypeScript精讲 - 表严肃讲TypeScript 表/8.x"
                       ng-class="{new: moment('2017-05-25 20:45:15').diff(moment(), 'days') >= -10}"
                       ng-href="/8.x"><span>TypeScript精讲 -...</span> <span
                                mid="'8.x'"></span></a>
                </div>
                            <div title="ES6精讲 - 表严肃讲ES6"
                     class="col-xs-12 col-sm-6 item">
                    <a tooltip-placement="top"
                       tooltip-popup-delay="200"
                       uib-tooltip="ES6精讲 - 表严肃讲ES6 表/7.x"
                       ng-class="{new: moment('2017-05-25 19:59:02').diff(moment(), 'days') >= -10}"
                       ng-href="/7.x"><span>ES6精讲 - 表严肃...</span> <span
                                mid="'7.x'"></span></a>
                </div>
                            <div title="HTML精讲 - 表严肃讲HTML"
                     class="col-xs-12 col-sm-6 item">
                    <a tooltip-placement="top"
                       tooltip-popup-delay="200"
                       uib-tooltip="HTML精讲 - 表严肃讲HTML 表/6.x"
                       ng-class="{new: moment('2017-05-25 06:58:03').diff(moment(), 'days') >= -10}"
                       ng-href="/6.x"><span>HTML精讲 - 表严...</span> <span
                                mid="'6.x'"></span></a>
                </div>
                    </div>
        <div id="roadmap" class="learning-path">
            <div class="tac block-title">学习路径</div>
                            <div class="step">
                    <a href="http://biaoyansu.com/6.x" class="title">HTML精讲 <span
                                mid="'6.x'"></span></a>
                    <div class="desc">
                        <p>网页的骨架。</p>
<p>没有它就没有网页。</p>
                    </div>
                </div>
                <span class="icon-down-open-big step-icon"></span>
                            <div class="step">
                    <a href="http://biaoyansu.com/9.x" class="title">CSS火速入门 <span
                                mid="'9.x'"></span></a>
                    <div class="desc">
                        <p>网页的皮肤。</p>
<p>没有它就没有颜值。</p>
                    </div>
                </div>
                <span class="icon-down-open-big step-icon"></span>
                            <div class="step">
                    <a href="http://biaoyansu.com/10.x" class="title">极简博客开发 <span
                                mid="'10.x'"></span></a>
                    <div class="desc">
                        <p>巩固学习成果。</p>
<p>三下五除二做个博客再说。</p>
                    </div>
                </div>
                <span class="icon-down-open-big step-icon"></span>
                            <div class="step">
                    <a href="http://biaoyansu.com/11.x" class="title">电商首页布局 <span
                                mid="'11.x'"></span></a>
                    <div class="desc">
                        <p>提升难度。</p>
<p>复杂的页面才能练出布局能力。</p>
                    </div>
                </div>
                <span class="icon-down-open-big step-icon"></span>
                            <div class="step">
                    <a href="http://biaoyansu.com/13.x" class="title">响应式布局到底怎么玩？ <span
                                mid="'13.x'"></span></a>
                    <div class="desc">
                        <p>只想写一次代码，跑在一万种设备上。</p>
<p>不就是宽度么。</p>
                    </div>
                </div>
                <span class="icon-down-open-big step-icon"></span>
                            <div class="step">
                    <a href="http://biaoyansu.com/14.x" class="title">玩转Bootstrap <span
                                mid="'14.x'"></span></a>
                    <div class="desc">
                        <p>我还没使劲，你就美了。</p>
<p>懒癌笑了。</p>
                    </div>
                </div>
                <span class="icon-down-open-big step-icon"></span>
                            <div class="step">
                    <a href="http://biaoyansu.com/15.x" class="title">Bootstrap新闻站开发 <span
                                mid="'15.x'"></span></a>
                    <div class="desc">
                        <p>巩固学习成果。</p>
<p>既然有杀器，那就直接练难的。</p>
                    </div>
                </div>
                <span class="icon-down-open-big step-icon"></span>
                            <div class="step">
                    <a href="http://biaoyansu.com/12.x" class="title">JavaScript精讲 <span
                                mid="'12.x'"></span></a>
                    <div class="desc">
                        <p>网页的神经。</p>
<p>没有它的网页活儿太差。</p>
                    </div>
                </div>
                <span class="icon-down-open-big step-icon"></span>
                            <div class="step">
                    <a href="http://biaoyansu.com/23.x" class="title">玩转Javascript DOM接口 <span
                                mid="'23.x'"></span></a>
                    <div class="desc">
                        <p>神经有了，还是连不到皮肤，碰不到骨骼？</p>
<p>你需要DOM接口</p>
                    </div>
                </div>
                <span class="icon-down-open-big step-icon"></span>
                            <div class="step">
                    <a href="http://biaoyansu.com/16.x" class="title">玩转JQuery <span
                                mid="'16.x'"></span></a>
                    <div class="desc">
                        <p>JS还能这么写？</p>
<p>也就它敢称为一个时代。</p>
                    </div>
                </div>
                <span class="icon-down-open-big step-icon"></span>
                            <div class="step">
                    <a href="http://biaoyansu.com/17.x" class="title">JQuery三部搞定表单验证 <span
                                mid="'17.x'"></span></a>
                    <div class="desc">
                        <p>用户在表单里胡求乱填怎么办？</p>
<p>永远不要相信他们。</p>
                    </div>
                </div>
                <span class="icon-down-open-big step-icon"></span>
                            <div class="step">
                    <a href="http://biaoyansu.com/18.x" class="title">Vue.js精讲 <span
                                mid="'18.x'"></span></a>
                    <div class="desc">
                        <p>写个JS从未如此轻松。</p>
<p>从此DOM是路人。</p>
                    </div>
                </div>
                <span class="icon-down-open-big step-icon"></span>
                            <div class="step">
                    <a href="http://biaoyansu.com/22.x" class="title">做个Vue.js清单应用 <span
                                mid="'22.x'"></span></a>
                    <div class="desc">
                        <p>巩固学习成果。</p>
<p>流畅实战，轻松实现。</p>
                    </div>
                </div>
                <span class="icon-down-open-big step-icon"></span>
                            <div class="step">
                    <a href="http://biaoyansu.com/19.x" class="title">前端有路由：vue-router <span
                                mid="'19.x'"></span></a>
                    <div class="desc">
                        <p>弹出层还能有独立链接？</p>
<p>单页应用大法好。</p>
                    </div>
                </div>
                <span class="icon-down-open-big step-icon"></span>
                            <div class="step">
                    <a href="http://biaoyansu.com/20.x" class="title">npm火速上手 <span
                                mid="'20.x'"></span></a>
                    <div class="desc">
                        <p>一个优秀的前端怎么会复制粘贴？</p>
<p>他用npm。</p>
                    </div>
                </div>
                <span class="icon-down-open-big step-icon"></span>
                            <div class="step">
                    <a href="http://biaoyansu.com/21.x" class="title">Webpack精讲 <span
                                mid="'21.x'"></span></a>
                    <div class="desc">
                        <p>一个项目有八十个模块依赖怎么管理？</p>
<p>你需要Webpack。</p>
                    </div>
                </div>
                <span class="icon-down-open-big step-icon"></span>
                        <div class="step">
                <div class="desc">
                    <div>不要水，讲干货。</div>
                    <div style="margin-top: 10px;">录课中...</div>
                </div>
            </div>
        </div>
    </div>
    <div class="footer">
        <a target="_blank" class="no-arrow" href="http://wpa.qq.com/msgrd?v=3&uin=3083609132&site=qq&menu=yes">联系客服</a>
 •
        <a class="no-arrow"
   target="_blank"
   href="//shang.qq.com/wpa/qunwpa?idkey=37c7c8e82fcf7503b88b67571d178ad21206e0c17cc6989c0ea23ef89ebbaad0">点击加群 <samp>663531737</samp></a>
 <br>
        陕ICP备1600228号-4 © 2017-2017
        •
        biaoyansu.com
        •
        version: 0.1.3
    </div>
    <div id="feedback">
    <div ng-if="_feedback.ui.show_feedback_form" id="feedback-form" class=" panel panel-default">
        <div class="panel-heading">
            反馈
            <div class="tool-list">
                <span ng-click="_feedback.ui.show_feedback_form=false" class="anchor">取消</span>
            </div>
        </div>
        <div class="panel-body">
            <form ng-submit="_feedback.cu(_base.on_feedback_success)" name="feedback_form">
                <div class="form-group">
                    <textarea name="content"
                              class="form-control"
                              ng-model="_feedback.cu_row.content"
                              rows="10"
                              autofocus
                              ng-maxlength="20000"
                              required
                    ></textarea>
                <div ng-if="feedback_form.content.$invalid" class="input-error">
                    <ul>
                        <li ng-if="feedback_form.content.$error.required">此项为必填项</li>
                        <li ng-if="feedback_form.content.$error.maxlength">你的反馈竟然超过了2万字，这样的话可以考虑分多条反馈</li>
                    </ul>
                </div>
                </div>
                <button ng-disabled="feedback_form.content.$invalid || _feedback.cu_pending"
                        class="btn btn-primary btn-block" type="submit">提交
                </button>
            </form>
        </div>
    </div>
</div>
    <div id="fixed_tool" >
    <div ng-click="_base.back_to_top()" ng-if="_base.ui.show_back_to_top"
         class="fixed_tool_item icon-up">
    </div>
    <div ng-if="!_feedback.ui.show_feedback_form"
         ng-click="_feedback.ui.show_feedback_form=!_feedback.ui.show_feedback_form"
         class="fixed_tool_item">反馈
    </div>
</div>
</div>
<div id="audio-playhead"></div>
<script type="text/ng-template" id="la-comment-form.tpl">
<form ng-submit="_comment.cu()" class="comment-form" name="comment">
    <div class="form-group">
        <div ng-if="!_comment.d.cu_row.reply_to" class="form-group">
            <div class="select-pills">
                <div ng-class="{active:_comment.d.cu_row.t== k}" ng-repeat="(k, v) in _comment.t"
                     class="select-pills-item"
                     ng-click="_comment.d.cu_row.t=k">
                    [: v.h_name :]
                </div>
            </div>
        </div>
        <p ng-if="_comment.d.cu_row.reply_to">回复：
            @[: _comment.d.list[_comment.d.cu_row.reply_to].r_user.nickname :]<a
                    class="gray-c"
                    ng-href="#c[: _comment.d.cu_row.reply_to :]"> 表/c[:
                _comment.d.cu_row.reply_to :]</a></p>
        <textarea placeholder="写下你想说的..."
                  type="text"
                  la-shortcut-submit="_comment.c_comment()"
                  la-auto-resize
                  ng-keyup="submit_shortcut($event)"
                  id="comment-input"
                  name="content"
                  ng-click="_comment.ui.show_comment_tool=true;$event.stopPropagation()"
                  ng-model="_comment.d.cu_row.content"
                  class="form-control"
                  rows="1"></textarea>
        <div ng-if="_comment.ui.show_comment_tool" class="emoji-tool">
            <span ng-if="!_comment.ui.show_full_comment_emoji"
                  ng-click="_comment.ui.show_full_comment_emoji=true;$event.stopPropagation();"
                  class="emoji"
            >表情 · - ·</span>
            <div ng-click="$event.stopPropagation();" class="emoji-list" ng-if="_comment.ui.show_full_comment_emoji">
                <div><span ng-click="_comment.ui.show_full_comment_emoji=false" class="close">&times;</span></div>
                <span class="emoji"
                      ng-click="append_emoji(e)"
                      ng-repeat="e in _comment.d.emoji.character track by $index">[: e :]</span>
            </div>
        </div>
    </div>
    <div ng-if="_comment.ui.show_comment_tool" class="form-group">
        <button ng-disabled="!_comment.d.cu_row.content" class="btn btn-primary" type="submit"
                title="快捷键：Ctrl+Enter">评论 <kbd>ctrl</kbd>+<kbd>↵</kbd>
        </button>
        <div ng-click="_comment.on_cancel()" class="btn anchor">取消</div>
    </div>
</form></script>
<script type="text/ng-template" id="la-comment-list.tpl">
<div class="comment-list">
    <div style="font-size: 16px;" class="title"><samp>[: _comment.d.count || 0 :]</samp> 条评论</div>
    <div id="c[: v.id :]"
         
         
         ng-repeat="v in _comment.d.list | toArray | orderBy:'-id' track by $index"
         class="comment-item">
        <div class="user clearfix">
            <div class="fl nickname">
                <span>[: (v.r_user.nickname || '@'+v.r_user.uname) || '已注销' :]</span>
                <span ng-if="v.reply_to">回复
                    <span>[: v.r_reply_to.r_user.nickname:]
                        <a class="gray-c small"
                           target="_blank"
                           ng-mouseenter="v.show_reply = true"
                           ng-mouseleave="v.show_reply = false"
                           ng-href="/c[: v.r_reply_to.id :]">表/c[: v.r_reply_to.id :]</a>
                    </span>
                </span>
            </div>
            <div class="fr">
                <a class="gray-c mid-comment-link"
                   target="_blank"
                   ng-href="/c[: v.id :]">表/c[: v.id :]</a>
                <span am-time-ago="v.created_at"></span>
            </div>
        </div>
        <div ng-class="{cup: v._TMP_too_long && !v._TMP_show_full}" ng-click="v._TMP_show_full=true"
             ng-init="v._TMP_too_long=v.content.length > 140">
            <div ng-show="v.r_reply_to.content && v.show_reply" class="help-block">
                <div>
                    [: v.r_reply_to.content|cut:140:]
                </div>
                <span class="kv-comment" am-time-ago="v.r_reply_to.created_at"></span>
            </div>
            <div ng-if="!v._TMP_too_long || v._TMP_show_full" style="white-space: pre-line;" class="content">[: v.content :]</div>
            <div>
                <div ng-if="v._TMP_too_long && !v._TMP_show_full" style="white-space: pre-line;" class="content">
                    [: v.content|cut:140 :]
                </div>
                
                
                
                
                
                
                
                
            </div>
        </div>
                    <div class="tool-list">
                <span ng-if="v._TMP_too_long" class="anchor-icon" ng-click="v._TMP_show_full=!v._TMP_show_full">
                        <span ng-if="!v._TMP_show_full">展开全部</span>
                        <span ng-if="v._TMP_show_full">收起</span>
                </span>
                <span class="tool-toggle" >
                    <i ng-click="_comment.vote('upvote', v)"
                       
                       tooltip-placement="top"
                       tooltip-popup-delay=300"
                       uib-tooltip="[: _comment.generate_voters_info(v) :]"
                       title="赞"
                       ng-class="{'icon-thumbs-up-alt': v.upvoted_by_him,
                       'icon-thumbs-up': !v.upvoted_by_him}"
                       class="anchor-icon">
                        [: v.data.upvote_count || '' :]
                    </i>
                    <i ng-click="_comment.vote('downvote', v)"
                       ng-class="{'icon-thumbs-down-alt':v.downvoted_by_him,
                       'icon-thumbs-down': !v.downvoted_by_him}"
                       class="anchor-icon"
                       title="踩"></i>
                    <i ng-click="_comment.on_trigger_reply(v)" class="anchor-icon icon-reply-all">回复</i>
                </span>
                <i style="opacity: 0;" class="tmp">.</i>
            </div>
                <div 
             ng-if="v.id === _comment.d.cu_row.reply_to"
             la-comment-form
             la-comment-form-iid="iid"
             la-comment-form-iname="iname"></div>
    </div>
</div>
</script>
<script type="text/ng-template" id="command-bar.tpl">
    <div ng-controller="CCommand" class="command-bar">
        <div class="clearfix main">
            <div class="text-side pull-left">
                <a href="/" ng-if="_command.ui.shrink || _base.device=='phone'" class="logo"></a><a href="/" class="bold domain" ng-if="!_command.ui.shrink && _base.device!='phone'">biaoyansu.com</a><span
                        class="slash">/<span
                            
                            ng-if="(!_command.pending && _command.row.keyword && _command.recom.t=='search') && _base.device!='phone'"

                    >search/</span></span>
            </div><span class="input-side pull-left">
                <input id="command-input"
                       class="command-input"
                       type="text"
                       
                       ng-model="_command.row.keyword"
                       ng-click="_command.on_click($event)"
                       ng-keyup="_command.on_keyup($event)"
                       ng-blur="_command.on_blur()"
                       ng-model-options="{debounce: 100}"
                       autofocus>
                <span ng-if="!_command.row.keyword" class="placeholder">关键词 课程ID...</span>
            </span>
        </div>
        <div ng-mouseleave="_command.hover_result_list=false"
             ng-mouseenter="_command.hover_result_list=true"
             ng-if="_command.row.keyword && _command.ui.show_recom && _command.focusing" class="result-list">
            <a ng-if="(_command.recom.t != 'search' && _command.recom.t != 'comment') && _command.recom.row"
               ng-href="/[: _command.recom.better_mmid :]"
               class="result-item clearfix">
                <div class="col-xs-12">
                    <span class="text-muted">课</span>
                    <strong mid="_command.recom.better_mmid"></strong>
                    <kbd class="pull-right">↵</kbd>
                    <span class="result-title">[: _command.recom.row.title :]</span>
                </div>
            </a>
            <div ng-if=" _command.recom.t == 'comment' && _command.recom.row"
                 ng-href="/[: _command.recom.better_mmid :]"
                 class="result-item comment-result clearfix">
                <div class="col-xs-12">
                    <div class="text-muted">评论
                        <div class="pull-right small">
                            表/[: _command.recom.better_mmid :]
                        </div>
                    </div>
                    <div class="comment-content">
                        [:_command.recom.row.content :]
                    </div>
                    <div class="text-right">
                        <div class="text-muted">—[: _command.recom.row.r_user.nickname :]</div>
                        <div class="text-muted time">于[: _command.recom.row.created_at :]</div>
                    </div>
                </div>
            </div>
            <a ng-href="/search/[: _command.recom.better_mmid :]" class="result-item clearfix">
                <div class="col-xs-12">
                    <span class="text-muted">搜索：</span><span
                            class="result-title">[: _command.row.keyword :]</span>
                    <span class="pull-right text-muted">
                        <span ng-if="!_command.recom.row"><kbd>↵</kbd>, </span>
                    <kbd>Ctrl</kbd> + <kbd>↵</kbd>
                    </span>
                </div>
            </a>
        </div>
    </div>
</script>
<div ng-if="_base.d.pop.show" ng-class="{
    warn: _base.d.pop.type == 'warn',
    info:_base.d.pop.type == 'info',
    success:_base.d.pop.type == 'success',
}" ng-click="_base.d.pop.show=false" class="pop">
    [: _base.d.pop.msg :]
</div>    <script src="dist/regular.bundle.min.js"></script>
            <script src="dist/regular.bundle.home.min.js"></script>
        <script>
  var _hmt = _hmt || [];
  (function () {
    var hm = document.createElement("script");
    hm.src = "https://hm.baidu.com/hm.js?547ee985cdf7f87df511d3eadfaf5c21";
    var s = document.getElementsByTagName("script")[0];
    s.parentNode.insertBefore(hm, s);
  })();
</script>
<script>
  (function (i, s, o, g, r, a, m) {
    i['GoogleAnalyticsObject'] = r;
    i[r] = i[r] || function () {
        (i[r].q = i[r].q || []).push(arguments)
      }, i[r].l = 1 * new Date();
    a = s.createElement(o),
      m = s.getElementsByTagName(o)[0];
    a.async = 1;
    a.src = g;
    m.parentNode.insertBefore(a, m)
  })(window, document, 'script', 'https://www.google-analytics.com/analytics.js', 'ga');

  ga('create', 'UA-100206022-1', 'auto');
  ga('send', 'pageview');

</script>

</body>
</html>
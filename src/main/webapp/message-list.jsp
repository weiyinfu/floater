<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<ul class="list-group" id="messageList">
  <li class="list-group-item hidden" id="messageItem">
    <!-- 帖子项目 -->
    <div>
      <!-- 头部 -->
      <div class="row">
        <div class="col-md-2">
          <img id="headImage" src="icons/用户头像.png" class="img-circle" width="50px" height="50px">
        </div>
        <div class="col-md-10">
          <span style="font-size: 18px;">
            <span id="userName">半似日兮半似月</span>
            <br> <small><span id="schoolMajor" style="padding-top: 22px;">东北大学计算机专业</span></small> <small><span id="createdTime"
                class="pull-right">上午9:23</span></small>
          </span>
        </div>
      </div>
      <!-- 内容 -->
      <div class="row">
        <pre id="content" style="background: white; font-size: 22px; border: none; white-space: pre-wrap;">评论内容</pre>
      </div>
      <!-- 底部 -->
      <div class="row" id="bottomButtons">
        <div class="pull-right" style="padding-right: 10px; font-size: 20px;">
          <a> <span id="reply" class="glyphicon glyphicon-envelope">回复</span>
          </a>
          <span>&nbsp;</span>
        </div>
      </div>
      <!-- 输入信息框 -->
      <div id="inputBox" class="collapse row" style="padding-top: 10px;">
        <div class="form-group">
          <textarea style="font-size: 20px;" class="form-control" rows="8" placeholder="回复内容"></textarea>
        </div>
        <button class="btn btn-primary btn-block">提交</button>
      </div>
      <!-- 输入框结束 -->
    </div>
  </li>
</ul>

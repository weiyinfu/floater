<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<ul class="list-group" id="postList">
  <li class="list-group-item hidden" id="postItem">
    <!-- 帖子项目 -->
    <div>
      <!-- 头部 -->
      <div class="row">
        <div class="col-md-2">
          <img id="headImage" src="icons/用户头像.png" class="img-circle" width="70px" height="70px">
        </div>
        <div class="col-md-10" style="font-size: 20px;">
          <span id="userName" style="font-size: 30px;">半似日兮半似月</span>
          <span id="authorInfo" class="hidden">
            <span>&nbsp;&nbsp;</span>
            <span class="glyphicon glyphicon-retweet"></span>
            <span>
              作者 <a id="authorName"></a>
            </span>
          </span>
          <br>
          <span id="schoolMajor">东北大学计算机专业</span>
          <span id="realTime" class="pull-right">上午9:23</span>
        </div>
      </div>
      <!-- 内容 -->
      <div class="row" id="postContent">
        <div id="mediaPath">
          <img width="100%" class="hidden">
          <audio controls="controls" class="hidden"></audio>
          <video class="hidden" controls="controls" width="100%"></video>
        </div>
        <div>
          <pre id="content" style="background: white; font-size: 22px; border: none; white-space: pre-wrap;">曾被金龙咬一缺
                                春江潮水连海平
                                  海上明月共潮生
          </pre>
        </div>
      </div>
      <!-- lastUser和topicInfo两个链接 -->
      <div class="row">
        <a id="lastUserInfo" class="hidden" style="font-size: 22px;">#转发的上一个用户 # </a> <br> <a id="topicInfo" class="hidden"
          style="font-size: 22px;">#话题信息# </a>
      </div>
      <!-- 底部 -->
      <div class="row" style="padding-top: 10px;">
        <div class="col-md-3 hidden" id="hi">
          <span class="glyphicon glyphicon-send" style="font-size: 30px;"> </span>
          <span style="font-size: 22px;">私信</span>
        </div>
        <div class="col-md-3 hidden" id="trash">
          <span class="glyphicon glyphicon-trash" style="font-size: 30px;"> </span>
          <span style="font-size: 22px;">删除</span>
        </div>
        <div class="col-md-3" id="comment">
          <span class="glyphicon glyphicon-comment" style="font-size: 30px;"> </span>
          <span style="font-size: 22px;">评论</span>
        </div>
        <div class="col-md-3" id="forward">
          <span class="glyphicon glyphicon-retweet" style="font-size: 30px;"></span>
          <span style="font-size: 22px;">转发</span>
        </div>
        <div class="col-md-3" id="praise">
          <span class="glyphicon glyphicon-heart" style="font-size: 30px;"></span>
          <span style="font-size: 22px;">赞</span>
        </div>
      </div>
      <!-- 底部 -->
      <!-- 输入信息框 -->
      <div id="inputBox" class="collapse row" style="padding-top: 10px;">
        <div class="form-group">
          <textarea style="font-size: 20px;" class="form-control" rows="8" placeholder="评论内容"></textarea>
        </div>
        <button class="btn btn-primary btn-block">提交</button>
      </div>
      <!-- 输入框结束 -->
    </div>
  </li>
</ul>

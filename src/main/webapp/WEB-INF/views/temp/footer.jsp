<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
   window.channelPluginSettings = {
    "plugin_id": "ef582c73-3a40-4525-bb41-a68efc7f806b"
  };
  (function() {
    var node = document.createElement('div');
    node.id = 'ch-plugin';
    document.body.appendChild(node);
    var async_load = function() {
      var s = document.createElement('script');
      s.type = 'text/javascript';
      s.async = true;
      s.src = '//cdn.channel.io/plugin/ch-plugin-web.js';
      s.charset = 'UTF-8';
      var x = document.getElementsByTagName('script')[0];
      x.parentNode.insertBefore(s, x);
    };
    if (window.attachEvent) {
      window.attachEvent('onload', async_load);
    } else {
      window.addEventListener('load', async_load, false);
    }
  })(); 
</script>
    <footer>
	<div class="footer">
		<div class="footer_wrap">
			<div class="footer_contents" style="color: white;">
				<div class="img_div"><img src="${pageContext.request.contextPath}/resources/img/logo.png"></div>
				<div class="img_div2"><img src="${pageContext.request.contextPath}/resources/img/logo2.png"></div>
				<div class="contents_div">
				<div><span><span><i class="fa fa-map-marker"></i></span> 서울특별시 강남구 테헤란로 14길 6 남도빌딩 2F, 3F, 4F</span></div>
				<div><span><span><i class="fa fa-envelope"></i></span> flu3793@gmail.com</span></div>
				<div><span><span><i class="fa fa-user"></i></span> 한형선 박준호 김보배 박미현 김재식</span></div>
				</div>
			</div>
		</div>
	</div>
</footer>
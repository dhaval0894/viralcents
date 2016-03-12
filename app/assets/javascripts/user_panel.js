// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).ready(function() {
	// clipboard copy
	var clip = new Clipboard('.my_clip_button');
	console.log(clip);

	zopim_chat();
	fbLogout();
});

// chat box
function zopim_chat(){
  $('[__jx__id], embed#__zopnetworkswf').remove();
  window.$zopim = null;
  (function(d,s){
    var z = $zopim = function(c){
      z._.push(c)
    }, $ = z.s = d.createElement(s), e = d.body.getElementsByTagName(s)[0];
    z.set = function(o){
      z.set._.push(o)
    };
    z._ = [];
    z.set._ = [];
    $.async = !0;
    $.setAttribute('charset','utf-8');
    $.src = '//v2.zopim.com/?3kxTxB6zH9i31AZ0o3sfl0yiRkWHCToF';
    z.t = +new Date;
    $.type = 'text/javascript';
    e.parentNode.insertBefore($,e)
  })(document,'script');
}

//menu-toggle
$("#menu-toggle").click(function(e) {
	e.preventDefault();
	$("#wrapper").toggleClass("toggled");
});


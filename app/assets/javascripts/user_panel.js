// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).ready(function() {
	// clipboard copy
	var clip = new Clipboard('.my_clip_button');
	console.log(clip);

	zopim_chat();

});

// chat box
function zopim_chat(){

window.$zopim||(function(d,s){var z=$zopim=function(c){z._.push(c)},$=z.s=
d.createElement(s),e=d.getElementsByTagName(s)[0];z.set=function(o){z.set.
_.push(o)};z._=[];z.set._=[];$.async=!0;$.setAttribute("charset","utf-8");
$.src="//v2.zopim.com/?3kxTxB6zH9i31AZ0o3sfl0yiRkWHCToF";z.t=+new Date;$.
type="text/javascript";e.parentNode.insertBefore($,e)})(document,"script");

}

//menu-toggle
$("#menu-toggle").click(function(e) {
	e.preventDefault();
	$("#wrapper").toggleClass("toggled");
});



function share_to_fb(story_url, s_id) {
    FB.ui(
     {
      display: 'popup',
      method: 'share',
      href: story_url,
      action_properties: JSON.stringify({
      object:'http://timesofindia.indiatimes.com/world/china/The-next-world-war-will-be-in-the-South-China-Sea-Ask-Thucydides-/articleshow/51066126.cms',
      })
    }, function(response){
      var id_obj = response;
      console.log(id_obj);
      var fb_post_id= id_obj.post_id;
      console.log(fb_post_id);
      if (fb_post_id != null){
        var res = "#fb_" + s_id; 
        $(res).addClass('disabled');
        console.log('done');
        $.ajax({
          type: "POST",
          url: "/user_stories/addStory_id",
          data:  JSON.stringify({ 'id' : s_id, 'post_id' : fb_post_id}), // the JSON data, as an object or string
          contentType: "application/json",
          dataType: "json",
        });
      }
      else{alert("failure");}
    });
  };



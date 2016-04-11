/* Function Calls */
$(document).ready(function() {

  // clipboard copy
  var clip = new Clipboard('.my_clip_button');

  // Facebook Alert Box
  $('.facebook_share').click(function() {
      bootbox.alert("Generate URL First");  
  });

  // Facebook Logout
  $('#fb_logout').click(function(){
    fbLogout();  
  });

  //menu-toggle
  $("#menu-toggle").click(function(e) {
    e.preventDefault();
    $("#wrapper").toggleClass("toggled");
  });

  // Search Panel 
  search_panel();

  // Story rate popover
  $('[data-toggle="popover"]').popover({
      html : true,

      content: function() {
        return $('#popover_content_wrapper').html();
      }
  });

  // Story title excerpt
  $(".caption").dotdotdot({
      wrap: 'letter'
  });

  // Twitter Alert Box
  $('.twitter_share').click(function() {
      bootbox.alert("Connect with Twitter First"); 
      window.location = '/settings' 
  });

  // Zopim Chat
  zopim_chat();

});

  
/* Function Definition */

// chat box
function zopim_chat(){
  window.$zopim||(function(d,s){var z=$zopim=function(c){z._.push(c)},$=z.s=
  d.createElement(s),e=d.getElementsByTagName(s)[0];z.set=function(o){z.set.
  _.push(o)};z._=[];z.set._=[];$.async=!0;$.setAttribute("charset","utf-8");
  $.src="//v2.zopim.com/?3kxTxB6zH9i31AZ0o3sfl0yiRkWHCToF";z.t=+new Date;$.
  type="text/javascript";e.parentNode.insertBefore($,e)})(document,"script");
}

// facebook logout 
function fbLogout() {
  FB.getLoginStatus(function(response) {
        console.log(response);
        if (response.authResponse) {
          console.log("signing out")
          console.log(response.authResponse)
          FB.logout();
        }
        window.location = '/signout';
    });
}

// Facebook Share
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
      var fb_post_id= id_obj.post_id;
      if (fb_post_id != null){
        var res = "#fb_" + s_id; 
        $(res).addClass('disabled');
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


// Generates Random string for Referral Url
function epicRandomString(b){
  for(var a=(Math.random()*eval("1e"+~~(50*Math.random()+50))).toString(36).split(""),c=3;c<a.length;c++)c==~~(Math.random()*c)+1&&a[c].match(/[a-z]/)&&(a[c]=a[c].toUpperCase());a=a.join("");a=a.substr(~~(Math.random()*~~(a.length/3)),~~(Math.random()*(a.length-~~(a.length/3*2)+1))+~~(a.length/3*2));if(24>b)return b?a.substr(a,b):a;a=a.substr(a,b);if(a.length==b)return a;for(;a.length<b;)a+=epicRandomString();return a.substr(0,b)
};

// Generates Referral Url
function generate_ref_url(uid, root_p)
{
  var prefix = epicRandomString(5);
  var suffix = epicRandomString(5);
  uid = prefix + uid + suffix;
  g_url = root_p + "?ref=" + uid; 
  document.getElementById('g_url').value=g_url;
  $('#but').addClass('disabled');
  //ajax call to controller action to add referral_url to database
  $.ajax({
      type: "POST",
      url: "add_referral_link",
      data:  JSON.stringify({ 'r_link' : g_url}), // the JSON data, as an object or string
      contentType: "application/json",
      dataType: "json",
  });
}

// Search and Filter for story using list.js
function search_panel(){
  var options = {
    valueNames: ['title','category','date']
  };

  var storyList = new List('stories', options);

  $('#filter-category').change(function () {
      var selection = this.value;
      if (selection) {
          storyList.filter(function(item) {
              return (item.values().category == selection);
          });
      } else {
          storyList.filter();
      }
  });
}

// Shortened Url for story
function url_generate(story_id)
{
  var story_id = story_id

  //alert(story_id);
  window.location.href = "bitly?sid=" + story_id;

};

//share referrer to facebook
function facebookShare(link, app_id)
{
  FB.ui({
  method: 'feed', 
  link: link,  
  href: link,
  }, function(response){});
}


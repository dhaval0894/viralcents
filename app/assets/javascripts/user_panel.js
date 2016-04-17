(function(){

    /*---- Function Calls ----*/
      $(document).on("ready", function() {

        // Clipboard copy instance
        new Clipboard('.my_clip_button'); 

        // Facebook/Twitter Alert Box
        $(document).on("click", ".so_share", function(){
            bootbox.alert("Generate URL First");
        });

        // Facebook Logout
        $(document).on("click", "#fb_logout", fbLogout);

        // Facebook Referrer Share
        $(document).on("click", "#fb_referrer", function(){
            facebookShare($(this).data('referrer-link'),$(this).data('facebook-app-id'));
        });

        // Facebook Share
        $(document).on("click", ".fb_share", function(){
            share_to_fb($(this).data('story-url'),$(this).data('story-id'));  
        });
        
        // Generate Url
        $(document).on("click", ".gen_link", function(){
            url_generate($(this).data('story-id'));
        });
        
        //menu-toggle
        $(document).on("click", "#menu-toggle", function(e) {
            e.preventDefault();
            $("#wrapper").toggleClass("toggled");
        });

        // Search Panel 
        search_panel();

        // Story rate popover
        $('.rate').popover({
            html : true,

            content: function() {
              return $('#popover_content_wrapper').html();
            }
        });

        // Story title excerpt
        $(".caption").dotdotdot(function(){
            wrap: 'letter'  
        });

        // tooltip for generate url
        $(document).on("click",".so_share",function(){
              var gen_button = '#gen_button' + $(this).data('story-id');
              var width = $(window).width();
              if( width > 768) {
                $(gen_button).tooltipster({animation: 'fade',delay: 1000,autoClose: true, position: "left", offsetY: 50, multiple: true});
              }
              else if( width < 768 && width >= 315){
                $(gen_button).tooltipster({animation: 'fade',delay: 200,autoClose: true, offsetY: 120, multiple: true});
              }
              else if(width < 315){
                $(gen_button).tooltipster({animation: 'fade',delay: 200,autoClose: true, offsetY: 165, multiple: true});
              }
              $(gen_button).tooltipster("show");
        });
         
        $(document).on("mouseout",".so_share",function(){
          var gen_button = '#gen_button' + $(this).data('story-id');
          try{
          $(gen_button).tooltipster("hide");
          }catch(err){}
        });

        // Twitter Alert Box
        $(document).on("click", ".twitter_share", function(){ 
            bootbox.dialog({
              title: "Connect With Twitter First",
              message: '<div class="text-center"><a class="btn btn-social-icon btn-sm btn-twitter" id="sign_in" href="/auth/twitter"><span class="fa fa-twitter"></span> Connect with Twitter</a></div>'
            });  
        });

        // Twitter Referrer Share
        $(document).on("click", "#tw_referrer", function(){
            twRefShareWindow($(this).data('referrer-link'));
        });

        // tooltip for generate url
        $(document).on("click",".so_share",function(){
              var gen_button = '#gen_button' + $(this).data('story-id');
              var width = $(window).width();
              if( width > 768) {
                $(gen_button).tooltipster({animation: 'fade',delay: 1000,autoClose: true, position: "left", offsetY: 50, multiple: true});
              }
              else if( width < 768 && width >= 315){
                $(gen_button).tooltipster({animation: 'fade',delay: 200,autoClose: true, offsetY: 120, multiple: true});
              }
              else if(width < 315){
                $(gen_button).tooltipster({animation: 'fade',delay: 200,autoClose: true, offsetY: 165, multiple: true});
              }
              $(gen_button).tooltipster("show");
        }); 
        $(document).on("mouseout",".so_share",function(){
          var gen_button = '#gen_button' + $(this).data('story-id');
          try{
          $(gen_button).tooltipster("hide");
          }catch(err){}
        });

        // Twitter Share Window
        $(document).on("click", ".tw_share", twShareWindow);
      });  



    
  /*---- Function Definition ----*/

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

    //Facebook Referrer Share
    function facebookShare(link, app_id)
    {
      FB.ui({
      method: 'feed', 
      link: link,  
      href: link,
      }, function(response){});
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
          else{bootbox.alert("failure");}
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
    }

    // Shortened Url for story
    function url_generate(story_id)
    {
      var story_id = story_id

      //alert(story_id);
      window.location.href = "bitly?sid=" + story_id;

    };

    //twitter referrer share window
    function twRefShareWindow(ref_link){
      window.open('https://twitter.com/intent/tweet?text=Sign up to an amazing app VIRALCENTS!! \r\n &amp;url='+ref_link+'','Twitter-dialog','width=626,height=436'); 
      return false;    
    }

    //twitter share window
    function twShareWindow(){
      window.open('', 'popup', 'width=580,height=360,scrollbars=no, toolbar=no,status=no,resizable=yes,menubar=no,location=no,directories=no,top=10,left=10');        
    }

})();  

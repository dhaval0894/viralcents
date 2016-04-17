(function(){
  
  /* --- Function Calls ---*/
    $(document).on("ready", function(){

        // Facebook Login
        $(document).on("click", "#fb_login", fbLogin);    
    });
    
  
  /*--- Function Definition ---*/

    // chat box
    function zopim_chat(){
      window.$zopim||(function(d,s){var z=$zopim=function(c){z._.push(c)},$=z.s=
      d.createElement(s),e=d.getElementsByTagName(s)[0];z.set=function(o){z.set.
      _.push(o)};z._=[];z.set._=[];$.async=!0;$.setAttribute("charset","utf-8");
      $.src="//v2.zopim.com/?3kxTxB6zH9i31AZ0o3sfl0yiRkWHCToF";z.t=+new Date;$.
      type="text/javascript";e.parentNode.insertBefore($,e)})(document,"script");
    }
    
    //Facebook Login
    function fbLogin() {
      FB.login(function(response) {
        console.log(response);
        if (response.authResponse) {
          console.log("creating user session");
          window.location = '/auth/facebook/callback'
        }
      });
    }

    // Load the SDK asynchronously
    (function(d, s, id) {
      var js, fjs = d.getElementsByTagName(s)[0];
      if (d.getElementById(id)) return;
      js = d.createElement(s); js.id = id;
      js.src = "//connect.facebook.net/en_US/sdk.js";
      fjs.parentNode.insertBefore(js, fjs);
    }(document, 'script', 'facebook-jssdk'));
      

      window.fbAsyncInit = function() {
      FB.init({
        appId      : '1357150584310400',
        cookie     : true,  // enable cookies to allow the server to access 
                            // the session
        xfbml      : true,  // parse social plugins on this page
        version    : 'v2.5' // use graph api version 2.5
      });

    }
    
})();


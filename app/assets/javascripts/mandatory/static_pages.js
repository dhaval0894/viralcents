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

// This function is called when someone finishes with the Login
  // Button.  See the onlogin handler attached to it in the sample
  // code below.

}

function fbLogin() {
  FB.login(function(response) {
    console.log(response);
    if (response.authResponse) {
      window.location = '/auth/facebook/callback'
    }
  });
}

// facebook logout 
function fbLogout() {
  FB.getLoginStatus(function(response) {
        console.log(response);
        if (response.authResponse) {
          FB.logout();
          window.location = '/signout'
        }
    });
}

// Test user email:lisa_zbjykeq_test@tfbnw.net pass:testviral
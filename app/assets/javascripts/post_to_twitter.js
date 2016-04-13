/* Function Calls */
$(document).ready(function() {
	// Tweet on  twitter
	$("#tweet_btn").click(function(){
    	run();
  	});
  	countChar();
  	$("#txt").keyup(function(){
    	countChar();
  	});
});

// Tweet on Twitter
function run(){
  var txt = document.getElementById('txt').value;

  window.opener.location.href = "post?p=" + txt;
  self.close();
}

function countChar(){
	var tweet_field=document.getElementById('txt').value;
	var max_char=document.getElementById('txt').maxLength;
	var current_char=tweet_field.length;
	console.log(current_char);
	var remaining_char=max_char-current_char;
	console.log(max_char);
	console.log(remaining_char);
	$("#remaining_char").text(remaining_char);
}
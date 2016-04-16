class StoriesMail

  include Sidekiq::Worker


  sidekiq_options queue: "abc"

   include Sidetiq::Schedulable

     recurrence backfill: true do
       minutely
    end

  def perform()

    
       
require 'SmtpApiHeader.rb'
require 'mail'
require 'json'

Mail.defaults do
  delivery_method :smtp, { :address   => 'smtp.sendgrid.net',
                           :port      => 587,
                           :domain    => 'sendgrid.com',
                           :user_name => 'rajiv-shrivastava',
                           :password  => 'rajiv834',
                           :authentication => 'plain',
                           :enable_starttls_auto => true }
end

hdr = SmtpApiHeader.new

@stories = hdr.all_stories_title

@names = hdr.user_names

receiver = hdr.user_mail_info

hdr.addTo(receiver)

hdr.setUniqueArgs({'test' => 1 ,'foo' =>2})


hdr.addSubVal("-name-" ,@names)

# hdr.setCategory('yourCategory')


mail = Mail.deliver do
  header['X-SMTPAPI'] =  hdr.asJSON()
  to 'willnotdeliver@domain.com' # When using SMTPAPI's 'to' parameter, this address will not get delivered to
  from 'Viralcents'
  subject 'Viralcents Wallet Information'
  text_part do
    body 'You  would put your content here, but I am going to say: Hello world!'
  end
  html_part do
    content_type 'text/html; charset=UTF-8'
    body '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">



<html style="margin: 0;padding: 0;font-family: &quot;helvetica neue&quot: ;, &quot: ;helvetica&quot: ;, helvetica, arial, sans-serif: ;"><head style="margin: 0;padding: 0;font-family: &quot;helvetica neue&quot: ;, &quot: ;helvetica&quot: ;, helvetica, arial, sans-serif: ;"><meta http-equiv="Content-Type" content="text/html; charset=UTF-8" style="margin: 0;padding: 0;font-family: &quot;helvetica neue&quot: ;, &quot: ;helvetica&quot: ;, helvetica, arial, sans-serif: ;">
 
 <style>
 /* ------------------------------------- 
    GLOBAL 
------------------------------------- */
* { 
  margin:0;
  padding:0;
}
* { font-family: "Helvetica Neue", "Helvetica", Helvetica, Arial, sans-serif; }

img { 
  max-width: 100%; 
}
.collapse {
  margin:0;
  padding:0;
}
body {
  -webkit-font-smoothing:antialiased; 
  -webkit-text-size-adjust:none; 
  width: 100%!important; 
  height: 100%;
}


/* ------------------------------------- 
    ELEMENTS 
------------------------------------- */
a { color: #2BA6CB;}

.btn {
  text-decoration:none;
  color: #FFF;
  background-color: #666;
  padding:10px 16px;
  font-weight:bold;
  margin-right:10px;
  text-align:center;
  cursor:pointer;
  display: inline-block;
}

p.callout {
  padding:15px;
  background-color:#ECF8FF;
  margin-bottom: 15px;
}
.callout a {
  font-weight:bold;
  color: #2BA6CB;
}

table.social {
/*  padding:15px; */
  background-color: #ebebeb;
  
}
.social .soc-btn {
  padding: 3px 7px;
  font-size:12px;
  margin-bottom:10px;
  text-decoration:none;
  color: #FFF;font-weight:bold;
  display:block;
  text-align:center;
}
a.fb { background-color: #3B5998!important; }
a.tw { background-color: #1daced!important; }
a.gp { background-color: #DB4A39!important; }
a.ms { background-color: #000!important; }

.sidebar .soc-btn { 
  display:block;
  width:100%;
}

/* ------------------------------------- 
    HEADER 
------------------------------------- */
table.head-wrap { width: 100%;}

.header.container table td.logo { padding: 15px; }
.header.container table td.label { padding: 15px; padding-left:0px;}


/* ------------------------------------- 
    BODY 
------------------------------------- */
table.body-wrap { width: 100%;}


/* ------------------------------------- 
    FOOTER 
------------------------------------- */
table.footer-wrap { width: 100%;  clear:both!important;
}
.footer-wrap .container td.content  p { border-top: 1px solid rgb(215,215,215); padding-top:15px;}
.footer-wrap .container td.content p {
  font-size:10px;
  font-weight: bold;
  
}


/* ------------------------------------- 
    TYPOGRAPHY 
------------------------------------- */
h1,h2,h3,h4,h5,h6 {
font-family: "HelveticaNeue-Light", "Helvetica Neue Light", "Helvetica Neue", Helvetica, Arial, "Lucida Grande", sans-serif; line-height: 1.1; margin-bottom:15px; color:#000;
}
h1 small, h2 small, h3 small, h4 small, h5 small, h6 small { font-size: 60%; color: #6f6f6f; line-height: 0; text-transform: none; }

h1 { font-weight:200; font-size: 44px;}
h2 { font-weight:200; font-size: 37px;}
h3 { font-weight:500; font-size: 27px;}
h4 { font-weight:500; font-size: 23px;}
h5 { font-weight:900; font-size: 17px;}
h6 { font-weight:900; font-size: 14px; text-transform: uppercase; color:#444;}

.collapse { margin:0!important;}

p, ul { 
  margin-bottom: 10px; 
  font-weight: normal; 
  font-size:14px; 
  line-height:1.6;
}
p.lead { font-size:17px; }
p.last { margin-bottom:0px;}

ul li {
  margin-left:5px;
  list-style-position: inside;
}

/* ------------------------------------- 
    SIDEBAR 
------------------------------------- */
ul.sidebar {
  background:#ebebeb;
  display:block;
  list-style-type: none;
}
ul.sidebar li { display: block; margin:0;}
ul.sidebar li a {
  text-decoration:none;
  color: #666;
  padding:10px 16px;
/*  font-weight:bold; */
  margin-right:10px;
/*  text-align:center; */
  cursor:pointer;
  border-bottom: 1px solid #777777;
  border-top: 1px solid #FFFFFF;
  display:block;
  margin:0;
}
ul.sidebar li a.last { border-bottom-width:0px;}
ul.sidebar li a h1,ul.sidebar li a h2,ul.sidebar li a h3,ul.sidebar li a h4,ul.sidebar li a h5,ul.sidebar li a h6,ul.sidebar li a p { margin-bottom:0!important;}



.container {
  display:block!important;
  max-width:600px!important;
  margin:0 auto!important; /* makes it centered */
  clear:both!important;
}


.content {
  padding:15px;
  max-width:600px;
  margin:0 auto;
  display:block; 
}

.content table { width: 100%; }


/* Odds and ends */
.column {
  width: 300px;
  float:left;
}
.column tr td { padding: 15px; }
.column-wrap { 
  padding:0!important; 
  margin:0 auto; 
  max-width:600px!important;
}
.column table { width:100%;}
.social .column {
  width: 280px;
  min-width: 279px;
  float:left;
}


@media only screen and (max-width: 600px) {
  
  a[class="btn"] { display:block!important; margin-bottom:10px!important; background-image:none!important; margin-right:0!important;}

  div[class="column"] { width: auto!important; float:none!important;}
  
  table.social div[class="column"] {
    width:auto!important;
  }

}
</style>

<meta name="viewport" content="width=device-width" style="margin: 0;padding: 0;font-family: &quot;helvetica neue&quot: ;, &quot: ;helvetica&quot: ;, helvetica, arial, sans-serif: ;">

<title style="margin: 0;padding: 0;font-family: &quot;helvetica neue&quot: ;, &quot: ;helvetica&quot: ;, helvetica, arial, sans-serif: ;">Virarlscents</title>

</head>
<body bgcolor="#FFFFFF" topmargin="0" leftmargin="0" marginheight="0" marginwidth="0" style="margin: 0;padding: 0;font-family: &quot;helvetica neue&quot: ;, &quot: ;helvetica&quot: ;, helvetica, arial, sans-serif: ;-webkit-font-smoothing: antialiased;-webkit-text-size-adjust: none;height: 100%;width: 100%!important;">
 
 <div style="background-color: #333A56;width: 80%;margin-left: 10%">

<table class="head-wrap" bgcolor="#999999" style="margin: 0;padding: 0;font-family: &quot;helvetica neue&quot: ;, &quot: ;helvetica&quot: ;, helvetica, arial, sans-serif: ;width: 100%;">
<tbody style="margin: 0;padding: 0;font-family: &quot;helvetica neue&quot: ;, &quot: ;helvetica&quot: ;, helvetica, arial, sans-serif: ;"><tr style="margin: 0;padding: 0;font-family: &quot;helvetica neue&quot: ;, &quot: ;helvetica&quot: ;, helvetica, arial, sans-serif: ;">
<td style="margin: 0;padding: 0;font-family: &quot;helvetica neue&quot: ;, &quot: ;helvetica&quot: ;, helvetica, arial, sans-serif: ;"></td>

<td style="margin: 0;padding: 0;font-family: &quot;helvetica neue&quot: ;, &quot: ;helvetica&quot: ;, helvetica, arial, sans-serif: ;">
  

</td>
</tr>
</tbody></table> 
 


<table class="body-wrap" bgcolor="" style="margin: 0;padding: 0;font-family: &quot;helvetica neue&quot: ;, &quot: ;helvetica&quot: ;, helvetica, arial, sans-serif: ;width: 100%;">
<tbody style="margin: 0;padding: 0;font-family: &quot;helvetica neue&quot: ;, &quot: ;helvetica&quot: ;, helvetica, arial, sans-serif: ;"><tr style="margin: 0;padding: 0;font-family: &quot;helvetica neue&quot: ;, &quot: ;helvetica&quot: ;, helvetica, arial, sans-serif: ;">
<td style="margin: 0;padding: 0;font-family: &quot;helvetica neue&quot: ;, &quot: ;helvetica&quot: ;, helvetica, arial, sans-serif: ;"></td>
<td class="container" align="" bgcolor="#FFFFFF" style="margin: 0 auto!important;padding: 0;font-family: &quot;helvetica neue&quot: ;, &quot: ;helvetica&quot: ;, helvetica, arial, sans-serif: ;display: block!important;max-width: 600px!important;clear: both!important;">
 
<div class="content" style="margin: 0 auto;padding: 15px;font-family: &quot;Helvetica Neue&quot;, &quot;Helvetica&quot;, Helvetica, Arial, sans-serif;max-width: 600px;display: block;">
<table style="margin: 0;padding: 0;font-family: &quot;helvetica neue&quot: ;, &quot: ;helvetica&quot: ;, helvetica, arial, sans-serif: ;width: 100%;">
<tbody style="margin: 0;padding: 0;font-family: &quot;helvetica neue&quot: ;, &quot: ;helvetica&quot: ;, helvetica, arial, sans-serif: ;"><tr style="margin: 0;padding: 0;font-family: &quot;helvetica neue&quot: ;, &quot: ;helvetica&quot: ;, helvetica, arial, sans-serif: ;">
<tr> <td><h1 style="text-align: center;color:#333A56">  ViralCents </h1>  </td></tr>
<td style="margin: 0;padding: 0;font-family: &quot;helvetica neue&quot: ;, &quot: ;helvetica&quot: ;, helvetica, arial, sans-serif: ;">
<h2 style="margin: 0;padding: 0;font-family: &quot;helveticaneue-light&quot: ;, &quot: ;helvetica neue light&quot: ;helvetica neue&quot: ;, helvetica, arial, &quot: ;lucida grande&quot: ;, sans-serif: ;line-height: 1.1;margin-bottom: 15px;color: #000;font-weight: 200;font-size: 44px;">Hi User,</h2>

 <br><br><br>
<p style="margin: 0;padding: 0;font-family: &quot;helvetica neue&quot: ;, &quot: ;helvetica&quot: ;, helvetica, arial, sans-serif: ;margin-bottom: 10px;font-weight: normal;font-size: 24px;line-height: 1.6;">Latest stories on viralcents
 </p>
</td>
</tr>
</tbody></table>
</div> 
 
<div class="content" style="margin: 0 auto;padding: 15px;font-family: &quot;Helvetica Neue&quot;, &quot;Helvetica&quot;, Helvetica, Arial, sans-serif;max-width: 600px;display: block;">
<table bgcolor="" style="margin: 0;padding: 0;font-family: &quot;helvetica neue&quot: ;, &quot: ;helvetica&quot: ;, helvetica, arial, sans-serif: ;width: 100%;">
<tbody style="margin: 0;padding: 0;font-family: &quot;helvetica neue&quot: ;, &quot: ;helvetica&quot: ;, helvetica, arial, sans-serif: ;"><tr style="margin: 0;padding: 0;font-family: &quot;helvetica neue&quot: ;, &quot: ;helvetica&quot: ;, helvetica, arial, sans-serif: ;">
<td style="margin: 0;padding: 0;font-family: &quot;helvetica neue&quot: ;, &quot: ;helvetica&quot: ;, helvetica, arial, sans-serif: ;">

<p class="" style="margin: 0;padding: 0;font-family: &quot;helvetica neue&quot: ;, &quot: ;helvetica&quot: ;, helvetica, arial, sans-serif: ;margin-bottom: 10px;font-weight: normal;font-size: 14px;line-height: 1.6;">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. </p>
<a class="btn" style="margin: 0;padding: 10px 16px;font-family: &quot;helvetica neue&quot: ;, &quot: ;helvetica&quot: ;, helvetica, arial, sans-serif: ;color: #FFF;text-decoration: none;background-color: #666;font-weight: bold;margin-right: 10px;text-align: center;cursor: pointer;display: inline-block;">Clickity Click »</a>
</td>
</tr>
</tbody></table>
</div> 
 
<div class="content" style="margin: 0 auto;padding: 15px;font-family: &quot;Helvetica Neue&quot;, &quot;Helvetica&quot;, Helvetica, Arial, sans-serif;max-width: 600px;display: block;"><table bgcolor="" style="margin: 0;padding: 0;font-family: &quot;helvetica neue&quot: ;, &quot: ;helvetica&quot: ;, helvetica, arial, sans-serif: ;width: 100%;">
<tbody style="margin: 0;padding: 0;font-family: &quot;helvetica neue&quot: ;, &quot: ;helvetica&quot: ;, helvetica, arial, sans-serif: ;"><tr style="margin: 0;padding: 0;font-family: &quot;helvetica neue&quot: ;, &quot: ;helvetica&quot: ;, helvetica, arial, sans-serif: ;">

<td style="margin: 0;padding: 0;font-family: &quot;helvetica neue&quot: ;, &quot: ;helvetica&quot: ;, helvetica, arial, sans-serif: ;">

<p class="" style="margin: 0;padding: 0;font-family: &quot;helvetica neue&quot: ;, &quot: ;helvetica&quot: ;, helvetica, arial, sans-serif: ;margin-bottom: 10px;font-weight: normal;font-size: 14px;line-height: 1.6;">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. </p>
<a class="btn" style="margin: 0;padding: 10px 16px;font-family: &quot;helvetica neue&quot: ;, &quot: ;helvetica&quot: ;, helvetica, arial, sans-serif: ;color: #FFF;text-decoration: none;background-color: #666;font-weight: bold;margin-right: 10px;text-align: center;cursor: pointer;display: inline-block;">Clickity Click »</a>
</td>
</tr>
</tbody></table></div> 
 
 
<div class="content" style="margin: 0 auto;padding: 15px;font-family: &quot;Helvetica Neue&quot;, &quot;Helvetica&quot;, Helvetica, Arial, sans-serif;max-width: 600px;display: block;"><table bgcolor="" style="margin: 0;padding: 0;font-family: &quot;helvetica neue&quot: ;, &quot: ;helvetica&quot: ;, helvetica, arial, sans-serif: ;width: 100%;">
<tbody style="margin: 0;padding: 0;font-family: &quot;helvetica neue&quot: ;, &quot: ;helvetica&quot: ;, helvetica, arial, sans-serif: ;"><tr style="margin: 0;padding: 0;font-family: &quot;helvetica neue&quot: ;, &quot: ;helvetica&quot: ;, helvetica, arial, sans-serif: ;">

<td style="margin: 0;padding: 0;font-family: &quot;helvetica neue&quot: ;, &quot: ;helvetica&quot: ;, helvetica, arial, sans-serif: ;">

<p class="" style="margin: 0;padding: 0;font-family: &quot;helvetica neue&quot: ;, &quot: ;helvetica&quot: ;, helvetica, arial, sans-serif: ;margin-bottom: 10px;font-weight: normal;font-size: 14px;line-height: 1.6;">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. </p>
<a class="btn" style="margin: 0;padding: 10px 16px;font-family: &quot;helvetica neue&quot: ;, &quot: ;helvetica&quot: ;, helvetica, arial, sans-serif: ;color: #FFF;text-decoration: none;background-color: #666;font-weight: bold;margin-right: 10px;text-align: center;cursor: pointer;display: inline-block;">Clickity Click »</a>
</td>
</tr>
</tbody></table></div> 
 
<div class="content" style="margin: 0 auto;padding: 15px;font-family: &quot;Helvetica Neue&quot;, &quot;Helvetica&quot;, Helvetica, Arial, sans-serif;max-width: 600px;display: block;"><table bgcolor="" style="margin: 0;padding: 0;font-family: &quot;helvetica neue&quot: ;, &quot: ;helvetica&quot: ;, helvetica, arial, sans-serif: ;width: 100%;">
<tbody style="margin: 0;padding: 0;font-family: &quot;helvetica neue&quot: ;, &quot: ;helvetica&quot: ;, helvetica, arial, sans-serif: ;"><tr style="margin: 0;padding: 0;font-family: &quot;helvetica neue&quot: ;, &quot: ;helvetica&quot: ;, helvetica, arial, sans-serif: ;">
<td style="margin: 0;padding: 0;font-family: &quot;helvetica neue&quot: ;, &quot: ;helvetica&quot: ;, helvetica, arial, sans-serif: ;">

<p class="" style="margin: 0;padding: 0;font-family: &quot;helvetica neue&quot: ;, &quot: ;helvetica&quot: ;, helvetica, arial, sans-serif: ;margin-bottom: 10px;font-weight: normal;font-size: 14px;line-height: 1.6;"> @stories  </p>
<a class="btn" style="margin: 0;padding: 10px 16px;font-family: &quot;helvetica neue&quot: ;, &quot: ;helvetica&quot: ;, helvetica, arial, sans-serif: ;color: #FFF;text-decoration: none;background-color: #666;font-weight: bold;margin-right: 10px;text-align: center;cursor: pointer;display: inline-block;">Clickity Click »</a>
</td>
</tr>
</tbody></table></div> 
 

<div class="content" style="margin: 0 auto;padding: 15px;font-family: &quot;Helvetica Neue&quot;, &quot;Helvetica&quot;, Helvetica, Arial, sans-serif;max-width: 600px;display: block;"><table bgcolor="" style="margin: 0;padding: 0;font-family: &quot;helvetica neue&quot: ;, &quot: ;helvetica&quot: ;, helvetica, arial, sans-serif: ;width: 100%;">
<tbody style="margin: 0;padding: 0;font-family: &quot;helvetica neue&quot: ;, &quot: ;helvetica&quot: ;, helvetica, arial, sans-serif: ;"><tr style="margin: 0;padding: 0;font-family: &quot;helvetica neue&quot: ;, &quot: ;helvetica&quot: ;, helvetica, arial, sans-serif: ;">
<td style="margin: 0;padding: 0;font-family: &quot;helvetica neue&quot: ;, &quot: ;helvetica&quot: ;, helvetica, arial, sans-serif: ;">

<p class="" style="margin: 0;padding: 0;font-family: &quot;helvetica neue&quot: ;, &quot: ;helvetica&quot: ;, helvetica, arial, sans-serif: ;margin-bottom: 10px;font-weight: normal;font-size: 14px;line-height: 1.6;">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. </p>
<a class="btn" style="margin: 0;padding: 10px 16px;font-family: &quot;helvetica neue&quot: ;, &quot: ;helvetica&quot: ;, helvetica, arial, sans-serif: ;color: #FFF;text-decoration: none;background-color: #666;font-weight: bold;margin-right: 10px;text-align: center;cursor: pointer;display: inline-block;">Clickity Click »</a>
</td>
</tr>
</tbody></table></div> 


<div class="content" style="margin: 0 auto;padding: 15px;font-family: &quot;Helvetica Neue&quot;, &quot;Helvetica&quot;, Helvetica, Arial, sans-serif;max-width: 600px;display: block;">
<table bgcolor="" style="margin: 0;padding: 0;font-family: &quot;helvetica neue&quot: ;, &quot: ;helvetica&quot: ;, helvetica, arial, sans-serif: ;width: 100%;">
<tbody style="margin: 0;padding: 0;font-family: &quot;helvetica neue&quot: ;, &quot: ;helvetica&quot: ;, helvetica, arial, sans-serif: ;"><tr style="margin: 0;padding: 0;font-family: &quot;helvetica neue&quot: ;, &quot: ;helvetica&quot: ;, helvetica, arial, sans-serif: ;">
<td style="margin: 0;padding: 0;font-family: &quot;helvetica neue&quot: ;, &quot: ;helvetica&quot: ;, helvetica, arial, sans-serif: ;">
 
<table bgcolor="" class="social" width="100%" style="margin: 0;padding: 0;font-family: &quot;helvetica neue&quot: ;, &quot: ;helvetica&quot: ;, helvetica, arial, sans-serif: ;background-color: #ebebeb;width: 100%;">
<tbody style="margin: 0;padding: 0;font-family: &quot;helvetica neue&quot: ;, &quot: ;helvetica&quot: ;, helvetica, arial, sans-serif: ;"><tr style="margin: 0;padding: 0;font-family: &quot;helvetica neue&quot: ;, &quot: ;helvetica&quot: ;, helvetica, arial, sans-serif: ;">
<td style="margin: 0;padding: 0;font-family: &quot;helvetica neue&quot: ;, &quot: ;helvetica&quot: ;, helvetica, arial, sans-serif: ;">
 
<div class="column" style="margin: 0;padding: 0;font-family: &quot;helvetica neue&quot: ;, &quot: ;helvetica&quot: ;, helvetica, arial, sans-serif: ;width: 280px;float: left;min-width: 279px;">
<table bgcolor="" cellpadding="" align="left" style="margin: 0;padding: 0;font-family: &quot;helvetica neue&quot: ;, &quot: ;helvetica&quot: ;, helvetica, arial, sans-serif: ;width: 100%;">
<tbody style="margin: 0;padding: 0;font-family: &quot;helvetica neue&quot: ;, &quot: ;helvetica&quot: ;, helvetica, arial, sans-serif: ;"><tr style="margin: 0;padding: 0;font-family: &quot;helvetica neue&quot: ;, &quot: ;helvetica&quot: ;, helvetica, arial, sans-serif: ;">
<td style="margin: 0;padding: 15px;font-family: &quot;helvetica neue&quot: ;, &quot: ;helvetica&quot: ;, helvetica, arial, sans-serif: ;">
<h5 class="" style="margin: 0;padding: 0;font-family: &quot;helveticaneue-light&quot: ;, &quot: ;helvetica neue light&quot: ;helvetica neue&quot: ;, helvetica, arial, &quot: ;lucida grande&quot: ;, sans-serif: ;line-height: 1.1;margin-bottom: 15px;color: #000;font-weight: 900;font-size: 17px;">Connect with Us:</h5>
<p class="" style="margin: 0;padding: 0;font-family: &quot;helvetica neue&quot: ;, &quot: ;helvetica&quot: ;, helvetica, arial, sans-serif: ;margin-bottom: 10px;font-weight: normal;font-size: 14px;line-height: 1.6;"><a href="http://zurb.com/playground/projects/responsive-email-templates/newsletter.html#" class="soc-btn fb" style="margin: 0;padding: 3px 7px;font-family: &quot;helvetica neue&quot: ;, &quot: ;helvetica&quot: ;, helvetica, arial, sans-serif: ;color: #FFF;font-size: 12px;margin-bottom: 10px;text-decoration: none;font-weight: bold;display: block;text-align: center;background-color: #3B5998!important;">Facebook</a> <a href="http://zurb.com/playground/projects/responsive-email-templates/newsletter.html#" class="soc-btn tw" style="margin: 0;padding: 3px 7px;font-family: &quot;helvetica neue&quot: ;, &quot: ;helvetica&quot: ;, helvetica, arial, sans-serif: ;color: #FFF;font-size: 12px;margin-bottom: 10px;text-decoration: none;font-weight: bold;display: block;text-align: center;background-color: #1daced!important;">Twitter</a> <a href="http://zurb.com/playground/projects/responsive-email-templates/newsletter.html#" class="soc-btn gp" style="margin: 0;padding: 3px 7px;font-family: &quot;helvetica neue&quot: ;, &quot: ;helvetica&quot: ;, helvetica, arial, sans-serif: ;color: #FFF;font-size: 12px;margin-bottom: 10px;text-decoration: none;font-weight: bold;display: block;text-align: center;background-color: #DB4A39!important;">Google+</a></p>
</td>
</tr>
</tbody></table> 
</div>
 
<div class="column" style="margin: 0;padding: 0;font-family: &quot;helvetica neue&quot: ;, &quot: ;helvetica&quot: ;, helvetica, arial, sans-serif: ;width: 280px;float: left;min-width: 279px;">
<table bgcolor="" cellpadding="" align="left" style="margin: 0;padding: 0;font-family: &quot;helvetica neue&quot: ;, &quot: ;helvetica&quot: ;, helvetica, arial, sans-serif: ;width: 100%;">
<tbody style="margin: 0;padding: 0;font-family: &quot;helvetica neue&quot: ;, &quot: ;helvetica&quot: ;, helvetica, arial, sans-serif: ;"><tr style="margin: 0;padding: 0;font-family: &quot;helvetica neue&quot: ;, &quot: ;helvetica&quot: ;, helvetica, arial, sans-serif: ;">
<td style="margin: 0;padding: 15px;font-family: &quot;helvetica neue&quot: ;, &quot: ;helvetica&quot: ;, helvetica, arial, sans-serif: ;">

<p style="margin: 0;padding: 0;font-family: &quot;helvetica neue&quot: ;, &quot: ;helvetica&quot: ;, helvetica, arial, sans-serif: ;margin-bottom: 10px;font-weight: normal;font-size: 14px;line-height: 1.6;">


Email: <strong style="margin: 0;padding: 0;font-family: &quot;helvetica neue&quot: ;, &quot: ;helvetica&quot: ;, helvetica, arial, sans-serif: ;"><a href="emailto:hseldon@trantor.com" style="margin: 0;padding: 0;font-family: &quot;helvetica neue&quot: ;, &quot: ;helvetica&quot: ;, helvetica, arial, sans-serif: ;color: #2BA6CB;">hseldon@trantor.com</a></strong></p>
</td>
</tr>
</tbody></table> 
</div>
<div class="clear" style="margin: 0;padding: 0;font-family: &quot;helvetica neue&quot: ;, &quot: ;helvetica&quot: ;, helvetica, arial, sans-serif: ;display: block;clear: both;"></div>
</td>
</tr>
</tbody></table> 
</td>
</tr>
</tbody></table>
</div> 
</td>
<td style="margin: 0;padding: 0;font-family: &quot;helvetica neue&quot: ;, &quot: ;helvetica&quot: ;, helvetica, arial, sans-serif: ;"></td>
</tr>
</tbody></table> 
 
<table class="footer-wrap" style="margin: 0;padding: 0;font-family: &quot;helvetica neue&quot: ;, &quot: ;helvetica&quot: ;, helvetica, arial, sans-serif: ;width: 100%;clear: both!important;">
<tbody style="margin: 0;padding: 0;font-family: &quot;helvetica neue&quot: ;, &quot: ;helvetica&quot: ;, helvetica, arial, sans-serif: ;"><tr style="margin: 0;padding: 0;font-family: &quot;helvetica neue&quot: ;, &quot: ;helvetica&quot: ;, helvetica, arial, sans-serif: ;">
<td style="margin: 0;padding: 0;font-family: &quot;helvetica neue&quot: ;, &quot: ;helvetica&quot: ;, helvetica, arial, sans-serif: ;"></td>

<td style="margin: 0;padding: 0;font-family: &quot;helvetica neue&quot: ;, &quot: ;helvetica&quot: ;, helvetica, arial, sans-serif: ;"></td>
</tr>
</tbody></table> 

</body></html>'
  end
end



end
end
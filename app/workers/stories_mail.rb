class StoriesMail

  include Sidekiq::Worker


  sidekiq_options queue: "high"

   include Sidetiq::Schedulable

     recurrence backfill: true do
       hourly(3)
    end

  def perform()

    
        require 'sendgrid-ruby'
          sendgrid = SendGrid::Client.new do |c|
             c.api_key ='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'
            end
    
          email = SendGrid::Mail.new do |m|
              m.to      = 'rjv834@gmail.com'
              m.from    = 'rjv834@gmail.com'
              m.subject = 'stories'
              m.html    = '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">



<html style="margin: 0;padding: 0;font-family: &quot;helvetica neue&quot: ;, &quot: ;helvetica&quot: ;, helvetica, arial, sans-serif: ;"><head style="margin: 0;padding: 0;font-family: &quot;helvetica neue&quot: ;, &quot: ;helvetica&quot: ;, helvetica, arial, sans-serif: ;"><meta http-equiv="Content-Type" content="text/html; charset=UTF-8" style="margin: 0;padding: 0;font-family: &quot;helvetica neue&quot: ;, &quot: ;helvetica&quot: ;, helvetica, arial, sans-serif: ;">
 
<meta name="viewport" content="width=device-width" style="margin: 0;padding: 0;font-family: &quot;helvetica neue&quot: ;, &quot: ;helvetica&quot: ;, helvetica, arial, sans-serif: ;">

<title style="margin: 0;padding: 0;font-family: &quot;helvetica neue&quot: ;, &quot: ;helvetica&quot: ;, helvetica, arial, sans-serif: ;">Virarlscents</title>

</head>
<body bgcolor="#FFFFFF" topmargin="0" leftmargin="0" marginheight="0" marginwidth="0" style="margin: 0;padding: 0;font-family: &quot;helvetica neue&quot: ;, &quot: ;helvetica&quot: ;, helvetica, arial, sans-serif: ;-webkit-font-smoothing: antialiased;-webkit-text-size-adjust: none;height: 100%;width: 100%!important;">
 
<table class="head-wrap" bgcolor="#999999" style="margin: 0;padding: 0;font-family: &quot;helvetica neue&quot: ;, &quot: ;helvetica&quot: ;, helvetica, arial, sans-serif: ;width: 100%;">
<tbody style="margin: 0;padding: 0;font-family: &quot;helvetica neue&quot: ;, &quot: ;helvetica&quot: ;, helvetica, arial, sans-serif: ;"><tr style="margin: 0;padding: 0;font-family: &quot;helvetica neue&quot: ;, &quot: ;helvetica&quot: ;, helvetica, arial, sans-serif: ;">
<td style="margin: 0;padding: 0;font-family: &quot;helvetica neue&quot: ;, &quot: ;helvetica&quot: ;, helvetica, arial, sans-serif: ;"></td>
<td class="header container" align="" style="margin: 0 auto!important;padding: 0;font-family: &quot;helvetica neue&quot: ;, &quot: ;helvetica&quot: ;, helvetica, arial, sans-serif: ;display: block!important;max-width: 600px!important;clear: both!important;">
 
<div class="content" style="margin: 0 auto;padding: 15px;font-family: &quot;Helvetica Neue&quot;, &quot;Helvetica&quot;, Helvetica, Arial, sans-serif;max-width: 600px;display: block;">
<table bgcolor="#999999" style="margin: 0;padding: 0;font-family: &quot;helvetica neue&quot: ;, &quot: ;helvetica&quot: ;, helvetica, arial, sans-serif: ;width: 100%;">
<tbody style="margin: 0;padding: 0;font-family: &quot;helvetica neue&quot: ;, &quot: ;helvetica&quot: ;, helvetica, arial, sans-serif: ;"><tr style="margin: 0;padding: 0;font-family: &quot;helvetica neue&quot: ;, &quot: ;helvetica&quot: ;, helvetica, arial, sans-serif: ;">
<td align="right" style="margin: 0;padding: 0;font-family: &quot;helvetica neue&quot: ;, &quot: ;helvetica&quot: ;, helvetica, arial, sans-serif: ;"><h6 class="collapse" style="margin: 0!important;padding: 0;font-family: &quot;helveticaneue-light&quot: ;, &quot: ;helvetica neue light&quot: ;helvetica neue&quot: ;, helvetica, arial, &quot: ;lucida grande&quot: ;, sans-serif: ;line-height: 1.1;margin-bottom: 15px;color: #444;font-weight: 900;font-size: 14px;text-transform: uppercase;">Newsletter</h6></td>
</tr>
</tbody></table>
</div> 
</td>
<td style="margin: 0;padding: 0;font-family: &quot;helvetica neue&quot: ;, &quot: ;helvetica&quot: ;, helvetica, arial, sans-serif: ;"></td>
</tr>
</tbody></table> 
 
<table class="body-wrap" bgcolor="" style="margin: 0;padding: 0;font-family: &quot;helvetica neue&quot: ;, &quot: ;helvetica&quot: ;, helvetica, arial, sans-serif: ;width: 100%;">
<tbody style="margin: 0;padding: 0;font-family: &quot;helvetica neue&quot: ;, &quot: ;helvetica&quot: ;, helvetica, arial, sans-serif: ;"><tr style="margin: 0;padding: 0;font-family: &quot;helvetica neue&quot: ;, &quot: ;helvetica&quot: ;, helvetica, arial, sans-serif: ;">
<td style="margin: 0;padding: 0;font-family: &quot;helvetica neue&quot: ;, &quot: ;helvetica&quot: ;, helvetica, arial, sans-serif: ;"></td>
<td class="container" align="" bgcolor="#FFFFFF" style="margin: 0 auto!important;padding: 0;font-family: &quot;helvetica neue&quot: ;, &quot: ;helvetica&quot: ;, helvetica, arial, sans-serif: ;display: block!important;max-width: 600px!important;clear: both!important;">
 
<div class="content" style="margin: 0 auto;padding: 15px;font-family: &quot;Helvetica Neue&quot;, &quot;Helvetica&quot;, Helvetica, Arial, sans-serif;max-width: 600px;display: block;">
<table style="margin: 0;padding: 0;font-family: &quot;helvetica neue&quot: ;, &quot: ;helvetica&quot: ;, helvetica, arial, sans-serif: ;width: 100%;">
<tbody style="margin: 0;padding: 0;font-family: &quot;helvetica neue&quot: ;, &quot: ;helvetica&quot: ;, helvetica, arial, sans-serif: ;"><tr style="margin: 0;padding: 0;font-family: &quot;helvetica neue&quot: ;, &quot: ;helvetica&quot: ;, helvetica, arial, sans-serif: ;">
<td style="margin: 0;padding: 0;font-family: &quot;helvetica neue&quot: ;, &quot: ;helvetica&quot: ;, helvetica, arial, sans-serif: ;">
<h1 style="margin: 0;padding: 0;font-family: &quot;helveticaneue-light&quot: ;, &quot: ;helvetica neue light&quot: ;helvetica neue&quot: ;, helvetica, arial, &quot: ;lucida grande&quot: ;, sans-serif: ;line-height: 1.1;margin-bottom: 15px;color: #000;font-weight: 200;font-size: 44px;">Great Scott!</h1>
<p class="lead" style="margin: 0;padding: 0;font-family: &quot;helvetica neue&quot: ;, &quot: ;helvetica&quot: ;, helvetica, arial, sans-serif: ;margin-bottom: 10px;font-weight: normal;font-size: 17px;line-height: 1.6;">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et.</p>
 
<p style="margin: 0;padding: 0;font-family: &quot;helvetica neue&quot: ;, &quot: ;helvetica&quot: ;, helvetica, arial, sans-serif: ;margin-bottom: 10px;font-weight: normal;font-size: 14px;line-height: 1.6;">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. </p>
</td>
</tr>
</tbody></table>
</div> 
 
<div class="content" style="margin: 0 auto;padding: 15px;font-family: &quot;Helvetica Neue&quot;, &quot;Helvetica&quot;, Helvetica, Arial, sans-serif;max-width: 600px;display: block;">
<table bgcolor="" style="margin: 0;padding: 0;font-family: &quot;helvetica neue&quot: ;, &quot: ;helvetica&quot: ;, helvetica, arial, sans-serif: ;width: 100%;">
<tbody style="margin: 0;padding: 0;font-family: &quot;helvetica neue&quot: ;, &quot: ;helvetica&quot: ;, helvetica, arial, sans-serif: ;"><tr style="margin: 0;padding: 0;font-family: &quot;helvetica neue&quot: ;, &quot: ;helvetica&quot: ;, helvetica, arial, sans-serif: ;">
<td style="margin: 0;padding: 0;font-family: &quot;helvetica neue&quot: ;, &quot: ;helvetica&quot: ;, helvetica, arial, sans-serif: ;">
<h4 style="margin: 0;padding: 0;font-family: &quot;helveticaneue-light&quot: ;, &quot: ;helvetica neue light&quot: ;helvetica neue&quot: ;, helvetica, arial, &quot: ;lucida grande&quot: ;, sans-serif: ;line-height: 1.1;margin-bottom: 15px;color: #000;font-weight: 500;font-size: 23px;">Title Ipsum <small style="margin: 0;padding: 0;font-family: &quot;helvetica neue&quot: ;, &quot: ;helvetica&quot: ;, helvetica, arial, sans-serif: ;font-size: 60%;color: #6f6f6f;line-height: 0;text-transform: none;">This is a note.</small></h4>
<p class="" style="margin: 0;padding: 0;font-family: &quot;helvetica neue&quot: ;, &quot: ;helvetica&quot: ;, helvetica, arial, sans-serif: ;margin-bottom: 10px;font-weight: normal;font-size: 14px;line-height: 1.6;">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. </p>
<a class="btn" style="margin: 0;padding: 10px 16px;font-family: &quot;helvetica neue&quot: ;, &quot: ;helvetica&quot: ;, helvetica, arial, sans-serif: ;color: #FFF;text-decoration: none;background-color: #666;font-weight: bold;margin-right: 10px;text-align: center;cursor: pointer;display: inline-block;">Clickity Click »</a>
</td>
</tr>
</tbody></table>
</div> 
 
<div class="content" style="margin: 0 auto;padding: 15px;font-family: &quot;Helvetica Neue&quot;, &quot;Helvetica&quot;, Helvetica, Arial, sans-serif;max-width: 600px;display: block;"><table bgcolor="" style="margin: 0;padding: 0;font-family: &quot;helvetica neue&quot: ;, &quot: ;helvetica&quot: ;, helvetica, arial, sans-serif: ;width: 100%;">
<tbody style="margin: 0;padding: 0;font-family: &quot;helvetica neue&quot: ;, &quot: ;helvetica&quot: ;, helvetica, arial, sans-serif: ;"><tr style="margin: 0;padding: 0;font-family: &quot;helvetica neue&quot: ;, &quot: ;helvetica&quot: ;, helvetica, arial, sans-serif: ;">

<td style="margin: 0;padding: 0;font-family: &quot;helvetica neue&quot: ;, &quot: ;helvetica&quot: ;, helvetica, arial, sans-serif: ;">
<h4 style="margin: 0;padding: 0;font-family: &quot;helveticaneue-light&quot: ;, &quot: ;helvetica neue light&quot: ;helvetica neue&quot: ;, helvetica, arial, &quot: ;lucida grande&quot: ;, sans-serif: ;line-height: 1.1;margin-bottom: 15px;color: #000;font-weight: 500;font-size: 23px;">Title Ipsum <small style="margin: 0;padding: 0;font-family: &quot;helvetica neue&quot: ;, &quot: ;helvetica&quot: ;, helvetica, arial, sans-serif: ;font-size: 60%;color: #6f6f6f;line-height: 0;text-transform: none;">This is a note.</small></h4>
<p class="" style="margin: 0;padding: 0;font-family: &quot;helvetica neue&quot: ;, &quot: ;helvetica&quot: ;, helvetica, arial, sans-serif: ;margin-bottom: 10px;font-weight: normal;font-size: 14px;line-height: 1.6;">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. </p>
<a class="btn" style="margin: 0;padding: 10px 16px;font-family: &quot;helvetica neue&quot: ;, &quot: ;helvetica&quot: ;, helvetica, arial, sans-serif: ;color: #FFF;text-decoration: none;background-color: #666;font-weight: bold;margin-right: 10px;text-align: center;cursor: pointer;display: inline-block;">Clickity Click »</a>
</td>
</tr>
</tbody></table></div> 
 
<div class="content" style="margin: 0 auto;padding: 15px;font-family: &quot;Helvetica Neue&quot;, &quot;Helvetica&quot;, Helvetica, Arial, sans-serif;max-width: 600px;display: block;"><table bgcolor="" style="margin: 0;padding: 0;font-family: &quot;helvetica neue&quot: ;, &quot: ;helvetica&quot: ;, helvetica, arial, sans-serif: ;width: 100%;">
<tbody style="margin: 0;padding: 0;font-family: &quot;helvetica neue&quot: ;, &quot: ;helvetica&quot: ;, helvetica, arial, sans-serif: ;"><tr style="margin: 0;padding: 0;font-family: &quot;helvetica neue&quot: ;, &quot: ;helvetica&quot: ;, helvetica, arial, sans-serif: ;">
<td style="margin: 0;padding: 0;font-family: &quot;helvetica neue&quot: ;, &quot: ;helvetica&quot: ;, helvetica, arial, sans-serif: ;">
 
<p class="callout" style="margin: 0;padding: 15px;font-family: &quot;helvetica neue&quot: ;, &quot: ;helvetica&quot: ;, helvetica, arial, sans-serif: ;margin-bottom: 15px;font-weight: normal;font-size: 14px;line-height: 1.6;background-color: #ECF8FF;">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt. <a href="http://zurb.com/playground/projects/responsive-email-templates/newsletter.html#" style="margin: 0;padding: 0;font-family: &quot;helvetica neue&quot: ;, &quot: ;helvetica&quot: ;, helvetica, arial, sans-serif: ;color: #2BA6CB;font-weight: bold;">Do it Now! »</a> </p> 
</td>
</tr>
</tbody></table></div> 
 
<div class="content" style="margin: 0 auto;padding: 15px;font-family: &quot;Helvetica Neue&quot;, &quot;Helvetica&quot;, Helvetica, Arial, sans-serif;max-width: 600px;display: block;"><table bgcolor="" style="margin: 0;padding: 0;font-family: &quot;helvetica neue&quot: ;, &quot: ;helvetica&quot: ;, helvetica, arial, sans-serif: ;width: 100%;">
<tbody style="margin: 0;padding: 0;font-family: &quot;helvetica neue&quot: ;, &quot: ;helvetica&quot: ;, helvetica, arial, sans-serif: ;"><tr style="margin: 0;padding: 0;font-family: &quot;helvetica neue&quot: ;, &quot: ;helvetica&quot: ;, helvetica, arial, sans-serif: ;">

<td style="margin: 0;padding: 0;font-family: &quot;helvetica neue&quot: ;, &quot: ;helvetica&quot: ;, helvetica, arial, sans-serif: ;">
<h4 style="margin: 0;padding: 0;font-family: &quot;helveticaneue-light&quot: ;, &quot: ;helvetica neue light&quot: ;helvetica neue&quot: ;, helvetica, arial, &quot: ;lucida grande&quot: ;, sans-serif: ;line-height: 1.1;margin-bottom: 15px;color: #000;font-weight: 500;font-size: 23px;">Title Ipsum <small style="margin: 0;padding: 0;font-family: &quot;helvetica neue&quot: ;, &quot: ;helvetica&quot: ;, helvetica, arial, sans-serif: ;font-size: 60%;color: #6f6f6f;line-height: 0;text-transform: none;">This is a note.</small></h4>
<p class="" style="margin: 0;padding: 0;font-family: &quot;helvetica neue&quot: ;, &quot: ;helvetica&quot: ;, helvetica, arial, sans-serif: ;margin-bottom: 10px;font-weight: normal;font-size: 14px;line-height: 1.6;">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. </p>
<a class="btn" style="margin: 0;padding: 10px 16px;font-family: &quot;helvetica neue&quot: ;, &quot: ;helvetica&quot: ;, helvetica, arial, sans-serif: ;color: #FFF;text-decoration: none;background-color: #666;font-weight: bold;margin-right: 10px;text-align: center;cursor: pointer;display: inline-block;">Clickity Click »</a>
</td>
</tr>
</tbody></table></div> 
 
<div class="content" style="margin: 0 auto;padding: 15px;font-family: &quot;Helvetica Neue&quot;, &quot;Helvetica&quot;, Helvetica, Arial, sans-serif;max-width: 600px;display: block;"><table bgcolor="" style="margin: 0;padding: 0;font-family: &quot;helvetica neue&quot: ;, &quot: ;helvetica&quot: ;, helvetica, arial, sans-serif: ;width: 100%;">
<tbody style="margin: 0;padding: 0;font-family: &quot;helvetica neue&quot: ;, &quot: ;helvetica&quot: ;, helvetica, arial, sans-serif: ;"><tr style="margin: 0;padding: 0;font-family: &quot;helvetica neue&quot: ;, &quot: ;helvetica&quot: ;, helvetica, arial, sans-serif: ;">
<td style="margin: 0;padding: 0;font-family: &quot;helvetica neue&quot: ;, &quot: ;helvetica&quot: ;, helvetica, arial, sans-serif: ;">
<h4 style="margin: 0;padding: 0;font-family: &quot;helveticaneue-light&quot: ;, &quot: ;helvetica neue light&quot: ;helvetica neue&quot: ;, helvetica, arial, &quot: ;lucida grande&quot: ;, sans-serif: ;line-height: 1.1;margin-bottom: 15px;color: #000;font-weight: 500;font-size: 23px;">Title Ipsum <small style="margin: 0;padding: 0;font-family: &quot;helvetica neue&quot: ;, &quot: ;helvetica&quot: ;, helvetica, arial, sans-serif: ;font-size: 60%;color: #6f6f6f;line-height: 0;text-transform: none;">This is a note.</small></h4>
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
<h5 class="" style="margin: 0;padding: 0;font-family: &quot;helveticaneue-light&quot: ;, &quot: ;helvetica neue light&quot: ;helvetica neue&quot: ;, helvetica, arial, &quot: ;lucida grande&quot: ;, sans-serif: ;line-height: 1.1;margin-bottom: 15px;color: #000;font-weight: 900;font-size: 17px;">Contact Info:</h5>
<p style="margin: 0;padding: 0;font-family: &quot;helvetica neue&quot: ;, &quot: ;helvetica&quot: ;, helvetica, arial, sans-serif: ;margin-bottom: 10px;font-weight: normal;font-size: 14px;line-height: 1.6;">Phone: <strong style="margin: 0;padding: 0;font-family: &quot;helvetica neue&quot: ;, &quot: ;helvetica&quot: ;, helvetica, arial, sans-serif: ;">408.341.0600</strong><br style="margin: 0;padding: 0;font-family: &quot;helvetica neue&quot: ;, &quot: ;helvetica&quot: ;, helvetica, arial, sans-serif: ;">
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
        sendgrid.send(email)

    
  end



end
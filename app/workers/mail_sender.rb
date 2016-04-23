class MailSender

  include Sidekiq::Worker

#sidekiq_options queue: "low"


  def perform(param)

   
    
        require 'sendgrid-ruby'
          sendgrid = SendGrid::Client.new do |c|
        c.api_key ='secret'
          
            end

          email = SendGrid::Mail.new do |m|
              m.to      =  param
              m.from    = 'Viralcents'
              m.subject = 'welcome'
                      m.html    = '<!DOCTYPE html>
<html>
<head>
<style>

.table
{
  style="border-collapse:collapse; height:100%; margin:0; padding:0; width:100%; font-family: "Source Sans Pro", "Georgia", "Arial", sans-serif !important; font-weight: 300; mso-table-lspace:0pt; mso-table-rspace:0pt;"
}


</style>


</head>


<body style="background-color:#333A56">



  <table align="center" border="0" cellpadding="0" cellspacing="0" height="100%" id="bodyTable" width="100%">
    <tr>
      <td align="center" id="bodyCell" style="height:100%;  margin:0; padding:0; width:100%; font-family: "Source Sans Pro", "Georgia", "Arial", sans-serif !important; font-weight: 300;" valign="top">
        
        <table border="0" cellpadding="0" cellspacing="0" class="templateContainer" style="border-collapse:collapse; mso-table-lspace:0pt; mso-table-rspace:0pt; max-width:564px;" width="100%">
          <tr>
            <td id="templatePreheader" style="border-top:0;border-bottom:0;padding-top:9px;padding-bottom:9px;color:#fff;text-align: center" valign="top">

                <h1 style="font-family: Georgia"> ViralCents </h1>
              
            </td>
          </tr>
          

          <tr>

            <td id="templateHeader" valign="top"></td>
          </tr>
          <tr>
            <td id="templateBody" valign="top">
              <table border="0" cellpadding="0" cellspacing="0" class="mcnTextBlock" style="min-width:100%; border-collapse:collapse; mso-table-lspace:0pt; mso-table-rspace:0pt;" width="100%">
                <tbody class="mcnTextBlockOuter">
                  <tr>
                    <td class="mcnTextBlockInner" valign="top">
                      <table align="left" border="0" cellpadding="0" cellspacing="0" class="mcnTextContentContainer" style="min-width:100%; border-collapse:collapse; mso-table-lspace:0pt; mso-table-rspace:0pt;" width="100%">
                        <tbody>
                          <tr>
                            <td class="mcnTextContent" style="padding-top:9px; padding-right: 18px; padding-bottom: 9px; padding-left: 18px;" valign="top">
                              <h1 style="text-align: left; display:block; margin:0; padding:0; color:#fff;    font-family:Georgia;font-size:26px;font-style:normal;   font-weight:bold; line-height:125%;   letter-spacing:normal;">Hello and welcome to ViralCents</h1>
                              <span style="color: #FFF;line-height: 30px;font-size:20px;font-family:Georgia">
                              <br>
                              Thank you for joining us and hope you enjoy using the website as much as we enjoyed making it. Our mission at clot co is to create the simplest event community in the world, so you can find/create events near you and make great friends.
                              <br>
                                <br>
                                <br>
                                Thank you very much
                                <br>
                                <br>
                                <button style="background-color:#fff;color:#333A56;border:10px;padding: 10px 10px 10px"> 
                                <b>Continue  on Viralcents</b></button>
                                </span>
                              </br>
                            </td>
                          </tr>
                        </tbody>
                      </table>
                    </td>
                  </tr>
                </tbody>
              </table>
            </td>
          </tr>
          <tr>
            <td id="templateFooter" style="text-align:center; /*@editable*/ /*@editable*/border-top:0;color: #fff /*@editable*/border-bottom:0; /*@editable*/padding-top:9px; /*@editable*/padding-bottom:9px;" valign="top">
              <table border="0" cellpadding="0" cellspacing="0" class="mcnFollowBlock" style="min-width:100%; border-collapse:collapse; mso-table-lspace:0pt; mso-table-rspace:0pt;" width="100%">
                <tbody class="mcnFollowBlockOuter">
                  <tr>
                    <td align="center" class="mcnFollowBlockInner" style="padding:9px" valign="top">
                      <table border="0" cellpadding="0" cellspacing="0" class="mcnFollowContentContainer" style="min-width:100%; border-collapse:collapse; mso-table-lspace:0pt; mso-table-rspace:0pt;" width="100%">
                        <tbody>
                          <tr>
                            <td align="center" style="padding-left:9px;padding-right:9px;">
                              <table border="0" cellpadding="0" cellspacing="0" class="mcnFollowContent" style="min-width:100%; border-collapse:collapse; mso-table-lspace:0pt; mso-table-rspace:0pt;" width="100%">
                                <tbody>
                                  <tr>
                                    <td align="center" style="padding-top:9px; padding-right:9px; padding-left:9px;" valign="top">
                                      <table align="center" border="0" cellpadding="0" cellspacing="0" style="border-collapse:collapse; mso-table-lspace:0pt; mso-table-rspace:0pt;">
                                        <tbody>
                                          <tr>
                                            <td align="center" valign="top">
                                              <!--[if mso]>
                                                <table align="center" border="0" cellspacing="0" cellpadding="0">
                                                <tr>
                                              <![endif]-->
                                              <!--[if mso]>
                                                <td align="center" valign="top">
                                              <![endif]-->
                                              <table align="left" border="0" cellpadding="0" cellspacing="0" style="display:inline; border-collapse:collapse; mso-table-lspace:0pt; mso-table-rspace:0pt;">
                                                <tbody>
                                                  <tr>
                                                    <td class="mcnFollowContentItemContainer" style="padding-right:10px; padding-bottom:9px;" valign="top">
                                                      <table border="0" cellpadding="0" cellspacing="0" class="mcnFollowContentItem" style="border-collapse:collapse; mso-table-lspace:0pt; mso-table-rspace:0pt;" width="100%">
                                                        <tbody>
                                                          <tr>
                                                            <td align="left" style="padding-top:5px; padding-right:10px; padding-bottom:5px; padding-left:9px;" valign="middle">
                                                              <table align="left" border="0" cellpadding="0" cellspacing="0" style="border-collapse:collapse; mso-table-lspace:0pt; mso-table-rspace:0pt;" width="">
                                                                <tbody>
                                                                  <tr>
                                                                    <td align="center" class="mcnFollowIconContent" valign="middle" width="24">                            
                          <a href="http://zurb.com/playground/projects/responsive-email-templates/newsletter.html#" style="margin: 0;padding: 10px 2px;font-family: &quot;Georgia Neue&quot;, &quot;Georgia&quot;, Georgia, Arial, sans-serif;color: #FFF;font-size: 12px;margin-bottom: 10px;text-decoration: none;font-weight: bold;display: block;text-align: center;background-color: #3B5998!important;border-radius:30px 30px 30px 30px;width: 30px;height: 10px;text-align: center">f</a>


                                                                    </td>
                                                                  </tr>
                                                                </tbody>
                                                              </table>
                                                            </td>
                                                          </tr>
                                                        </tbody>
                                                      </table>
                                                    </td>
                                                  </tr>
                                                </tbody>
                                              </table>
                                              <!--[if mso]>
                                                </td>
                                              <![endif]-->
                                              <!--[if mso]>
                                                <td align="center" valign="top">
                                              <![endif]-->
                                              <table align="left" border="0" cellpadding="0" cellspacing="0" style="display:inline; border-collapse:collapse; mso-table-lspace:0pt; mso-table-rspace:0pt;">
                                                <tbody>
                                                  <tr>
                                                    <td class="mcnFollowContentItemContainer" style="padding-right:10px; padding-bottom:9px;" valign="top">
                                                      <table border="0" cellpadding="0" cellspacing="0" class="mcnFollowContentItem" style="border-collapse:collapse; mso-table-lspace:0pt; mso-table-rspace:0pt;" width="100%">
                                                        <tbody>
                                                          <tr>
                                                            <td align="left" style="padding-top:5px; padding-right:10px; padding-bottom:5px; padding-left:9px;" valign="middle">
                                                              <table align="left" border="0" cellpadding="0" cellspacing="0" style="border-collapse:collapse; mso-table-lspace:0pt; mso-table-rspace:0pt;" width="">
                                                                <tbody>
                                                                  <tr>
                                                                    <td align="center" class="mcnFollowIconContent" valign="middle" width="24">
                                                                                                  
                          <a href="http://zurb.com/playground/projects/responsive-email-templates/newsletter.html#" style="margin: 0;padding: 10px 2px;font-family: &quot;Georgia Neue&quot;, &quot;Georgia&quot;, Georgia, Arial, sans-serif;color: #FFF;font-size: 12px;margin-bottom: 10px;text-decoration: none;font-weight: bold;display: block;text-align: center;background-color: #1daced!important;border-radius:30px 30px 30px 30px;width: 30px;height: 10px;text-align: center">t</a>


                                                                    </td>
                                                                  </tr>
                                                                </tbody>
                                                              </table>
                                                            </td>
                                                          </tr>
                                                        </tbody>
                                                      </table>
                                                    </td>
                                                  </tr>
                                                </tbody>
                                              </table>
                                              <!--[if mso]>
                                                </td>
                                              <![endif]-->
                                              <!--[if mso]>
                                                <td align="center" valign="top">
                                              <![endif]-->
                                            </td>
                                          </tr>
                                        </tbody>
                                      </table>
                                    </td>
                                  </tr>
                                </tbody>
                              </table>
                            </td>
                          </tr>
                        </tbody>
                      </table>
                    </td>
                  </tr>
                </tbody>
              </table> 

              <table border="0" cellpadding="0" cellspacing="0" class="mcnDividerBlock" style="min-width:100%; border-collapse:collapse; mso-table-lspace:0pt; mso-table-rspace:0pt;" width="100%">
                <tbody class="mcnDividerBlockOuter">
                  <tr>
                    <td class="mcnDividerBlockInner" style="min-width: 100%; padding: 10px 18px 25px;">
                      <table border="0" cellpadding="0" cellspacing="0" class="mcnDividerContent" style="min-width: 100%;border-top: 2px solid #EEEEEE; border-collapse:collapse; mso-table-lspace:0pt; mso-table-rspace:0pt;" width="100%">
                        <tbody>
                          <tr>
                            <td>
                              <span></span>
                            </td>
                          </tr>
                        </tbody>
                      </table>
                      <!--
                        <td class="mcnDividerBlockInner" style="padding: 18px;">
                        <hr class="mcnDividerContent" style="border-bottom-color:none; border-left-color:none; border-right-color:none; border-bottom-width:0; border-left-width:0; border-right-width:0; margin-top:0; margin-right:0; margin-bottom:0; margin-left:0;" />
                      -->
                    </td>
                  </tr>
                </tbody>
              </table>

              <table border="0" cellpadding="0" cellspacing="0" class="mcnTextBlock" style="min-width:100%; border-collapse:collapse; mso-table-lspace:0pt; mso-table-rspace:0pt;" width="100%">
                <tbody class="mcnTextBlockOuter">
                  <tr>
                    <td class="mcnTextBlockInner" valign="top">
                      <table align="center" border="0" cellpadding="0" cellspacing="0" class="mcnTextContentContainer" style="min-width:100%; border-collapse:collapse; mso-table-lspace:0pt; mso-table-rspace:0pt;" width="100%">
                        <tbody>
                          <tr>
                            <td class="mcnTextContent" style="padding-top:9px; padding-right: 18px; padding-bottom: 9px; padding-left: 18px; *@editable*/color:#fff;/*@editable*/font-family:Georgia; /*@editable*/font-size:12px; /*@editable*/line-height:150%; /*@editable*/text-align:center;" valign="top">
                            <span style="color: #fff"> 
                              <em>Copyright © 2016 Techritzy, All rights reserved.</em>
                              <br>
                                <br>
                                  <strong>any-email@gmail.com</strong>
                                  </span>
                                </br>
                              </br>
                            </td>
                          </tr>
                        </tbody>
                      </table>
                    </td>
                  </tr>
                </tbody>
              </table>
            </td>
          </tr>
        </table>
        <!--[if gte mso 9]>
          </td>
          </tr>
          </table>
        <![endif]-->
        <!-- // END TEMPLATE -->
      </td>
    </tr>
  </table>

</body>
</html>'
            end
        sendgrid.send(email)

    
  end



end










  

class NotificationMailSender

	@queue = :mail_queue

	def self.perform(param)

		
		    require 'sendgrid-ruby'

		      email = SendGrid::Mail.new do |m|
		          m.to      = x
		          m.from    = 'rjv834@gmail.com'
		          m.subject = 'welcome'
		          m.html    = '<html>
<head>
<style type="text/css">  
body { margin: 0;    padding: 0;   min-width: 100% !important;   line-height: 21px;    font-family: "HelveticaNeue-Light", "Helvetica Neue Light", "Helvetica Neue", Helvetica, Arial, "Lucida Grande", sans-serif;    color: #7d7d7d;   font-size: 14px; }  .content {  width: 100%;    max-width: 480px;   margin: 0 auto;  }   
</style> 
</head>
<body>

    <div style="text-align: center">   
<br>

<img  src="https://static.techwallacdn.com/img/product-tile-small/tw/tw/b5/e1/b5e14a9b4e7c8462558cd33681fe86ec.jpg" height:140px;width:140px; align="center" style="border-radius: 150px;
  -webkit-border-radius: 150px;  -moz-border-radius: 150px;box-shadow: 0 0 8px rgba(0, 0, 0, .8);
  -webkit-box-shadow: 0 0 8px rgba(0, 0, 0, .8);
  -moz-box-shadow: 0 0 8px rgba(0, 0, 0, .8)">
  
</div>
<br><br>


<table width="100%" class="content" bgcolor="#fff" border="0" cellpadding="0" cellspacing="0" > 


      <tr> 

       <td colspan="2">  


             </td>

       </tr>   <!--Row 1  -->

       <tr>  

      <td colspan="2" class="withPadding"> 
            <h3 style="padding: 10px 10px 10px 10px;background-color: #3399FF;color:#fff;line-height: 30px">  <br>Viralscents Welcomes You<br></h3>
           
        </td>

        </tr>  <!-- Row 2 -->
       
   
        <tr>

        <td>



            <p style="background-color: #fff;
          border-radius: 3px;
          box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.16), 0 2px 10px 0 rgba(0, 0, 0, 0.12);
          padding: 12px 20px;margin-top: -23px;line-height: 250%">


            Hi XYZ,

            <br> Notificatios are active now
       <br>

            Viralscents Keep notify you.
             <br>


            </p>    


            <p style="background-color: #f2f2f2;
          border-radius: 3px;
          box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.16), 0 2px 10px 0 rgba(0, 0, 0, 0.12);
          padding: 12px 20px;margin-top: -23px;line-height: 250%">


            Viralscents Pvt. Ltd.
              <br>

            Thanks for signing up with viralscents.
             <br>

            Some text here.............
            <br>

            asdasdasdasd

            <br>

            </p>    

      </td>
       </tr>    <!--Row  3 -->


   

      </table>
      </body>
      </html>'
		        end
		    sendgrid.send(email)

		
	end



end
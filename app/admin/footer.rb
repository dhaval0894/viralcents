module ActiveAdmin
  module Views
    class Footer < Component

      def build
        super :id => "footer"                                                    
        super :style => "text-align: right;"                                     

        div do                                                                   
          small "Copyright ViralCents #{Date.today.year}. All Rights Reserved."                                       
        end
      end

    end
  end
end
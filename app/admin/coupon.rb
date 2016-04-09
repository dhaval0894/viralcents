ActiveAdmin.register Coupon do

index do 

    id_column
	column :coupon_title

	actions
end

index as: :grid, default: true do |coupon|
  link_to image_tag(coupon.coupon_title), admin_coupon_path(coupon)
end


# coupon controller begins

controller do

def create

    @coupon = Coupon.new(coupon_params)

		respond_to do |format|
		      if @coupon.save
		        format.html { redirect_to @coupon, notice: 'Coupon was successfully created.' }
		        format.json { render :show, status: :created, location: @coupon }
		      else
		        format.html { render :new }
		        format.json { render json: @coupon.errors, status: :unprocessable_entity }
		      end
		end
    end


    def coupon_params
             params.require(:coupon).permit(:coupon_title, :coupon_company_name, 
             	:coupon_company_logo ,:coupon_amount,:coupon_description,:coupon_terms)
    end

end 

 #coupon controller ends


end

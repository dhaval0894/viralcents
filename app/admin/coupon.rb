ActiveAdmin.register Coupon do

index do 
 
    render partial: 'check'
		 
    id_column
	column :coupon_title
	column :coupon_company_logo
	column :coupon_company_name
	column :coupon_amount
	column :coupon_description
	column :coupon_terms
    actions
end



# coupon controller begins

controller do

# create new coupon
def create

    @coupon = Coupon.new(coupon_params)

		respond_to do |format|
		      if @coupon.save
		        format.html { redirect_to admin_coupons_path, notice: 'Coupon was successfully created.' }
		        format.json { render :show, status: :created, location: @coupon }
		      else
		        format.html { render :new }
		        format.json { render json: admin_coupons_path, status: :unprocessable_entity }
		      end
		end
    
    end    # create new coupon ends

    def coupon_params
             params.require(:coupon).permit(:coupon_title, :coupon_company_name, 
             	:coupon_company_logo ,:coupon_amount,:coupon_description,:coupon_terms)
    
    end  




end    #coupon controller ends


end

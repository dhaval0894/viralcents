ActiveAdmin.register Coupon do
	permit_params :coupon_title, :coupon_company_logo, :coupon_company_name, :coupon_amount, :coupon_description, :coupon_reuse, :coupon_terms,:coupon_code ,:expiry_date

	index do 
	 
	    render partial: 'check'
			 
	    id_column
		column :coupon_title
		column :coupon_company_name
		column :expiry_date
		column :coupon_amount
		column :coupon_terms
		column :coupon_code
	    actions
	end

	#form for new/edit
	form do |f|
		    f.inputs "Coupon" do
			  f.input :coupon_title, :label => "Coupon Title"
		      f.input :coupon_company_logo
		      f.input :coupon_company_name
		      f.input :coupon_amount
		      f.input :coupon_description
		      f.input :coupon_terms
		      f.input :coupon_code
		      f.input :expiry_date
		      f.input :coupon_reuse, :label => "Coupon Reuse"
		    end
		    f.actions
	end	    


end

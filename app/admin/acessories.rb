ActiveAdmin.register Acessory do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :asset_name, :asset_model, :issued_date, :user_id, :admin_user_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:asset_name, :asset_model, :issued_date, :user_id, :admin_user_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  form do |f|
    f.inputs do
      f.input :asset_name
      f.input :asset_model
      f.input :issued_date
      f.input :user, :as => :select, :collection => User.all.collect{|user| [user.name, user.id]}
      f.input :admin_user, :as => :select, :collection => AdminUser.all.collect{|admin| [admin.email, admin.id]}
    end
      f.actions
  end


  
end

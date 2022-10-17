ActiveAdmin.register Complain do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
   permit_params :description, :user_id, :acessory_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:description, :user_id, :acessory_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  form do |f|
    f.inputs do
      f.input :description
      f.input :user, :as => :select, :collection => User.all.collect{|user| [user.name, user.id]}
      f.input :acessory, :as => :select, :collection => Acessory.all.collect{|acessory| [acessory.asset_name, acessory.id]}
    end
      f.actions
  end

  
end

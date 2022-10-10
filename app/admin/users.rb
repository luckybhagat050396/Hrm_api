ActiveAdmin.register User do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
    permit_params :name, :user_name, :email, :role_id, :password, :password_confirmation, :password_digest,:total_leave,:manager_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :username, :email, :password_digest, :role_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

# controller do
#   def create
#   byebug
#   end
# end

  form do |f|
    f.inputs do
      f.input :name
      f.input :user_name
      f.input :email
      f.input :phone_number
      f.input :manager_id
      f.input :total_leave
      f.input :role , :as => :select, :collection => Role.all.collect{|role| [role.name, role.id]}
    end
      f.actions
  end

end 

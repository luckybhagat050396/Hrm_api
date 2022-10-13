ActiveAdmin.register LeaveUser do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
   permit_params :start_date, :leave_reason, :leave_type, :user_id,:status
  #
  # or
  #
  # permit_params do
  #   permitted = [:start_date, :end_date, :leave_reason, :leave_type, :user_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  


  form do |f|
    f.inputs do 
      f.input :start_date, :as => :datepicker 
      f.input :leave_type, :as => :select,:collection => ["paid","unpaid"]
      f.input :leave_reason
      f.input :status
      f.input :user_id , :as => :select, :collection => User.all.collect{|user| [user.name, user.id]}
    end
    f.actions 
  end
end

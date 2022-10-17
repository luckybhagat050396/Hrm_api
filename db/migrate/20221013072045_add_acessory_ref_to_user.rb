class AddAcessoryRefToUser < ActiveRecord::Migration[7.0]
  def change
    add_reference :complains, :user, foreing_key: true
    add_reference :complains, :acessory, foreing_key: true
    add_reference :acessories, :user, foreing_key: true
    add_reference :acessories, :admin_user, foreing_key: true 
  end
end

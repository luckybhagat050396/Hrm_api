class Removeuserreferencetorole < ActiveRecord::Migration[7.0]
  def change
    # remove_reference :users,:role, foreing_key: true
  end
end

class CreateLeaveUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :leave_users do |t|

      t.datetime :start_date, array: true,default: []
      t.datetime :end_date, array: true, default: []
      t.text :leave_reason
      t.string :leave_type
      t.timestamps
    end
  end
end

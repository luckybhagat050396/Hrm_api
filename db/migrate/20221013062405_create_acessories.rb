class CreateAcessories < ActiveRecord::Migration[7.0]
  def change
    create_table :acessories do |t|
      t.string :asset_name
      t.string :asset_model
      t.datetime :issued_date

      t.timestamps
    end
  end
end

class CreateExpos < ActiveRecord::Migration
  def change
    create_table :expos do |t|
      t.string :email,               default: ""
      t.string :phone_number

      t.timestamps null: false
    end
  end
end

class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|

      t.string :name
      t.text :description
      t.string :phone
      t.string :email

      t.timestamps
    end
  end
end

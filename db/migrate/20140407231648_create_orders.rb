class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :customer_name
      t.string :customer_email
      t.string :description
      t.float :price
      t.date :paid_for_on

      t.timestamps
    end
  end
end

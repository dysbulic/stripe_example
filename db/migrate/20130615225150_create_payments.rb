class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.string :stripe_token
      t.float :amount
      t.references :user

      t.timestamps
    end
    add_index :payments, :user_id
  end
end

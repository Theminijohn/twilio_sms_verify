class AddPhoneAttributesToUsers < ActiveRecord::Migration
  def change
    add_column :users, :phone_number, :string
    add_column :users, :phone_verification_code, :string
    add_column :users, :phone_verified, :boolean, default: false
  end
end

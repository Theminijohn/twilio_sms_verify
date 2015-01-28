class CreatePhoneVerificationServices < ActiveRecord::Migration
  def change
    create_table :phone_verification_services do |t|

      t.timestamps null: false
    end
  end
end

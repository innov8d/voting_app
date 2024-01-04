class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :email
      t.string :zip
      t.datetime :sign_on_at

      t.timestamps
    end
  end
end

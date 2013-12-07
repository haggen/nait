class CreateUsers < ActiveRecord::Migration
  def change
    enable_extension :hstore
    
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.hstore :options

      t.timestamps
    end
  end
end

class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :content
      t.references :author, index: true
      t.references :commentable, index: true
      t.string :commentable_type

      t.timestamps
    end
  end
end

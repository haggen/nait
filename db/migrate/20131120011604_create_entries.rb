class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.string :title
      t.text :description
      t.float :estimate
      t.references :author, :index => true
      t.references :project, :index => true
      t.references :status, :index => true

      t.timestamps
    end
  end
end

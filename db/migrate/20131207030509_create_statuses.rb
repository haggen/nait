class CreateStatuses < ActiveRecord::Migration
  def change
    create_table :statuses do |t|
      t.integer :sort, :index => true
      t.string :name
      t.string :color
      t.boolean :closing, :default => false
      t.references :project, :index => true

      t.timestamps
    end
  end
end

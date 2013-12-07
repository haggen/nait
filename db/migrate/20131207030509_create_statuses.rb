class CreateStatuses < ActiveRecord::Migration
  def change
    create_table :statuses do |t|
      t.string :name
      t.string :color
      t.boolean :closing, :default => false
      t.references :project

      t.timestamps
    end
  end
end

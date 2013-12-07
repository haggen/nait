class CreateLogs < ActiveRecord::Migration
  def change
    create_table :logs do |t|
      t.date :date
      t.float :value
      t.references :author, index: true
      t.references :entry, index: true
      t.references :project, index: true

      t.timestamps
    end
  end
end

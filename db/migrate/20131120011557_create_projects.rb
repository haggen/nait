class CreateProjects < ActiveRecord::Migration
  def change
    enable_extension :hstore

    create_table :projects do |t|
      t.string :name
      t.references :manager, index: true
      t.hstore :options

      t.timestamps
    end
  end
end

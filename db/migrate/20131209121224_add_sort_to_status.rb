class AddSortToStatus < ActiveRecord::Migration
  def change
    add_column :statuses, :sort, :integer
  end
end

class Status < ActiveRecord::Base
  belongs_to :project
  has_many :entries

  validates_presence_of :name, :color, :sort

  after_initialize do
    self.sort = project.statuses.order(:sort).reverse.first.sort + 1 if sort.nil?
  end

  def move_up
    arel = self.class.arel_table
    target = project.statuses.where(arel[:sort].lt(sort)).order(:sort).reverse.first

    if target
      target.update_attribute(:sort, sort)
      update_attribute(:sort, sort - 1)
    end
  end

  def move_down
    arel = self.class.arel_table
    target = project.statuses.where(arel[:sort].gt(sort)).order(:sort).first

    if target
      target.update_attribute(:sort, sort)
      update_attribute(:sort, sort + 1)
    end
  end
end

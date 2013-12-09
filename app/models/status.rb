class Status < ActiveRecord::Base
  belongs_to :project
  has_many :entries

  before_create do
    self.sort = self.class.order('sort desc').select(:sort).first.sort + 1
  end

  def move_up
    target = self.class.where('sort < ?', sort).order('sort desc').first

    if target
      target.update_attribute(:sort, sort)
      update_attribute(:sort, sort - 1)
    end
  end

  def move_down
    target = self.class.where('sort > ?', sort).order('sort asc').first

    if target
      target.update_attribute(:sort, sort)
      update_attribute(:sort, sort + 1)
    end
  end
end

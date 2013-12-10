class TimeRecord < ActiveRecord::Base
  include Authorable

  belongs_to :project
  belongs_to :entry

  validates_presence_of :value

  after_initialize do
    self.date = Date.today if date.nil?
  end
end

class Log < ActiveRecord::Base
  include Authorable

  belongs_to :project
  belongs_to :entry

  after_initialize do
    self.date = Date.today if date.nil?
  end
end

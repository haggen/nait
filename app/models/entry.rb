class Entry < ActiveRecord::Base
  include Authorable
  include Commentable

  belongs_to :project
  belongs_to :status

  has_many :logs

  validates_presence_of :title

  after_initialize do
    self.estimate = 0 if self.estimate.nil?
  end

  def log_sum
    logs.sum(:value)
  end
end

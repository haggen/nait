class Entry < ActiveRecord::Base
  include Authorable
  include Commentable

  belongs_to :project
  belongs_to :status

  has_many :logs

  validates_presence_of :title

  scope :open, -> do
    statuses = Status.arel_table
    entries = Entry.arel_table

    includes(:status).where statuses[:closing].eq(false).or(entries[:status_id].eq(nil))
  end

  def log_sum
    logs.sum(:value)
  end
end

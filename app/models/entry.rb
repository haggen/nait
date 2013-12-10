class Entry < ActiveRecord::Base
  include Authorable
  include Commentable

  belongs_to :project
  belongs_to :status

  has_many :time_records

  validates_presence_of :title

  scope :by_status, -> do
    statuses = Status.arel_table
    includes(:status).order(statuses[:sort].asc)
  end

  scope :open, -> do
    statuses, entries = Status.arel_table, Entry.arel_table
    includes(:status).where statuses[:closing].eq(false).or(entries[:status_id].eq(nil))
  end

  def time_recorded
    time_records.sum(:value)
  end
end

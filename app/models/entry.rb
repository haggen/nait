class Entry < ActiveRecord::Base
  include Authorable
  include Commentable

  belongs_to :project
  belongs_to :status

  has_many :logs
end

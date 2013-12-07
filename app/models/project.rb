class Project < ActiveRecord::Base
  include Commentable

  belongs_to :manager, :class_name => 'User'

  has_many :logs
  has_many :entries
  has_many :statuses
  has_many :memberships
  has_many :members, :through => :memberships, :source => :user

  def non_members
    User.all - members.to_a
  end
end

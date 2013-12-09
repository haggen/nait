class Project < ActiveRecord::Base
  include Commentable

  belongs_to :manager, :class_name => 'User'

  has_many :logs, :dependent => :destroy
  has_many :entries, :dependent => :destroy
  has_many :statuses, :dependent => :destroy
  has_many :memberships, :dependent => :destroy
  has_many :members, :through => :memberships, :source => :user

  validates_presence_of :name, :manager_id

  def non_members
    User.all - members.to_a
  end
end

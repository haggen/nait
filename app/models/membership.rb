class Membership < ActiveRecord::Base
  belongs_to :user
  belongs_to :project

  validates_presence_of :project
  validates_presence_of :user

  validates_associated :user, :if => :user_id_blank?
  accepts_nested_attributes_for :user, :reject_if => :user_id_not_blank?

  def user_id_blank?
    self.user_id.blank?
  end

  def user_id_not_blank?
    not user_id_blank?
  end
end

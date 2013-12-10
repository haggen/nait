class User < ActiveRecord::Base
  include Authenticable

  has_many :entries
  has_many :comments
  has_many :memberships
  has_many :projects, :through => :memberships
  has_many :logs

  validates_presence_of :name

  def short_name
    names = name.split
    names.first.concat names.size > 1 ? ' ' + names.last[0] : ''
  end

  def avatar(size = 32)
    hash = Digest::MD5.hexdigest(email)
    "//gravatar.com/avatar/#{hash}.jpg?s=#{size}"
  end
end

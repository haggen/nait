class Comment < ActiveRecord::Base
  include Authorable

  belongs_to :commentable, :polymorphic => true
end

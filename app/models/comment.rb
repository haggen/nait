class Comment < ActiveRecord::Base
  include Authorable

  belongs_to :commentable, :polymorphic => true

  default_scope -> do
    order(:created_at => :asc)
  end
end

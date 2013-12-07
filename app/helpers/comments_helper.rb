module CommentsHelper
  def commentable_comments_path(commentable)
    url_for [commentable, :comments]
  end

  def commentable_comment_path(commentable, comment)
    url_for [commentable, comment]
  end

  def new_commentable_comment_path(commentable)
    url_for [:new, commentable, :comments]
  end

  def edit_commentable_comment_path(commentable, comment)
    url_for [:edit, commentable, comment]
  end
end

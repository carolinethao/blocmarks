module UsersHelper
  def render_user_bookmarks(user)
    if user.bookmarks.count > 0
      render user.bookmarks
    else
      "#{user.email} has not submitted any bookmarks yet."
    end
  end
end

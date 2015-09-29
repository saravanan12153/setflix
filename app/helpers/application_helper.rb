module ApplicationHelper
  def page_title
    if content_for?(:title)
      "SetFlix - #{content_for(:title)}"
    else
      "Flix"
    end
  end
end

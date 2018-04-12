class StaticPagesController < ApplicationController
  def dashboard
    @recent_threads = ForumThread.last(5)
  end
end

class ForumThreadsController < ApplicationController
  before_action :authenticate_user!, except: [:index,:show]
  before_action :set_forum_thread, except: [:index,:new,:create, :category]

  def index
    query = params[:q].presence || "*"
    @forum_threads = ForumThread.search "#{query}"
  end

  def new
    @forum_thread = ForumThread.new
    @forum_thread.forum_posts.new
  end

  def create
    @forum_thread = current_user.forum_threads.new forum_thread_params
     @forum_thread.forum_posts.first.user_id = current_user.id
    if @forum_thread.save
      redirect_to @forum_thread
    else
      render action: :new
    end
  end

  def show
    @forum_posts = @forum_thread.forum_posts.order(created_at: :asc) 
    @forum_post = ForumPost.new
  end

  def edit
    if current_user != @forum_thread.user
      redirect_to @forum_thread, alert: "Permission Denied!"
    end
  end

  def update
    if current_user == @forum_thread.user
      @forum_thread.update_attributes(forum_thread_update_params)
      redirect_to @forum_thread
    else
      redirect_to @forum_thread, alert: "Permission Denied!"
    end
  end
  

  def category
    if params[:category] == "All"
      @category_threads = ForumThread.all
    else
    @category_threads = ForumThread.where(category: params[:category])
    end    
  end

  private

  def set_forum_thread
    @forum_thread = ForumThread.friendly.find(params[:id])
  end

  def forum_thread_params
    params.require(:forum_thread).permit(:subject,:category, first_forum_post: [:body], forum_posts_attributes: [:body])
  end

  def forum_thread_update_params
    params.require(:forum_thread).permit(:subject,:category)
  end

 
end

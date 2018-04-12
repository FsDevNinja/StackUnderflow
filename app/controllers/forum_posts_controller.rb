class ForumPostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_forum_thread, except: [:index,:new]
  before_action :set_forum_post, except: [:index,:create,:edit,:update, :new]
  
  def create
    @forum_post = @forum_thread.forum_posts.new forum_post_params
    @forum_post.user = current_user

    if @forum_post.save
      redirect_to @forum_thread, notice: "Successfully Posted!"
    else
      redirect_to @forum_thread, alert: "Unable to Save Your Post!"
    end
  end

  def edit
    @forum_post = ForumPost.find(params[:id])
    if current_user != @forum_post.user
      redirect_to @forum_thread, alert: "Permission Denied!"
    end
  end  

  def update
    @forum_post = ForumPost.find(params[:id])
    if current_user == @forum_post.user
      @forum_post.update_attributes(forum_post_params)
      redirect_to @forum_thread
    else
      redirect_to @forum_thread, alert: "Permission Denied!"
    end
    
  end

  def solved
    if current_user == @forum_thread.user
      @forum_thread.forum_posts.each do |post|
        post.update_attributes(solved: false)
      end
      @forum_post = ForumPost.find(params[:forum_post_id])
      @forum_post.update_attributes(solved: true)
    end
    redirect_to @forum_thread    
  end

  def unsolved
    if current_user == @forum_thread.user
      @forum_post = ForumPost.find(params[:forum_post_id])
      @forum_post.update_attributes(solved: false)
    end
    redirect_to @forum_thread
  end

  private

  def set_forum_thread
    @forum_thread = ForumThread.find(params[:forum_thread_id])
  end

  def set_forum_post
    @forum_post = ForumPost.find(params[:forum_post_id])
  end

  def forum_post_params
    params.require(:forum_post).permit(:body)
  end
end

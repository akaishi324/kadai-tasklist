class RelationshipsController < ApplicationController
  before_action :require_user_logged_in
  def create
    task = Task.find(params[:follow_id])
    current_user.favorite(task)
    flash[:success] = 'この投稿をお気に入り登録しました。'
    redirect_to user
  end

  def destroy
     task = Task.find(params[:follow_id])
    current_user.unfavorite(task)
    flash[:success] = 'お気に入り登録解除しました。'
    redirect_to user
  end
end

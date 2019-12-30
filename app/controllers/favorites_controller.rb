class FavoritesController < ApplicationController
  def create
    task = Task.find(params[:task_id])
  current_user.favorite(task)
  flash[:success] = "登録完了しました！"
  redirect_to root_path
  end

  def destroy
    task = Task.find(params[:task_id])
  current_user.unfavorite(task)
  flash[:success] = "登録解除しました！"
  redirect_to root_path
  end
end

class FavoritesController < ApplicationController
  include SessionsHelper
  
  def create
    @favorite = current_user.favorites.create(event_id: params[:event_id])
    #redirect_to events_url, notice: "#{favorite.event.user.name}さんのブログをお気に入り登録しました"
    redirect_to events_url
  end

  def destroy
    @favorite = current_user.favorites.find_by(event_id: params[:event_id]).destroy
    #redirect_to events_url, notice: "#{favorite.event.user.name}さんのブログをお気に入り解除しました"
    if params[:from_url] == 'user_profile'
      redirect_to user_path(current_user.id)
    else
      redirect_to events_url
    end
  end

end

class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @micropost = current_user.microposts.build
      
      #マイクロポストを取得
      #ユーザー情報をあらかじめ先読み
      @feed_items = current_user.feed_items.includes(:user).order(created_at: :desc)
    end
  end
end

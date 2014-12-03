get '/user/:id/matches' do
  @all_items = Item.all
  @all_users = User.all
  @all_likes = Like.all
  @my_likes = Like.where(user_id: current_user.id)
  @my_items = Item.where(user_id: current_user.id)

  @items_i_like = []
  @my_likes.each do |like|
    @all_items.each do |item|
      if like.item_id == item.id
        @items_i_like << item
      end
    end
  end

  @users_i_like = []
  @all_users.each do |user|
    @items_i_like.each do |item|
      if item.user_id == user.id
        @users_i_like << user
      end
    end
  end

  @likes_on_my_items = []
  @my_items_that_users_like = []
  @users_who_like_me = []
  @my_items.each do |item|
    @all_likes.each do |like|
      if item.id == like.item_id
        @likes_on_my_items << like
        @my_items_that_users_like << like.item
        @users_who_like_me << like.user
      end
    end
  end

  @matches = @users_i_like & @users_who_like_me


  erb :'/user/matches'
end

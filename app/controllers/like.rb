#LIKE
post '/like' do
  like = Like.create(item_id: params[:item_id], user: current_user)
  likes = like.item.likes.count
  item_id = like.item.id
  { :item_id => item_id, :likes => likes }.to_json
end

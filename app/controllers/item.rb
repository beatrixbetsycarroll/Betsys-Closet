get '/item/all' do
  @items = Item.all
  erb :'/item/all'
end

get '/item/:id' do
  if session[:user_id]
    @item = Item.find(params[:id])
    @user = @item.user
    erb :'/item/show'
  else
    redirect('/user/login')
  end
end



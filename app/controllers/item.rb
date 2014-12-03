get '/item/all' do
  @items = Item.all
  erb :'/item/all'
end

#upload a new item
get '/item/new' do
  if current_user
    erb :'item/new_form'
  else
    redirect("/login")
  end
end

post '/item' do
  p "**********"
  p params[:item]
  item = Item.new(params[:item])
  item.user_id = current_user.id
  tag = Tag.new(params[:tag])
  item.tags << tag

  if item.save
    redirect("/item/#{item.id}")
  else
    session[:error] = item.errors.messages
    redirect("/item/new")
  end
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

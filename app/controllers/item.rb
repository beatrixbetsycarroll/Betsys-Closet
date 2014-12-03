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

#upload a new item
get '/item/new' do
  if current_user
    erb :new_form
  else
    redirect("/login")
  end
end

post '/item' do
  item = Item.new(params[:entry])
  tag = Tag.new(params[:tag])
  item.tags << tag
  if entry.save
    redirect("/item/#{item.id}")
  else
    session[:error] = item.errors.messages
    redirect("/item/new")
  end
end

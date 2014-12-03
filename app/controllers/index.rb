get '/' do
  if session[:user_id]
    # redirect("user/#{session[:user_id]}")
    @items = Item.all
    @current_user = current_user
    erb :'item/all'
  else
  erb :'/user/login'
  end
end

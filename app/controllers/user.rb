#signup
get '/user/new' do
  erb :'/user/new'
end

post '/user' do
  @user = User.new(params[:user])
  if @user.save
    session[:user_id] = @user.id
    redirect("user/login")
    # redirect("/user/#{@user.id}")
  else
    session[:error] = @user.errors.messages
    redirect("user/new")
  end
end

#login
get '/user/login' do
  redirect("/") if session[:user_id]
  erb :'/user/login'
end

post '/user/login' do
  user = User.find_by(username: params[:user][:username]).try(:authenticate, params[:user][:password])

  if user
    session[:user_id] = user.id
    redirect("user/#{user.id}")
  else
    session[:errors] = "non-existent user"
    redirect('/')
  end
end

#logout
get '/user/logout' do
  session[:user_id] = nil
  redirect('/')
end

#user
get '/user/:id' do |id|
  @page_owner = User.find(id)
  # if id.to_i == session[:user_id]
  #   @items = @page_owner.items
  #   erb :'/user/profile'
  # else
    @user = User.find(id)
    @items = @user.items
    erb :'/user/show'
  # end
end








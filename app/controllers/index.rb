get '/' do
  if session[:user_id]
    redirect("user/#{session[:user_id]}")
  else
  erb :'/user/login'
  end
end

get '/user/' do
 "hellow worl"
end

get '/user/:id' do
 "hello user!"
end

get '/user/login' do
  erb :'/user/login'
end

get '/user/signup' do
  erb :'/user/signup'
end

post '/user/signup' do
  @user = User.new(params[:user])
  if @user.save
    session[:user_id] = @user.id
    redirect("/user/#{@user.id}")
  else
    session[:error] = @user.errors.messages
    redirect("/signup")
  end
end

# Homepage (Root path)


helpers do
  def user_logged_in?
    session[:email] && session[:email] != ""
  end
 
  def get_current_user
    if user_logged_in?
      User.find_by_email(session[:email])
    end
  end
end
 
get '/' do
  erb :index
end


 
get '/login' do
  erb :'login'
end
 
post '/login' do
  @user = User.find_by_email(params[:email])
 
  if @user
    session[:email] = @user.email
    redirect '/'
  end
end
 
get '/logout' do
  session[:email] = ""
  redirect '/'
end




get '/users/new' do
  @user = User.new
  erb :'users/new'
end

post '/users/new' do
   @user = User.new(
    name: params[:name],
    email: params[:email],
    password: params[:password]
  )
  if @user.save
    redirect '/music'
  else
    erb :'users/new'
  end
end

get '/music' do
  @songs = Song.all
  erb :'music/index'
end

post '/music' do
  @song = Song.new(
    title: params[:title],
    artist: params[:artist],
    url:  params[:url]
  )
  if @song.save
    redirect '/music'
  else
    erb :'music/new'
  end
end

get '/music/new' do
  @song = Song.new
  erb :'music/new'
end

get '/music/:id' do
  @song = Song.find params[:id]
  erb :'music/show'  
end


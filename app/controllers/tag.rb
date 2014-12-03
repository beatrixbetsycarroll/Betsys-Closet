get '/search' do
  p "**********"
  p params[:query]

  @tag_name = Tag.find_by(tag: params[:query]).tag
  @all_tags = Tag.all
  @tag_instances = Tag.where(tag: params[:query])

  @tag_items = []
  @tag_instances.each do |searched_tag|
    @all_tags.each do |tag|
      if searched_tag.tag == tag.tag
        @tag_items += tag.items
      end
    end
  end

  if @tag_instances
    erb :'/tag/show'
  else
    session[:error] = "No searches match that tag!"
    redirect "/"
  end
end


get '/tag/all' do
  @all_tags = Tag.all
  erb :'/tag/all'
end

get '/tag/:tag/show' do

  @tag_name = Tag.find_by(tag: params[:tag]).tag
  @all_tags = Tag.all
  @tag_instances = Tag.where(tag: params[:tag])

  @tag_items = []
  @tag_instances.each do |searched_tag|
    @all_tags.each do |tag|
      if searched_tag.tag == tag.tag
        @tag_items += tag.items
      end
    end
  end


  erb :'/tag/show'
end

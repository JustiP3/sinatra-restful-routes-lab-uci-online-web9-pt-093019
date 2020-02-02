class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do 
    @recipes = Recipe.all 
    erb :index 
  end 

  get '/new' do 
    erb :new 
  end 

  post '/new' do 
    @recipe = Recipe.new 
    @recipe.name = params[:name]
    @recipe.ingredients = params[:ingredients]
    @recipe.cook_time = params[:cook_time]
    @recipe.save 
    redirect "/#{@recipe.id}"
  end 

  get '/:id' do
    @recipe = Recipe.find_by(:id => params[:id])
    erb :show 
  end
end

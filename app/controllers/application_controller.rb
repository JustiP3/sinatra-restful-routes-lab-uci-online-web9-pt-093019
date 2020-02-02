class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    redirect '/recipes'
  end

  get '/recipes' do
    @recipes = Recipe.all
    erb :index
  end

  get '/recipes/new' do
    erb :new
  end

  post '/recipes/new' do
    @recipe = Recipe.new
    @recipe.name = params[:name]
    @recipe.ingredients = params[:ingredients]
    @recipe.cook_time = params[:cook_time]
    @recipe.save
    redirect "/recipes/#{@recipe.id}"
  end

  get '/recipes/delete' do

  end

  get '/recipes/:id/edit' do 
    @recipe = Recipe.find(params[:id])
    erb :edit 
  end 

  get '/recipes/:id' do
    @recipe = Recipe.find_by(:id => params[:id])
    erb :show
  end
end

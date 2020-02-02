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

  post '/recipes/' do
    @recipe = Recipe.new(params)
    if @recipe.save    
      binding.pry
      redirect "/recipes/#{@recipe.id}"
    else 
      redirect "/recipes"
    end 
  end

  get '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    erb :show
  end

  get '/recipes/:id/edit' do
    @recipe = Recipe.find(params[:id])
    erb :edit
  end


  delete '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    @recipe.delete
  end


end

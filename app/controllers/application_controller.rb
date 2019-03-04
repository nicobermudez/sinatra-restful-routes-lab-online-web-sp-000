require "./config/environment"

class ApplicationController < Sinatra::Base

  set :views, Proc.new { File.join(root, "../views/") }
  
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # code actions here!

  get '/recipes/new' do
    erb :new
  end

  get '/recipes' do
    @recipes = Recipes.all
    erb :index
  end

  post '/recipes' do
    @recipe = Recipe.create(params)
    redirect to '/recipes/#{recipe.id}'
  end




end

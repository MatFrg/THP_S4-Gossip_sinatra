# require 'bundler'
# Bundler.require
require 'gossip'

class ApplicationController < Sinatra::Base
##Dans cette partie, nous avons créé une classe ApplicationController qui hérite (<) de la classe Sinatra::Base. 
##Grâce à l'héritage, ApplicationController aura toutes les fonctionnalités que propose la classe Sinatra::Base (= toutes les fonctionnalités de base de Sinatra).

  # get '/' do
  #   "<html><head><title>The Gossip Project</title></head><body><h1>Mon super site de gossip !</h1></body></html>"
  # end

  get '/' do 
  	erb :index, locals: {gossips: Gossip.all} #une méthode locals, qui permet d'envoyer à notre fichier ERB des variables que l'on utilisera. Ici on veut lui envoyer l'array obtenu par Gossip.all
  end
  ##Sinatra comprend tout seul qu'il doit aller chercher le fichier index.erb rangé dans le dossier /views.

  get '/gossips/new/' do
  	erb :new_gossip
  end

  post '/gossips/new/' do
  Gossip.new(params["gossip_author"], params["gossip_content"]).save
  redirect '/'
	end


	get '/gossips/:id/' do
		erb :show , locals: {id: params["id"], gossip: Gossip.find(params["id"].to_i)}
		#Gossip.find(params["id"].to_i)
	end


  # run! if app_file == $0
  ##elle permet d’exécuter le code de la classe sans avoir à écrire un ApplicationController.new.perform en bas du fichier.
end
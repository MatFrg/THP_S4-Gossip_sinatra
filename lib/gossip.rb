require 'csv'
require 'pry'

class Gossip
	attr_accessor :auteur, :description 

	def initialize(auteur, description)
	@auteur = auteur.to_s
	@description = description.to_s
	end


	def save
		CSV.open("./db/gossip.csv", "ab") do |csv|
    csv << [auteur, description]
  	end
	end

	def self.all
		all_gossips = Array.new

		CSV.read("./db/gossip.csv").each do |csv|
    	all_gossips << Gossip.new(csv[0],csv[1])
  	end 

  	return all_gossips
	end

	def self.find(id)
		CSV.read("./db/gossip.csv")[id]
	end

end






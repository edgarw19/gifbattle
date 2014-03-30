class GifsController < ApplicationController

	def choose
		rand_id = rand(Gif.count)
		@gif1 = Gif.first(:conditions => [ "id >= ?", rand_id])
		@gif2 = Gif.first(:conditions => [ "id >= ?", rand_id])
		if @gif1.id == @gif2.id 
			@gif2 = Gif.first(:order => 'Random()')
		end
		total = (@gif1.votes+@gif2.votes)
		number_one = (@gif1.votes/total*100)
		number_two = (@gif2.votes/total*100)
		@gif1.update_attribute(:votes, number_one)
		@gif2.update_attribute(:votes, number_two)
	end


	def index
		@gifs = Gif.order("cached_votes_up DESC").limit(10)
	end

	

	def new
		@gif = Gif.new

	end

	def create
		@gif = Gif.new(params[:gif])
		if @gif.save
			redirect_to root_path
		else
			render 'new'
		end
	end

	def show
		@gif = Gif.find(params[:id])
		rand_id = rand(Gif.count)
		@gif1 = Gif.first(:conditions => [ "id >= ?", rand_id])
		@gif2 = Gif.first(:conditions => [ "id >= ?", rand_id])
		if @gif1.id == @gif2.id 
			@gif2 = Gif.first(:order => 'Random()')
		end

	end

	def like
		@gif = Gif.find(params[:id])
		rand_id = rand(Gif.count)
		@gif1 = Gif.first(:conditions => [ "id >= ?", rand_id])
		@gif2 = Gif.first(:conditions => [ "id >= ?", rand_id])
		total = (@gif1.votes+@gif2.votes)
		number_one = (@gif1.votes/total*100)
		number_two = (@gif2.votes/total*100)
		@gif1.update_attribute(:votes, number_one)
		@gif2.update_attribute(:votes, number_two)
		redirect_to gif_path
	end

end

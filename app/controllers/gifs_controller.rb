class GifsController < ApplicationController
	
	def choose
		rand_id = rand(Gif.count)
		@gif1 = Gif.first(:conditions => [ "id >= ?", rand_id])
		@gif2 = Gif.first(:conditions => [ "id >= ?", rand_id])
		if @gif1.id == @gif2.id 
			@gif2 = Gif.first(:order => 'Random()')
		end
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
	end

	def like
		@gif = Gif.find(params[:id])
		@gif.votes.up
		redirect_to gif_path
	end

end

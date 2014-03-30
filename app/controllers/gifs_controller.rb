class GifsController < ApplicationController
  def choose
  	@gif1 = Gif.first(:order => 'Random()')
  	@gif2 = Gif.first(:order => 'Random() * .9')
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

  def like
		@gif = Gif.find(params[:id])
		@gif.liked_by current_user
		redirect_to questions_path
	end

end

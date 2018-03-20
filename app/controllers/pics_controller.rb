class PicsController < ApplicationController

	before_action :load_pic, only: [:show, :edit, :update]

	def index
	end

	def new
		@pic = Pic.new
	end

	def create
		@pic = Pic.new(pic_params)
	end

	def show
	end

	def destroy
	end

	def edit
	end

	def update
	end

	private
	def load_pic
		@pic = Pic.find(params[:id])
	end

	def pic_params
		params.require(:pic).permit(:title, :description)
	end

end
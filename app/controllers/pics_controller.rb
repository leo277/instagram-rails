class PicsController < ApplicationController

	before_action :load_pic, only: [:show, :edit, :update, :destroy]

	def index
		@pics = Pic.all.order("created_at DESC")
	end

	def new
		@pic = Pic.new
	end

	def create
		@pic = Pic.new(pic_params)
		if @pic.save
			redirect_to @pic, notice: "The pic is posted!"
		else
			render :new
		end
	end

	def show

	end

	def destroy
		@pic.destroy
		redirect_to root_path, :notice => "Pic deleted"
	end

	def edit
	end

	def update
		if @pic.update_attributes(pic_params)
			redirect_to @pic, :notice => "Pic is updated"
		else
			render :edit
		end
	end

	private
	def load_pic
		@pic = Pic.find(params[:id])
	end

	def pic_params
		params.require(:pic).permit(:title, :description)
	end

end
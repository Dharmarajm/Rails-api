class InfosController < ApplicationController

	def index
		@infos=Info.all
		render json: @infos
	end

	def show
		@info=Info.find(params[:id])
		render json: @info
	end

	def create
		@info=Info.new(info_params)
        
        if @info.user_id.present?
		 if @info.save
		 	render json:@info,status: :created
		 elsif Info.exists?(:phone_number => params[:phone_number])
		 	render json: "Phone Number should be unique"
		 else
		 	render json: "name already present"
		 end	
        else
        	render json: {data:[{ error: "user_id isn't present"}] } ,status: 401
        end
	end

	def update
		@info=Info.find(params[:id])
		@info.update(info_params)
		render json: @info
	end

	def destroy
		@info=Info.find(params[:id])
		@info.destroy
		render json: {data:[{ success: "Given ID: "+params[:id]+" deleted suceessfully"}]}
	end

	private

	def info_params
		params.require(:info).permit( :name, :phone_number , :location, :user_id)
	end
end

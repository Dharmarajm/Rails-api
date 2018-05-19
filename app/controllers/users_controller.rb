class UsersController < ApplicationController
	
	def index
		@users=User.all
		@info = Info.all
		render json: {data1: @users }#, data2: @info
	end

	def show
		#user = []
		@user = User.find(params[:id])
		#@info = Info.where(user_id:params[:id])
		#user << @user.as_json.merge({"info" => Info.where(user_id:params[:id]), "user" => User.find(params[:id])})
		render json: { data: @user }
    end


	def create
		@user=User.new(user_params)
		if @user.save
			render json:@user,status: :created
		elsif User.where(:name => params[:name]).present?
			render json: "name should be unique"
		else 
			render json: { data:[ {error: "email already present"} ] }, status: 401 
		end	

	end

	def update
		@user=User.find(params[:id])
		@user.update(user_params)
		render json: @user
	end

	def destroy
		@user=User.find(params[:id])
		@user.destroy
		render json: { data:[ {error: "Given ID: "+params[:id]+" deleted successfully"} ] }
	end

	private

	def user_params
		params.require(:user).permit( :name, :email , :password)
	end

end


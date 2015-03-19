class Dashboard::CollaboratorsController < ApplicationController
	def create
		@collection = current_user.collections.find(params[:collection_id])
		@new_friend = @collection.collaborators.new(collaborator_params)

		if @new_friend.save
			redirect_to [:dashboard, @collection], notice: "Friend added to collection"
		else
			flash[:error] = "Could not add friend"
			redirect_to add_friend_dashboard_collection_path(@collection)	
		end
	end

	private

	def collaborator_params
		params.require(:collaborator).permit(:username)
	end
end

class Dashboard::CollectionsController < ApplicationController
	def show
		@collection = current_user.collections.find(params[:id])
	end

	def new
		@collection = current_user.collections.new
	end

	def create
		@collection = current_user.collections.new(collection_params)

		if @collection.save
			redirect_to([:dashboard, @collection], notice: "\"#{@collection.title}\" created")
		else
			flash.now[:error] = "Could not create collection"
			render action: "new"
		end
	end

	private

	def collection_params
		params.require(:collection).permit(:title)
	end
end

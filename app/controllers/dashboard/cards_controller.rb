class Dashboard::CardsController < ApplicationController
	def show
		@card = Card.find(params[:id])
	end

	def new
		@collection = Collection.find_by_id(params[:collection_id])
		@new_card = @collection.cards.build
	end

	def create
		@collection = Collection.find_by_id(params[:collection_id])
		@card = @collection.cards.new(card_params)

		if @card.save
			redirect_to [:dashboard, @collection], notice: "Card saved"
		else
			flash.now[:error] = "Could not save card"
			render action: "new"
		end
	end

	private

	def card_params
		params.require(:card).permit(:image, :title)
	end
end

class CardsController < ApplicationController
	def show
		@card = Card.find(params[:id])
	end

	def new
		@card = Card.new
	end

	def create
		@card = current_user.cards.new(card_params)

		if @card.save
			redirect_to @card, notice: "Card saved"
		else
			flash.now[:error] = "Could not save card"
			render action: "new"
		end
	end

	private

	def card_params
		params.require(:card).permit(:image)
	end
end

class CardListsController < ApplicationController
  before_action :authenticate_user!

  def new
    @card_list = CardList.new
  end

  def create
    @card_list = current_user.card_lists.build(card_list_params)
    if @card_list.save
      flash[:notice] = 'Collection created!'
      redirect_to card_lists_path
    else
      render :new
    end
  end

  def index
    @card_lists = current_user.card_lists
  end

  private

  def card_list_params
    params.require(:card_list).permit(:name, :description)
  end
end

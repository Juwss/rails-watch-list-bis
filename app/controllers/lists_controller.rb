class ListsController < ApplicationController
  # En tant qu’utilisateur, je peux voir toutes mes listes de films.
  def index
    @lists = List.all
    @movies = Movie.all
  end

  # En tant qu’utilisateur, je peux créer une liste de films.
  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    @list.user = current_user
    if @list.save
      redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  # En tant qu’utilisateur, je peux voir les détails d’une liste de films.
  def show
    @list = List.find(params[:id])
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end
end

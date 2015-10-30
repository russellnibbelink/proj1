class TrainersController < ApplicationController
  before_filter :authenticate_trainer!

  def index
    @trainers = Trainer.all
  end

  def show
    @trainer = Trainer.find(params[:id])
    @pokemons = Pokemon.where(trainer_id: @trainer.id)
    if @trainer == current_trainer
      @show_button = true
    else
      @show_button = false
    end
  end

end

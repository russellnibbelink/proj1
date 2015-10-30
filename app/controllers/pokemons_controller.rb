class PokemonsController < ApplicationController
  def capture
    @pokemon = Pokemon.find(params[:id])
    @pokemon.trainer_id = current_trainer.id
    @pokemon.save
    redirect_to root_path
  end

  def damage
    @pokemon = Pokemon.find(params[:id])
    @trainer = Trainer.find(@pokemon.trainer_id)
    @pokemon.health -= 10
    if @pokemon.health <= 0
      @pokemon.destroy
    else
      @pokemon.save
    end
    redirect_to @trainer
  end

  def new
    @pokemon = Pokemon.new
  end

  def create
    values = params[:pokemon]
    @pokemon = Pokemon.new
    @pokemon.name = values[:name]
    @pokemon.level = 1
    @pokemon.health = 100
    @pokemon.trainer_id = current_trainer.id
    if @pokemon.save
      redirect_to Trainer.find(current_trainer.id)
    else
      flash[:error] = @pokemon.errors.full_messages.to_sentence
      redirect_to :action => "new"
    end
  end
end

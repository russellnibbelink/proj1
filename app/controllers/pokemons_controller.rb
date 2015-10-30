class PokemonsController < ApplicationController
  def capture
    @pokemon = Pokemon.find(params[:id])
    puts 'hello'
    puts @pokemon
    puts current_trainer
    @pokemon.trainer_id = current_trainer.id
    puts @pokemon.trainer_id
    @pokemon.save
    redirect_to root_path
  end
end

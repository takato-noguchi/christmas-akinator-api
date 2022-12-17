class GamesController < ApplicationController

  def new
  end
  
  # 新しいゲームがスタートさせる
  def create
    game = Game.create!(status: 'in_progress')
    if game.save
        render json: game
    else
        render json: game.errors, status: 422
    end
  end


  def challenge
    current_game = Game.find(params[:id])
    extract_presents =  ExtractionAlgorithm.new(current_game).compute
    render json: extract_presents.first
  end

  def give_up
  end

  def update
    current_game = Game.find(params[:id])

    if params[:correct].present?
      current_game.status = 'finished'
      current_game.result = :correct
      current_game.save!

      render json: current_game
    else
      current_game.status = 'finished'
      current_game.result = :incorrect
      current_game.save!

      render json: current_game
    end
  end

  def correct
  end
end

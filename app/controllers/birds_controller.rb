class BirdsController < ApplicationController
  def index
    @birds = Bird.all
    render json: @birds
  end

  def show
    bird = Bird.find_by(id: params[:id])
    if bird
      render json: bird.to_json(except: [:created_at, :updated_at])
    else
      render json: {message: 'Bird not found'}
    end
  end
end
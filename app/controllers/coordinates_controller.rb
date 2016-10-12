class CoordinatesController < ApplicationController
  before_filter :authenticate_user!, except: [:index]

  def index
  end

  def main
    if params[:show].nil?

      @time_start = (Time.now - 1.minute)
      @time_finish = Time.now
      @date = Date.today

    else

      @date = Date.parse(params[:show].to_a.sort.collect { |c| c[1] }.join('-'))
      @time_start = @date
      @time_finish = @date.tomorrow

  end

    @coordinates = Coordinate.where(user_id: current_user.id, created_at: @time_start..@time_finish)
  end

  def create
    @coordinate = Coordinate.new(coordinate_par.merge(user_id: current_user.id))
    respond_to do |format|
      if @coordinate.save
        format.json { render :show, status: :created, location: @coordinate }
      else
        format.json { render json: @coordinate.errors, status: :unprocessable_entity }
      end
    end
  end

  def coordinate_par
    params.require(:coordinate).permit(:latitude, :longitude)
  end
end

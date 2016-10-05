class CoordinatesController < ApplicationController
before_filter :authenticate_user!, except: [:index]


  def index

  end

  def main
    
    if params[:show].nil? then 
    
    @time_start = (Time.now - 1.minute)
    @time_finish = Time.now
    @date=Date.today

    else 

    @date = Date.parse(params[:show].to_a.sort.collect{|c| c[1]}.join("-")) || 1
    @time_start = @date
    @time_finish = @date+1.day

    end 
    
    @coordinates = Coordinate.where(email: current_user.email, time: @time_start..@time_finish)
    
  end

  # POST /coordinates
  # POST /coordinates.json
  def create
    @coordinate = Coordinate.new(coordinate_par.merge({email: current_user.email}))

    respond_to do |format|
      if @coordinate.save
        format.html { redirect_to @coordinate, notice: 'Coordinate was successfully created.' }
        format.json { render :show, status: :created, location: @coordinate }
      else
        format.html { render :new }
        format.json { render json: @coordinate.errors, status: :unprocessable_entity }
      end
    end
  end

    def coordinate_par
      params.require(:coordinate).permit(:latitude, :longitude, :time)
    end
end

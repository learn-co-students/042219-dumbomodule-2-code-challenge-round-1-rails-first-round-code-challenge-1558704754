class PowersController < ApplicationController
  before_action :get_power

  def index
    @powers = Power.all
  end

  def new
    @power = Power.new(power_params)
  end

  def create
    @power = Power.new(power_params)
    if @power.valid?
      @power.save
      redirect_to @power
    else
      render :new
    end
  end

  private


  def power_params
      params.require(:power).permit(:name, :description)
  end

  def get_power
    @power= Power.find_by(params[:id])
  end

end

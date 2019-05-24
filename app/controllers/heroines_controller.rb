class HeroinesController < ApplicationController
  before_action :get_heroine

  def index
    @heroines = Heroine.all
  end

  def new
    @heroine = Heroine.new
  end

  def create
    @heroine = Heroine.create(heroine_params)
    if @heroine.valid?
      # @heroine.save
      redirect_to heroine_path(@heroine)
    else
      flash[:error] = @heroine.errors.full_messages
      render 'new'
    end
  end

  private

  def heroine_params
    params.require(:heroine).permit(:name, :super_name, :power_id)
  end

  def get_heroine
    @heroine = Heroine.find_by(params[:id])
  end

end

class HeroinesController < ApplicationController
  before_action :get_heroine, only: [:show, :edit, :update, :destroy]

  def index
    @heroines = Heroine.all
  end

  def new
    @heroine = Heroine.new
  end

  def show
  end
  def create
    @heroine = Heroine.create(heroine_params)
    if @heroine.valid?
      # @heroine.save
      redirect_to @heroine
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
    @heroine = Heroine.find(params[:id])
  end

end

class WineriesController < ApplicationController
  before_action :set_winery, only: [:show, :edit, :update, :destroy]
  respond_to :html

  def index
    @wineries = Winery.all
    respond_with(@wineries)
  end

  def show
    respond_with(@winery)
  end

  def new
    @winery = Winery.new
    respond_with(@winery)
  end

  def edit
  end

  def create
    @winery = Winery.new(winery_params)
    flash[:notice] = "Welcome, #{@winery.name}" if @winery.save
    respond_with(@winery)
  end

  def update
    @winery.update(winery_params)
    respond_with(@winery)
  end

  def destroy
    @winery.destroy
    respond_with(@winery)
  end

  private

    def set_winery
      @winery = Winery.find(params[:id])
    end

    def winery_params
      params.require(:winery).permit(:name)
    end
end

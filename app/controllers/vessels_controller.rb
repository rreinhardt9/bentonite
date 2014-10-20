class VesselsController < ApplicationController
  before_action :set_vessel, only: [:show, :edit, :update, :destroy]
  respond_to :html

  def index
    @vessels = Vessel.all
    respond_with(@vessels)
  end

  def show
    respond_with(@vessel)
  end

  def new
    @vessel = Vessel.new
    respond_with(@vessel)
  end

  def edit
  end

  def create
    @vessel = Vessel.new(vessel_params)
    @vessel.save
    respond_with(@vessel)
  end

  def update
    @vessel.update(vessel_params)
    respond_with(@vessel)
  end

  def destroy
    @vessel.destroy
    respond_with(@vessel)
  end

  private
    def set_vessel
      @vessel = Vessel.find(params[:id])
    end

    def vessel_params
      params.require(:vessel).permit(:name, :capacity, :active, :winery_id)
    end
end

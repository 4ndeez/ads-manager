class AdvertisementsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_ad, only: %i[show edit update destroy]

  def index
    @ads = Advertisement.all
  end

  def show; end

  def new
    @ad = Advertisement.new
  end

  def create
    @ad = Advertisement.new(ad_params)
    if @ad.save
      render :show, data: @ad
    else
      render :new
    end
  end

  def edit; end

  private

  def set_ad
    @ad = Advertisement.find(params[:id])
  end

  def ad_params
    params.require(:advertisement).permit(:name, :description, :user_id, images: [])
  end
end

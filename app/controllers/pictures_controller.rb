class PicturesController < ApplicationController
  def index
      @msg = "Pictures data"
      #@picture = Picture.new
      @data =Picture.all
      #modelクラス名
  end
  
  def add
      @msg = "add new data"
      @picture = Picture.new
  end

  protect_from_forgery

  def create
      if request.post? then
          Picture.create(picture_params)
      end
  redirect_to '/pictures'
  end

  def edit
      @msg = "edit data.[id = " + params[:id] + "]"
      @picture = Picture.find(params[:id])
  end

  def update
      obj = Picture.find(params[:id])
      obj.update(picture_params)
      redirect_to '/pictures'
  end

  def delete
      obj = Picture.find(params[:id])
      obj.destroy
      redirect_to '/pictures'
  end

  private

  def picture_params
      params.require(:picture).permit(:title,:file)
  end

  #redirect_to '/pictures'

end

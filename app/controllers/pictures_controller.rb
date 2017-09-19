class PicturesController < ApplicationController
  def index
      @msg = "simple db"
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

  #def csv_download
  #    @picture = Picture.all
  #    send_data render_to_string, filename:'data.csv', type: :csv
  #end
  
  def csv_download
      @picture = Picture.all
      f = File.open('./app/assets/db.csv','w')
      @picture.each do |obj|
        f.print(obj.file)
        f.print(',')
      end
      f.close
  end

  private

  def picture_params
      params.require(:picture).permit(:title,:file)
  end

  #redirect_to '/pictures'

end

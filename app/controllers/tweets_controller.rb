class TweetsController < ApplicationController
  def index
    @tweets = Tweet.all
    logger.debug("******")#コンソールに表示される
  end

  def new
    @tweet = Tweet.new
  end

  def create
    file = params[:tweet][:file].read
    @tweet = Tweet.new(message: params[:tweet][:message], file: file, tdate: Time.current)
    if @tweet.save
      flash[:notice] = "ツイートに成功しました"
      redirect_to "/" #action: :indexでも可、またはroot_path
    else
      render "new"
    end
  end

  def show
    @tweet = Tweet.find(params[:id])
  end

  def edit
    @tweet = Tweet.find(params[:id])
  end

  def update
    tweet = Tweet.find(params[:id])
    tweet.update(message: params[:tweet][:message])
    flash[:notice] = "ツイート内容を更新しました"
    redirect_to "/"
  end

  def destroy
    tweet = Tweet.find(params[:id])
    tweet.destroy
    flash[:notice] = "ツイートを削除しました"
    redirect_to action: :index
  end
  
  def get_image
    image = Tweet.find(params[:id])
    send_data image.file, disposition: :inline, type: "image/png"
  end
end
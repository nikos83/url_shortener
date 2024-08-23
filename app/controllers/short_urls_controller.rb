class ShortUrlsController < ApplicationController
  before_action :authenticate_user!, except: [:show]

  def index
    @short_urls = current_user.short_urls
  end

  def new
    @short_url = ShortUrl.new
  end

  def create
    @short_url = current_user.short_urls.new(short_url_params)
    if @short_url.save
      redirect_to short_urls_path, notice: 'Short URL was successfully created.'
    else
      render :new
    end
  end

  def show
    @short_url = ShortUrl.find_by(short_code: params[:short_code])
    if @short_url
      redirect_to @short_url.original_url, allow_other_host: true
    else
      render plain: "URL not found", status: :not_found
    end
  end

  private

  def short_url_params
    params.require(:short_url).permit(:original_url)
  end
end

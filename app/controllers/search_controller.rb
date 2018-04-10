class SearchController < ApplicationController
  def new
    @query = Query.new(params[:q])
  end

  def results
    @query = Query.new(params[:q])
    respond_to do |format|
      format.json { render :results, status: :success, location: @query }
    end
  end

  def photo
    @photo = flickr.photos.getInfo(params[:id])
    respond_to do |format|
      format.json { render :photo, status: :success, location: @photo }
    end
  end
end

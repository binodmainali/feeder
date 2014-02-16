class FeedsController < ApplicationController
  include FeedsHelper
  before_action :set_feed, only: [:show, :edit, :update, :destroy]

  # GET /feeds
  def index
    @feeds = Feed.latest
    @feed = Feed.new
  end

  # GET /feeds/1
  def show
  end

  # GET /feeds/new
  def new
    @feed = Feed.new
    @feeds = Feed.latest
  end

  # GET /feeds/1/edit
  def edit
  end

  def check_input
    require 'uri'
       u = URI.parse(feed_params["link"] )
       if !u.host.nil?
          create
        else
          q = "%" + feed_params["link"] + "%"      
          @results = Feed.search(q)
        end
      rescue Exception => e
        q = "%" + feed_params["link"] + "%"      
        @results = Feed.search(q)
  end

  # POST /feeds
  def create
      @feed = Feed.find_or_initialize_by(feed_params)
      processed_feed = @feed.process_url(@feed.link)
      @feed = update_feed_object(@feed, processed_feed)
      if processed_feed.class.ancestors.include?(Feedzirra::FeedUtilities) && @feed.save! 
        FeedItem.process_and_save_feed(processed_feed.entries, @feed.id)
        @feed.user_ids = [current_user.id] if user_signed_in?
        redirect_to @feed, notice: 'Feed was successfully created.'
      else
        flash[:notice] = "Error parsing feed"
        render action: 'new', notice: "Invalid Rss Feed url"
      end
  end

  # PATCH/PUT /feeds/1
  def update
    if @feed.update_attributes(feed_params)
      if request.xhr?
        render :json => {"result" => "Category Updated Successfully"}
      else
        redirect_to @feed, notice: 'Feed was successfully updated.'
      end
      
    else
      render action: 'edit'
    end
  end

  # DELETE /feeds/1
  def destroy
    @feed.destroy
    redirect_to feeds_url, notice: 'Feed was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_feed
      @feed = Feed.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def feed_params
      params.require(:feed).permit(:title, :description, :image, :last_build_date, :published_at, :link, :category)
    end
end

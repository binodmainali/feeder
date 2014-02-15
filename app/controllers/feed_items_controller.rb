class FeedItemsController < ApplicationController
  before_action :set_feed_item, only: [:show, :edit, :update, :destroy]

  # GET /feed_items
  def index
    @feed_items = FeedItem.all
  end

  # GET /feed_items/1
  def show
  end

  # GET /feed_items/new
  def new
    @feed_item = FeedItem.new
  end

  # GET /feed_items/1/edit
  def edit
  end

  # POST /feed_items
  def create
    @feed_item = FeedItem.new(feed_item_params)

    if @feed_item.save
      redirect_to @feed_item, notice: 'Feed item was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /feed_items/1
  def update
    if @feed_item.update(feed_item_params)
      redirect_to @feed_item, notice: 'Feed item was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /feed_items/1
  def destroy
    @feed_item.destroy
    redirect_to feed_items_url, notice: 'Feed item was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_feed_item
      @feed_item = FeedItem.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def feed_item_params
      params.require(:feed_item).permit(:name, :summary, :url, :published_at, :guid)
    end
end

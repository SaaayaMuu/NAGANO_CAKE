class Admin::ItemsController < ApplicationController
  
  before_action :authenticate_admin!
  
  def new
    @item = Item.new
  end
  
  def create
    @item = Item.new(item_params)
    if @item.save
    redirect_to admin_item_path(@item.id)
    else
      render :new
    end
  end
  
  def index
    @items = Item.page(params[:page])
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end
  
  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    redirect_to admin_item_path(@item.id)
  end
  
  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to admin_items_path
  end
  
  private
  
  def item_params
    params.require(:item).permit(:name, :introduction, :image, :genre, :price, :genre_id, :is_active)
  end

end

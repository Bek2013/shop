class ItemsController < ApplicationController
  # GET: Список товаров
  before_filter :authenticate_user!, except: [:index, :show]


  def   index
   @items = Item.all
  end

  # GET: Форма создания
  def new
    @item = Item.new
  end

  #POST: Процесс создания
  def create

    @item = Item.new(params[:item].permit(:name, :description, :price, :category_id))
    if @item.save
      redirect_to items_path, notice: 'Item was successfully created.'
    else
      render action: "new"
    end
  end

  #GET: Процесс редактирования
  def edit
    @item = Item.find params[:id]
  end

  #PUT: Процесс обновления
  def update
    @item = Item.find(params[:id])

    if @item.update_attributes(params[:item].permit(:name, :description, :price, :category_id))
      redirect_to @item, notice: 'Item was successfully updated.'
    else
      render action: "edit"
    end
  end

  #GET: Просмотр
  def show
    @item = Item.find params[:id]
    @comment = Comment.new item_id: @item.id

  end

  #DELETE: Процесс удаления
  def destroy
    item = Item.find params[:id]  #Найти товар
    item.destroy
    redirect_to items_path, notice: 'Item deleted' #Вернуться в список товаров
  end

end

class Category < ActiveRecord::Base
  validates :name, :description, :presence  => true
  #nullify если категорию снести, айди товаров станет нуль и можно его потом изменить и присобачить товары к какой нить категории
  has_many :items, dependent: :nullify


end

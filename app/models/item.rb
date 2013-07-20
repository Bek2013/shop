class Item < ActiveRecord::Base
  validates :name, :description, :price, :presence => true
  validates_length_of :name, :minimum => 2
  validates :price, :numericality => {
      :greater_than => 0,
      :only_integer => true
  }

  belongs_to :category
  has_many :comments
  has_many :item_users
  has_many :item_orders, dependent: :destroy

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/assets/missing-item.png"

end

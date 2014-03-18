class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :name, presence: true   

  has_many :listings, dependent: :destroy 
  has_many :sales, class_name: "Buy", foreign_key: "seller_id" 
  has_many :purchases, class_name: "Buy", foreign_key: "buyer_id"  
end

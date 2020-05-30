class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :charters
  has_many :clients
  has_many :orders
  has_many :products
  has_many :providers
  has_many :services
  belongs_to :company
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  enum role: %w( sales admin super_admin )
end

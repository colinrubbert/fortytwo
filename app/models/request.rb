class Request < ActiveRecord::Base
  belongs_to :user

  validates :name, :description, :phone, :email, :presence => true
  validates :name, :length => { minimum: 3 }
end

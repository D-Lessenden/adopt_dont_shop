class App < ApplicationRecord
has_many :pets

validates_presence_of :name, :address, :city, :state, :zip, :phone_number, :description


end

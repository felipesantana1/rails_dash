class Dojo < ActiveRecord::Base
    validates :name, :street, :city, presence: true 
    validates :state, presence: true, length: {in: 2..2}
end

class Dojo < ActiveRecord::Base
    validates :name, :street, :city, presence: true, uniqueness: {case_sensitive: false} 
    validates :state, presence: true, length: {in: 2..2}, uniqueness: {case_sensitive: false} 
end

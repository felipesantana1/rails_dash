class Dojo < ActiveRecord::Base

    validates :name, :street, :city, presence: true, uniqueness: {case_sensitive: false}

    validates :state, presence: true, length: {in: 2..2}
    
    has_many :students
    
end

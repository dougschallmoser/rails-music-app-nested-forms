class Artist < ApplicationRecord

    has_many :songs
    validates :name, uniqueness: true

    def self.search(query)
        if query.present?
            self.where("name LIKE ?", "%#{query}%")
        else
            self.all 
        end
    end
    
end

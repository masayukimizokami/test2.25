class User < ApplicationRecord

 has_many :posts

 validates :name, presence: true
 validates :email, presence: true, uniqueness: true
 validates :age, presence: true, numericality: true
 validates :name, presence: true, length: { in:3..50 }
end

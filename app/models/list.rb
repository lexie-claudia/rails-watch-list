class List < ApplicationRecord
  has_many :bookmarks, dependent: :destroy
  # you have to do 'through bookmarks' because the list accesses the movies through bookmarks on schema
  has_many :movies, through: :bookmarks

  validates :name, presence: true, uniqueness: true
end

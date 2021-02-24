class Bookmark < ApplicationRecord
  belongs_to :movie
  belongs_to :list
  validates :comment, length: { minimum: 6 }
  # validates :movie, :list, presence: true

  # we use scope to show the two tables are seperate/ validate the uniqueness of two columns
  validates :movie_id, uniqueness: { scope: :list_id }
end

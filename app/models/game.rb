class Game < ActiveRecord::Base

  has_many :user_games
  has_many :users, through: :user_games

  validates_presence_of :title, :release_date, :genre
  validates_uniqueness_of :title

  # scope method
  def self.search(query)
    where("title LIKE ?", "%#{query}%")
  end

  def self.alphabetize
    order(title: :asc)
  end
end

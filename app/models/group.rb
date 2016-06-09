class Group < ActiveRecord::Base
  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :title, length: { maximum: 100 }, presence: true
  validates :location, inclusion: {in: %w(makeshop computerlab)}, presence: true
  validates :time, inclusion: {in: %w(morning afternoon evening)}, presence: true
  validates :weekday, inclusion: {in: %w(monday tuesday wednesday thursday friday saturday sunday)}
end

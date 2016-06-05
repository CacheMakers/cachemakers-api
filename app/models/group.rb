class Group < ActiveRecord::Base
  has_many :tags
  before_save { self.leader_email = leader_email.downcase }
  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :title, length: { maximum: 100 }, presence: true
  validates :location, inclusion: {in: %w(makeshop computerlab)}, presence: true
  validates :time, inclusion: {in: %w(morning afternoon evening)}, presence: true
  validates :weekday, inclusion: {in: %w(monday tuesday wednesday thursday friday saturday sunday)}
  validates :leader_email, format: { with: EMAIL_REGEX }
  validates :leader_name, length: {maximum: 255}, presence: true
end

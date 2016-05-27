class Group < ActiveRecord::Base
  validates :title, length: { minimum: 1, maximum: 100}, presence: true
  validates :location, inclusion: {in: %w(makeshop computerlab)}, presence: true
  validates :time, inclusion: {in: %w(morning afternoon evening)}, presence: true
end

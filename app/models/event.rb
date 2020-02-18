class Event < ApplicationRecord
  has_many :attendances
  has_many :users, through: :attendances

  #From here to
  validates :start_date, :duration, :title, :description, :price, :location, presence: true
  validates :title, length: {minimum: 5, maximum: 140}
  validates :description, length: {minimum: 20, maximum: 1000}
  validates :price, numericality: {greater_than: 0, less_than_or_equal_to: 1000}
  validate :multiple_of_five
  validate :cant_be_past

  private 

  def multiple_of_five
    errors.add(:duration, "has to be a multiple of 5") unless duration % 5 == 0 
  end

  def cant_be_past
    errors.add(:start_date, "can't be past") if start_date < Time.now
  end
  #here thanks to https://github.com/luca-montaigut
end

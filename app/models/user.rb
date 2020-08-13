class User < ApplicationRecord
  
  has_many :attendances
  has_many :events, foreign_key: "host_id", class_name: "Event" 

  validates :first_name, presence: true
  validates :last_name, presence: true
  #validates :description, presence: true
  #validates :email, presence: true

  after_create :welcome_send

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end

end

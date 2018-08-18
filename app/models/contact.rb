class Contact < ApplicationRecord
  validates_presence_of :name, :email
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, on: [ :create, :update]
  validates :age, numericality: true
  validates :email, uniqueness: true
  validates_format_of :phone, with: /\d[0-9]\)*\z/, on: [ :create, :update]
end

class Winery < ActiveRecord::Base
  belongs_to :user
  has_many :vessels

  validates_presence_of :name, :message => "can't be blank"
  validates_uniqueness_of :name, :message => "must be unique"
end

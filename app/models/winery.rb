class Winery < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :name, :message => "can't be blank"
  validates_uniqueness_of :name, :message => "must be unique"
end

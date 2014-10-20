class Vessel < ActiveRecord::Base
  belongs_to :winery

  validates_presence_of :name
  validates_uniqueness_of :name
end

class Meeting < ActiveRecord::Base
  has_many :presentations
end

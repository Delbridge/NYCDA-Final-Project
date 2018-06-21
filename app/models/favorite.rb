class Favorite < ApplicationRecord
     serialize :title, Array
     belongs_to :user
end


class SystemProduct < ActiveRecord::Base
  belongs_to :system
  belongs_to :product
  
  default_scope { order("id") } 
end

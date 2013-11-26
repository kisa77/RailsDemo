class Product < ActiveRecord::Base
    default_scope :order => 'titile'
end

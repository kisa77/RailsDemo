class Person < ActiveRecord::Base
    validates_presence_of :name
    belongs_to :event
end

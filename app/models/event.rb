class Event < ActiveRecord::Base
##    validates_presence_of :name
    validates :name, :description, :presence => true
    validates :name, :uniqueness => true
##    validates :name, :description, :format => {
##        :with       =>  %r{\.(gif|png|jpg)$}i,
##        :message    => 'must be a url or image'
##    }
end

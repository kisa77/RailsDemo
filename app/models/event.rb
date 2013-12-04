class Event < ActiveRecord::Base
##    validates_presence_of :name
    validates :name, :description, :presence => true
    validates :name, :uniqueness => true
##    validates :name, :description, :format => {
##        :with       =>  %r{\.(gif|png|jpg)$}i,
##        :message    => 'must be a url or image'
##    }
    has_many :line_items
    has_many :person

    before_destroy :ensure_not_referenced_by_any_line_item

    private
    def ensure_not_referenced_by_any_line_item
        if line_ittems.empty?
            return true
        else
            errors.add(:base, 'Line Items present')
            return false
        end
    end
end

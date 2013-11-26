class Product < ActiveRecord::Base
    has_many :line_items

    default_scope :order => 'titile'

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

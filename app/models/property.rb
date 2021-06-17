class Property < ApplicationRecord
  has_many :stations, dependent: :destroy
  accept_nested_attributes_for :children, allow_destroy: true
end

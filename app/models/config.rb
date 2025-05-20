class Config < ApplicationRecord
  validates :parameter, json: { schema: { type: 'object' } }
end

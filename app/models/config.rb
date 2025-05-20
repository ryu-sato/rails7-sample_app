class Config < ApplicationRecord
  attribute :parameter, :json
  validates :parameter, json: { schema: { type: 'object' } }
end

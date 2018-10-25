class AddressPoolLog < ApplicationRecord
  STATUSES = %w(success failed).freeze 

  validates_inclusion_of :status, in: STATUSES
end

class Job < ApplicationRecord
    belongs_to :company

    has_one :category
    has_many :interests
end

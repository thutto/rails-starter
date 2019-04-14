class Note < ApplicationRecord
  validates :noteText, presence: true, length: { minimum: 1, maximum: 1000}
end

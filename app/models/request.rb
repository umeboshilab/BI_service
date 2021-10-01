class Request < ApplicationRecord
    validates :title, presence: true, length: { maximum: 50 }
    validates :message, presence: true, length: { maximum: 200 }
    has_one :task, dependent: :destroy
end

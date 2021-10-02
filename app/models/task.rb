class Task < ApplicationRecord
    belongs_to :request
    belongs_to :host_user
    belongs_to :group
    validates :comment, presence: true
end

class Task < ApplicationRecord
    belongs_to :request
    belongs_to :host_user
end

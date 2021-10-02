class Group < ApplicationRecord
    has_many :requests, dependent: :destroy
    has_many :tasks, dependent: :destroy
end

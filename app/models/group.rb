class Group < ApplicationRecord
    has_many :requests, dependent: :destroy
    has_many :tasks, dependent: :destroy

    validates :name,
    presence: true,
    length: { maximum: 25 },
    format: {
        with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々]|[A-Za-z0-9]|)+\z/,
        message: 'に使用できない文字が含まれています'
    }
end

class User < ApplicationRecord
    has_secure_password
    has_one :host_user, dependent: :destroy

    validates :name,
        presence: true,
        length: { maximum: 16 },
        format: {
            with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々]|[A-Za-z0-9]|)+\z/,
            message: 'に使用できない文字が含まれています'
        }
    validates :email,
        presence: true,
        uniqueness: true
    validates :password,
        length: { minimum:8, maximum: 15 }
end

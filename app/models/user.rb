class User < ApplicationRecord
    has_secure_password
    has_one :host_user, dependent: :destroy

    validates :name,
        presence: true,
        length: { maximum: 16 },
        format: {
            with: /\A[a-z0-9]+\z/,
            message: 'は小文字英数字で入力してください'
        }
    validates :email,
        presence: true,
        uniqueness: true
    validates :password,
        length: { minimum:8, maximum: 15 }
end

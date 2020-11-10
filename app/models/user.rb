class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         extend ActiveHash::Associations::ActiveRecordExtensions
         belongs_to_active_hash :sex


         validates :nickname, presence: true
         validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,100}+\z/i }
         validates :sex, presence: true
         validates :birthday, presence: true

         validates :sex_id, numericality: { other_than: 1 } 
end


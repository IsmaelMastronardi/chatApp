class User < ApplicationRecord
  has_many :messages
  has_many :chats_as_user1, class_name: 'Chat', foreign_key: 'user1_id', dependent: :destroy
  has_many :chats_as_user2, class_name: 'Chat', foreign_key: 'user2_id', dependent: :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end

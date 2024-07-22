class Chat < ApplicationRecord
  belongs_to :user1, class_name: 'User'
  belongs_to :user2, class_name: 'User'
  has_many :messages, dependent: :destroy

  scope :between, -> (user1_id, user2_id) do
    where("(chats.user1_id = ? AND chats.user2_id =?) OR (chats.user1_id = ? AND chats.user2_id =?)", user1_id, user2_id, user2_id, user1_id)
  end
end

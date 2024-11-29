class Chat < ApplicationRecord
  belongs_to :sender_user, class_name: "User"
  belongs_to :recipient_user, class_name: "User"
  has_many :messages, dependent: :destroy

  # Normaliza os IDs antes de validar/salvar
  before_validation :normalize_user_ids

  # Garante unicidade dos pares de IDs, independente da ordem
  validates :sender_user_id, uniqueness: { scope: :recipient_user_id, message: "Este chat já existe" }

  scope :between_users, -> (user1,user2) {
    where(
      "(sender_user_id = :user1 AND recipient_user_id = :user2) OR 
       (sender_user_id = :user2 AND recipient_user_id = :user1)",
      user1: user1,
      user2: user2
    )
  }

  private

  # Troca os IDs para garantir sempre a mesma ordem
  def normalize_user_ids
    if sender_user_id > recipient_user_id
      self.sender_user_id, self.recipient_user_id = recipient_user_id, sender_user_id
    end
  end
end

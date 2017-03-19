class Message < ApplicationRecord
  belongs_to :user
  belongs_to :chat_room

  validates :body, presence: true, length: { minimum: 2, maximum: 1000 }

  before_create :convert_message_to_dialect

  after_create_commit { broadcast_message }


  def timestamp
    created_at.strftime('%H:%M:%S %d %B %Y')
  end

  def message_dialect
    user.dialect
  end

  private

  def convert_message_to_dialect
    mess_body = self.body
    converted_message = Degreave::Converter.new(user.dialect, mess_body).convert_message
    self.body = converted_message
  end

  def broadcast_message
    MessageBroadcastJob.perform_later(self)
  end
end

class User < ApplicationRecord

  ONLINE_PERIOD = 3.minutes
  DIALECTS = { yoda: 'Yoda', valley: 'Valley girl', ebonics: 'Ali G' }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :chat_rooms, dependent: :destroy
  has_many :messages, dependent: :destroy

  validates_presence_of :dialect

  scope :online, -> { where('updated_at > ? OR online = ?', ONLINE_PERIOD.ago, true) }

  def name
    email.split('@')[0]
  end

  def is_online?
    updated_at > ONLINE_PERIOD.ago || online?
  end

end

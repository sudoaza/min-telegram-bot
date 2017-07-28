class Chat
  include DataMapper::Resource

  property :id,         Serial
  property :chat_id,    Integer
  property :created_at, DateTime
  property :updated_at, DateTime

  validates_uniqueness_of :chat_id
end

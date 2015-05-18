class Message < ActiveRecord::Base

  # validates :url, format: { with: /@^(https?|ftp):/ }
  validates :content, presence: true, length: { maximum: 140 }
  validates :author, presence: true, length: { maximum: 25 }

  def other_messages(author)
    messages = ""
    message_record = Message.where(author: author)


    message_record.each do |element|
      messages << element.content
    end

    return messages

  end

end
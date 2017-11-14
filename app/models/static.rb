class Static < ActiveRecord::Base
  mount_uploader :attachment, AttachmentUploader
  
  def attributes
    super.merge({ attachment_url: attachment.url })
  end
end

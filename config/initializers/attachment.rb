module Paperclip
  class Attachment
    def link
      url.gsub('s3', 's3-us-west-2')
    end
  end
end

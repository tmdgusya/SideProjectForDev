class FrameWorkService

  class << self

    def enroll_framework(name, img_url, type)
      framework = Framework.new
      framework.name = name
      framework.img_url = img_url
      framework.type = type
      framework.save
    end
  end
end

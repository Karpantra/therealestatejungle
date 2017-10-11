module EmailHelper
  def email_image_url(image)
    ENV['URL'] + image_url(image)
  end
end

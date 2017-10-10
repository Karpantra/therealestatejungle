module EmailHelper
  def email_image_url(image)
    Rails.root.join("app/assets/images/#{image}")
  end
end

module ViewHelper
  def display_avatar_navbar
    if current_user.facebook_picture_url.nil?
      content_tag(:div, "#{current_user.first_name.first}#{current_user.last_name.first}", class: 'avatar default-avatar', "data-toggle" => "dropdown")
    else
      image_tag current_user.facebook_picture_url, class: "avatar dropdown-toggle", id: "navbar-wagon-menu", "data-toggle" => "dropdown"
    end
  end

  def display_avatar_mailbox(message)
    if message.sender.facebook_picture_url.nil?
      content_tag(:div, "#{message.sender.first_name.first}#{message.sender.last_name.first}", class: 'avatar-large default-avatar')
    else
      image_tag message.sender.facebook_picture_url, class: "avatar-large"
    end
  end
end

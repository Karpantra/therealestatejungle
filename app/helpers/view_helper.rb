module ViewHelper
  def display_avatar
    if current_user.facebook_picture_url.nil?
      content_tag(:div, "#{current_user.first_name.first}#{current_user.last_name.first}", class: 'avatar default-avatar', "data-toggle" => "dropdown")
    else
      image_tag current_user.facebook_picture_url, class: "avatar dropdown-toggle", id: "navbar-wagon-menu", "data-toggle" => "dropdown"
    end
  end
end

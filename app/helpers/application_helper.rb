# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  # return a title on a per-page basis
  def title
    base_title = "POVRay Short Code Contest"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end

  # our logo
  def logo
    image_tag("logo.png", :alt => "POVRay woo!", :class => "round")
  end
end

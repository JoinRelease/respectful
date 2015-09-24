module ApplicationHelper

  def bootstrap_class_for(flash_type)
    @bootstrap_classes ||= {
      notice: 'alert-info', # Blue
      alert: 'alert-info', # Blue
      success: 'alert-success', # Green
      error: 'alert-danger', # Red
      warning: 'alert-warning' # Yellow
    }

    @bootstrap_classes[flash_type.to_sym]
  end
	def site_name
    "Respectful"
  end

  def site_url
    if Rails.env.production?
      "http://www.joinrespectful.com/"
    else
      "http://localhost:3000"
    end
  end

  def meta_description
    "Funeral planning application"
  end

  def meta_keywords
    "Respect,Respectful,funeral, planning, mausoleum, cemetery, deceased, cremation, burial"
  end

  # Returns the full title on a per-page basis.
  def full_title(page_title)
    if page_title.empty?
      site_name
    else
      "#{site_name} | #{page_title}"
    end
  end

  def human_bool(bool)
    bool ? 'Yes' : 'No'
  end

end

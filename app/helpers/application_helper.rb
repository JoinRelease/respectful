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
    # Change the value below between the quotes.
    "Join Respect"
  end

  def site_url
    if Rails.env.production?
      # Place your production URL in the quotes below
      "http://www.joinrespect.com/"
    else
      # Our dev & test URL
      "http://localhost:3000"
    end
  end

  def meta_author
    # Change the value below between the quotes.
    "Tai Dupree"
  end

  def meta_description
    # Change the value below between the quotes.
    "Add your website description here"
  end

  def meta_keywords
    # Change the value below between the quotes.
    "Add your keywords here"
  end

  # Returns the full title on a per-page basis.
  # No need to change any of this we set page_title and site_name elsewhere.
  def full_title(page_title)
    if page_title.empty?
      site_name
    else
      "#{page_title} | #{site_name}"
    end
  end

end

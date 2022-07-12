module ApplicationHelper
  def extract_url(val)
    val.split(/\W/).last
  end
end

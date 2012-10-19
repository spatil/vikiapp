module ApplicationHelper

  def format_url(url, options = {})
    options.each do |key, val|
      url.gsub!(/#{key}=\w+/, "#{key}=#{val}")
    end
    return url
  end

  def genres(options = {})
    genres = ""
    options.each{|l| l.select{|key, val| genres << "#{val}," if key == 'name'}}
    genres.chop
  end
end

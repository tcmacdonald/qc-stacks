require 'compass'
require 'susy'


activate :deploy do |deploy|
  deploy.method = :git
  deploy.user = "procload"
  deploy.host = "http://www.github.com/"
  deploy.path = "https://github.com/procload/qc-stacks"
end


# Methods defined in the helpers block are available in templates
helpers do
  
  # Calculate the years for a copyright
  def copyright_years(start_year)
    end_year = Date.today.year
    if start_year == end_year
      start_year.to_s
    else
      start_year.to_s + '-' + end_year.to_s
    end
  end
  
end

page "*", :layout => "public"
page '/email/*', layout: false
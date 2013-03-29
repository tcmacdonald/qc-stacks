module ArticleHelpers
  def build_archive
    ["tom", "dick", "harry"].each do |name|
      proxy "/archives/#{Dir.pwd}/#{name}/poo.html", "/index.html", :locals => { :person_name => name }, :ignore => true
    end
  end
end
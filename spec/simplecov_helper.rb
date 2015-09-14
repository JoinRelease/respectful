SimpleCov.profiles.define 'Respectful' do

  add_filter '/spec/'
  add_filter '/config/'
  add_filter '/vendor/'
  add_filter '/libs/tasks/'

  add_group "Controllers",  "app/controllers"
  add_group "Models",       "app/models"
  add_group 'Helpers',      "app/helpers"
  add_group 'Recent' do |source|
    changes = `find #{Rails.root}/app -maxdepth 5 -mtime -1 -ls`
    changes.include?(source.filename)
  end
  add_group "Bad" do |source|
    source.covered_percent < 80
  end
end

curr_dir = File.expand_path(File.dirname(__FILE__))
rails_locale_dir = File.expand_path(File.join(curr_dir, "..", "rails"))
rails_branch = ARGV.first
rails_branch ||= '2-3-stable'

puts "Fetching latest Rails locale files to #{rails_locale_dir}"

command = %(
  curl -Lo '#{rails_locale_dir}/action_view.yml' http://github.com/rails/rails/blob/#{rails_branch}/actionpack/lib/action_view/locale/en.yml?raw=true

  curl -Lo '#{rails_locale_dir}/active_record.yml' http://github.com/rails/rails/blob/#{rails_branch}/activerecord/lib/active_record/locale/en.yml?raw=true

  curl -Lo '#{rails_locale_dir}/active_support.yml' http://github.com/rails/rails/blob/#{rails_branch}/activesupport/lib/active_support/locale/en.yml?raw=true
)
command << %(
  curl -Lo '#{rails_locale_dir}/active_model.yml' http://github.com/rails/rails/blob/#{rails_branch}/activemodel/lib/active_model/locale/en.yml?raw=true
) if rails_branch == 'master'

exec command

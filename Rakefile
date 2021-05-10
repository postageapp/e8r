require 'rubygems'
require 'bundler'

begin
  Bundler.setup(:default, :development)

rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts 'Run `bundle install` to install missing gems'

  exit e.status_code
end

require 'rake'
require 'juwelier'

Juwelier::Tasks.new do |gem|
  gem.name = 'e8r'
  gem.homepage = 'http://github.com/postageapp/e8r'
  gem.license = 'MIT'
  gem.summary = %Q{Extensions to Enumerator}
  gem.description = %Q{Enumerator after going to the gym}
  gem.email = 'tadman@postageapp.com'
  gem.authors = [ 'Scott Tadman' ]
end

Juwelier::RubygemsDotOrgTasks.new

require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec)

require 'rdoc/task'

Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ''

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = 'e8r #{version}'
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

task test: :spec
task default: :spec

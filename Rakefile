require 'rubygems'

require 'bundler'
Bundler.require(:default, :test)

require 'spec'
require 'spec/rake/spectask'

desc "Run specs"
Spec::Rake::SpecTask.new(:spec) do |t|
  t.spec_files = [ "spec/spec_helper.rb"] + Dir["spec/**/*_spec.rb" ]
  t.spec_opts += [ "-fs", "--color", "--loadby", "random" ]

  # Disable rcov for now.  Weird duplicate-include with spec_helper.
  # t.rcov = ENV.has_key?('NO_RCOV') ? ENV['NO_RCOV'] != 'true' : true
  t.rcov = false
  t.rcov_opts += [ '--exclude', '~/.salesforce,gems,vendor,/var/folders,spec,config,tmp' ]
  t.rcov_opts += [ '--text-summary', '--sort', 'coverage', '--sort-reverse' ]
end

task :default => 'spec'

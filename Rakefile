require 'rake'
require 'spec/rake/spectask'


desc "Run all specs"
Spec::Rake::SpecTask.new do |t|
  t.spec_files = FileList['spec/**/*_spec.rb']
  t.spec_opts = ['--options', 'spec/spec.opts']
end

desc "Run all stories"
task :stories do
  ruby "stories/all.rb --colour --format plain"
end

desc "Run all test and stories"
task :default => [:spec, :stories]

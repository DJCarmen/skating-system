require 'rake'
require 'spec/rake/spectask'


desc "Run all specs"
Spec::Rake::SpecTask.new do |t|
  t.spec_files = FileList['spec/**/*_spec.rb']
  t.spec_opts = ['--options', 'spec/spec.opts']
#  unless ENV['NO_RCOV']
#    t.rcov = true
#    t.rcov_dir = '../doc/output/coverage'
#    t.rcov_opts = ['--exclude', 'spec\/spec,bin\/spec,examples,\/var\/lib\/gems,\/Library\/Ruby,\.autotest']
#  end
end

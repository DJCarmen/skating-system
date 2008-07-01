require 'rake'
require 'spec/rake/spectask'


require 'rubygems'
Gem::manage_gems
require 'rake/gempackagetask'

spec = Gem::Specification.new do |s|
    s.platform  =   Gem::Platform::RUBY
    s.name      =   "skating_system"
    s.version   =   "0.0.1"
    s.author    =   "Laurie Young"
    s.email     =   "skating_system@wildfalcon.com"
    s.summary   =   "Implemetation of the skating system."
    s.files     =   FileList['lib/**/*.rb', 'spec/**/*'].to_a
    s.require_path  =   "lib"
    s.autorequire   =   "skating_system"
#    s.test_files = Dir.glob('tests/*.rb')
    s.has_rdoc  =   true
    s.extra_rdoc_files  =   ["README"]
end

Rake::GemPackageTask.new(spec) do |pkg|
    pkg.need_tar = true
end

task :default => "pkg/#{spec.name}-#{spec.version}.gem" do
    puts "generated latest version"
end



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

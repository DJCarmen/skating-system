require 'rake'

Gem::Specification.new do |s|
    s.platform  =   Gem::Platform::RUBY
    s.name      =   "skating_system"
    s.version   =   "0.0.1"
    s.author    =   "Laurie Young"
    s.email     =   "skating_system@wildfalcon.com"
    s.summary   =   "Implemetation of the skating system."
    s.files     =   Rake::FileList['lib/**/*.rb', 'spec/**/*'].to_a
    s.require_path  =   "lib"
    s.autorequire   =   "skating_system"
    s.has_rdoc  =   true
    s.extra_rdoc_files  =   ["README"]
end
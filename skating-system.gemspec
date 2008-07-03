
Gem::Specification.new do |s|
    s.platform  =   Gem::Platform::RUBY
    s.name      =   "skating-system"
    s.version   =   "0.0.2"
    s.author    =   "Laurie Young"
    s.email     =   "skating_system@wildfalcon.com"
    s.summary   =   "Implemetation of the skating system."
    s.files     =   ['lib/skating_system.rb', 'lib/skating_system/scorer.rb', 'lib/skating_system/performance_results.rb', 'lib/skating_system/ranking.rb',
                    'spec/spec.opts', 'spec/spec_helper.rb', 'spec/spec/scorer_spec.rb', 'spec/spec/performance_results_spec.rb', 'spec/spec/ranking_spec.rb']
    s.require_path  =   "lib"
    s.autorequire   =   "skating_system"
    s.has_rdoc  =   true
    s.extra_rdoc_files  =   ["README"]
end

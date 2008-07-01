require File.join(File.dirname(__FILE__), *%w[helper])

%w[final_performance].each do |dir|
  require File.join(File.dirname(__FILE__), "#{dir}/stories")
end

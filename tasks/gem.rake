require 'hoe'

# compile takes higher importance in packaging
task :package => [:compile]

HOE = Hoe.spec 'mongrel_service' do
  self.rubyforge_name = "mongrel"
  self.version = '0.4.beta1'

  developer 'Luis Lavena', 'luislavena@gmail.com'

  extra_deps << ['gem_plugin', '~> 0.2.3']
  extra_deps << ['mongrel', '~> 1.1.5']

  self.need_tar = false
end

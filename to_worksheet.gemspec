Gem::Specification.new do |s|
  s.name        = "to_worksheet"
  s.version     = "0.0.1"
  s.author      = "Fabrício Ferrari de Campos"
  s.email       = "fabricio@vizir.com.br"
  s.homepage    = "http://github.com/fabricioffc/to_worksheet"
  s.summary     = "Array conversion to a worksheet"
  s.description = "Only to excel for now."

  s.files = Dir["{lib,spec}/**/*"]
  s.files += %w(Rakefile .gemtest)
  s.require_path = "lib"

  s.add_development_dependency 'rspec', '~> 1.3.0'

  s.rubyforge_project = s.name
  s.required_rubygems_version = ">= 1.3.4"
end

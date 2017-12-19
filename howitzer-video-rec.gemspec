$LOAD_PATH.push File.expand_path('../lib', __FILE__)
require 'howitzer/video_record/version'

Gem::Specification.new do |spec|
  spec.name          = 'howitzer-video-rec'
  spec.version       = Howitzer::VideoRecord::VERSION
  spec.authors       = ['Roman Parashchenko', 'Alexey Voronenko']
  spec.email         = ['howitzer@strongqa.com']

  spec.summary       = 'Video recording gem for howitzer'
  spec.homepage      = 'https://github.com/strongqa/howitzer-video-rec'
  spec.files         = `git ls-files`.split("\n")
  spec.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'headless'

  spec.add_development_dependency 'bundler', '~> 1.16'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency('rubocop')
end

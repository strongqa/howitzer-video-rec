# howtizer-video-rec


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'howitzer-video-rec'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install howitzer-video-rec

## Usage

### Cucumber
Add to env.rb:

`require 'howitzer/video_record'`

Add to your hooks.rb:
```ruby
  Before do |scenario|
    Howitzer::VideoRecord.start_recording
  end


  After do |scenario|
    Howitzer::VideoRecord.stop_and_save(scenario.name)
  end
```

### RSpec

  Add to your spec_helper.rb:
   ```ruby
  require 'howitzer/video_record' 
   
  config.before(:example) do
    Howitzer::VideoRecord.start_recording
  end

  config.after(:example) do
    scenario_name =
        if RSpec.current_example.description.blank?
          RSpec.current_example.metadata[:full_description]
        else
          RSpec.current_example.description
        end
    Howitzer::VideoRecord.stop_and_save(scenario_name)
  end
   ```
### Turnip
    Same as rspec.
    
#### Info:
Currently it creates video directory under your project root with sub-directories for each run.
You can customize name of the final files passing argument to stop_and_save method.
Also some ENV variables are supported:
- VIDEO_DIR - video directory path relative to the root of the project
- DISPLAY - display port for xvfb



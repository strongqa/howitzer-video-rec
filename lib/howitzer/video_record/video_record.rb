module Howitzer
  # module to hold video recording dsl
  module VideoRecord
    attr_reader :headless

    DEFAULT_CONFIG = {
      video_dir: ENV['VIDEO_DIR'] || 'videos',
      nested_dir: ENV['NESTED_DIR'] || Time.now.strftime('%Y%m%d_%H-%M'),
      video_postfix: ENV['VIDEO_POSTFIX'] || rand(1_000_000),
      display: ENV['DISPLAY'].to_i.zero? ? 99 : ENV['DISPLAY']
    }.freeze

    def self.start_recording(*args)
      args.first.merge(display: DEFAULT_CONFIG[:display])
      @headless = Headless.new(*args)
      @headless.start
      @headless.video.start_capture
    end

    def self.stop_and_save(name = nil)
      dir_path = "./#{DEFAULT_CONFIG[:video_dir]}/#{DEFAULT_CONFIG[:nested_dir]}"
      FileUtils.mkdir_p dir_path
      @headless.video.stop_and_save("#{dir_path}/#{name}_#{DEFAULT_CONFIG[:video_postfix]}.mov")
    end

    def self.destroy_virtual_display
      @headless.destroy
    end
  end
end

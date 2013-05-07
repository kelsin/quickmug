module Quickmug
  class Format
    def initialize(data, caption)
      @data = data
      @caption = caption
      @client = Quickmug.client
      @format = Quickmug.config['format']

      @urls = @client.images.getURLs(:ImageID => @data['id'], :ImageKey => @data['Key'])
    end

    def render
      output = @format

      @urls.keys.each do |key|
        if key =~ /URL$/
          output.gsub!("[#{key}]", @urls[key])
        end
      end

      if @caption.length > 0
        output.gsub!("[caption]", @caption)
      end

      output
    end
  end
end

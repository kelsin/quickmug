module QuickMug
  class Image
    attr_reader :id, :key

    def initialize(id, key)
      @id = id
      @key = key
    end

    def apiHash
      {:ImageID => @id, :ImageKey => @key}
    end

    def info
      @info ||= QuickMug.client.images.getInfo(apiHash)
    end

    def to_s
      render
    end

    def render
      output = QuickMug.config['format']

      info.each do |key, value|
        output = output.gsub("[#{key}]", value.to_s)
      end

      output
    end

    def self.fromApi(data)
      Image.new(data['id'], data['Key'])
    end

    def self.fromArgs(args)
      raise ArgumentError.new('You must specify an image ID and KEY') if args.size < 2
      Image.new(args[0],args[1])
    end
  end
end

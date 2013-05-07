module QuickMug
  class Upload
    def self.process(args)
      raise ArgumentError.new('You must specify an image') if args.empty?
      image = File.expand_path(args[0])
      caption = args[1..-1].join(' ')

      raise ArgumentError.new('The specified file does not exist') unless File.exists?(image)
      raise ArgumentError.new('You must specify album in ~/.quickmug') unless QuickMug.config['album']

      data = {:AlbumID => QuickMug.config['album']}

      if caption.length > 0
        data[:Caption] = caption
      end

      File.open(image, "rb") do |f|
        # Upload file to the album
        data = QuickMug.client.upload_media(data.merge(:file => f))
      end

      Image.fromApi(data)
    end
  end
end

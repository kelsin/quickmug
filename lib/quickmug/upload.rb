module Quickmug
  class Upload
    def self.process(args)
      raise ArgumentError.new('You must specify an image.') if args.empty?
      image = File.expand_path(args[0])
      caption = args[1..-1].join(' ')

      raise ArgumentError.new('The specified file does not exist.') unless File.exists?(image)
      raise ArgumentError.new('You must specify album in ~/.quickmug') unless Quickmug.config['album']

      puts "Uploading #{image}"

      data = {:AlbumID => Quickmug.config['album']}

      if caption.length > 0
        data[:Caption] = caption
      end

      File.open(image, "rb") do |f|
        # Upload file to the album
        data = Quickmug.client.upload_media(data.merge(:file => f))
      end

      puts data

      # Format and paste if we have a format
      if Quickmug.config['format']
        str = Format.new(data, caption).render
        puts "Copying: #{str}"
        Clipboard.copy(str)
      end
    end
  end
end

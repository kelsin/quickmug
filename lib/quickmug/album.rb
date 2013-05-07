module QuickMug
  class Album
    attr_reader :id, :key

    def initialize(id, key)
      @id = id
      @key = key
    end

    def apiHash
      {:AlbumID => @id, :AlbumKey => @key}
    end

    def info
      @info ||= QuickMug.client.albums.getInfo(apiHash)
    end

    def images
      @images ||= QuickMug.client.images.get(apiHash)['Images'].map do |data|
        Image.fromApi(data)
      end
    end

    def selected?
      self.id == QuickMug.config['album']
    end

    def to_s
      selected = selected? ? '*' : ' '
      " #{selected} #{info['Title']} id:#@id key:#@key"
    end

    def self.fromApi(data)
      Album.new(data['id'], data['Key'])
    end

    def self.fromArgs(args)
      raise ArgumentError.new('You must specify an image ID and KEY') if args.size < 2
      Album.new(args[0],args[1])
    end

    def self.all
      @@albums ||= QuickMug.client.albums.get.map do |data|
        Album.fromApi(data)
      end
    end

    def self.selected
      @@selected ||= self.all.first(&:selected?)
    end
  end
end

# Quickmug

I currently use [Jekyll](http://jekyllrb.com/) for
[my blog](http://mx.kelsin.net) and
[SmugMug](http://www.smugmug.com/) for hosted images and photos. I created this
gem to allow myself to easily upload files to SmugMug from the command
line. Quickmug also puts a string (in the format of my chosing) on my clipboard
for easy insertion into my blog post. Right now I use a
[custom liquid tag](https://github.com/Kelsin/mxKelsin/blob/master/_plugins/images.rb)
that inserts the images using [Bootstrap](http://twitter.github.io/bootstrap/)'s
thumbnail classes. I use the following format string in order to do this:

    {% image [ThumbURL] [LargeURL] [Caption] %}

## Installation

Add this line to your application's Gemfile:

    gem 'quickmug'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install quickmug

## Configuation

This is a small gem that helps you upload photos to smugmug. It relies on a
config file `~/.quickmug` that is a yaml document like the following:

    consumer:
        key: aaa
        secret: bbb
    access:
        token: ccc
        secret: ddd
    album: 123456789
    format: "{% image [ThumbURL] [LargeURL] [Caption] %}"

Consumer data is the API app key that you can get by registering an app on
SmugMug's website. This allows you to use their api.

Access data is your personal access token for your user. You can get this using
oauth. I plan on adding a feature to this gem that helps you get that... but
it's not in the code yet (sorry).

Album is the album id that uploads will go to. You can get a list of albums by
running `quickmug albums` (as long as you have the consumer and access tokens
specified).

Format is a string that you would like copied to your clipboard after you upload
an image. Any blocks like `[xxx]` will be replaced with the `xxx` field from the
smugmug
[images.getInfo](http://api.smugmug.com/services/api/?version=1.3.0&method=smugmug.images.getInfo)
call.

## Usage

The following commands are available

* **albums** List all of your albums (the selected one is starred)
* **copy ID KEY** If you pass in a image id and key, this copies the format
    string to the clipboard as if you just uploaded that image.
* **images [options]** Lists the last 5 of the images from your selected album
    using your format string. You can use `-a` to list all images and `-l NUM`
    to list a certain number.
* **last** Copies the format string for the last image in your album (this is
    often the one you just uploaded).
* **upload IMAGE CAPTION** Uploads a image file to smugmug with a caption. You
    don't need quotes around the caption.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

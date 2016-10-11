# ColoredLog

Very simple colorized and formatted log class.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'colored_log'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install colored_log

## Usage

logger = ColoredLog::Log.new(filename, level: Logger::INFO, progname: 'Hello')

logger.info('Hello World!')

OUTPUT: 
11.10.2016 11:19:28.015797 (#4833)[Hello:WARN]: Hello World!

require 'logger'

module ColoredLog
  class Log < Logger
    def initialize(*args, level: Logger::INFO, progname: nil)
      super(*args)
      @level = level
      @progname = progname
      @formatter = CFormatter.new
    end

    #
    # Severity label for logging (max 5 chars).
    # SEV_LABEL = %w(DEBUG INFO WARN ERROR FATAL ANY).each(&:freeze).freeze
    #
    # def format_severity(severity)
    #   SEV_LABEL[severity] || 'ANY'
    # end
    #
    # format_message(format_severity(severity), Time.now, progname, message))
    #
    # def format_message(severity, datetime, progname, msg)
    #   (@formatter || @default_formatter).call(severity, datetime, progname, msg)
    # end
    class CFormatter
      attr_accessor :datetime_format
      attr_accessor :severity

      def initialize
        @datetime_format = nil
      end

      def colored(msg)
        color = case @severity
                  when :none
                    nil
                  when :sql
                    '34'
                  when :DEBUG
                    '38;5;240'
                  when :INFO
                    nil
                  when :WARN
                    '38;5;225'
                  when :ERROR
                    '31'
                  when :FATAL
                    '91'
                  else
                    '39'
                end
        (color) ? "\e[#{color}m#{msg.to_s}\e[0m" : msg
      end

      def call(severity, time, progname, msg)
        @severity = severity.to_sym
        msg = colored("[#{progname}:#{severity}]: #{msg2str(msg)}")
        "#{format_datetime(time)} (#{$$}) #{msg}\n"
      end

      private

      def format_datetime(time)
        time.strftime(@datetime_format || '%d.%m.%Y %H:%M:%S.%6N'.freeze)
      end

      def msg2str(msg)
        case msg
          when ::String
            msg
          when ::Exception
            "#{ msg.message } (#{ msg.class })\n" << (msg.backtrace || []).join("\n")
          else
            msg.inspect
        end
      end
    end
  end
end

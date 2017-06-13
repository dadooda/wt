
require_relative "../../boot/app"

require "pastel"

module Script
  class Cpuinfo
    attr_writer :cpu_name, :mode, :os_type, :proc_cpuinfo_content, :ruby_platform, :stdout, :wmic_cpu_get_content

    def initialize(attrs = {})
      attrs.each { |k, v| public_send("#{k}=", v) }
    end

    #--------------------------------------- Data attributes

    # Return CPU name string.
    def cpu_name
      @cpu_name ||= if windows?
        # NOTE: WMIC output is ugly and might use national chars. Hence the tricky regexp.
        wmic_cpu_get_content =~ /\s+{10,}\n\n(.+?)\s*$/ ? $1 : raise("Error parsing `wmic cpu get` output")
      else
        proc_cpuinfo_content =~ /model name\s+:\s+(.+)$/ ? $1 : raise("Error parsing `/proc/cpuinfo`")
      end
    end

    # A container for all mode attribute values.
    def mode
      @mode ||= {}
    end

    def os_type
      @os_type ||= case ruby_platform
      when /bccwin|djgpp|mingw|mswin/i
        :windows
      else
        :unix
      end
    end

    def pastel
      @pastel ||= Pastel.new
    end

    def proc_cpuinfo_content
      @proc_cpuinfo_content ||= File.read("/proc/cpuinfo")
    end

    def ruby_platform
      @ruby_platform ||= RUBY_PLATFORM
    end

    def stdout
      @stdout ||= STDOUT
    end

    def wmic_cpu_get_content
      @wmic_cpu_get_content ||= `wmic cpu get name`
    end

    #--------------------------------------- Mode attributes

    # Return <tt>true</tt> if color output is supported in console.
    def color_supported?
      mode_attr(:color_supported, interactive?)
    end

    def interactive?
      mode_attr(:interactive, stdout.tty?)
    end

    def windows?
      mode_attr(:windows, os_type == :windows)
    end

    #--------------------------------------- Misc

    # Emphasize <tt>s</tt> by bold-typing it if color is supported.
    def emphasize(s)
      color_supported?? pastel.bold(s) : s
    end

    # A helper to deal with mode attributes.
    # Since most (all?) mode attributes are boolean, <tt>@mode ||= ...</tt> will not work as expected, hence the helper.
    def mode_attr(k, default)
      mode.has_key?(k) ? mode[k] : (mode[k] = default)
    end
    private :mode_attr

    #---------------------------------------

    # Main routine.
    def main
      stdout.puts "Your CPU is: " + emphasize(cpu_name)
      0
    end
  end
end

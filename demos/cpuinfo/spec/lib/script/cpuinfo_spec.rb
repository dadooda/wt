
require "script/cpuinfo"

describe Script::Cpuinfo do
  describe "#color_supported?" do
    let(:ex) { -> (mode) { expect(described_class.new(mode: mode).color_supported?) } }

    it "generally works" do
      ex.(interactive: true).to be true
      ex.(interactive: false).to be false
    end
  end

  describe "#cpu_name" do
    let(:mp) { -> (attrs) { described_class.new(attrs).cpu_name } }

    it "generally works" do
      expect { mp.(os_type: :unix, proc_cpuinfo_content: "kk") }.to raise_error /^Error parsing/
      expect(mp.(os_type: :unix, proc_cpuinfo_content: "      model           : 42\n      model name      : Intel(R) Core(TM) i7-2760QM CPU @ 2.40GHz\n      stepping        : 7")).to eq "Intel(R) Core(TM) i7-2760QM CPU @ 2.40GHz"

      expect { mp.(os_type: :windows, wmic_cpu_get_content: "kk") }.to raise_error /^Error parsing/
      expect(mp.(os_type: :windows, wmic_cpu_get_content: "Name                                       \n\nIntel(R) Core(TM) i7-2760QM CPU @ 2.40GHz  \n\n\n\n")).to eq "Intel(R) Core(TM) i7-2760QM CPU @ 2.40GHz"
    end
  end

  describe "#emphasize" do
    let(:ex) { -> (mode, s) { expect(described_class.new(mode: mode).emphasize(s)) } }
    let(:pastel) { Pastel.new }

    it "generally works" do
      ex.({color_supported: false}, "!").to eq "!"
      ex.({color_supported: true}, "!").to eq pastel.bold("!")
    end
  end

  describe "#interactive?" do
    let(:ex) { -> (stdout) { expect(described_class.new(stdout: stdout).interactive?) } }

    it "generally works" do
      ex.(STDOUT).to be true
      ex.(StringIO.new).to be false
    end
  end

  describe "#main" do
    it "generally works" do
      r = described_class.new({
        mode: {
          interactive: false,
        },
        os_type: :unix,
        proc_cpuinfo_content: "      model           : 42\n      model name      : Intel(R) Core(TM) i7-2760QM CPU @ 2.40GHz\n      stepping        : 7",
        stdout: StringIO.new,
      })
      expect(r.main).to eq 0
      expect(r.stdout.tap(&:rewind).readline).to match /^Your CPU is: /
    end
  end

  describe "#mode" do
    let(:ex) { -> (mode, m) { expect(described_class.new(mode: mode).public_send(m)) } }

    it "generally works" do
      ex.({interactive: true}, :interactive?).to be true
      ex.({interactive: false}, :interactive?).to be false
    end
  end

  describe "#os_type" do
    let(:ex) { -> (ruby_platform) { expect([ruby_platform, described_class.new(ruby_platform: ruby_platform).os_type]) } }

    it "generally works" do
      [
        ["x64-mingw32", :windows],
        ["i386-cygwin", :unix],
        ["i386-linux", :unix],
        ["other", :unix],
      ].each do |input, expected|
        ex.(input).to eq [input, expected]
      end
    end
  end
end

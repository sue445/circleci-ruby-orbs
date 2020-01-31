# Usage: scripts/generate_markdown.rb src/commands/bundle-install.yml

require "yaml"

raise "yaml is required" unless ARGV[0]

config = YAML.load_file(ARGV[0])

result = config["parameters"].map do |name, values|
  line = "* `#{name}` : #{values["description"]}"

  if values.key?("default")
    default = values["default"]
    line << " (default: `#{default}`)" unless default.to_s.empty?
  end

  line
end.join("\n")

puts result

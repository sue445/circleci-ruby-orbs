orb_ref = ARGV[0]

raise "Usage: push_latest_version_tag.rb <namespace>/<orb-name>" unless orb_ref

result = `circleci orb info #{orb_ref} --token #{ENV["CIRCLECI_API_TOKEN"]}`

result =~ /^Latest:\s*#{orb_ref}@(.+)$/

version = $1

raise "Not found version in '#{result}'" unless version

def system!(command)
  puts command
  ret = system(command)
  raise "`#{command}` is failed" unless ret
end

system! "git tag -a #{version} -m 'Release #{version}'"
system! "git push origin --tags"

require 'json'
require 'uri'
require 'net/http'
require 'rubygems'

IRB_TAGS_URI = 'https://api.github.com/repos/ruby/irb/tags'
RELINE_TAGS_URI = 'https://api.github.com/repos/ruby/reline/tags'

def get_versions(uri)
  response = Net::HTTP.get_response(URI(uri))
  JSON.parse(response.body).map { |tag| tag['name'].delete_prefix('v') }
end

IRB_VERSIONS = get_versions(IRB_TAGS_URI)
RELINE_VERSIONS = get_versions(RELINE_TAGS_URI)

def get_dependency(gemname, version)
  response = Net::HTTP::get_response(URI("https://raw.githubusercontent.com/ruby/#{gemname}/v#{version}/#{gemname}.gemspec"))
  response.body.match(/spec.add_dependency "reline", "(.*) (.*?)"/)
end

def depend_reline_versions(dependency_version, comparison)
  RELINE_VERSIONS.map do |reline_version|
    case comparison
    when ">="
      if Gem::Version.new(reline_version) >= Gem::Version.new(dependency_version)
        reline_version
      end
    end
  end.compact # FIXME
end

def irb_and_reline_versions
  IRB_VERSIONS.map do |irb_version|
    matchdata = get_dependency('irb', irb_version)
    next if matchdata.nil? # FIXME
    dependency_version = matchdata[2]
    comparison = matchdata[1]
    {irb_version: irb_version, reline_versions: depend_reline_versions(dependency_version, comparison)}
  end.compact
end

irb_and_reline_versions.each do |hash|
  hash[:reline_versions].each do |reline_version|
    appraise "irb v#{hash[:irb_version]} and reline v#{reline_version}" do
      gem "irb", "#{hash[:irb_version]}"
      gem "reline", "#{reline_version}"
    end
  end
end

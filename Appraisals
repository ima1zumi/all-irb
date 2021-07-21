# IRB_VERSIONS = %w(1.3.6 1.3.5 1.3.4 1.3.3 1.3.2 1.3.1 1.3.0 1.2.9 1.2.8 1.2.7 1.2.6 1.2.5 1.2.4 1.2.3 1.2.2 1.2.1 1.2.0 1.1.1 1.1.0 1.1.0.pre.4 1.1.0.pre.3 1.1.0.pre.2 1.1.0.pre.1 1.0.0)
# RELINE_VERSIONS = %w(0.2.6 0.2.5 0.2.4 0.2.3 0.2.2 0.2.1 0.2.0 0.1.10 0.1.9 0.1.8 0.1.7 0.1.6 0.1.5 0.1.4 0.1.3 0.1.2 0.1.1 0.1.0 0.0.7 0.0.6 0.0.5 0.0.4 0.0.3 0.0.2 0.0.1 0.0.0)
IRB_VERSIONS = %w(1.3.6 1.3.5 1.3.4)
RELINE_VERSIONS = %w(0.2.6 0.2.5)

IRB_VERSIONS.each do |irb_version|
  RELINE_VERSIONS.each do |reline_version|
    appraise "irb v#{irb_version} and reline v#{reline_version}" do
      gem "irb", "#{irb_version}"
      gem "reline", "#{reline_version}"
    end
  end
end

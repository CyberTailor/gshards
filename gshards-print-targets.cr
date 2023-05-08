# Copyright 2022 Gentoo Authors
# Distributed under the terms of the MIT License

require "yaml"

yaml = File.open("shard.yml") do |file|
  YAML.parse(file)
end

if !yaml["targets"]?
  exit(1)
end

yaml["targets"].as_h.each do |key, value|
  puts Process.quote(["-o", key.as_s, value["main"].as_s])
end

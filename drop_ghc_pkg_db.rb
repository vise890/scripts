#!/usr/bin/env ruby
pkgs = `ghc-pkg check --simple-output --names-only`
pkgs.chomp.split("\s").each do |pkg|
  system "ghc-pkg --force unregister #{pkg}"
end

@echo off

set SP=%~dp0
ruby -e 'require File.expand_path("../boot/app", ENV["SP"]); require "script/cpuinfo"; exit Script::Cpuinfo.new.main' -- %*

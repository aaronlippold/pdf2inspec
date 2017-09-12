# encoding: utf-8

libdir = File.dirname(__FILE__)
$LOAD_PATH.unshift(libdir) unless $LOAD_PATH.include?(libdir)

require 'pdf2inspec/cli'
require 'pdf2inspec/pdf2inspec'
require 'pdf2inspec/version'

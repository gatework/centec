# frozen_string_literal: true

require "minitest/autorun"
require "centec"

class CentecTest < Minitest::Test
  def test_version_matches_gemspec
    spec = Gem::Specification.load(File.expand_path("../centec.gemspec", __dir__))
    assert_equal Centec::VERSION, spec.version.to_s
    assert_equal "centec", spec.name
  end

  def test_errors_can_be_rescued_as_standard_errors
    assert_operator Centec::Error, :<, StandardError
  end

  def test_package_contains_only_library_and_documentation
    spec = Gem::Specification.load(File.expand_path("../centec.gemspec", __dir__))
    assert_equal %w[CHANGELOG.md LICENSE README.md lib/centec.rb lib/centec/version.rb], spec.files.sort
  end
end

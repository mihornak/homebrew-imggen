class Imggen < Formula
  desc "Generate images using AI providers (Gemini, Freepik)"
  homepage "https://github.com/mihornak/imggen"
  url "https://github.com/mihornak/imggen/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "PLACEHOLDER"
  license "MIT"

  depends_on "python@3"

  def install
    bin.install "imggen"
  end

  test do
    assert_match "Available models", shell_output("#{bin}/imggen --list-models")
  end
end

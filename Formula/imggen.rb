class Imggen < Formula
  desc "Generate images using AI providers (Gemini, Freepik)"
  homepage "https://github.com/mihornak/imggen"
  url "https://github.com/mihornak/imggen/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "7bd662e3fab2afb7948cee0e3e798c40131a5ebb1d72653bd5f97dd11b4cf091"
  license "MIT"

  depends_on "python@3"

  def install
    bin.install "imggen"
  end

  test do
    assert_match "Available models", shell_output("#{bin}/imggen --list-models")
  end
end

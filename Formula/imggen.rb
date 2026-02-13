class Imggen < Formula
  desc "Generate images using AI providers (Gemini, Freepik)"
  homepage "https://github.com/mihornak/imggen"
  url "https://github.com/mihornak/imggen/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "3405730dd24d4f5c850366a3dea338f1b7b97191d571a721f6286309c11a0819"
  license "MIT"

  depends_on "python@3"

  def install
    bin.install "imggen"
  end

  def caveats
    <<~EOS
      To configure API keys, run:
        imggen auth

      To install the Claude Code skill (/generate-image), run:
        imggen setup-skill
    EOS
  end

  test do
    assert_match "Available models", shell_output("#{bin}/imggen --list-models")
  end
end

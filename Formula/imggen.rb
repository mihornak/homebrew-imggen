class Imggen < Formula
  desc "Generate images using AI providers (Gemini, Freepik)"
  homepage "https://github.com/mihornak/imggen"
  url "https://github.com/mihornak/imggen/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "9a059211a8bef03e5aa0c36f036f6efa408b3ccb49ebcf0af9bcd2f9ab72d9fb"
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

class Imggen < Formula
  desc "Generate images using AI providers (Gemini, Freepik)"
  homepage "https://github.com/mihornak/imggen"
  url "https://github.com/mihornak/imggen/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "19f7b7e87a70df0acd653a67cd150a349fea477866da00f0617e7251251c5d69"
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

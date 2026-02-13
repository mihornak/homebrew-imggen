class Imggen < Formula
  desc "Generate images using AI providers (Gemini, Freepik)"
  homepage "https://github.com/mihornak/imggen"
  url "https://github.com/mihornak/imggen/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "7bd662e3fab2afb7948cee0e3e798c40131a5ebb1d72653bd5f97dd11b4cf091"
  license "MIT"

  depends_on "python@3"

  def install
    bin.install "imggen"
    (share/"imggen").install "skill/SKILL.md"
  end

  def post_install
    claude_dir = Pathname.new(Dir.home)/".claude"
    if claude_dir.directory?
      skill_dir = claude_dir/"skills/generate-image"
      skill_dir.mkpath
      cp share/"imggen/SKILL.md", skill_dir/"SKILL.md"
    end
  end

  def caveats
    <<~EOS
      To configure API keys, run:
        imggen auth

      Claude Code skill was #{(Pathname.new(Dir.home)/".claude").directory? ? "installed" : "skipped (install Claude Code first, then run: brew postinstall imggen)"}.
    EOS
  end

  test do
    assert_match "Available models", shell_output("#{bin}/imggen --list-models")
  end
end

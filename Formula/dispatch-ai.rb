class DispatchAi < Formula
  desc "Pattern 3 autonomous coding CLI with a verifier you can trust"
  homepage "https://github.com/dispatch-ai-labs/dispatch-ai"
  version "0.0.7"

  on_macos do
    on_arm do
      url "https://github.com/dispatch-ai-labs/dispatch-ai/releases/download/v0.0.7/dispatch-darwin-arm64"
      sha256 "05f57176c1b02e2b27b34f21564137ca2e9c62111f23cda0890f17816dcf81f4"
    end
    on_intel do
      url "https://github.com/dispatch-ai-labs/dispatch-ai/releases/download/v0.0.7/dispatch-darwin-x64"
      sha256 "eb575e94e3039b9ddf186ee7428c4b9b16088338217cb410017d1a82b94ada2f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dispatch-ai-labs/dispatch-ai/releases/download/v0.0.7/dispatch-linux-arm64"
      sha256 "47cb62fa0d165586f8a754647a1b7e1beca303e064ad6d6f07e52f2796cf940a"
    end
    on_intel do
      url "https://github.com/dispatch-ai-labs/dispatch-ai/releases/download/v0.0.7/dispatch-linux-x64"
      sha256 "306b668a4f8837abef2b7938227a17ddda5fda98b06de322712f57062e75b2d4"
    end
  end

  def install
    if OS.mac?
      bin.install (Hardware::CPU.arm? ? "dispatch-darwin-arm64" : "dispatch-darwin-x64") => "dispatch"
    else
      bin.install (Hardware::CPU.arm? ? "dispatch-linux-arm64" : "dispatch-linux-x64") => "dispatch"
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/dispatch --version")
  end
end

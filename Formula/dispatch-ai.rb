class DispatchAi < Formula
  desc "Pattern 3 autonomous coding CLI with a verifier you can trust"
  homepage "https://github.com/dispatch-ai-labs/dispatch-ai"
  version "0.0.4"

  on_macos do
    on_arm do
      url "https://github.com/dispatch-ai-labs/dispatch-ai/releases/download/v0.0.4/dispatch-darwin-arm64"
      sha256 "5571cd27e20bff0a49a9bc450c6988bf11085bd0ee78e80c44abcf2ac390f8ed"
    end
    on_intel do
      url "https://github.com/dispatch-ai-labs/dispatch-ai/releases/download/v0.0.4/dispatch-darwin-x64"
      sha256 "d7954aef1056e4d8b69aae8f6f8d776cbe06e32f7685b83626cc659fa7385904"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dispatch-ai-labs/dispatch-ai/releases/download/v0.0.4/dispatch-linux-arm64"
      sha256 "4c32a3b62038a6c85af3a6a92d837ae2fdfb9f93d43cb0a852273e28780c8b93"
    end
    on_intel do
      url "https://github.com/dispatch-ai-labs/dispatch-ai/releases/download/v0.0.4/dispatch-linux-x64"
      sha256 "27a8ce407fe43a1ac2906ea431c26d0359135e58417e293c3ceae7a0529a697b"
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

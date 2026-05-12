class DispatchAi < Formula
  desc "Pattern 3 autonomous coding CLI with a verifier you can trust"
  homepage "https://github.com/dispatch-ai-labs/dispatch-ai"
  version "0.0.6"

  on_macos do
    on_arm do
      url "https://github.com/dispatch-ai-labs/dispatch-ai/releases/download/v0.0.6/dispatch-darwin-arm64"
      sha256 "e0f3100477a7884a6fa1e5ef096caf5d18144c4ff8255bb806a81179130d3c68"
    end
    on_intel do
      url "https://github.com/dispatch-ai-labs/dispatch-ai/releases/download/v0.0.6/dispatch-darwin-x64"
      sha256 "7e36c0cee668f914981f77052f17daf711cd0102381ca095786f2b40ac943c4f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dispatch-ai-labs/dispatch-ai/releases/download/v0.0.6/dispatch-linux-arm64"
      sha256 "fa7509070ec9c466ca9d05d1bfc0547ac822b1654238aa9cb02f05bb1e3559b7"
    end
    on_intel do
      url "https://github.com/dispatch-ai-labs/dispatch-ai/releases/download/v0.0.6/dispatch-linux-x64"
      sha256 "d05919ca24bcdf6ad7582a4d0b8f029e5cc7d45e7c80aea1aa1b6ec98b84761a"
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

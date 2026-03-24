class BetterAnonymity < Formula
  desc "MacOS Security, Privacy & Anonymity Tools"
  homepage "https://github.com/johnpatrickroach/better-anonymity"
  url "https://github.com/johnpatrickroach/better-anonymity/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
  license "MIT"
  head "https://github.com/johnpatrickroach/better-anonymity.git", branch: "main"

  def install
    # Install specific directories to libexec to ensure correct structure
    libexec.install "bin", "lib", "README.md", "LICENSE"
    
    # Symlink the main binary from libexec/bin to the global bin directory
    bin.install_symlink libexec/"bin/better-anonymity"
    
    # Create aliases pointing to the SAME target in libexec
    bin.install_symlink libexec/"bin/better-anonymity" => "better-anon"
    bin.install_symlink libexec/"bin/better-anonymity" => "b-a"
  end

  def caveats
    <<~EOS
      You can now run 'better-anonymity', 'better-anon', or 'b-a'.
      
      To start using the tool, run:
        b-a
        
      To check your privacy score:
        b-a diagnose
    EOS
  end

  test do
    assert_match "Usage", shell_output("#{bin}/better-anonymity help")
  end
end

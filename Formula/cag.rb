class Cag < Formula
  desc "Generate clean architecture boilerplate for Kotlin"
  homepage "https://github.com/EranBoudjnah/CleanArchitectureGenerator"
  url "https://github.com/EranBoudjnah/CleanArchitectureGenerator/releases/download/v0.3.0/cag-0.3.0.tar"
  sha256 "7c423e32e4aa0ca319ebadcd3f8506f45c97d343ddc3bd632a1c581d18c7d300"
  license "MIT"

  depends_on "openjdk"

  def install
    libexec.install Dir["lib/*"]

    (bin/"cag").write <<~EOS
      #!/bin/bash
      exec java -cp "#{libexec}/*" com.mitteloupe.cag.cli.MainKt "$@"
    EOS
    (bin/"cag").chmod 0755

    bin.install "bin/cag.bat"
  end

  test do
    assert_match "0.0.2", shell_output("#{bin}/cag --version")
  end
end

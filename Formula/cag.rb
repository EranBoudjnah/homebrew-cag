class Cag < Formula
  desc "Generate clean architecture boilerplate for Kotlin"
  homepage "https://github.com/EranBoudjnah/CleanArchitectureGenerator"
  url "https://github.com/EranBoudjnah/CleanArchitectureGenerator/releases/download/v0.4.0/cag-0.4.0.tar"
  sha256 "f4aeeb452c48ddc39b03cd1bf53a8d92bf8392d864d649fdc88adcecb6f3b288"
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

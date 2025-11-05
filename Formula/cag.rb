class Cag < Formula
  desc "Generate clean architecture boilerplate for Kotlin"
  homepage "https://github.com/EranBoudjnah/CleanArchitectureGenerator"
  url "https://github.com/EranBoudjnah/CleanArchitectureGenerator/releases/download/v0.4.1/cag-0.4.1.tar"
  sha256 "6af34bded5839bac43d40cc238b1264f0f88293088e9262e379459f22ed1f10a"
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
    assert_match "0.4.1", shell_output("#{bin}/cag --version")
  end
end

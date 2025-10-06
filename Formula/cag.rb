class Cag < Formula
  desc "Generate clean architecture boilerplate for Kotlin"
  homepage "https://github.com/EranBoudjnah/CleanArchitectureGenerator"
  url "https://github.com/EranBoudjnah/CleanArchitectureGenerator/releases/download/cli-v0.0.2/cag-0.0.2.tar"
  sha256 "f6b0e15ce15abb7f78521bc3f2e659bd014d38c551075ed52ffee3283d646214"
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

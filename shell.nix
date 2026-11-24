{ pkgs ? import <nixpkgs> { } }:

pkgs.mkShell {
  name = "victory-linux";

  packages = with pkgs; [
    rustup
    cargo-xwin
    umu-launcher
    vulkan-loader
    vulkan-tools
    pkg-config
    clang
    llvm
    lld
  ];

  shellHook = ''
    export LD_LIBRARY_PATH="${pkgs.vulkan-loader}/lib''${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}"
    echo "VIctory Linux shell: cargo xwin build --release -p victory --target x86_64-pc-windows-msvc"
    echo "Run under Proton with ./scripts/victory-proton.sh TITLE.exe --execute"
    echo "The launcher prefers installed GE-Proton; otherwise UMU selects its default."
    echo "Rustup installs the pinned toolchain from rust-toolchain.toml on first use."
  '';
}

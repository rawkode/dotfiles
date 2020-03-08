self: super:
let
  unstable = import <unstable> { };
  unstable-nonfree = import <unstable> { config.allowUnfree = true; };
in {
  fwupd = unstable.fwupd;

  fprintd = (super.callPackage ../packages/fingerprint-reader/default.nix {
    libpam-wrapper = (super.callPackage ../packages/fingerprint-reader/libpam-wrapper.nix { });
  });
  libfprint = (super.callPackage ../packages/fingerprint-reader/libfprint.nix { });
}

# Generated by bower2nix v3.2.0 (https://github.com/rvl/bower2nix)
{ fetchbower, buildEnv }:
buildEnv { name = "bower-env"; ignoreCollisions = true; paths = [
  (fetchbower "jquery" "2.1.4" "~2.1.3" "1ywrpk2xsr6ghkm3j9gfnl9r3jn6xarfamp99b0bcm57kq9fm2k0")
  (fetchbower "video.js" "4.11.4" "~4.11.4" "05prdvyk0rxbkh7sdd0d9ns5l5crwvc68wzkyqmrdjw367pcv8sn")
  (fetchbower "leaflet" "0.7.7" "~0.7.3" "0jim285bljmxxngpm3yx6bnnd10n2whwkgmmhzpcd1rdksnr5nca")
  (fetchbower "tinymce" "4.1.10" "~4.1.7" "16jyvdb9bq8gjwhs69q8p88vdixalajrz81nsmbrzzxhkih57dyx")
]; }
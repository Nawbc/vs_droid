// ignore_for_file: constant_identifier_names

const IS_APP_INIT = 'is_app_init';
const TERMINAL_QUAKE_MODE = 'terminal_quake_mode';
const SERVER_PORT = 'server_port';

const String SENTRY_DNS = 'https://af5cdd26b94d447c9d25633109067c56@o532771.ingest.sentry.io/4504020304986112';

const String LOOPBACK_ADDR = '127.0.0.1';

const String THEME_KEY = 'theme';
const String LIGHT_THEME = 'light';
const String DARK_THEME = 'dark';

const ALPINE_SEMVER = "v3.16.2";
const BOOTSTRAP_SEMVER = "2022.10.23-r1+apt-android-7";
const PROOT_DISTRO_SEMVER = "3.2.1";
const PROOT_SEMVER = "5.1.107-54";
const NCURSES_SEMVER = "6.3-4";
const NCURSES_UTILS_SEMVER = "6.3-4";
const TALLOC_SEMVER = "2.3.3";

const ALPINE_TARBALL = "alpine-aarch64-$ALPINE_SEMVER.tar.xz";
const FAKE_ALPINE_SCRIPT = """
DISTRO_NAME="Alpine Linux (edge)"

TARBALL_URL['aarch64']="$ALPINE_TARBALL"
TARBALL_SHA256['aarch64']="cb5dc88e0328765b0decae0da390c2eeeb9414ae82f79784cf37d7c521646a59"
""";

const ROOTFS_DOWNLOAD_CN = [
  {
    "label": "Alpine Linux(built-in)",
    "value": "alpine",
  },
  {
    "label": "Manjaro(coming soon)",
    "value": "manjaro",
    "url": "https://github.com/manjaro-arm/rootfs/releases",
  },
  {
    "label": "Arch Linux(coming soon)",
    "value": "arch",
    "url": "",
  },
  {
    "label": "Debian(coming soon)",
    "value": "debian",
    "url": "",
  },
  {
    "label": "Fedora(coming soon)",
    "value": "fedora",
    "url": "",
  },
  {
    "label": "OpenSUSE(coming soon)",
    "value": "openSUSE",
    "url": "",
  },
  {
    "label": "Ubuntu(coming soon)",
    "value": "ubuntu",
    "url": "",
  },
];

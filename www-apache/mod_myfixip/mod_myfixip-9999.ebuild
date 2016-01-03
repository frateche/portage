# Sources : https://github.com/frateche/portage

EAPI=5

inherit apache-module git-r3

DESCRIPTION="Fix 'remote_ip' in HTTP/HTTPS (PROXY protocol, like ha-proxy and Amazon ELB)"
HOMEPAGE="https://github.com/ggrandes/apache22-modules"
LICENSE="Apache-2.0"

KEYWORDS="~amd64"
IUSE=""
SLOT="0"

EGIT_REPO_URI="https://github.com/ggrandes/apache22-modules.git"

APACHE2_MOD_CONF="30_${PN}"
APACHE2_MOD_DEFINE="FIXIP"

need_apache2_2


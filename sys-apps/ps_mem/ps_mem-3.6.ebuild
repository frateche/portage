# Sources : https://github.com/frateche/portage

EAPI=5

inherit git-r3

DESCRIPTION="Memory usage tool"
HOMEPAGE="https://github.com/pixelb/ps_mem/"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"

EGIT_CLONE_TYPE="single"
EGIT_REPO_URI="https://github.com/pixelb/ps_mem/"
EGIT_REPO_COMMIT="c80287d"

src_install() {
	into /usr
	dosbin ps_mem.py
	dosym  ps_mem.py usr/sbin/ps_mem
	doman ps_mem.1
}

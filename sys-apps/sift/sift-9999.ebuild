# Sources : https://github.com/frateche/portage

EAPI=5

DESCRIPTION="A fast and powerful open source alternative to grep in go."
HOMEPAGE="http://sift-tool.org/"
SRC_URI=""

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-lang/go sys-devel/gcc"
RDEPEND="${DEPEND}"

EGO_PN="github.com/svent/sift"

inherit golang-vcs

src_compile() {
	ebegin "Starting compilation"
	GOPATH=$WORKDIR/$P:$EGO_STORE_DIR go build  -ldflags '-w' -v ${EGO_PN}
}

src_install() {
	ebegin "Starting installation"
	into /usr
	dobin sift
}

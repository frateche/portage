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

PKGS="github.com/svent/go-nbreader:7cef48d
github.com/svent/go-flags:4bcbad3
github.com/svent/sift:v0.7.1"

inherit golang-vcs

src_configure() {
	ebegin "Starting source configuration"
	for p in $PKGS
	do
		DIR=$(echo $EGO_STORE_DIR/src/${p%:*})
		COMMIT=$(echo ${p#*:})
		echo "Force checkout $DIR -> $COMMIT"
		cd $DIR
		git checkout $COMMIT 2>/dev/null
	done
}

src_compile() {
	ebegin "Starting compilation"
	GOPATH=$WORKDIR/$P:$EGO_STORE_DIR go build  -ldflags '-w' -v ${EGO_PN}
}

src_install() {
	ebegin "Starting installation"
	into /usr
	dobin sift
}

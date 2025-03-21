# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit autotools multilib-minimal

DESCRIPTION="A ELF object file access library"
HOMEPAGE="http://www.mr511.de/software/"
SRC_URI="http://www.mr511.de/software/${P}.tar.gz"

LICENSE="LGPL-2"
SLOT="0"
KEYWORDS="~alpha ~amd64 arm ~arm64 ~hppa ~mips ~ppc ~ppc64 ~sparc ~x86 ~sparc-solaris ~sparc64-solaris ~x64-solaris ~x86-solaris"
IUSE="debug nls"

RDEPEND="!dev-libs/elfutils"
DEPEND="${RDEPEND}"
BDEPEND="nls? ( sys-devel/gettext )"

DOCS=( ChangeLog README )

MULTILIB_WRAPPED_HEADERS=( /usr/include/libelf/sys_elf.h )

PATCHES=(
	"${FILESDIR}/${P}-build.patch"
)

src_prepare() {
	default

	eautoreconf
}

multilib_src_configure() {
	# prefix might want to play with this; unfortunately the stupid
	# macro used to detect whether we're building ELF is so screwed up
	# that trying to fix it is just a waste of time.
	export mr_cv_target_elf=yes

	ECONF_SOURCE="${S}" econf \
		$(use_enable nls) \
		--enable-shared \
		$(use_enable debug)
}

multilib_src_install() {
	emake \
		prefix="${ED}/usr" \
		libdir="${ED}/usr/$(get_libdir)" \
		install \
		install-compat \
		-j1

	find "${D}" -name '*.la' -o -name '*.a' -delete || die
}

# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

# ebuild generated by hackport 0.7.1.1.9999
#hackport: flags: aeson,assoc,quickcheck,semigroupoids,+assoc

CABAL_FEATURES="lib profile haddock hoogle hscolour"
CABAL_HACKAGE_REVISION="5"
inherit haskell-cabal

DESCRIPTION="An either-or-both data type"
HOMEPAGE="https://github.com/haskellari/these"
SRC_URI="https://hackage.haskell.org/package/${P}/${P}.tar.gz
	https://hackage.haskell.org/package/${P}/revision/${CABAL_HACKAGE_REVISION}.cabal -> ${PF}.cabal"

LICENSE="BSD"
SLOT="0/${PV}"
KEYWORDS="~amd64 ~arm64 ~ppc64 ~x86"

RDEPEND=">=dev-haskell/assoc-1:=[profile?] <dev-haskell/assoc-1.1:=[profile?]
	>=dev-haskell/hashable-1.2.7.0:=[profile?] <dev-haskell/hashable-1.5:=[profile?]
	>=dev-lang/ghc-8.4.3:=
"
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-2.2.0.1
"

src_configure() {
	haskell-cabal_src_configure \
		--flag=assoc
}
BDEPEND="app-text/dos2unix"

src_prepare() {
	# pull revised cabal from upstream
	cp "${DISTDIR}/${PF}.cabal" "${S}/${PN}.cabal" || die

	# Convert to unix line endings
	dos2unix "${S}/${PN}.cabal" || die

	# Apply patches *after* pulling the revised cabal
	default
}

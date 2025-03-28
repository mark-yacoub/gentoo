# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

# ebuild generated by hackport 0.7.9999

CABAL_FEATURES="lib profile haddock hoogle hscolour test-suite"
inherit haskell-cabal

DESCRIPTION="Release with confidence"
HOMEPAGE="https://hedgehog.qa"
HACKAGE_REV="1"
SRC_URI="https://hackage.haskell.org/package/${P}/${P}.tar.gz
	https://hackage.haskell.org/package/${P}/revision/${HACKAGE_REV}.cabal -> ${PF}.cabal"

LICENSE="BSD"
SLOT="0/${PV}"
KEYWORDS="~amd64 ~arm64 ~ppc64 ~x86"

RDEPEND=">=dev-haskell/ansi-terminal-0.6:=[profile?] <dev-haskell/ansi-terminal-0.12:=[profile?]
	>=dev-haskell/async-2.0:=[profile?] <dev-haskell/async-2.3:=[profile?]
	>=dev-haskell/concurrent-output-1.7:=[profile?] <dev-haskell/concurrent-output-1.11:=[profile?]
	>=dev-haskell/erf-2.0:=[profile?] <dev-haskell/erf-2.1:=[profile?]
	>=dev-haskell/exceptions-0.7:=[profile?] <dev-haskell/exceptions-0.11:=[profile?]
	>=dev-haskell/lifted-async-0.7:=[profile?] <dev-haskell/lifted-async-0.11:=[profile?]
	>=dev-haskell/mmorph-1.0:=[profile?] <dev-haskell/mmorph-1.2:=[profile?]
	>=dev-haskell/monad-control-1.0:=[profile?] <dev-haskell/monad-control-1.1:=[profile?]
	>=dev-haskell/mtl-2.1:=[profile?] <dev-haskell/mtl-2.3:=[profile?]
	>=dev-haskell/pretty-show-1.6:=[profile?] <dev-haskell/pretty-show-1.11:=[profile?]
	>=dev-haskell/primitive-0.6:=[profile?] <dev-haskell/primitive-0.8:=[profile?]
	>=dev-haskell/random-1.1:=[profile?] <dev-haskell/random-1.3:=[profile?]
	>=dev-haskell/resourcet-1.1:=[profile?] <dev-haskell/resourcet-1.3:=[profile?]
	>=dev-haskell/stm-2.4:=[profile?] <dev-haskell/stm-2.6:=[profile?]
	>=dev-haskell/text-1.1:=[profile?] <dev-haskell/text-1.3:=[profile?]
	>=dev-haskell/transformers-base-0.4.5.1:=[profile?] <dev-haskell/transformers-base-0.5:=[profile?]
	>=dev-haskell/wl-pprint-annotated-0.0:=[profile?] <dev-haskell/wl-pprint-annotated-0.2:=[profile?]
	>=dev-lang/ghc-8.4.3:=
"
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-2.2.0.1
"

src_prepare() {
	# pull revised cabal from upstream
	cp "${DISTDIR}/${PF}.cabal" "${S}/${PN}.cabal" || die

	# Apply patches *after* pulling the revised cabal
	default
}

# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

# ebuild generated by hackport 0.6.1

CABAL_FEATURES="lib profile haddock hoogle hscolour test-suite"
inherit haskell-cabal

DESCRIPTION="Simple and incomplete pure haskell implementation of linear algebra"
HOMEPAGE="https://hackage.haskell.org/package/dense-linear-algebra"
SRC_URI="https://hackage.haskell.org/package/${P}/${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0/${PV}"
KEYWORDS="~amd64 ~arm64 ~ppc64 ~x86"
IUSE=""

RDEPEND=">=dev-haskell/math-functions-0.1.7:=[profile?]
	>=dev-haskell/primitive-0.3:=[profile?]
	>=dev-haskell/vector-0.10:=[profile?]
	>=dev-haskell/vector-algorithms-0.4:=[profile?]
	>=dev-haskell/vector-binary-instances-0.2.1:=[profile?]
	dev-haskell/vector-th-unbox:=[profile?]
	>=dev-lang/ghc-7.4.1:=
"
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-1.10
	test? ( dev-haskell/hspec
		dev-haskell/quickcheck )
"

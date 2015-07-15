-- |
-- Module      :  Acme.Operators.Base
-- License     :  BSD-3-Clause (see the file LICENSE)
-- Maintainer  :  Oleg Grenrus <oleg.grenrus@iki.fi>
--
-- Have you ever been wondering about some magic lookin operator. Here are all operators in base package. Not so many.
--
-- The operators are in few bigger logical groups, subgrouped by package. Many of them are exported from 'Prelude'.
--
-- There is a Stack Overflow QA listing prononciations of some of the operators.
-- See: <http://stackoverflow.com/questions/7746894/are-there-pronounceable-names-for-common-haskell-operators>
{-# LANGUAGE CPP #-}
module Acme.Operators.Base (
  -- * Functions
  -- ** Data.Function
  ($),
  (&),
  -- * Functors
  -- | Infamous operators on 'Functor', 'Applicative' and 'Monad'. Also 'Alternative'.

  -- ** Data.Functor
  (<$>),
  (<$),
  ($>),
  -- ** Control.Applicative
  (<*>),
  (<*),
  (*>),
  (<**>),
  (<|>),
  -- ** Control.Monad
  (>>=),
  (>>),
  (=<<),
  (>=>),
  (<=<),
  (<$!>),
  -- * Category & Arrows
  -- ** Control.Category
  -- | Dot operator '.' clashes with one in 'Prelude': 'Prelude..'. You can use '<<<'.
  (.),
  (>>>),
  (<<<),
  -- ** Control.Arrow
  -- | Optionally one can use @Arrows@ language extensions. See: <https://downloads.haskell.org/~ghc/7.10.1/docs/html/users_guide/arrow-notation.html>.
  (***),
  (&&&),
  (^>>),
  (>>^),
  (<<^),
  (^<<),
  (+++),
  (|||),
  -- * Algebraic
  -- ** Data.Eq
  (==),
  (/=),
  -- ** Data.Ord
  (<=),
  (<),
  (>),
  (>=),
  -- * Data.Monoid
  (<>),
  -- * Data
  -- ** Data.Bits
  (.&.),
  (.|.),
  -- ** Data.Bool
  (&&),
  (||),
  -- ** Data.Complex
  Complex(..), -- :+
  -- ** Data.Ratio
  (%),
  -- ** Data.List
  (++),
  (!!),
  (\\),
  -- * Type level trickery
  -- ** Data.Type.Equality
  (:~:),
  ) where

import Control.Applicative
import Control.Arrow
import Control.Category
import Control.Monad
import Data.Bits
import Data.Complex (Complex(..))
import Data.Function hiding ((.))
import Data.Functor
import Data.List
import Data.Monoid
import Data.Ratio
import Data.Type.Equality
import Prelude hiding ((.))

#if !MIN_VERSION_base(4,8,0)

infixl 4 <$!>

-- | Strict version of 'Data.Functor.<$>'.
--
-- @since 4.8.0.0
(<$!>) :: Monad m => (a -> b) -> m a -> m b
{-# INLINE (<$!>) #-}
f <$!> m = do
  x <- m
  let z = f x
  z `seq` return z

infixl 1 &

-- | '&' is a reverse application operator.  This provides notational
-- convenience.  Its precedence is one higher than that of the forward
-- application operator '$', which allows '&' to be nested in '$'.
--
-- @since 4.8.0.0
(&) :: a -> (a -> b) -> b
x & f = f x


#endif

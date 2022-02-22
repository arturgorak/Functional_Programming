data Expr a = Val a | Add (Expr a) (Expr a) | Mul (Expr a) (Expr a) | Sub (Expr a) (Expr a) | Div (Expr a) (Expr a) deriving Show



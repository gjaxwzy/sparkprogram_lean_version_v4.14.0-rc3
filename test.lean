import Mathlib
--the version is different,hence i cannot simply import minif2fimport
--question 1
example(f:ℝ->ℝ)(hf:f 0 = 0)(hf2:∀x:ℝ,f (2*x)=f (x)+Real.sin (x)):f (1) < 1 :=
by sorry
--question 2
def f(x:Nat):=
if x=0 then 0
else if Nat.gcd (f (x-1)+1) (105) =1 then f (x-1)+1
else f (x-1)+2
example:f 1000=2186 :=
 by sorry
--question 3
example(a b c:ℝ)(h1:a ≥ 0)(h2:b ≥ 0)(h3:c ≥ 0):Real.sqrt (a*a+a*b+b*b) +Real.sqrt (b*b+c*b+c*c)+Real.sqrt (a*a+a*c+c*c)≤ Real.sqrt (5*a^2+5*b^2+5*c^2+4*ab+4*bc+4*ca):=
by sorry
--question 4
def f_2(x:Nat):Int:=
if x=0 then 0
else if x=1 then 1
else if x=2 then 1
else if x=3 then 3
else f_2 (x-1)+2*f_2 (x-2)+f_2 (x-3)
example(a:Int)(h1:a>0):∃ b:Nat, (b>1)∧ (a∣f_2 b):=
by sorry
--question 5

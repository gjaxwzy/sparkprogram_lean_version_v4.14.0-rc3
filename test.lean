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

def f_3(l:List ℝ)(x:ℝ):ℝ:=
List.prod (List.map (x-.) l)
def requir(x:ℝ):=x≤ 1∧ x≥ -1
def requir2(x:ℝ):=x<1∧ x>-1
example(a b:ℝ)(l:List ℝ)(h1:List.Forall requir l)(h2:a>-1∧ a<0∧ b>0 ∧ b<1):requir2 (f_3 l a)∨ requir2 (f_3 l b):=
by sorry

--proof 1

theorem theorem_5fdfb072_cf0d_4e11_bd2a_0934958add04 (a : ℝ) (h : a = 10) : Real.sqrt (10 * 4 * 3 * 3) = 6 * Real.sqrt 10 :=
calc Real.sqrt (10 * 4 * 3 * 3)=Real.sqrt (10*2*2*3*3):=by norm_num
_=Real.sqrt (10)*Real.sqrt (2)*Real.sqrt 2*Real.sqrt 3*Real.sqrt 3:=by simp[norm_num,Real.sqrt_mul]
_=Real.sqrt 10*(2*3):=by simp[Real.mul_self_sqrt,mul_assoc]
_=Real.sqrt 10*6:=by norm_num
_=6*Real.sqrt 10:=by simp[mul_comm]
--proof 2
theorem theorem_394a1998_91a8_40a3_80d4_d8426d461b0c (a b : ℝ) (ha : 0 < a) (hb : 0 < b) (hab : a * b + 1 / (a * b) = 6) : (a + 1) * (b + 1) ≥ 2 := by sorry

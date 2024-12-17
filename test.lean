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
theorem theorem_394a1998_91a8_40a3_80d4_d8426d461b0c (a b : ℝ) (ha : 0 < a) (hb : 0 < b) (hab : a * b + 1 / (a * b) = 6) : (a + 1) * (b + 1) ≥ 2 :=
have h1:0<a*b:=mul_pos ha hb
have abnonzero:a*b≠0:=ne_of_gt h1
have h2:0≤ a*b:=le_of_lt h1
have h3:0≤ √(a * b):= Real.sqrt_nonneg (a*b)
have ha1:0≤ a:=by
 apply le_of_lt
 exact ha
have hb1:0≤ b:=by
 apply le_of_lt
 exact hb
have amgm:(a+1)*(b+1)≥ a*b+2*Real.sqrt (a*b)+1:=
calc (a+1)*(b+1)=a*b+a+b+1:=by ring
 _=a*b+(Real.sqrt a)^2+(Real.sqrt b)^2+1:=by rw[Real.sq_sqrt ha1 ,Real.sq_sqrt hb1]
 _≥ a*b+2*Real.sqrt a*Real.sqrt b+1:=by linarith[two_mul_le_add_pow_two (Real.sqrt a) (Real.sqrt b)]
 _=a*b+2*Real.sqrt (a*b)+1:=by simp[←(Real.sqrt_mul ha1 b),mul_assoc]

have anotherhab :a*b+2*Real.sqrt (a*b)-1=0∨a*b-2*Real.sqrt (a*b) -1=0:=by
 apply eq_zero_or_eq_zero_of_mul_eq_zero
 calc (a * b + 2 * √(a * b) - 1) * (a * b - 2 * √(a * b) - 1)=(a*b)*(a*b)-2*a*b-4*√(a * b)*√(a * b)+1:=by ring_nf
 _=(a*b)*(a*b)-2*a*b-4*a*b+1:=by simp[Real.mul_self_sqrt h2,mul_assoc]
 _=(a*b)*(a*b)-2*a*b-4*a*b+(a*b)/(a*b):=by rw[div_self abnonzero]
 _=(a*b)*(a*b+1/(a*b)-6):=by ring_nf
 _=(a*b)*(6-6):=by rw[hab]
 _=0:=by ring
have esti:a*b+2*Real.sqrt (a*b)-1≥ 0:=by
    cases anotherhab
    case inl hab1=>
        apply ge_of_eq
        exact hab1
    case inr hab1=>
    calc a * b + 2 * √(a * b) - 1=a*b-2*√(a * b)-1+4*√(a * b):=by ring
        _=4*√(a * b):=by simp[hab1]
        _≥ 0:=by linarith[h2]

by linarith[amgm,anotherhab]
--proof 3;i have no idea about dealing with finset.icc
open BigOperators
    theorem theorem_1abfa71b_2e7e_4b59_9af1_cb16f6cafea1 (i k : ℕ) (h₁ : k ≤ i) : ∑ n in Finset.Icc k i, Nat.choose n k = Nat.choose (i + 1) (k + 1) := by
    induction i
    case zero=>
        have kzero:k=0:=Nat.eq_zero_of_le_zero h₁
        have ineq1:0≤ 0:=by linarith
        calc ∑ n in Finset.Icc k 0, Nat.choose n k=∑ n in Finset.Icc 0 0, Nat.choose n 0:=by rw[kzero]
        _=Nat.choose 0 0+∑ n in ∅, Nat.choose n 0:=by rw[← Finset.add_sum_Ico_eq_sum_Icc ineq1 ,Finset.Ico_self]
        _=Nat.choose 0 0 +0 :=by rw[Finset.sum_empty]
        _=Nat.choose 1 1:=by simp[Nat.choose_self 0,Nat.choose_self 1]
        _=Nat.choose (0+1) (0+1):=by norm_num
        _=Nat.choose (0+1) (k+1):=by rw[kzero]
    case succ i hi=>
        cases Nat.le_add_one_iff.mp h₁
        case inl kgood=>
            calc ∑ n in Finset.Icc k (i + 1), Nat.choose n k=∑ n in Finset.Icc k i, Nat.choose n k+Nat.choose (i+1) k:=by apply Finset.sum_Icc_succ_top h₁
            _=Nat.choose (i+1) (k+1)+Nat.choose (i+1) k:=by rw[hi kgood]
            _=Nat.choose (i+1) k+Nat.choose (i+1) (k+1):=by rw[add_comm]
            _=Nat.choose (i+1+1) (k+1):=by rw[Nat.choose_succ_succ' (i+1) k]
        case inr keq=>
            have ineq2:i+1 ≤ i+1:=by linarith
            calc ∑ n in Finset.Icc k (i + 1), Nat.choose n k= ∑ n in Finset.Icc (i+1) (i + 1), Nat.choose n (i+1):=by rw[keq]
            _=Nat.choose (i+1) (i+1)+∑ n in ∅, Nat.choose n (i+1):=by rw[← Finset.add_sum_Ico_eq_sum_Icc ineq2 ,Finset.Ico_self]
            _=Nat.choose (i+1) (i+1):=by simp[Finset.sum_empty]
            _=Nat.choose (i+1+1) (i+1+1):=by rw[Nat.choose_self (i+1),Nat.choose_self (i+1+1)]
            _=Nat.choose (i+1+1) (k+1):=by rw[keq]

--proof 4
theorem theorem_f000e48f_6f30_408a_ac91_493fff4521d6 (f : ℕ → ℕ) (hf: f 1 = 1) (hf1: ∀ m n: ℕ, f (m + n) = f m + f n + m*n): ∀ n:ℕ, f n = n*(n + 1) / 2 := by
    intro n
    --have producteven:Even (n*(n+1)):=Nat.even_mul_succ_self n
    induction' n with n h
    case zero=>
        have doublef:f 0+0=f 0+f 0:=
            calc f 0+0=f 0:=by ring
            _=f 0+f 0+0*0:=by apply hf1 0 0
            _=f 0+f 0:=by ring
        calc f 0=0:=by rw[← (add_left_cancel doublef)]
        _=0 * (0 + 1) / 2:=by ring
    case succ=>
        have ge0: 0<2:=by norm_num
        have plugin:f (n+1)=n*(n+1)/2+(n+1):=
            calc f (n+1)=f n+f 1+n*1:=by rw[hf1 n 1]
            _=n*(n+1)/2+1+n*1:=by rw[hf,h]
            _=n*(n+1)/2+(n+1):=by ring
        have doublef:2*f (n + 1)  =2*((n + 1) * (n + 1 + 1) / 2):=
            calc 2*f (n+1)=2*(n*(n+1)/2+(n+1)):=by rw[plugin]
            _=2*(n*(n+1)/2)+2*(n+1):=by rw[mul_add]
            _=n*(n+1)+2*(n+1):=by rw[Nat.two_mul_div_two_of_even (Nat.even_mul_succ_self n)]
            _=(n+1)*(n+1+1):=by ring
            _=2*((n + 1) * (n + 1 + 1) / 2):=by rw[(Nat.two_mul_div_two_of_even (Nat.even_mul_succ_self (n+1)))]


        apply Nat.eq_of_mul_eq_mul_left ge0 doublef


--proof 5
theorem theorem_337c29d8_7fce_47e8_97d8_b2489b8c61d5 (a : ℝ) : (a^3 - a + 2)^2 > 4 * a^2 * (a^2 + 1) * (a - 2) :=
have h1:(a^3 - a + 2)^2-4 * a^2 * (a^2 + 1) * (a - 2)>0:=by
    cases eq_or_ne a 0
    case inl eqzero=>
        simp[eqzero]
    case inr nezero=>
        have squaregezero:0<a^2:=zpow_two_pos_of_ne_zero nezero
        calc (a^3 - a + 2)^2-4 * a^2 * (a^2 + 1) * (a - 2)=(a^2*(a-2))^2+2*(a^2)^2+8*a^2+(a-2)^2:=by ring
        _≥ 8*a^2:=by linarith[sq_nonneg (a-2),sq_nonneg (a^2),sq_nonneg (a^2*(a-2))]
        _> 0:=by linarith[squaregezero]
by linarith[h1]

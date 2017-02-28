theory Scratch
  imports Main
begin

lemma TND: "P \<or> \<not>P"
  by blast  

-- By -- assistant
lemma "\<exists>st. (fails st \<longrightarrow> (\<forall>s. fails s))"
  apply (insert TND[where P = "\<forall>s. fails s"])
  apply (erule disjE)
   apply (rule exI[where x = "Stefan"])
   apply (rule impI)
   apply assumption
  apply (unfold not_all)
  apply (erule exE)
  apply (rule exI)
  apply (rule impI)
  apply (erule notE)
    apply assumption
  find_theorems "\<not>(\<forall>_. _)"
end

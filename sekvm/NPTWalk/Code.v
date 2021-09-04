Require Import Coqlib.
Require Import AST.
Require Import Integers.
Require Import Values.
Require Import Cop.
Require Import Clight.
Require Import CDataTypes.
Require Import Ctypes.

Require Import Ident.

Local Open Scope Z_scope.

Definition _Rd : ident := 999%positive.
Definition _addr := 1%positive.
Definition _alloc := 2%positive.
Definition _arg := 3%positive.
Definition _base := 4%positive.
Definition _cb_offset := 5%positive.
Definition _cbndx := 6%positive.
Definition _cnt := 7%positive.
Definition _count := 8%positive.
Definition _cur_ticket := 9%positive.
Definition _cur_vcpuid := 10%positive.
Definition _cur_vmid := 11%positive.
Definition _data := 12%positive.
Definition _end := 13%positive.
Definition _esr := 14%positive.
Definition _fault_ipa := 15%positive.
Definition _get_now := 16%positive.
Definition _gfn := 17%positive.
Definition _gpa := 18%positive.
Definition _hsr := 19%positive.
Definition _i := 20%positive.
Definition _inbuf := 21%positive.
Definition _inc_exe := 22%positive.
Definition _incr_now := 23%positive.
Definition _incr_ticket := 24%positive.
Definition _index := 25%positive.
Definition _inowner := 26%positive.
Definition _inpfn := 27%positive.
Definition _iova := 28%positive.
Definition _is_write := 29%positive.
Definition _kvm := 30%positive.
Definition _len := 31%positive.
Definition _level := 32%positive.
Definition _lk := 33%positive.
Definition _load_addr := 34%positive.
Definition _load_idx := 35%positive.
Definition _load_info_cnt := 36%positive.
Definition _log_hold := 37%positive.
Definition _log_incr := 38%positive.
Definition _main := 39%positive.
Definition _map := 40%positive.
Definition _mapped := 41%positive.
Definition _my_ticket := 42%positive.
Definition _n := 43%positive.
Definition _next := 44%positive.
Definition _num := 45%positive.
Definition _num_context_banks := 46%positive.
Definition _offset := 47%positive.
Definition _outbuf := 48%positive.
Definition _outowner := 49%positive.
Definition _outpfn := 50%positive.
Definition _owner := 51%positive.
Definition _pa := 52%positive.
Definition _paddr := 53%positive.
Definition _page_count := 54%positive.
Definition _pass_hlock := 55%positive.
Definition _pass_lock := 56%positive.
Definition _pass_qlock := 57%positive.
Definition _perm := 58%positive.
Definition _pfn := 59%positive.
Definition _pgd := 60%positive.
Definition _pgd_idx := 61%positive.
Definition _pgd_pa := 62%positive.
Definition _pgnum := 63%positive.
Definition _pmd := 64%positive.
Definition _pmd_idx := 65%positive.
Definition _pmd_pa := 66%positive.
Definition _power := 67%positive.
Definition _prot := 68%positive.
Definition _pte := 69%positive.
Definition _pte_idx := 70%positive.
Definition _pte_pa := 71%positive.
Definition _pud := 72%positive.
Definition _reg := 73%positive.
Definition _remap := 74%positive.
Definition _remap_addr := 75%positive.
Definition _res := 76%positive.
Definition _ret := 77%positive.
Definition _rt := 78%positive.
Definition _size := 79%positive.
Definition _smmu_enable := 80%positive.
Definition _smmu_index := 81%positive.
Definition _start := 82%positive.
Definition _state := 83%positive.
Definition _t_vmid := 84%positive.
Definition _target := 85%positive.
Definition _target_addr := 86%positive.
Definition _target_vmid := 87%positive.
Definition _total_smmu := 88%positive.
Definition _ttbr := 89%positive.
Definition _ttbr_pa := 90%positive.
Definition _type := 91%positive.
Definition _val := 92%positive.
Definition _valid := 93%positive.
Definition _vcpu := 94%positive.
Definition _vcpu_state := 95%positive.
Definition _vcpuid := 96%positive.
Definition _vm_state := 97%positive.
Definition _vmid := 98%positive.
Definition _vttbr := 99%positive.
Definition _wait_hlock := 100%positive.
Definition _wait_lock := 101%positive.
Definition _wait_qlock := 102%positive.
Definition _write_val := 103%positive.
Definition _t'1 := 104%positive.
Definition _t'2 := 105%positive.
Definition _t'3 := 106%positive.
Definition _t'4 := 107%positive.
Definition _t'5 := 108%positive.
Definition _t'6 := 109%positive.

Definition get_npt_level_body :=
  (Ssequence
    (Ssequence
      (Scall (Some _t'1)
        (Evar get_pt_vttbr (Tfunction (Tcons tuint Tnil) tulong cc_default))
        ((Etempvar _vmid tuint) :: nil))
      (Sset _vttbr (Etempvar _t'1 tulong)))
    (Ssequence
      (Ssequence
        (Scall (Some _t'2)
          (Evar walk_pgd (Tfunction
                            (Tcons tuint
                              (Tcons tulong (Tcons tulong (Tcons tuint Tnil))))
                            tulong cc_default))
          ((Etempvar _vmid tuint) :: (Etempvar _vttbr tulong) ::
           (Etempvar _addr tulong) :: (Econst_int (Int.repr 0) tuint) :: nil))
        (Sset _pgd (Etempvar _t'2 tulong)))
      (Ssequence
        (Ssequence
          (Scall (Some _t'3)
            (Evar walk_pud (Tfunction
                              (Tcons tuint
                                (Tcons tulong
                                  (Tcons tulong (Tcons tuint Tnil)))) tulong
                              cc_default))
            ((Etempvar _vmid tuint) :: (Etempvar _pgd tulong) ::
             (Etempvar _addr tulong) :: (Econst_int (Int.repr 0) tuint) :: nil))
          (Sset _pud (Etempvar _t'3 tulong)))
        (Ssequence
          (Ssequence
            (Scall (Some _t'4)
              (Evar walk_pmd (Tfunction
                                (Tcons tuint
                                  (Tcons tulong
                                    (Tcons tulong (Tcons tuint Tnil)))) tulong
                                cc_default))
              ((Etempvar _vmid tuint) :: (Etempvar _pud tulong) ::
               (Etempvar _addr tulong) :: (Econst_int (Int.repr 0) tuint) ::
               nil))
            (Sset _pmd (Etempvar _t'4 tulong)))
          (Ssequence
            (Sifthenelse (Ebinop Oeq
                           (Ebinop Oand (Etempvar _pmd tulong)
                             (Econst_long (Int64.repr 3) tulong) tulong)
                           (Econst_long (Int64.repr 3) tulong) tint)
              (Ssequence
                (Ssequence
                  (Scall (Some _t'5)
                    (Evar walk_pte (Tfunction
                                      (Tcons tuint
                                        (Tcons tulong (Tcons tulong Tnil)))
                                      tulong cc_default))
                    ((Etempvar _vmid tuint) :: (Etempvar _pmd tulong) ::
                     (Etempvar _addr tulong) :: nil))
                  (Sset _pte (Etempvar _t'5 tulong)))
                (Sifthenelse (Ebinop Oeq
                               (Ebinop Oand
                                 (Ebinop Oand (Etempvar _pte tulong)
                                   (Econst_long (Int64.repr 281474976710655) tulong)
                                   tulong)
                                 (Econst_long (Int64.repr 1152921504606842880) tulong)
                                 tulong) (Econst_long (Int64.repr 0) tulong)
                               tint)
                  (Sset _ret (Econst_int (Int.repr 0) tuint))
                  (Sset _ret (Econst_int (Int.repr 3) tuint))))
              (Sifthenelse (Ebinop Oeq
                             (Ebinop Oand
                               (Ebinop Oand (Etempvar _pmd tulong)
                                 (Econst_long (Int64.repr 281474976710655) tulong)
                                 tulong)
                               (Econst_long (Int64.repr 1152921504606842880) tulong)
                               tulong) (Econst_long (Int64.repr 0) tulong)
                             tint)
                (Sset _ret (Econst_int (Int.repr 0) tuint))
                (Sset _ret (Econst_int (Int.repr 2) tuint))))
            (Ssequence
              (Scall (Some _t'6)
                (Evar check (Tfunction (Tcons tuint Tnil) tuint cc_default))
                ((Etempvar _ret tuint) :: nil))
              (Sreturn (Some (Etempvar _t'6 tuint))))))))).

Definition f_get_npt_level := {|
  fn_return := tuint;
  fn_callconv := cc_default;
  fn_params := ((_vmid, tuint) :: (_addr, tulong) :: nil);
  fn_vars := nil;
  fn_temps := ((_vttbr, tulong) :: (_pgd, tulong) :: (_pud, tulong) ::
               (_pmd, tulong) :: (_pte, tulong) :: (_ret, tuint) ::
               (_t'6, tuint) :: (_t'5, tulong) :: (_t'4, tulong) ::
               (_t'3, tulong) :: (_t'2, tulong) :: (_t'1, tulong) :: nil);
  fn_body := get_npt_level_body
|}.

Definition walk_npt_body :=
  (Ssequence
    (Ssequence
      (Scall (Some _t'1)
        (Evar get_pt_vttbr (Tfunction (Tcons tuint Tnil) tulong cc_default))
        ((Etempvar _vmid tuint) :: nil))
      (Sset _vttbr (Etempvar _t'1 tulong)))
    (Ssequence
      (Ssequence
        (Scall (Some _t'2)
          (Evar walk_pgd (Tfunction
                            (Tcons tuint
                              (Tcons tulong (Tcons tulong (Tcons tuint Tnil))))
                            tulong cc_default))
          ((Etempvar _vmid tuint) :: (Etempvar _vttbr tulong) ::
           (Etempvar _addr tulong) :: (Econst_int (Int.repr 0) tuint) :: nil))
        (Sset _pgd (Etempvar _t'2 tulong)))
      (Ssequence
        (Ssequence
          (Scall (Some _t'3)
            (Evar walk_pud (Tfunction
                              (Tcons tuint
                                (Tcons tulong
                                  (Tcons tulong (Tcons tuint Tnil)))) tulong
                              cc_default))
            ((Etempvar _vmid tuint) :: (Etempvar _pgd tulong) ::
             (Etempvar _addr tulong) :: (Econst_int (Int.repr 0) tuint) :: nil))
          (Sset _pud (Etempvar _t'3 tulong)))
        (Ssequence
          (Ssequence
            (Scall (Some _t'4)
              (Evar walk_pmd (Tfunction
                                (Tcons tuint
                                  (Tcons tulong
                                    (Tcons tulong (Tcons tuint Tnil)))) tulong
                                cc_default))
              ((Etempvar _vmid tuint) :: (Etempvar _pud tulong) ::
               (Etempvar _addr tulong) :: (Econst_int (Int.repr 0) tuint) ::
               nil))
            (Sset _pmd (Etempvar _t'4 tulong)))
          (Ssequence
            (Sifthenelse (Ebinop Oeq
                           (Ebinop Oand (Etempvar _pmd tulong)
                             (Econst_long (Int64.repr 3) tulong) tulong)
                           (Econst_long (Int64.repr 3) tulong) tint)
              (Ssequence
                (Ssequence
                  (Scall (Some _t'5)
                    (Evar walk_pte (Tfunction
                                      (Tcons tuint
                                        (Tcons tulong (Tcons tulong Tnil)))
                                      tulong cc_default))
                    ((Etempvar _vmid tuint) :: (Etempvar _pmd tulong) ::
                     (Etempvar _addr tulong) :: nil))
                  (Sset _pte (Etempvar _t'5 tulong)))
                (Sset _ret (Etempvar _pte tulong)))
              (Sset _ret (Etempvar _pmd tulong)))
            (Ssequence
              (Scall (Some _t'6)
                (Evar check64 (Tfunction (Tcons tulong Tnil) tulong
                                 cc_default)) ((Etempvar _ret tulong) :: nil))
              (Sreturn (Some (Etempvar _t'6 tulong))))))))).

Definition f_walk_npt := {|
  fn_return := tulong;
  fn_callconv := cc_default;
  fn_params := ((_vmid, tuint) :: (_addr, tulong) :: nil);
  fn_vars := nil;
  fn_temps := ((_vttbr, tulong) :: (_pgd, tulong) :: (_pud, tulong) ::
               (_pmd, tulong) :: (_pte, tulong) :: (_ret, tulong) ::
               (_t'6, tulong) :: (_t'5, tulong) :: (_t'4, tulong) ::
               (_t'3, tulong) :: (_t'2, tulong) :: (_t'1, tulong) :: nil);
  fn_body := walk_npt_body
|}.

Definition set_npt_body :=
  (Ssequence
    (Ssequence
      (Scall (Some _t'1)
        (Evar get_pt_vttbr (Tfunction (Tcons tuint Tnil) tulong cc_default))
        ((Etempvar _vmid tuint) :: nil))
      (Sset _vttbr (Etempvar _t'1 tulong)))
    (Ssequence
      (Ssequence
        (Scall (Some _t'2)
          (Evar walk_pgd (Tfunction
                            (Tcons tuint
                              (Tcons tulong (Tcons tulong (Tcons tuint Tnil))))
                            tulong cc_default))
          ((Etempvar _vmid tuint) :: (Etempvar _vttbr tulong) ::
           (Etempvar _addr tulong) :: (Econst_int (Int.repr 1) tuint) :: nil))
        (Sset _pgd (Etempvar _t'2 tulong)))
      (Ssequence
        (Ssequence
          (Scall (Some _t'3)
            (Evar walk_pud (Tfunction
                              (Tcons tuint
                                (Tcons tulong
                                  (Tcons tulong (Tcons tuint Tnil)))) tulong
                              cc_default))
            ((Etempvar _vmid tuint) :: (Etempvar _pgd tulong) ::
             (Etempvar _addr tulong) :: (Econst_int (Int.repr 1) tuint) :: nil))
          (Sset _pud (Etempvar _t'3 tulong)))
        (Sifthenelse (Ebinop Oeq (Etempvar _level tuint)
                       (Econst_int (Int.repr 2) tuint) tint)
          (Scall None
            (Evar set_pmd (Tfunction
                             (Tcons tuint
                               (Tcons tulong
                                 (Tcons tulong (Tcons tulong Tnil)))) tvoid
                             cc_default))
            ((Etempvar _vmid tuint) :: (Etempvar _pud tulong) ::
             (Etempvar _addr tulong) :: (Etempvar _pte tulong) :: nil))
          (Ssequence
            (Ssequence
              (Scall (Some _t'4)
                (Evar walk_pmd (Tfunction
                                  (Tcons tuint
                                    (Tcons tulong
                                      (Tcons tulong (Tcons tuint Tnil))))
                                  tulong cc_default))
                ((Etempvar _vmid tuint) :: (Etempvar _pud tulong) ::
                 (Etempvar _addr tulong) :: (Econst_int (Int.repr 1) tuint) ::
                 nil))
              (Sset _pmd (Etempvar _t'4 tulong)))
            (Sifthenelse (Ebinop Oeq
                           (Ebinop Oand (Etempvar _pmd tulong)
                             (Econst_long (Int64.repr 3) tulong) tulong)
                           (Econst_long (Int64.repr 3) tulong) tint)
              (Scall None
                (Evar set_pte (Tfunction
                                 (Tcons tuint
                                   (Tcons tulong
                                     (Tcons tulong (Tcons tulong Tnil)))) tvoid
                                 cc_default))
                ((Etempvar _vmid tuint) :: (Etempvar _pmd tulong) ::
                 (Etempvar _addr tulong) :: (Etempvar _pte tulong) :: nil))
              (Scall None (Evar panic (Tfunction Tnil tvoid cc_default)) nil))))))).

Definition f_set_npt := {|
  fn_return := tvoid;
  fn_callconv := cc_default;
  fn_params := ((_vmid, tuint) :: (_addr, tulong) :: (_level, tuint) ::
                (_pte, tulong) :: nil);
  fn_vars := nil;
  fn_temps := ((_vttbr, tulong) :: (_pgd, tulong) :: (_pud, tulong) ::
               (_pmd, tulong) :: (_t'4, tulong) :: (_t'3, tulong) ::
               (_t'2, tulong) :: (_t'1, tulong) :: nil);
  fn_body := set_npt_body
|}.

Definition mem_load_ref_body :=
  (Scall None
    (Evar mem_load_raw (Tfunction (Tcons tulong (Tcons tuint Tnil)) tvoid
                          cc_default))
    ((Etempvar _gfn tulong) :: (Etempvar _reg tuint) :: nil)).

Definition f_mem_load_ref := {|
  fn_return := tvoid;
  fn_callconv := cc_default;
  fn_params := ((_gfn, tulong) :: (_reg, tuint) :: nil);
  fn_vars := nil;
  fn_temps := nil;
  fn_body := mem_load_ref_body
|}.

Definition mem_store_ref_body :=
  (Scall None
    (Evar mem_store_raw (Tfunction (Tcons tulong (Tcons tuint Tnil)) tvoid
                           cc_default))
    ((Etempvar _gfn tulong) :: (Etempvar _reg tuint) :: nil)).

Definition f_mem_store_ref := {|
  fn_return := tvoid;
  fn_callconv := cc_default;
  fn_params := ((_gfn, tulong) :: (_reg, tuint) :: nil);
  fn_vars := nil;
  fn_temps := nil;
  fn_body := mem_store_ref_body
|}.

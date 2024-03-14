;;! target = "aarch64"
;;! test = "compile"
;;! flags = " -C cranelift-enable-heap-access-spectre-mitigation -O static-memory-forced -O static-memory-guard-size=0 -O dynamic-memory-guard-size=0"

;; !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
;; !!! GENERATED BY 'make-load-store-tests.sh' DO NOT EDIT !!!
;; !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

(module
  (memory i32 1)

  (func (export "do_store") (param i32 i32)
    local.get 0
    local.get 1
    i32.store offset=0x1000)

  (func (export "do_load") (param i32) (result i32)
    local.get 0
    i32.load offset=0x1000))

;; function u0:0:
;;   stp fp, lr, [sp, #-16]!
;;   unwind PushFrameRegs { offset_upward_to_caller_sp: 16 }
;;   mov fp, sp
;;   ldr x16, [x0, #8]
;;   ldr x16, [x16]
;;   subs xzr, sp, x16, UXTX
;;   b.lo #trap=stk_ovf
;;   unwind DefineNewFrame { offset_upward_to_caller_sp: 16, offset_downward_to_clobbers: 0 }
;; block0:
;;   mov w11, w2
;;   movz x12, #0
;;   ldr x13, [x0, #80]
;;   add x13, x13, x2, UXTW
;;   add x13, x13, #4096
;;   movn w10, #4099
;;   subs xzr, x11, x10
;;   csel x13, x12, x13, hi
;;   csdb
;;   str w3, [x13]
;;   b label1
;; block1:
;;   ldp fp, lr, [sp], #16
;;   ret
;;
;; function u0:1:
;;   stp fp, lr, [sp, #-16]!
;;   unwind PushFrameRegs { offset_upward_to_caller_sp: 16 }
;;   mov fp, sp
;;   ldr x16, [x0, #8]
;;   ldr x16, [x16]
;;   subs xzr, sp, x16, UXTX
;;   b.lo #trap=stk_ovf
;;   unwind DefineNewFrame { offset_upward_to_caller_sp: 16, offset_downward_to_clobbers: 0 }
;; block0:
;;   mov w11, w2
;;   movz x12, #0
;;   ldr x13, [x0, #80]
;;   add x13, x13, x2, UXTW
;;   add x13, x13, #4096
;;   movn w10, #4099
;;   subs xzr, x11, x10
;;   csel x13, x12, x13, hi
;;   csdb
;;   ldr w0, [x13]
;;   b label1
;; block1:
;;   ldp fp, lr, [sp], #16
;;   ret
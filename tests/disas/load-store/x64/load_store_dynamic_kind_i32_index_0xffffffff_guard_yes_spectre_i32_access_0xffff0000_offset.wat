;;! target = "x86_64"
;;! test = "compile"
;;! flags = " -C cranelift-enable-heap-access-spectre-mitigation -O static-memory-maximum-size=0 -O static-memory-guard-size=4294967295 -O dynamic-memory-guard-size=4294967295"

;; !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
;; !!! GENERATED BY 'make-load-store-tests.sh' DO NOT EDIT !!!
;; !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

(module
  (memory i32 1)

  (func (export "do_store") (param i32 i32)
    local.get 0
    local.get 1
    i32.store offset=0xffff0000)

  (func (export "do_load") (param i32) (result i32)
    local.get 0
    i32.load offset=0xffff0000))

;; function u0:0:
;;   pushq   %rbp
;;   unwind PushFrameRegs { offset_upward_to_caller_sp: 16 }
;;   movq    %rsp, %rbp
;;   movq    8(%rdi), %r10
;;   movq    0(%r10), %r10
;;   cmpq    %rsp, %r10
;;   jnbe #trap=stk_ovf
;;   unwind DefineNewFrame { offset_upward_to_caller_sp: 16, offset_downward_to_clobbers: 0 }
;; block0:
;;   movq    88(%rdi), %rax
;;   movl    %edx, %r8d
;;   xorq    %rdx, %rdx, %rdx
;;   movq    %r8, %r9
;;   addq    %r9, 80(%rdi), %r9
;;   movl    $-65536, %r10d
;;   lea     0(%r9,%r10,1), %rdi
;;   cmpq    %rax, %r8
;;   cmovnbeq %rdx, %rdi, %rdi
;;   movl    %ecx, 0(%rdi)
;;   jmp     label1
;; block1:
;;   movq    %rbp, %rsp
;;   popq    %rbp
;;   ret
;;
;; function u0:1:
;;   pushq   %rbp
;;   unwind PushFrameRegs { offset_upward_to_caller_sp: 16 }
;;   movq    %rsp, %rbp
;;   movq    8(%rdi), %r10
;;   movq    0(%r10), %r10
;;   cmpq    %rsp, %r10
;;   jnbe #trap=stk_ovf
;;   unwind DefineNewFrame { offset_upward_to_caller_sp: 16, offset_downward_to_clobbers: 0 }
;; block0:
;;   movq    88(%rdi), %rax
;;   movl    %edx, %edx
;;   xorq    %rcx, %rcx, %rcx
;;   movq    %rdx, %r8
;;   addq    %r8, 80(%rdi), %r8
;;   movl    $-65536, %r9d
;;   lea     0(%r8,%r9,1), %rdi
;;   cmpq    %rax, %rdx
;;   cmovnbeq %rcx, %rdi, %rdi
;;   movl    0(%rdi), %eax
;;   jmp     label1
;; block1:
;;   movq    %rbp, %rsp
;;   popq    %rbp
;;   ret
; RUN: llc < %s -mtriple=x86_64-apple-darwin -mcpu=corei7-avx -mattr=+avx | FileCheck %s

; FIXME: use avx versions for punpcklbw, punpckhbw and punpckhwd

; CHECK: vextractf128 $0
; CHECK-NEXT: punpcklbw
; CHECK-NEXT: punpckhbw
; CHECK-NEXT: vinsertf128 $0
; CHECK-NEXT: vinsertf128 $1
; CHECK-NEXT: vpermilps $85
define <32 x i8> @funcA(<32 x i8> %a) nounwind uwtable readnone ssp {
entry:
  %shuffle = shufflevector <32 x i8> %a, <32 x i8> undef, <32 x i32> <i32 5, i32 5, i32 5, i32 5, i32 5, i32 5, i32 5, i32 5, i32 5, i32 5, i32 5, i32 5, i32 5, i32 5, i32 5, i32 5, i32 5, i32 5, i32 5, i32 5, i32 5, i32 5, i32 5, i32 5, i32 5, i32 5, i32 5, i32 5, i32 5, i32 5, i32 5, i32 5>
  ret <32 x i8> %shuffle
}

; CHECK: vextractf128 $0
; CHECK-NEXT: punpckhwd
; CHECK-NEXT: vinsertf128 $0
; CHECK-NEXT: vinsertf128 $1
; CHECK-NEXT: vpermilps $85
define <16 x i16> @funcB(<16 x i16> %a) nounwind uwtable readnone ssp {
entry:
  %shuffle = shufflevector <16 x i16> %a, <16 x i16> undef, <16 x i32> <i32 5, i32 5, i32 5, i32 5, i32 5, i32 5, i32 5, i32 5, i32 5, i32 5, i32 5, i32 5, i32 5, i32 5, i32 5, i32 5>
  ret <16 x i16> %shuffle
}


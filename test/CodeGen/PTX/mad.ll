; RUN: llc < %s -march=ptx32 -mattr=+sm13 | FileCheck %s

define ptx_device float @t1_f32(float %x, float %y, float %z) {
; CHECK: mad.rn.f32 r{{[0-9]+}}, r{{[0-9]+}}, r{{[0-9]+}}, r{{[0-9]+}};
; CHECK-NEXT: ret;
	%a = fmul float %x, %y
  %b = fadd float %a, %z
	ret float %b
}

define ptx_device double @t1_f64(double %x, double %y, double %z) {
; CHECK: mad.rn.f64 rd{{[0-9]+}}, rd{{[0-9]+}}, rd{{[0-9]+}}, rd{{[0-9]+}};
; CHECK-NEXT: ret;
	%a = fmul double %x, %y
  %b = fadd double %a, %z
	ret double %b
}

#![allow(non_snake_case, non_camel_case_types)]

extern crate libc;
mod fib;

use std::ffi::CString;

type VALUE = libc::c_ulong;

extern "C" {
    static rb_cObject: VALUE;
    fn rb_define_class(name: *const libc::c_char, rb_super: VALUE) -> VALUE;
    fn rb_define_method(klass: VALUE,
                        name: *const libc::c_char,
                        func: extern "C" fn(v: VALUE, v2: VALUE),
                        argc: libc::c_int)
                        -> libc::c_void;
    fn rb_num2long(val: VALUE) -> libc::c_long;
}

fn rb_int2fix(num: u32) -> VALUE {
    return ((num as VALUE) << 1) | 0x01;
}

extern fn rb_fib(_: VALUE, rb_num: VALUE) {
    let num = unsafe { rb_num2long(rb_num) } as u32;
    let result = fib::fib(num);

    rb_int2fix(result);
}

#[no_mangle]
pub extern "C" fn Init_rust() {
    let c_name = CString::new("Rust").unwrap();
    let fib = CString::new("fib").unwrap();

    unsafe {
        let rb_cRust = rb_define_class(c_name.as_ptr(), rb_cObject);
        rb_define_method(rb_cRust, fib.as_ptr(), rb_fib, 1);
    }
}

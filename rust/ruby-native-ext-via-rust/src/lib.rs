#![allow(non_snake_case, non_camel_case_types)]

extern crate libc;
use std::ffi::CString;

type VALUE = libc::c_ulong;

extern {
    static rb_cObject: VALUE;
    fn rb_define_class(name: *const libc::c_char, rb_super: VALUE) -> VALUE;
}

#[no_mangle]
pub extern fn Init_rust() {
    let c_name = CString::new("Rust").unwrap();

    unsafe { rb_define_class(c_name.as_ptr(), rb_cObject) };
}

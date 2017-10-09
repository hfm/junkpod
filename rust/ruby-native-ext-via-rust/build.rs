use std::process::Command;

fn main() {
    let output = Command::new("ruby")
        .arg("-e")
        .arg("puts RbConfig::CONFIG['libdir']")
        .output()
        .unwrap_or_else(|e| { panic!("failed to execute process: {}", e) });

    println!("cargo:rustc-link-search=native={}", String::from_utf8_lossy(&output.stdout));
}

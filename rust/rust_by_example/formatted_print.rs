pub fn main() {
    println!("{} days", 31);

    println!("{0}, this is {1}. {1}, this is {0}", "Alice", "Bob");

    println!("{subject} {verb} {object}", object="the lazy dog", subject="the quick brow fox", verb="jumps over");

    println!("{} of {:b} peaple know binary, the other half don't", 1, 2);

    println!("{number:>width$}", number=1, width=6);
    println!("{number:>0width$}", number=1, width=6);

    // println!("My name is {0}, {1} {0}", "Bond");

    // struct Structure(i32);
    // println!("This struct `{}` won't print...", Structure(3));
}

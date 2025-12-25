restart

add_force CLK {0 0ns} {1 10ns} -repeat_every 20ns

add_force OE {0 0ns}
add_force ACLR {0 0ns}
add_force SCLR {1 0ns}
add_force ALOAD {1 0ns}
add_force SLOAD {1 0ns}
add_force ENP {1 0ns}
add_force ENT {1 0ns}
add_force A {0011 0ns}
run 10ns

add_force ACLR {1 0ns}
run 10ns

add_force ALOAD {0 0ns}
run 10ns

add_force ALOAD {1 0ns}
run 84ns

add_force SCLR {0 0ns}
add_force A {1011 0ns}
run 26ns

add_force SCLR {1 0ns}
add_force SLOAD {0 0ns}
run 26ns

add_force SLOAD {1 0ns}
run 74ns

add_force OE {1 0ns}
run 60ns

add_force OE {0 0ns}
run 20ns

add_force ENP {0 0ns}
run 30ns

add_force ENT {0 0ns}
run 30ns

add_force ENP {1 0ns}
run 30ns





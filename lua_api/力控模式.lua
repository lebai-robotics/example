C_POSE = {}
J_POSE = {}

J_POSES["likong"] = {j1=0.001155,j2=-0.785398,j3=1.570796,j4=-2.352818,j5=1.570915,j6=0.784243}
C_POSES["likong"] = {-0.480309,-0.121175,0.313069,-0.785405,-0.002463,0.002307}
print(J_POSES["likong"]) --
print(C_POSES["likong"]) --

movej(J_POSES["likong"],0,1,0,0)
wait(100)

print(get_tcp_force())
set_force_kind(2)
force_mode_set_mass(20)
force_mode_set_damping(100)
force_mode_set_force_threshold(1)

force_mode({0,0,0.2,0,0,0}, {force_x=9.863473415374756,force_y=-2.8040139436721803,force_z=21.631520795822144,torque_x=-0.7025988057255745,torque_y=-0.32469522356987,torque_z=0.02187027093023062})


while true
do
    movej({-0.1,0.1,0,0,0,0,base=C_POSES["likong"]}, 0,0.3,0,0)
    movej({0.1,-0.1,0,0,0,0,base=C_POSES["likong"]}, 0,0.3,0,0)
end

print(os.date())
local x = os.clock()

print(get_actual_joint_positions())
movej({j1=0, j2=0, j3=0, j4=0, j5=0, j6=0}, 1, 1, 0, 1)
print(get_actual_joint_positions())

print(string.format("elapsed time: %.2fs\n", os.clock() - x))

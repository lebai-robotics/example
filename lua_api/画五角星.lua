function clone(x)
  return {x[1],x[2],x[3],x[4],x[5],x[6]}
end

local p = math.rad(36)/2

local vel = 0.06
local acc = 0.1

function 画☆(a, r)
  local x = r * math.sin(p)
  local y = r * math.cos(p)
  print('x', x, 'y', y)

  print('a', a)
  movej(a, 0.4, 1, 0, 1)
  wait(1000)

  b = clone(a)
  b[1] = a[1] - x
  b[2] = a[2] - y
  print('b', b)
  movel(b, vel, acc, 0, 0)

  c = clone(a)
  c[1] = a[1] + r / 2
  c[2] = a[2] - r / 2 * math.cos(math.rad(36))
  print('c', c)
  movel(c, vel, acc, 0, 0)

  d = clone(a)
  d[1] = a[1] - r / 2
  d[2] = c[2]
  print('d', d)
  movel(d, vel, acc, 0, 0)

  e = clone(a)
  e[1] = a[1] + x
  e[2] = a[2] - y
  print('e', e)
  movel(e, vel, acc, 0, 0)

  movel(a, vel, acc, 0, 0)

end

-- a = get_actual_tcp_pose()

a = {-0.34, -0.12, 0.4, -1.57, 0, 0.25}
for i=0,2 do
  a[3] = a[3] - 0.08
  画☆(a, 0.1+i*0.02)
end

a[2] = a[2] + 0.2
a[3] = a[3] - 0.04
for i=0,2 do
  a[3] = a[3] + 0.08
  画☆(a, 0.1+i*0.02)
end

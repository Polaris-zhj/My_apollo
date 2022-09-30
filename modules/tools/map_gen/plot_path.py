#!/usr/bin/env python3

###############################################################################
# Copyright 2017 The Apollo Authors. All Rights Reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
###############################################################################

import sys
import matplotlib.pyplot as plt

f = open(sys.argv[1], 'r')
xs = []
ys = []
for line in f:
    line = line.replace("\n", '')
    data = line.split(',')
    x = float(data[0])
    y = float(data[1])
    xs.append(x)
    ys.append(y)
f.close()

fig = plt.figure()
ax = plt.subplot2grid((1, 1), (0, 0))
ax.plot(xs, ys, "b-", lw=3, alpha=0.8)
ax.axis('equal')
plt.show()

User.create email: "david@thebitcorps.com", username: "development", password: "thebitkorns", password_confirmation: "thebitkorns"

stages_numbers = [20, 24, 20, 53, 37, 35, 19, 56, 6, 22, 38, 39, 38, 36, 38];
areas = [   [953.4607, 507.1432, 461.5797, 481.1994, 476.5228, 457.8817, 446.5017, 446.9629, 236.1602, 448.2658, 447.8763, 440.8667, 447.3156, 441.7497, 194.9186, 437.9683, 442.2007, 444.6538, 410.4535, 490.5800],
            [245.6781, 188.6463, 192.5996, 319.1559, 561.0878, 833.8926, 590.4498, 586.5203, 587.24, 588.6782, 588.6275, 369.9845, 198.4553, 175.5082, 184.1240, 190.2783, 193.9879, 195.262, 194.1064, 190.5155, 184.4805, 194.9064, 182.7699, 180.6029],
            [268.5614, 180.957, 180.4582, 180.1044, 180.0726, 180.0018, 180.0681, 180.0873, 180.4074, 200.4649, 272.7149, 184.9473, 181.2804, 180.5371, 179.4616, 178.4127, 177.2036,175.9917, 173.5693, 207.8065],
            [223.3394, 176.7372, 176.7372, 176.7372, 176.7372, 230.3122, 335.6144, 186.5050, 185.8957, 187.3582, 187.3582, 187.3582, 187.3582, 187.3582, 187.3582, 187.3582, 187.3582, 187.3582, 187.3582, 279.9162, 264.4498, 246.1574, 240.8581, 237.8120, 244.7329, 211.3429, 192.4940, 200.2373, 205.9642, 209.6214, 211.2163, 210.7523, 208.2287, 203.6409, 196.9802, 188.2337, 197.9645, 198.1793, 188.3216, 197.1046, 203.7819, 208.3670, 210.8695, 211.2944, 209.6429, 205.9120, 200.0946, 192.2835, 191.9269, 245.8607, 245.7855, 235.5245, 282.5147],
            [241.2299, 182.4387, 188.9991, 197.1567, 238.3736, 183.0875, 182.2486, 181.5587, 180.9944, 180.5806, 180.3288, 180.2044, 180.2073, 180.3450, 180.5987, 180.9751, 181.4911, 182.1418, 182.9316, 250.1137, 190.7468, 188.4627, 239.2884, 182.9032, 182.0119, 181.2791, 180.6991, 180.2596, 179.9718, 179.8386, 179.8396, 179.9820, 180.2678, 180.6660, 181.1935, 181.8831, 195.7131],
            [204.2083, 204.2405, 204.4160, 233.0234, 188.1052, 185.3311, 176.9676, 181.2834, 181.7361, 180.3746, 177.1971, 205.2343, 180.8696, 180.5307, 180.3131, 180.1917, 180.2104, 215.0866, 200.4537, 200.4567, 192.1828, 179.7990, 179.8721, 180.0063, 180.2469, 180.5711, 207.4843, 181.9171, 179.0625, 178.2243, 179.4011, 180.3854, 191.5782, 188.6963, 188.5793],
            [207.5217, 181.7100, 180.9983, 180.3936, 179.8947, 179.4982, 179.2006, 179.0018, 193.4572, 183.0194, 201.1165, 181.7774, 181.1228, 180.5703, 180.1185, 179.7635, 179.5028, 179.3368, 219.0837],
            [325.1612, 191.0475, 191.0489, 191.0504, 191.0521, 191.0539, 191.0598, 206.4736, 200.9065, 200.5448, 200.5508, 194.1590, 207.0074, 206.9999, 207.0000, 207.0000, 207.0000, 207.0000, 207.0000, 231.9407, 243.0919, 243.0919, 243.0919, 243.2292, 243.4382, 226.7521, 227.0077, 227.0077, 227.0077, 227.0077, 230.9042, 207.0012, 207.0000, 207.0000, 206.9999, 206.9999, 206.9999, 206.9999, 206.9999, 677.3993, 185.5678, 194.0237, 201.8421, 209.0238, 215.5700, 221.4813, 226.7585, 231.4021, 235.4125, 238.7901, 241.5351, 243.6475, 414.2460, 246.1889, 823.9179, 8217.3675],
            [248.0086, 181.1338, 229.1157, 175.6605, 153.0229, 219.2461],
            [274.6905, 185.2278, 180.1754, 180.1467, 180.0661, 180.0174, 180.0007, 180.0169, 180.0205, 180.0596, 196.2298, 190.5622, 183.9195, 182.4272, 180.2355, 180.1121, 180.0183, 180.0020, 180.0177, 180.0665, 180.1485, 257.4328],
            [222.4041, 226.9160, 216.5029, 208.5325, 180.8568, 180.6059, 180.3812, 180.2087, 180.0749, 180.0702, 180.0131, 180.0023, 180.0124, 180.0714, 180.1706, 180.2125, 180.3906, 180.6153, 180.8568, 197.1893, 191.9123, 186.4788, 190.9018, 181.0302, 180.7690, 180.5700, 180.4026, 180.1764, 180.0844, 180.0289, 180.0009, 180.0282, 180.0857, 180.2721, 180.4063, 180.5794, 180.7784, 181.0302],
            [200.6185, 193.9842, 194.0377, 201.7835, 180.2056, 180.0006, 179.0295, 178.4669, 178.2348, 178.3589, 178.8825, 179.7008, 180.3429, 181.1172, 183.3791, 186.3722, 188.8578, 191.6663, 194.8033, 187.0554, 186.4946, 150.1772, 206.2979, 252.6711, 180.8216, 180.5917, 180.4069, 180.2668, 180.9967, 181.3540, 180.5795, 180.0266, 180.0028, 180.0372, 180.0262, 180.0150, 180.0323, 180.0044, 181.1110],
            [210.9435, 195.5796, 220.0200, 300.9456, 180.2618, 180.2035, 180.1565, 180.1175, 180.0417, 180.0201, 180.0069, 180.0025, 180.0068, 180.0198, 180.0419, 180.1179, 180.1575, 180.2045, 180.2599, 182.2732, 318.7832, 209.0381, 206.6757, 180.1720, 180.1128, 180.0630, 180.0235, 180.0379, 180.0161, 180.0027, 179.9982, 180.0026, 180.0158, 180.0381, 180.0239, 180.0640, 180.1139, 180.1701],
            [203.4955, 191.3816, 186.6602, 188.7002, 180.2617, 180.2031, 180.1540, 180.1144, 180.0393, 180.0186, 180.0036, 180.0015, 180.0124, 180.0295, 180.1010, 180.1363, 180.1808, 180.2370, 209.5827, 208.1803, 195.4074, 209.0458, 180.1410, 180.0866, 180.0397, 180.0027, 180.0211, 180.0041, 180.0001, 180.0021, 180.0103, 180.0318, 180.0182, 180.0590, 180.1097, 180.1700],
            [198.7039, 194.9736, 183.6963, 182.0315, 180.2719, 180.2093, 180.1572, 180.1155, 180.0391, 180.0183, 180.0080, 180.0080, 180.0182, 180.0387, 180.1144, 180.1554, 180.2066, 180.2703, 180.5280, 182.2931, 181.0650, 182.8534, 185.6211, 180.0589, 180.1705, 180.1091, 180.0562, 180.0139, 180.0272, 180.0060, 179.9954, 179.9954, 180.0060, 180.0268, 180.0128, 180.0544, 180.1064, 180.1689]]

15.times do |i|
      stages_numbers[i].times do |j|
            Lot.create(number: j + 1, stage: i + 1, block: i + 1, square_meters: areas[i][j], status: "available")
      end
end
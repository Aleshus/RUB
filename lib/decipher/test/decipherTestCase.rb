require './lib/caesarCipher'
require 'test/unit'

class TestDecipher < Test::Unit::TestCase

   def test_decode
        assert_equal(CaesarCipher.decode("1JKJ'pz'{ol'{yhklthyr'vm'{ol'Jvu{yvs'Kh{h'Jvywvyh{pvu5"),"*CDC is the trademark of the Control Data Corporation.")
        assert_equal(CaesarCipher.decode("1PIT'pz'h'{yhklthyr'vm'{ol'Pu{lyuh{pvuhs'I|zpulzz'Thjopul'Jvywvyh{pvu5"),"*IBM is a trademark of the International Business Machine Corporation.")
        assert_equal(CaesarCipher.decode("1KLJ'pz'{ol'{yhklthyr'vm'{ol'Kpnp{hs'Lx|pwtlu{'Jvywvyh{pvu5"),"*DEC is the trademark of the Digital Equipment Corporation.")
   end


end
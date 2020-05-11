echo "Downloading gcc source files..."
curl https://ftp.gnu.org/gnu/gcc/gcc-5.4.0/gcc-5.4.0.tar.bz2 -O

echo "extracting files..."
tar xvfj gcc-5.4.0.tar.bz2

echo "Installing dependencies..."
yum -y install gmp-devel mpfr-devel libmpc-devel

echo "Configure and install..."
mkdir gcc-5.4.0-build
cd gcc-5.4.0-build

../gcc-5.4.0/configure --enable-languages=c,c++ \
--enable-libstdcxx-threads \
--enable-libstdcxx-time \
--enable-shared \
--enable-__cxa_atexit \
--disable-libunwind-exceptions \
--disable-libada \
--host x86_64-redhat-linux-gnu \
--build x86_64-redhat-linux-gnu \
--with-default-libstdcxx-abi=gcc4-compatible \
--disable-multilib

make -j$(nproc) && make install


try() {
  kvsmake -G
  kvsmake
  ./TornadoVolumeData_test
  diff output_image.bmp test_image.bmp
}

try

echo OK

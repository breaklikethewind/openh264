#ifndef __BASEDECODERTEST_H__
#define __BASEDECODERTEST_H__

#include "test_stdint.h"
#include <limits.h>
#include <fstream>
#include "codec_api.h"

#include "utils/BufferedData.h"

class BaseDecoderTest {
 public:
  struct Plane {
    const uint8_t* data;
    int width;
    int height;
    int stride;
  };

  struct Frame {
    Plane y;
    Plane u;
    Plane v;
  };

  struct Callback {
    virtual void onDecodeFrame (const Frame& frame) = 0;
  };

  BaseDecoderTest();
  void SetUp();
  void TearDown();
  void DecodeFile (const char* fileName, Callback* cbk);

  bool Open (const char* fileName);
  bool DecodeNextFrame (Callback* cbk);

 private:
  void DecodeFrame (const uint8_t* src, int sliceSize, Callback* cbk);

  ISVCDecoder* decoder_;
  std::ifstream file_;
  BufferedData buf_;
  enum {
    OpenFile,
    Decoding,
    EndOfStream,
    End
  } decodeStatus_;
};

#endif //__BASEDECODERTEST_H__

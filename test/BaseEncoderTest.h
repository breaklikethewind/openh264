#ifndef __BASEENCODERTEST_H__
#define __BASEENCODERTEST_H__

#include "codec_api.h"
#include "codec_app_def.h"
#include "utils/InputStream.h"

class BaseEncoderTest {
 public:
  struct Callback {
    virtual void onEncodeFrame (const SFrameBSInfo& frameInfo) = 0;
  };

  BaseEncoderTest();
  void SetUp();
  void TearDown();
  void EncodeFile (const char* fileName, EUsageType usageType, int width, int height, float frameRate,
                   SliceModeEnum slices, bool denoise, int layers, Callback* cbk);
  void EncodeStream (InputStream* in, EUsageType usageType, int width, int height, float frameRate, SliceModeEnum slices,
                     bool denoise, int layers, Callback* cbk);

 private:
  ISVCEncoder* encoder_;
};

#endif //__BASEENCODERTEST_H__

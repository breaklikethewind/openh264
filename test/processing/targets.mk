PROCESSING_UNITTEST_SRCDIR=test/processing
PROCESSING_UNITTEST_CPP_SRCS=\
	$(PROCESSING_UNITTEST_SRCDIR)/ProcessUT_ScrollDetection.cpp\

PROCESSING_UNITTEST_OBJS += $(PROCESSING_UNITTEST_CPP_SRCS:.cpp=.$(OBJ))

OBJS += $(PROCESSING_UNITTEST_OBJS)
$(PROCESSING_UNITTEST_SRCDIR)/%.$(OBJ): $(PROCESSING_UNITTEST_SRCDIR)/%.cpp
	$(QUIET_CXX)$(CXX) $(CFLAGS) $(CXXFLAGS) $(INCLUDES) $(PROCESSING_UNITTEST_CFLAGS) $(PROCESSING_UNITTEST_INCLUDES) -c $(CXX_O) $<


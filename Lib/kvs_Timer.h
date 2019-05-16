#include <kvs/Timer>


extern "C"
{
kvs::Timer* Timer_new();
void Timer_delete( kvs::Timer* self );
void Timer_start( kvs::Timer* self);
void Timer_stop( kvs::Timer* self);
double Timer_sec( kvs::Timer* self);
}

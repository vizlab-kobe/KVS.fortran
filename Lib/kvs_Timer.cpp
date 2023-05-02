#include <kvs/Timer>


extern "C"
{

kvs::Timer* Timer_new()
{
    return new kvs::Timer();
}

void Timer_delete( kvs::Timer* self )
{
    if ( self ) delete self;
}

void Timer_start( kvs::Timer* self)
{
    self->start();
}

void Timer_stop( kvs::Timer* self)
{
    self->stop();
}
double Timer_sec( kvs::Timer* self)
{
    return self->sec();
}

} // end of extern "C"

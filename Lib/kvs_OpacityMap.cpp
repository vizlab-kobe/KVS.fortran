#include <kvs/OpacityMap>


extern "C"
{

kvs::OpacityMap* OpacityMap_new()
{
    return new kvs::OpacityMap();
}

void OpacityMap_delete( kvs::OpacityMap* self )
{
    if ( self ) delete self;
}

void OpacityMap_setRange( kvs::OpacityMap* self, const float min_value, const float max_value )
{
    self->setRange( min_value, max_value );
}

void OpacityMap_setResolution( kvs::OpacityMap* self, const int resolution )
{
    self->setResolution( size_t( resolution ) );
}

void OpacityMap_addPoint( kvs::OpacityMap* self, const float value, const float opacity )
{
    self->addPoint( value, opacity );
}

void OpacityMap_removePoint( kvs::OpacityMap* self, const float value )
{
    self->removePoint( value );
}

void OpacityMap_create( kvs::OpacityMap* self )
{
    self->create();
}

} // end of extern "C"

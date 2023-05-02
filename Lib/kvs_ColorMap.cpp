#include <kvs/ColorMap>


extern "C"
{

kvs::ColorMap* ColorMap_new()
{
    return new kvs::ColorMap();
}

void ColorMap_delete( kvs::ColorMap* self )
{
    if ( self ) delete self;
}

void ColorMap_setRange( kvs::ColorMap* self, float min_value, float max_value )
{
    self->setRange( min_value, max_value );
}

void ColorMap_setResolution( kvs::ColorMap* self, int resolution )
{
    self->setResolution( size_t( resolution ) );
}

void ColorMap_create( kvs::ColorMap* self )
{
    self->create();
}

kvs::ColorMap* ColorMap_Rainbow( int resolution )
{
    return new kvs::ColorMap( kvs::ColorMap::Rainbow( resolution ) );
}

kvs::ColorMap* ColorMap_CoolWarm( int resolution )
{
    return new kvs::ColorMap( kvs::ColorMap::CoolWarm( resolution ) );
}

kvs::ColorMap* ColorMap_BrewerBrBG( int resolution )
{
    return new kvs::ColorMap( kvs::ColorMap::BrewerBrBG( resolution ) );
}

kvs::ColorMap* ColorMap_BrewerPiYG( int resolution )
{
    return new kvs::ColorMap( kvs::ColorMap::BrewerPiYG( resolution ) );
}

kvs::ColorMap* ColorMap_BrewerPRGn( int resolution )
{
    return new kvs::ColorMap( kvs::ColorMap::BrewerPRGn( resolution ) );
}

kvs::ColorMap* ColorMap_BrewerPuOr( int resolution )
{
    return new kvs::ColorMap( kvs::ColorMap::BrewerPuOr( resolution ) );
}

kvs::ColorMap* ColorMap_BrewerRdBu( int resolution )
{
    return new kvs::ColorMap( kvs::ColorMap::BrewerRdBu( resolution ) );
}

kvs::ColorMap* ColorMap_BrewerRdGy( int resolution )
{
    return new kvs::ColorMap( kvs::ColorMap::BrewerRdGy( resolution ) );
}

kvs::ColorMap* ColorMap_BrewerRdYlBu( int resolution )
{
    return new kvs::ColorMap( kvs::ColorMap::BrewerRdYlBu( resolution ) );
}

kvs::ColorMap* ColorMap_BrewerRdYlGn( int resolution )
{
    return new kvs::ColorMap( kvs::ColorMap::BrewerRdYlGn( resolution ) );
}

kvs::ColorMap* ColorMap_BrewerSpectral( int resolution )
{
    return new kvs::ColorMap( kvs::ColorMap::BrewerSpectral( resolution ) );
}

kvs::ColorMap* ColorMap_Viridis( int resolution )
{
    return new kvs::ColorMap( kvs::ColorMap::Viridis( resolution ) );
}

kvs::ColorMap* ColorMap_Plasma( int resolution )
{
    return new kvs::ColorMap( kvs::ColorMap::Plasma( resolution ) );
}

kvs::ColorMap* ColorMap_Inferno( int resolution )
{
    return new kvs::ColorMap( kvs::ColorMap::Inferno( resolution ) );
}

kvs::ColorMap* ColorMap_Magma( int resolution )
{
    return new kvs::ColorMap( kvs::ColorMap::Magma( resolution ) );
}

kvs::ColorMap* ColorMap_Cividis( int resolution )
{
    return new kvs::ColorMap( kvs::ColorMap::Cividis( resolution ) );
}

} // end of extern "C"

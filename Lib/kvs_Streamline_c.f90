! C interface
interface

   function C_kvs_Streamline_new ()&
        bind( C, name="Streamline_new" )
     import
     type( C_ptr ) :: C_kvs_Streamline_new
   end function C_kvs_Streamline_new

   function C_kvs_Streamline_copy( other )&
       bind( C, name="Streamline_copy" )
     import
     type( C_ptr ) :: C_kvs_Streamline_copy
     type( C_ptr ), value :: other
   end function C_kvs_Streamline_copy

   subroutine C_kvs_Streamline_delete ( this )&
        bind( C, name="Streamline_delete" )
     import
     type( C_ptr ), value :: this
   end subroutine C_kvs_Streamline_delete

   function C_kvs_Streamline_exec( this, volume, point, tfunc)&
        bind( C, name="Streamline_exec" )
     import
     type( C_ptr ) :: C_kvs_Streamline_exec
     type( C_ptr ), value :: this
     type( C_ptr ), value :: volume
     type( C_ptr ), value :: point
     type( C_ptr ), value :: tfunc
   end function C_kvs_Streamline_exec

end interface

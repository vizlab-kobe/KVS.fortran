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

   subroutine C_kvs_Streamline_delete( this )&
        bind( C, name="Streamline_delete" )
     import
     type( C_ptr ), value :: this
   end subroutine C_kvs_Streamline_delete

   subroutine C_kvs_Streamline_setSeedPoints( this, points )&
        bind( C, name="Streamline_setSeedPoints" )
     import
     type( C_ptr ), value :: this
     type( C_ptr ), value :: points
   end subroutine C_kvs_Streamline_setSeedPoints

   subroutine C_kvs_Streamline_setTransferFunction( this, tfunc )&
        bind( C, name="Streamline_setTransferFunction" )
     import
     type( C_ptr ), value :: this
     type( C_ptr ), value :: tfunc
   end subroutine C_kvs_Streamline_setTransferFunction

   function C_kvs_Streamline_exec( this, volume )&
        bind( C, name="Streamline_exec" )
     import
     type( C_ptr ) :: C_kvs_Streamline_exec
     type( C_ptr ), value :: this
     type( C_ptr ), value :: volume
   end function C_kvs_Streamline_exec

end interface

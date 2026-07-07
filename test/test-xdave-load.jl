@testitem "Loading xdave" tags=[:unit, :fast] begin 
    using XDave

    @test isdefined(XDave,:xdave)    
    
end

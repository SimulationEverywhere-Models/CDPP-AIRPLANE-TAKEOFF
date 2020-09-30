[top]
components : Buffer@Buffer Proc@Proc Luggage@Luggage Cabin_prepare@Cabin_prepare Flight_plan@Flight_plan State_check@State_check Clearance@Clearance Trailer_truck@Trailer_truck Sliding@Sliding
in : bufferIn
in : luggageIn
in : cabinCrewIn
in : pilotIn
%in : stateCIn

%out : procOut
%out : luggageOut
%out : cabinCheckedOut
%out : planeReadyOut
out : slidingOut

Link : bufferIn bufferIn@Buffer
Link : bufferOut@Buffer procIn@Proc
Link : notificationOut@Proc bufferIn@Buffer
%Link : procOut@Proc procOut

Link : luggageIn luggageIn@Luggage
%Link : luggageOut@Luggage luggageOut
Link : cabinCrewIn cabinCrewIn@Cabin_prepare
%Link : cabinCheckedOut@Cabin_prepare cabinCheckedOut
Link : pilotIn pilotIn@Flight_plan
%Link : planeReadyOut@Flight_plan planeReadyOut

Link : luggageOut@Luggage procIn@Proc
Link : procOut@Proc stateCIn@State_check
Link : cabinCheckedOut@Cabin_prepare stateCIn@State_check
Link : planeReadyOut@Flight_plan stateCIn@State_check

%Link : stateCIn stateCIn@State_check
Link : stateCOut@State_check clearIn@Clearance
Link : clearOut@Clearance trailerIn@Trailer_truck
Link : trailerOut@Trailer_truck slidingIn@Sliding
Link : slidingOut@Sliding slidingOut
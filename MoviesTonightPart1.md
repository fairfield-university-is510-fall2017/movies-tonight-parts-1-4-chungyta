# "Data Modeling Notes"

## "Normalization Analysis"

### "1NF Conversion"
DATASHEET(<u>TName</u>, Location, Phone, Mtitle,<u>Showtime</u>, Rating, <u>CCode</u>, <u>CName</u>)

### '2NF Conversion'
TName --> (Location, Phone)

Mtitle --> (Rating)

Mtitle --> (CCode, CName)

TName(<u>Location</u>,Phone)

Mtitle(<u>Rating</u>)

DATASHEET( TName, Mtitle, <u>Showtime</u>, <u>Ccode</u>, <u>CName</u>)


### "3NF Conversion"
TName, Mtitle-->Showtime

Theaters(TName, Location, Phone)

Movies(Mtitle, rating)

Credits(Mtitle, Ccode, CName)

Shows(TName, Mtitle, Showtime)


### "BCNF Conversion"
ArtistID ---> Credits

MID --> showtime


Theaters(TID,TName,Location, Phone)

Movies(MID, Mtitle, Rating)

Credits(MID, Ccode, ArtistID)

Shows(SID,TID, MID,showtime)

Artists(ArtistID, CName)

## "Entity Relationship Model"
![Image of ERD](MoviesTonightERD.png)


Instance: ap-2f37d696067eeb6daf1111cfc3272672
InstanceOf: AdministrableProductDefinitionUvEpi
Title: "Administrable product Tegretol 200 mg tablets"
Description: "Tegretol 200 mg tablets"
Usage: #example

* identifier.system = $phpid
* identifier.value = "EU/1/98/071/004 " 

* status = #active

* formOf = Reference(mpac2bb08bb4cc3f51f8c4e3513034c019)
* administrableDoseForm = $spor-rms#200000002152 "tablet"
* unitOfPresentation = $spor-rms#200000002152 "tablet"

//this is just manufactured with extra steps?


//reference to MedicinalProductDefinition: EU/1/97/049/001 Karvea 75 mg tablet
* producedFrom = Reference(mid-2f37d696067eeb6daf1111cfc3272672)


* routeOfAdministration.code = $spor-rms#100000073619 "Oral use"

* routeOfAdministration.targetSpecies.code = $spor-rms#100000109093 "Human"
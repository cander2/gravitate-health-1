{% for index,row in data["data"].iterrows() %}
{% if row["skip"] not in ['y', 'Y', 'x', 'X'] %}

{% set ns = namespace() %}
{% set ns.one = row['type'] %}
{% set ns.two = row['name']|lower | regex_replace('[^A-Za-z0-9]+', '') %}
{% set ns.three= data["dictionary"]["MajorName"] %}
{% set ns.name_to_has= ns.one ~ ns.two ~ns.three  %}


Instance: cud-{{ns.name_to_has| create_hash_id}}
InstanceOf: ClinicalUseDefinition-{{row['type']}}-uv-epi
Description: "{{row['type']}} - {{row['name']}}"
Usage: #example

* identifier.system = "{{row['identifier_system']}}"
* identifier.value = "{{row['identifier']}}"
* identifier.use = #official

* type = #{{row['type']}}

// Reference to MedicinalProductDefinition: EU/1/97/049/001 Karvea 75 mg tablet blister x28
 
{% if data["turn"] != "1" %}
* subject = Reference({{data["references"]["MedicinalProductDefinition"][0][0]}})
{% endif %}
{% if row["type"]|string =="contraindication"  %}

* contraindication
  * diseaseSymptomProcedure.concept.coding = $meddra#{{row["conceptID"]}} "{{ row["concept"] }}"
{% endif %}

{% if row["type"]|string =="indication"  %}

* indication
  * diseaseSymptomProcedure.concept.coding = $meddra#{{row["conceptID"]}} "{{ row["concept"] }}"

{% endif %}

{% if row["type"]|string =="interaction"  %}

* interaction.interactant.itemCodeableConcept = https://gsrs.ncats.nih.gov/ginas/app/beta/#{{row["conceptID"]}} "{{ row["concept"] }}"

//* interaction.interactant.itemCodeableConcept.text = "METHOTREXATE"
{% endif %}


{%- endif %}
{%- endfor %}


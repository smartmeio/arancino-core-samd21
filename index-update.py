import json

#Caricamento sezione da inserire ottenuta dal file creato tramite il bash
def loadNewSection():
    f = open('../platform_index.json')
    json_file = json.load(f)
    f.close()
    return json_file

#Inserimento sezione all'interno del json principale 
def InsertSection(section):
    #apertura file e inizializzazione variabile json
    f = open('package_smartmeio_index.json')
    index_json = json.load(f)
    f.close()
    #Inizializzazione variabile sentinella e indice ciclo   
    sent = 0
    i=0
    
    #Ciclo che ricerca la lista degli elementi corrispondenti alla architettura da inserire e successivamente inserisce come ultimo della lista la sezione ottenuta in precedenza
    while sent != 2:
        if sent == 0 and index_json['packages'][0]["platforms"][i]["architecture"] == section["architecture"]:
            sent = 1
        elif sent == 1 and index_json['packages'][0]["platforms"][i]["architecture"] != section["architecture"]:
            index_json['packages'][0]["platforms"].insert(i, section)
            sent = 2
        i+=1
    
    #Scrittura json con sezione aggiunta all'interno del file        
    with open("package_smartmeio_index.json", 'w') as json_file:
        json.dump(index_json, json_file, indent=4, separators=(',', ': '))    
    
    
if __name__ == "__main__": 
    parsed = loadNewSection()
    InsertSection(parsed)

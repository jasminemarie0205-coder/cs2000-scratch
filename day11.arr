use context dcic2024
include csv
  
voter-data = 
  load-table: VoterID,FirstName,LastName,DOB,Party,Address,City,State,Zip,Phone,Email,LastVoted 
    source: csv-table-file("voters.csv", default-options)
end

#ASSUMPTION: treating missing values for party affiliation as Independents

voters-with-independents =transform-column(voter-data, "Party", lam(p :: String) -> String:
      if p == "":
        "Independent"
      else:
        p
      end
  end)


fixed-phone =transform-column(voter-data, "Phone", lam(p :: String) -> String:
    
    replace1= string-replace(p,"-","")
    replace2=string-replace(replace1," ","")
    replace3=string-replace(replace2,"(","")
    replace4=string-replace(replace3,")","")
    replace5=string-replace(replace4,".","")
   
    if string-length(replace5) == 10:
       replace5
    else:
      "INVALID"
    end
  end)


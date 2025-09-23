import { HttpClient, HttpRequest } from '@angular/common/http';
import { Component, inject } from '@angular/core';
import { OnInit } from '@angular/core';
import { environment } from '../../../../../environments/environment.development';
import { DatePipe } from '@angular/common';

type Claim = {
  claimId: string;           // UUID as string
  policyId: string;          // UUID as string
  openDate: string;          // ISO 8601 format (e.g., "2025-09-16T18:03:00")
  procedureNotes: string;
  claimType: string;
  status: string;
  claimAmount: number;       // Assuming it's a long integer
};

@Component({
  selector: 'app-claim-approval',
  standalone: true, // ✅ Required if using inject() directly
  imports: [DatePipe],       // ✅ Only valid with standalone: true
  templateUrl: './claim-approval.html',
  styleUrls: ['./claim-approval.css'] // ✅ corrected from styleUrl
})


export class ClaimApproval implements OnInit{
  private http = inject(HttpClient)
  agentId!:any
  Claims:any[] = []
  ngOnInit(): void {
    this.agentId = localStorage.getItem('userId')
    
    
    const url:any = `${environment.apiUrl}/private/claim/get/agent/${this.agentId}`
    const respone:any = this.http.get<[]>(url).subscribe({
      next: (element:any) => {
        this.Claims = element
        console.log(this.Claims)
      },
      error:(err) => {console.log("Could not get data")}
    } 
    )  
  }

  ConfirmAction(claim:any,value:string){
    const Updatedstatus = (value)
    if(Updatedstatus==='2'){
       claim.status = "Review".toUpperCase()
    }
    else if(Updatedstatus==='3'){
      claim.status = "Aproved".toUpperCase()

    }

    else if(Updatedstatus==='4'){
       claim.status = "Rejected".toUpperCase()
    }

const updateUrl = `${environment.apiUrl}/private/claim/update/${claim.claimId}/${Updatedstatus}`;
this.http.put(updateUrl, {}).subscribe();
    

  }


  
}

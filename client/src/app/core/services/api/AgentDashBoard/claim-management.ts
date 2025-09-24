import { Injectable,inject } from '@angular/core';
import { HttpClient,HttpRequest } from '@angular/common/http';
import { environment } from '../../../../../environments/environment.development';
import { Observable } from 'rxjs';

type Claim = {
  claimId: string;          
  policyId: string;          
  openDate: string;         
  procedureNotes: string;
  claimType: string;
  status: string;
  claimAmount: number;      
};


@Injectable({
  providedIn: 'root'
})
export class ClaimManagement {
  private http = inject(HttpClient)
  private apiUrl = environment.apiUrl
  Claims!:[] 


  getClaimsByAgentId(agentId: string | null): Observable<Claim[]> {
    const url = `${this.apiUrl}/private/claim/get/agent/${agentId}`;
    return this.http.get<Claim[]>(url);
  }



  updateClaimStatus(claim: Claim, updatedStatus: string) {
    if (updatedStatus === '2') {
      claim.status = "Review".toUpperCase();
    } else if (updatedStatus === '3') {
      claim.status = "Aproved".toUpperCase();
    } else if (updatedStatus === '4') {
      claim.status = "Rejected".toUpperCase();
    }
    const url = `${environment.apiUrl}/private/claim/update/${claim.claimId}/${updatedStatus}`;
    this.http.put(url, {}).subscribe();
  }
  
}

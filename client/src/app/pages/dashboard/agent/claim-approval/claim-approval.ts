import { HttpClient, HttpRequest } from '@angular/common/http';
import { Component, inject } from '@angular/core';
import { OnInit } from '@angular/core';
import { environment } from '../../../../../environments/environment.development';
import { CommonModule, DatePipe } from '@angular/common';
import { ClaimManagement } from '../../../../core/services/api/AgentDashBoard/claim-management';

type Claim = {
  claimId: string;           // UUID as string
  policyId: string;          // UUID as string
  openDate: string;          // ISO 8601 format (e.g., "2025-09-16T18:03:00")
  procedureNotes: string;
  claimType: string;
  status: string;
  claimAmount: number; 
  updatedAt:string;      
};

@Component({
  selector: 'app-claim-approval',
  standalone: true, 
  imports: [DatePipe,CommonModule],       
  templateUrl: './claim-approval.html',
  styleUrls: ['./claim-approval.css']
})


export class ClaimApproval implements OnInit{
  Claims:any[] = []
  private service = inject(ClaimManagement)
  private agentId:any
  ngOnInit(): void {
  this.agentId = localStorage.getItem('userId')
  this.service.getClaimsByAgentId(this.agentId).subscribe({
      next: (claims: Claim[]) => {
        this.Claims = claims;
        console.log("Claims loaded:", this.Claims);
      },
      error: (err) => {
        console.error("Failed to load claims:", err);
      }
    });

  }

  ConfirmAction(claim:Claim,status:string){
    console.log(this.Claims)
    this.service.updateClaimStatus(claim,status)
  }


  
}


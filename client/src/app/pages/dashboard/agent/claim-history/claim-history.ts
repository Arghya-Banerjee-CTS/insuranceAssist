import { Component, inject, OnInit } from '@angular/core';
import { ClaimManagement } from '../../../../core/services/api/AgentDashBoard/claim-management';
import { CommonModule, DatePipe } from '@angular/common';




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
  selector: 'app-claim-history',
  imports: [CommonModule,DatePipe],
  templateUrl: './claim-history.html',
  styleUrl: './claim-history.css'
})

export class ClaimHistory implements OnInit{
  Claims:any[] = []
  private service = inject(ClaimManagement)
  agentId!:string | null
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

}

import { CommonModule } from '@angular/common';
import { Component, inject } from '@angular/core';
import { Claim } from '../../../../../core/services/api/claim/claim';
import { FormsModule } from '@angular/forms';

@Component({
  selector: 'app-client-claim-history',
  imports: [CommonModule, FormsModule],
  templateUrl: './client-claim-history.html',
  styleUrl: './client-claim-history.css'
})

// class claimHistoryModel {
//   private 
// }

export class ClientClaimHistory {

  private claimService = inject(Claim);
  private clientId: any = localStorage.getItem('userId');

  ngOnInit(){
    this.onClaimHistory();
  }

  resultDefault: any[] = [];
  result: any[] = [];

  filterStatus: string = '';
  filterType: string = '';
  filterStartDate?: string;
  filterEndDate?: string;

  onClaimHistory(){
    this.claimService.onGetClaimHistory(this.clientId).subscribe({
      next: (result:any) => {
        this.result = result;
        this.resultDefault = result;
        console.log(result);
      }
    })
  }

  filterByStatus(status: string){
    this.filterStatus = status;
    this.applyFilters();
  }

  filterByType(type: string){
    this.filterType = type;
    this.applyFilters();
  }

  applyFilters(){
    
  }

  resetFilters(){
    this.filterStatus = '';
    this.filterType = '';
    this.filterStartDate = undefined;
    this.filterEndDate = undefined;
    this.result = this.resultDefault;
  }

}

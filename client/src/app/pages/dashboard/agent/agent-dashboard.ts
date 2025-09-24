import { Component } from '@angular/core';
import { Overview } from './overview/overview';
import { ClaimApproval } from "./claim-approval/claim-approval";
import { ClaimHistory } from './claim-history/claim-history';

@Component({
  selector: 'app-agent',
  imports: [Overview, ClaimApproval,ClaimHistory],
  templateUrl: './agent.html',
  styleUrl: './agent.css'
})
export class AgentDashboard {
  activeTab: 'overview' | 'claim-approval' | 'claim-history' | 'claim-status-log' = 'overview';
  setTab(tab: 'overview' | 'claim-approval' | 'claim-history' | 'claim-status-log') {
    this.activeTab = tab;
  }
}

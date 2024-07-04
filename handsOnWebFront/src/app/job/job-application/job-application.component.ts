import { ActivatedRoute, Params, Router } from '@angular/router';
import { HttpService } from '../../http-requests/http.service';
import { Component, OnInit } from '@angular/core';
import { FormGroup, Validators, FormControl } from '@angular/forms';
import { DatePipe } from '@angular/common';
import { JobService } from '../job.service';
import { Subscription } from 'rxjs/internal/Subscription';


export interface Appliance {
  userName: string,
  userEmail: string,
  applianceText: string,
  jobId?: number
}

@Component({
  selector: 'app-job-application',
  templateUrl: './job-application.component.html',
  styleUrls: ['./job-application.component.css'],
  providers: [DatePipe],
})
export class JobApplicationComponent implements OnInit {
  form!: FormGroup;
  appliance: any;
  messageError: string = '';
  id!: number;
  sub!: Subscription;

  constructor(
    private router: Router,
    private jobService: JobService,
    private acRoute: ActivatedRoute,
    private httpService: HttpService
  ) { 
    this.httpService.getJobs().subscribe();
  }

  ngOnInit() {
    this.sub = this.acRoute.params.subscribe((params: Params) => {
      this.id = params['id'];
    });
    this.form = new FormGroup({
      userName: new FormControl(null, [Validators.required]),
      userEmail: new FormControl(null, [Validators.required]),
      applianceText: new FormControl(null, [Validators.required]),
    });
  }

  onSubmit(form: FormGroup): void {
    this.addAppliance(form.value);
    console.log(this.appliance)
    this.httpService.inputAppliance(this.appliance).subscribe(
      {
        next: (data) => {
          this.router.navigate(['']);
        },
        error: (e) => {
          this.messageError = e.error.message;
        },
      }
    );
  }

  addAppliance(data: Appliance): void {
    let jobId = this.jobService.getJobId(this.id)
    this.appliance = {
      userName: data.userName,
      userEmail: data.userEmail,
      applianceText: data.applianceText,
      jobId: jobId
    };
  }

  onClose(): void {
    this.messageError = '';
  }
}

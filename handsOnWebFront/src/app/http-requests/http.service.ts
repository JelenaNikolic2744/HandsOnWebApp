import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { tap } from 'rxjs/operators';
import { JobService } from '../job/job.service';
import { Job } from '../job/job.model';
import { Appliance } from '../job/job-application/job-application.component';


@Injectable()
export class HttpService {
  constructor(
    private http: HttpClient,
    private jobService: JobService,
  ) { }

  getJobs() {
    return this.http.get<Job[]>('http://localhost:3000/job').pipe(
      tap((jobs) => {
        this.jobService.setJobs(jobs);
      })
    );
  }

  inputAppliance(appliance: Appliance) {
    const headers = new HttpHeaders({
      'Content-Type': 'application/json',
       "Accept": "application/json"
    });
    return this.http.post<string>('http://localhost:3000/appliances', appliance, {headers: headers})
  }
}

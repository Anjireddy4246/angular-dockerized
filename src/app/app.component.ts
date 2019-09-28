import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.less']
})
export class AppComponent implements OnInit {
  title = 'angular-fireball';
  subTitle = 'awesome angular 8.0';
  ngOnInit(): void {
    if (this.title == 'angular-fireball') {
      console.log('Angular App is up and running');
    }
  }
}

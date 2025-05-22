import { Component } from '@angular/core';
import {RouterLink} from '@angular/router';


// ⬅️ Le decimos que "bootstrap" existe como variable global
declare var bootstrap: any;

@Component({
  selector: 'app-technologies',
  standalone: true,
  imports: [
    RouterLink
  ],
  templateUrl: './technologies.component.html',
  styleUrl: './technologies.component.css'
})
export class TechnologiesComponent {
  // Funcion para inicializar los carruseles
  ngAfterViewInit(): void {
    const carousels = document.querySelectorAll('.carousel');
    carousels.forEach((carousel) => {
      new bootstrap.Carousel(carousel, {
        interval: 1500,
        ride: 'carousel'
      });
    });
  }
}


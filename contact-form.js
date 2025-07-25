// Contact form functionality
document.addEventListener('DOMContentLoaded', function() {
    const contactForm = document.getElementById('contact-form');
    
    if (contactForm) {
        contactForm.addEventListener('submit', function(e) {
            e.preventDefault();
            
            // Get form data
            const formData = new FormData(contactForm);
            const name = contactForm.querySelector('input[type="text"]').value;
            const email = contactForm.querySelector('input[type="email"]').value;
            const experience = contactForm.querySelector('select').value;
            const message = contactForm.querySelector('textarea').value;
            
            // Basic validation
            if (!name || !email || !experience || !message) {
                showNotification('Please fill in all fields', 'error');
                return;
            }
            
            // Email validation
            const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            if (!emailRegex.test(email)) {
                showNotification('Please enter a valid email address', 'error');
                return;
            }
            
            // Show loading state
            const submitBtn = contactForm.querySelector('.form-submit');
            const originalText = submitBtn.textContent;
            submitBtn.textContent = 'Sending...';
            submitBtn.disabled = true;
            
            // Create WhatsApp message
            const whatsappMessage = encodeURIComponent(
                `Hello! I'm interested in Eswatini travel packages.\n\n` +
                `Name: ${name}\n` +
                `Email: ${email}\n` +
                `Experience Type: ${experience}\n` +
                `Message: ${message}\n\n` +
                `Please contact me to discuss my travel plans.`
            );
            
            // Simulate form processing delay
            setTimeout(() => {
                // Track the form submission
                if (typeof gtag !== 'undefined') {
                    gtag('event', 'form_submit', {
                        event_category: 'engagement',
                        event_label: experience,
                        value: 1
                    });
                }
                
                if (typeof posthog !== 'undefined') {
                    posthog.capture('contact_form_submitted', {
                        experience_type: experience,
                        source: 'website_contact_form'
                    });
                }
                
                // Reset form
                contactForm.reset();
                submitBtn.textContent = originalText;
                submitBtn.disabled = false;
                
                // Show success message
                showNotification('Thank you! Your inquiry has been received. Redirecting to WhatsApp...', 'success');
                
                // Redirect to WhatsApp after showing success message
                setTimeout(() => {
                    window.open(`https://wa.me/+2687654321?text=${whatsappMessage}`, '_blank');
                }, 2000);
                
            }, 1000);
        });
    }
});

// Notification system
function showNotification(message, type = 'info') {
    // Remove existing notifications
    const existingNotifications = document.querySelectorAll('.notification');
    existingNotifications.forEach(notif => notif.remove());
    
    // Create notification element
    const notification = document.createElement('div');
    notification.className = `notification notification-${type}`;
    notification.innerHTML = `
        <div class="notification-content">
            <span class="notification-message">${message}</span>
            <button class="notification-close" onclick="this.parentElement.parentElement.remove()">×</button>
        </div>
    `;
    
    // Add to page
    document.body.appendChild(notification);
    
    // Auto remove after 5 seconds
    setTimeout(() => {
        if (notification.parentNode) {
            notification.remove();
        }
    }, 5000);
    
    // Add fade in animation
    setTimeout(() => {
        notification.classList.add('notification-show');
    }, 10);
}

// Enhanced WhatsApp tracking
function trackWhatsAppClick(source) {
    // Google Analytics tracking
    if (typeof gtag !== 'undefined') {
        gtag('event', 'whatsapp_click', {
            event_category: 'contact',
            event_label: source,
            value: 1
        });
    }
    
    // PostHog tracking
    if (typeof posthog !== 'undefined') {
        posthog.capture('whatsapp_clicked', {
            source: source,
            timestamp: new Date().toISOString()
        });
    }
}

// Enhanced booking interest tracking
function trackBookingInterest(packageType) {
    // Google Analytics tracking
    if (typeof gtag !== 'undefined') {
        gtag('event', 'booking_interest', {
            event_category: 'engagement',
            event_label: packageType,
            value: 1
        });
    }
    
    // PostHog tracking
    if (typeof posthog !== 'undefined') {
        posthog.capture('booking_interest', {
            package_type: packageType,
            timestamp: new Date().toISOString()
        });
    }
}

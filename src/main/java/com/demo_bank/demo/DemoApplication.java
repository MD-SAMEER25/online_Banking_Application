package com.demo_bank.demo;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.ApplicationRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;

import java.awt.*;
import java.net.URI;

@SpringBootApplication
public class DemoApplication {

	private static final Logger logger = LoggerFactory.getLogger(DemoApplication.class);

	public static void main(String[] args) {
		SpringApplication.run(DemoApplication.class, args);
	}

	@Bean
	public ApplicationRunner applicationRunner() {
		return args -> {
			String url = "http://127.0.0.1:8070/home"; // Replace with your desired URL

			// Log the URL that the application should open
			logger.info("Application started. Open your web browser and go to: {}", url);

			// Attempt to open the URL in the default web browser
			openBrowser(url);
		};
	}

	private void openBrowser(String url) {
		// Check if running in a headless environment (e.g., server with no GUI)
		if (GraphicsEnvironment.isHeadless()) {
			return; // Simply do nothing if in headless mode, no warning or logging
		}

		// Check if the desktop is supported (for environments with GUI)
		if (Desktop.isDesktopSupported()) {
			Desktop desktop = Desktop.getDesktop();
			try {
				desktop.browse(new URI(url));
			} catch (Exception e) {
				// Log error if the browser couldn't be opened
				logger.error("Failed to open browser with URL: {}", url, e);
			}
		} else {
			// Log a warning if the desktop environment is not supported
			logger.warn("Desktop is not supported. Open the URL manually: {}", url);
		}
	}
}

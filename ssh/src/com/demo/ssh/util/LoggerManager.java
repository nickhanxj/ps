package com.demo.ssh.util;

import org.apache.log4j.Logger;

public class LoggerManager {
	private LoggerManager() {
	}

	private static Logger logger = Logger.getLogger(LoggerManager.class);

	public static void info(String info) {
		logger.info(info);
	}

	public static void error(String error) {
		logger.error(error);
	}
}

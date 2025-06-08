import logging
import sys


class Logger:
    """Singleton Logger class to handle logging across the application."""
    _logger = None

    @classmethod
    def get_logger(cls, name="app", level="INFO"):
        if cls._logger is None:
            cls._logger = logging.getLogger(name)
            handler = logging.StreamHandler(sys.stdout)
            formatter = logging.Formatter(
                "%(asctime)s [%(levelname)s] %(name)s: %(message)s"
            )
            handler.setFormatter(formatter)
            cls._logger.addHandler(handler)
            # Convert string level to logging constant
            log_level = getattr(logging, level.upper(), logging.INFO)
            cls._logger.setLevel(log_level)
            cls._logger.propagate = False
        return cls._logger

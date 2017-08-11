import os
basedir = os.path.abspath(os.path.dirname(__file__))


class Config:
    SQLALCHEMY_TRACK_MODIFICATIONS = False


class ProductionConfig(Config):
    pass


class DevelopmentConfig(Config):
    DEBUG = True
    SQLALCHEMY_ECHO = True
    SQLALCHEMY_DATABASE_URI = 'sqlite:///' + os.path.join(basedir, 'dev.db')


config = {
    'development': DevelopmentConfig,
    'production': ProductionConfig,
    # And the default is...
    'default': DevelopmentConfig
}

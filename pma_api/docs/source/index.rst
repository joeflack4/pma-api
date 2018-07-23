.. PMA API documentation master file, created by
   sphinx-quickstart on Mon Jul 16 16:03:07 2018.
   You can adapt this file completely to your liking, but it should at least
   contain the root `toctree` directive.
   
   docs:
     sphinx: http://www.sphinx-doc.org/en/master/
     sphinx.ext.autodoc: http://www.sphinx-doc.org/en/master/usage/extensions/autodoc.html
     sphinx.ext.doctest: http://www.sphinx-doc.org/en/master/usage/extensions/doctest.html
     sphinx.ext.coverage: http://www.sphinx-doc.org/en/master/usage/extensions/coverage.html
     sphinxcontrib.httpdomain: https://hoyodecrimen.com/api/ext/httpdomain/doc/index.html
     sphinxcontrib.autohttp.flask: https://sphinxcontrib-httpdomain.readthedocs.io/en/stable/#module-sphinxcontrib.autohttp.flask
     sphinxcontrib.autohttp.flaskqref: https://sphinxcontrib-httpdomain.readthedocs.io/en/stable/#sphinxcontrib-autohttp-flaskqref-quick-api-reference-for-flask-app


API Documentation
=================
.. CURRENT SETUP --------------------------------------------------------------
   From http://kartowicz.com/dryobates/2016-10/sphinx-rest-api/

.. toctree::
   :maxdepth: 2
   :caption: Contents:

   content/usage/using_the_api
   content/usage/installation

Quick start
-----------

Explore the API at: https://api.pma2020.org/v1/resources

Summary
-------

.. Summary table
   Syntax: qrefflask:: module:app
   URL: https://sphinxcontrib-httpdomain.readthedocs.io/en/stable/#directive-qrefflask
.. qrefflask:: pma_api.__init__:create_app()
  :undoc-static:


API Details
-----------

.. Api details
   Syntax: autoflask:: module:app
   URL:
.. autoflask:: pma_api.__init__:create_app()
  :undoc-static:


Indices and tables
==================
* :ref:`genindex`
* :ref:`modindex`


.. SPHINX DEFAULTS ------------------------------------------------------------
.. Sphinx default (start next line with .. to reactivate)
   toctree::
   :maxdepth: 2
   :caption: Contents:

.. From http://kartowicz.com/dryobates/2016-10/sphinx-rest-api/

.. Sphinx default (remove this line to reactivate and trailing ..s to activate)
.. Indices and tables
.. ==================

.. * :ref:`genindex`
.. * :ref:`modindex`
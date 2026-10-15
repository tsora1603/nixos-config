from unittest.mock import patch

from PySide6.QtWidgets import QApplication, QMainWindow
import qdarktheme

from tidaler.gui import MainWindow
from tidaler.ui.main import Ui_MainWindow


def reject_network(*args, **kwargs):
    raise AssertionError("The GUI smoke check must not access the network")


with patch("requests.sessions.Session.request", side_effect=reject_network):
    app = QApplication([])
    qdarktheme.setup_theme()

    assert issubclass(MainWindow, QMainWindow)

    window = QMainWindow()
    ui = Ui_MainWindow()
    ui.setupUi(window)

    assert ui.tr_results.model() is not None
    assert ui.tr_queue_download.columnCount() > 0
    assert ui.cb_quality_audio is not None

    window.show()
    app.processEvents()
    assert window.isVisible()
    window.close()
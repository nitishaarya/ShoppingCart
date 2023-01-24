function HideLabel() {
    document.getElementById('<%= lblInfo.ClientID %>').style.visibility = "hidden";
}
setInterval("HideLabel();", 5000);
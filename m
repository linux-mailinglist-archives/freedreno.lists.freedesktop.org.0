Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D606A11598D
	for <lists+freedreno@lfdr.de>; Sat,  7 Dec 2019 00:14:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D6B86FAA6;
	Fri,  6 Dec 2019 23:14:58 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com
 [IPv6:2607:f8b0:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B884C6FAA6
 for <freedreno@lists.freedesktop.org>; Fri,  6 Dec 2019 23:14:57 +0000 (UTC)
Received: by mail-il1-x12a.google.com with SMTP id g12so7717337ild.2
 for <freedreno@lists.freedesktop.org>; Fri, 06 Dec 2019 15:14:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nb5X/YG7EhxVVMb4rPYE5JMk9umoZgG5Z8q8yvwSs2M=;
 b=tqOAT1JCJXBmSniS66+MioMjHu17A4W8dkEtHMZgGU0JQ5e/EFAvhhZBbZu9Z1/Fty
 1ZHSgbucIia1Pd9r9kCoKk4bEWngOUkSzkRScQvRfyAICtzrBSKJ+xxTgVvxvEkG2mXi
 Fuw4OaUuYg/qG/CINLI+uMbmOKaxvyu9MOXBOiNveBT/I7hzzDqCEFHDfbS5r0w6DQY5
 ocf2U9cVqTnf75I1h1n/6dpuvJtk7Y53iHb6Xbgy85a3y5Z3rcH7z3iGQVDWJhBBn3o/
 Pgus/QNdrfjXkmqF9wszDSnMeWKTq0yadksGlbIiCN/J+fqRkU0kL4e3Fu/lB44aAp6W
 5Pvg==
X-Gm-Message-State: APjAAAVuK8r0cfCFok43j190gyZsvw0N5hsYXJMEb7l7GPgXjMB3cdWf
 wPGhzVoXcHCUQ98L/nGHWF8qZg==
X-Google-Smtp-Source: APXvYqyszDdpM/3ud4bfV15wu6oE2QbjCevykqalAbVlwCBIN4naArSw84K73+sk7klQIdxWF+06mQ==
X-Received: by 2002:a92:8dc3:: with SMTP id w64mr15201727ill.68.1575674097195; 
 Fri, 06 Dec 2019 15:14:57 -0800 (PST)
Received: from ddavenport4.bld.corp.google.com
 ([2620:15c:183:0:92f:a80a:519d:f777])
 by smtp.gmail.com with ESMTPSA id b15sm4317946ilo.37.2019.12.06.15.14.56
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Fri, 06 Dec 2019 15:14:56 -0800 (PST)
From: Drew Davenport <ddavenport@chromium.org>
To: dri-devel@lists.freedesktop.org
Date: Fri,  6 Dec 2019 16:13:45 -0700
Message-Id: <20191206161137.3.I55d53dbb7c64256e4231a6b99c6e6d1c336f624b@changeid>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191206161137.1.Ibb7612c1ebcebe3f560b3269150c0e0363f01e44@changeid>
References: <20191206161137.1.Ibb7612c1ebcebe3f560b3269150c0e0363f01e44@changeid>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nb5X/YG7EhxVVMb4rPYE5JMk9umoZgG5Z8q8yvwSs2M=;
 b=NuMpicKsb6T6BeUCy+TlL4PJnkcDqAUqaRI0E66NpQifyU90z1WQQyECfu2NVtv0jA
 0bdI49nIuuwI4aiB/lszsIyNXya/559wjjVjvlvZZTdoQI097EexNyicnvZFeMHeIkho
 MUjJv2HRu6cwQ32HoRuTJf/Fo6/aKrxETWbAg=
Subject: [Freedreno] [PATCH 3/6] drm/msm/dpu: Remove unnecessary NULL checks
X-BeenThere: freedreno@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Freedreno graphics driver community testing & development
 <freedreno.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/freedreno>,
 <mailto:freedreno-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/freedreno>
List-Post: <mailto:freedreno@lists.freedesktop.org>
List-Help: <mailto:freedreno-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/freedreno>,
 <mailto:freedreno-request@lists.freedesktop.org?subject=subscribe>
Cc: Rob Clark <robdclark@gmail.com>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Bruce Wang <bzwang@chromium.org>, Jordan Crouse <jcrouse@codeaurora.org>,
 Daniel Vetter <daniel@ffwll.ch>, Drew Davenport <ddavenport@chromium.org>,
 Jeykumar Sankaran <jsanka@codeaurora.org>, freedreno@lists.freedesktop.org,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

ZHB1X2NydGNfbWl4ZXIuaHdfbG0gd2lsbCBuZXZlciBiZSBOVUxMLCBzbyBkb24ndCBjaGVjay4K
ClNpZ25lZC1vZmYtYnk6IERyZXcgRGF2ZW5wb3J0IDxkZGF2ZW5wb3J0QGNocm9taXVtLm9yZz4K
LS0tCgogZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X2NydGMuYyB8IDEzICsrKy0t
LS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDEwIGRlbGV0aW9ucygt
KQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9kcHUxL2RwdV9jcnRjLmMg
Yi9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvZHB1MS9kcHVfY3J0Yy5jCmluZGV4IGI5ZWQ4Mjg1
YWIzOS4uYmY1MTM0MTFiMjQzIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3Av
ZHB1MS9kcHVfY3J0Yy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9kcHUxL2RwdV9j
cnRjLmMKQEAgLTE5NywxMCArMTk3LDYgQEAgc3RhdGljIHZvaWQgX2RwdV9jcnRjX2JsZW5kX3Nl
dHVwKHN0cnVjdCBkcm1fY3J0YyAqY3J0YykKIAlEUFVfREVCVUcoIiVzXG4iLCBkcHVfY3J0Yy0+
bmFtZSk7CiAKIAlmb3IgKGkgPSAwOyBpIDwgY3N0YXRlLT5udW1fbWl4ZXJzOyBpKyspIHsKLQkJ
aWYgKCFtaXhlcltpXS5od19sbSkgewotCQkJRFBVX0VSUk9SKCJpbnZhbGlkIGxtIGFzc2lnbmVk
IHRvIG1peGVyXG4iKTsKLQkJCXJldHVybjsKLQkJfQogCQltaXhlcltpXS5taXhlcl9vcF9tb2Rl
ID0gMDsKIAkJbWl4ZXJbaV0uZmx1c2hfbWFzayA9IDA7CiAJCWlmIChtaXhlcltpXS5sbV9jdGwt
Pm9wcy5jbGVhcl9hbGxfYmxlbmRzdGFnZXMpCkBAIC0xMTEzLDEyICsxMTA5LDkgQEAgc3RhdGlj
IGludCBfZHB1X2RlYnVnZnNfc3RhdHVzX3Nob3coc3RydWN0IHNlcV9maWxlICpzLCB2b2lkICpk
YXRhKQogCiAJZm9yIChpID0gMDsgaSA8IGNzdGF0ZS0+bnVtX21peGVyczsgKytpKSB7CiAJCW0g
PSAmY3N0YXRlLT5taXhlcnNbaV07Ci0JCWlmICghbS0+aHdfbG0pCi0JCQlzZXFfcHJpbnRmKHMs
ICJcdG1peGVyWyVkXSBoYXMgbm8gbG1cbiIsIGkpOwotCQllbHNlCi0JCQlzZXFfcHJpbnRmKHMs
ICJcdG1peGVyOiVkIGN0bDolZCB3aWR0aDolZCBoZWlnaHQ6JWRcbiIsCi0JCQkJbS0+aHdfbG0t
PmlkeCAtIExNXzAsIG0tPmxtX2N0bC0+aWR4IC0gQ1RMXzAsCi0JCQkJb3V0X3dpZHRoLCBtb2Rl
LT52ZGlzcGxheSk7CisJCXNlcV9wcmludGYocywgIlx0bWl4ZXI6JWQgY3RsOiVkIHdpZHRoOiVk
IGhlaWdodDolZFxuIiwKKwkJCW0tPmh3X2xtLT5pZHggLSBMTV8wLCBtLT5sbV9jdGwtPmlkeCAt
IENUTF8wLAorCQkJb3V0X3dpZHRoLCBtb2RlLT52ZGlzcGxheSk7CiAJfQogCiAJc2VxX3B1dHMo
cywgIlxuIik7Ci0tIAoyLjIxLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkZyZWVkcmVubyBtYWlsaW5nIGxpc3QKRnJlZWRyZW5vQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2ZyZWVkcmVubw==

Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4709AC0EB
	for <lists+freedreno@lfdr.de>; Fri,  6 Sep 2019 21:53:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2D8C6E0F2;
	Fri,  6 Sep 2019 19:52:59 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com
 [IPv6:2607:f8b0:4864:20::d29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C06A6E0AF
 for <freedreno@lists.freedesktop.org>; Fri,  6 Sep 2019 19:23:55 +0000 (UTC)
Received: by mail-io1-xd29.google.com with SMTP id s21so15291362ioa.1
 for <freedreno@lists.freedesktop.org>; Fri, 06 Sep 2019 12:23:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=W2yelZaQQgNOeM3tNL1ucPE8YNMsnU8lMoKbAm8AChY=;
 b=ajqEWbhwInhylFs0Q9vSPBh+pgpEQtafVvUXWGhFgcYgq8VgQ0wLrFhjXwgW9TgWkh
 Mg9wAJWHaKwrEYLTACNTKZMOlMhD/H+0Vv8zgoGD7fCzbU6uejyg0UeYWUhgiVKzgiCC
 bZuJJDglQqjJI/p1sQ8Hn/qQjJytKGeFfKn8OxLRrUt119iHmswqMCkyJJu5ZEvQVRHx
 /k00fNOw+Njxb5+Van0V/JiG+DJ8Ni9x68uZ3zWSnj1XMJNry8m0AvrHd9hP4n5oxdla
 SxRZ8uqul3ZjXWyqSHi60ftD9GfvTx1HXOUjv4ROecNZg54B9bvk0Kp0D5rSBODZjuM1
 sw7g==
X-Gm-Message-State: APjAAAV4teX8olZfQxpnG/xq8tzlrxU+xf63q8H7SjIteJE0DrNE/+4D
 DrxhIDmzb/KuD4gISYXhNk8Pag==
X-Google-Smtp-Source: APXvYqyY9z+bVXK367r0PSgo655xMFstBXHta7tC6uhSnr685D0+632U3Kq50X7yvcGVAdjr9dTt6w==
X-Received: by 2002:a02:b882:: with SMTP id p2mr11801092jam.16.1567797834689; 
 Fri, 06 Sep 2019 12:23:54 -0700 (PDT)
Received: from ddavenport4.bld.corp.google.com
 ([2620:15c:183:0:92f:a80a:519d:f777])
 by smtp.gmail.com with ESMTPSA id h70sm10931804iof.48.2019.09.06.12.23.53
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Fri, 06 Sep 2019 12:23:54 -0700 (PDT)
From: Drew Davenport <ddavenport@chromium.org>
To: dri-devel@lists.freedesktop.org
Date: Fri,  6 Sep 2019 13:23:40 -0600
Message-Id: <20190906192344.223694-2-ddavenport@chromium.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190906192344.223694-1-ddavenport@chromium.org>
References: <20190906192344.223694-1-ddavenport@chromium.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 06 Sep 2019 19:52:55 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=W2yelZaQQgNOeM3tNL1ucPE8YNMsnU8lMoKbAm8AChY=;
 b=B3VuUrCPXYpqko0QYumGcNMUcl2LhhNpt8HxgSsn0nP4Qj3gxIGutfehwIrE/9CNMq
 Y/x74jvwoJ5LfLkSBRpe9Ody0Qe/J7PVA5YgG84CwXB6883006LkjTHM/BKvJ5Ghkbp8
 cqFcByfJzSDo8FoE6q4ujiKJd2RwGPWB9kUNM=
Subject: [Freedreno] [PATCH 2/6] drm/msm/dpu: Remove unused macro
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
Cc: freedreno@lists.freedesktop.org, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Rob Clark <robdclark@gmail.com>, linux-kernel@vger.kernel.org,
 Bruce Wang <bzwang@chromium.org>, Jordan Crouse <jcrouse@codeaurora.org>,
 Daniel Vetter <daniel@ffwll.ch>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Drew Davenport <ddavenport@chromium.org>, Thomas Gleixner <tglx@linutronix.de>,
 Sean Paul <sean@poorly.run>, Jeykumar Sankaran <jsanka@codeaurora.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

U2lnbmVkLW9mZi1ieTogRHJldyBEYXZlbnBvcnQgPGRkYXZlbnBvcnRAY2hyb21pdW0ub3JnPgot
LS0KCiBkcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvZHB1MS9kcHVfa21zLmggfCA0IC0tLS0KIDEg
ZmlsZSBjaGFuZ2VkLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9tc20vZGlzcC9kcHUxL2RwdV9rbXMuaCBiL2RyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9kcHUx
L2RwdV9rbXMuaAppbmRleCA0Yzg4OWFhYmRhZjkuLjZjZWJhMzNhMTc5ZSAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X2ttcy5oCisrKyBiL2RyaXZlcnMvZ3B1
L2RybS9tc20vZGlzcC9kcHUxL2RwdV9rbXMuaApAQCAtMTM5LDEwICsxMzksNiBAQCBzdHJ1Y3Qg
dnN5bmNfaW5mbyB7CiAKICNkZWZpbmUgdG9fZHB1X2ttcyh4KSBjb250YWluZXJfb2YoeCwgc3Ry
dWN0IGRwdV9rbXMsIGJhc2UpCiAKLS8qIGdldCBzdHJ1Y3QgbXNtX2ttcyAqIGZyb20gZHJtX2Rl
dmljZSAqICovCi0jZGVmaW5lIGRkZXZfdG9fbXNtX2ttcyhEKSAoKEQpICYmIChEKS0+ZGV2X3By
aXZhdGUgPyBcCi0JCSgoc3RydWN0IG1zbV9kcm1fcHJpdmF0ZSAqKSgoRCktPmRldl9wcml2YXRl
KSktPmttcyA6IE5VTEwpCi0KIC8qKgogICogRGVidWdmcyBmdW5jdGlvbnMgLSBleHRyYSBoZWxw
ZXIgZnVuY3Rpb25zIGZvciBkZWJ1Z2ZzIHN1cHBvcnQKICAqCi0tIAoyLjIwLjEKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkZyZWVkcmVubyBtYWlsaW5n
IGxpc3QKRnJlZWRyZW5vQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ZyZWVkcmVubw==

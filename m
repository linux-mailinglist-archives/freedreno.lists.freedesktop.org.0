Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E56FAC0ED
	for <lists+freedreno@lfdr.de>; Fri,  6 Sep 2019 21:53:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9BBF6E10C;
	Fri,  6 Sep 2019 19:53:00 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com
 [IPv6:2607:f8b0:4864:20::d44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6551F6E087
 for <freedreno@lists.freedesktop.org>; Fri,  6 Sep 2019 19:23:57 +0000 (UTC)
Received: by mail-io1-xd44.google.com with SMTP id n197so15219519iod.9
 for <freedreno@lists.freedesktop.org>; Fri, 06 Sep 2019 12:23:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=j/k1s41Cd84FscFUH5HHkD4volUIZMrS8vWB51FggFg=;
 b=tta8klu/z1cc6oJmEBKGfGLozaQZzJPVAd5rutP4HsCVDlrXDQG2wiB9UOhoz5lrG7
 4FyR3ulLamD6D+i2vGDp+Se0H/6ZAkCKI+41EI4Sm98OfkS3PzINgQZAIIv05OfIjku9
 48YmAR8KjnWwgPqkjqB6SgKzObtW+EAyKn7gKxACDLY3OH6g75BBl0r4sShtJhr/aUHw
 TiAljYojd02sRPyDK4aElYwF9VNNqQY0dyPG6jbbUTUGmX00jnicGuvH16NKd+BBi83x
 GyoNWFS/WU9LMqC7WcHC7hHmWBoudaRSOD71mwr/IiH1XUnaj7lNhxOR/3f6/VjZvpky
 BpEg==
X-Gm-Message-State: APjAAAW0O1WDVBLYxSJ/o0g3Ots6zawDcrJLfaC9AEZJcrJqhFKEa/HU
 rNhvA72R5y2avpRwQ2pHWpxPTw==
X-Google-Smtp-Source: APXvYqxqS6QiXdDk5JDrakHdF9YlW8kNKtcmhtlrPTEYPW9EklfJ+iKnRmaedLHEBp6mDxHHlcHM/w==
X-Received: by 2002:a02:cad1:: with SMTP id f17mr8739258jap.18.1567797836589; 
 Fri, 06 Sep 2019 12:23:56 -0700 (PDT)
Received: from ddavenport4.bld.corp.google.com
 ([2620:15c:183:0:92f:a80a:519d:f777])
 by smtp.gmail.com with ESMTPSA id h70sm10931804iof.48.2019.09.06.12.23.55
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Fri, 06 Sep 2019 12:23:56 -0700 (PDT)
From: Drew Davenport <ddavenport@chromium.org>
To: dri-devel@lists.freedesktop.org
Date: Fri,  6 Sep 2019 13:23:42 -0600
Message-Id: <20190906192344.223694-4-ddavenport@chromium.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190906192344.223694-1-ddavenport@chromium.org>
References: <20190906192344.223694-1-ddavenport@chromium.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 06 Sep 2019 19:52:56 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=j/k1s41Cd84FscFUH5HHkD4volUIZMrS8vWB51FggFg=;
 b=RVUr+41FgmB62dAmBtO1Yq+z6nYqWpcb7vKjFfyJhjKwnK2zetlCIe4aATNsLL5Igw
 63by+MASskqj+6jzFzFqSsjREa0+GkcMUAoeg4H9GmmkSkEDivCEm46WJVBXxXlYGmlH
 NVFZ/59Xrc+sZiOFTXGT5XjfVM+a7JzT0eVK4=
Subject: [Freedreno] [PATCH 4/6] drm/msm/dpu: Remove unnecessary NULL checks
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
Cc: Bruce Wang <bzwang@chromium.org>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jayant Shekhar <jshekhar@codeaurora.org>,
 Jordan Crouse <jcrouse@codeaurora.org>, Rob Clark <robdclark@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Drew Davenport <ddavenport@chromium.org>,
 Jeykumar Sankaran <jsanka@codeaurora.org>, freedreno@lists.freedesktop.org,
 Sean Paul <sean@poorly.run>, Sravanthi Kollukuduru <skolluku@codeaurora.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

ZHJtX2NydGMuZGV2IHdpbGwgbmV2ZXIgYmUgTlVMTCwgc28gbm8gbmVlZCB0byBjaGVjayBpdC4K
ClNpZ25lZC1vZmYtYnk6IERyZXcgRGF2ZW5wb3J0IDxkZGF2ZW5wb3J0QGNocm9taXVtLm9yZz4K
LS0tCgogZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X2NvcmVfcGVyZi5jIHwgNSAt
LS0tLQogZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X2NydGMuYyAgICAgIHwgNiAr
KystLS0KIDIgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQoK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9kcHUxL2RwdV9jb3JlX3BlcmYu
YyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9kcHUxL2RwdV9jb3JlX3BlcmYuYwppbmRleCAw
OTRkNzQ2MzVmYjcuLjgzOTg4N2EzYTgwYyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL21z
bS9kaXNwL2RwdTEvZHB1X2NvcmVfcGVyZi5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vZGlz
cC9kcHUxL2RwdV9jb3JlX3BlcmYuYwpAQCAtMzMsMTEgKzMzLDYgQEAgc3RhdGljIHN0cnVjdCBk
cHVfa21zICpfZHB1X2NydGNfZ2V0X2ttcyhzdHJ1Y3QgZHJtX2NydGMgKmNydGMpCiB7CiAJc3Ry
dWN0IG1zbV9kcm1fcHJpdmF0ZSAqcHJpdjsKIAotCWlmICghY3J0Yy0+ZGV2KSB7Ci0JCURQVV9F
UlJPUigiaW52YWxpZCBkZXZpY2VcbiIpOwotCQlyZXR1cm4gTlVMTDsKLQl9Ci0KIAlwcml2ID0g
Y3J0Yy0+ZGV2LT5kZXZfcHJpdmF0ZTsKIAlpZiAoIXByaXYtPmttcykgewogCQlEUFVfRVJST1Io
ImludmFsaWQga21zXG4iKTsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9k
cHUxL2RwdV9jcnRjLmMgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvZHB1MS9kcHVfY3J0Yy5j
CmluZGV4IGVhZDdkNjU3MDk3Yy4uMGI5ZGMwNDJkMmUyIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dw
dS9kcm0vbXNtL2Rpc3AvZHB1MS9kcHVfY3J0Yy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9tc20v
ZGlzcC9kcHUxL2RwdV9jcnRjLmMKQEAgLTI2Niw3ICsyNjYsNyBAQCBlbnVtIGRwdV9pbnRmX21v
ZGUgZHB1X2NydGNfZ2V0X2ludGZfbW9kZShzdHJ1Y3QgZHJtX2NydGMgKmNydGMpCiB7CiAJc3Ry
dWN0IGRybV9lbmNvZGVyICplbmNvZGVyOwogCi0JaWYgKCFjcnRjIHx8ICFjcnRjLT5kZXYpIHsK
KwlpZiAoIWNydGMpIHsKIAkJRFBVX0VSUk9SKCJpbnZhbGlkIGNydGNcbiIpOwogCQlyZXR1cm4g
SU5URl9NT0RFX05PTkU7CiAJfQpAQCAtNjk0LDcgKzY5NCw3IEBAIHN0YXRpYyB2b2lkIGRwdV9j
cnRjX2Rpc2FibGUoc3RydWN0IGRybV9jcnRjICpjcnRjLAogCXVuc2lnbmVkIGxvbmcgZmxhZ3M7
CiAJYm9vbCByZWxlYXNlX2JhbmR3aWR0aCA9IGZhbHNlOwogCi0JaWYgKCFjcnRjIHx8ICFjcnRj
LT5kZXYgfHwgIWNydGMtPnN0YXRlKSB7CisJaWYgKCFjcnRjIHx8ICFjcnRjLT5zdGF0ZSkgewog
CQlEUFVfRVJST1IoImludmFsaWQgY3J0Y1xuIik7CiAJCXJldHVybjsKIAl9CkBAIC03NjYsNyAr
NzY2LDcgQEAgc3RhdGljIHZvaWQgZHB1X2NydGNfZW5hYmxlKHN0cnVjdCBkcm1fY3J0YyAqY3J0
YywKIAlzdHJ1Y3QgbXNtX2RybV9wcml2YXRlICpwcml2OwogCWJvb2wgcmVxdWVzdF9iYW5kd2lk
dGg7CiAKLQlpZiAoIWNydGMgfHwgIWNydGMtPmRldikgeworCWlmICghY3J0YykgewogCQlEUFVf
RVJST1IoImludmFsaWQgY3J0Y1xuIik7CiAJCXJldHVybjsKIAl9Ci0tIAoyLjIwLjEKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkZyZWVkcmVubyBtYWls
aW5nIGxpc3QKRnJlZWRyZW5vQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ZyZWVkcmVubw==

Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02CED284B6
	for <lists+freedreno@lfdr.de>; Thu, 23 May 2019 19:17:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74DBA6E044;
	Thu, 23 May 2019 17:17:16 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E3616E056
 for <freedreno@lists.freedesktop.org>; Thu, 23 May 2019 17:17:14 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id o7so7653659qtp.4
 for <freedreno@lists.freedesktop.org>; Thu, 23 May 2019 10:17:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hZe31Z2x4VZIoxtbM4ZpRRber9rntpgDGP2PgN5budQ=;
 b=jyUH23isCK/fCZMFS76xeSdduQkvx6gBe3c8WtwoKeSS1wzfAfA3xwQYehRcbTizQT
 yiJUVkWRVwl3QSfHOBWr3bsjBvKPDz4BDHlaL62Sm1P9piUEH2z33G1mM3ZsVdz6I6Jd
 D7HGDJklM3gqwpRGgSHPO9T5XDm+eoh4fnWg/jxYjzJ61X+guSvyzlkC4ZDEIB+X/n6S
 ErOtT2O/yhkJu6cOVzcHgrOMrCzZdhttYGSyv6FUZze4aaXKstBP/XmRfq1hd73u7HjM
 vAixM3lklv7RDhQbXJJr2xqpSqURmyqpeI/vPRXy5HNUwmYSC2vYO+uwKZ8O7g4WWCIh
 k8dg==
X-Gm-Message-State: APjAAAUQzuNMxyfqhscg7+kEJsv7lwg76ee/AYEScBglGhBmq0VyShV0
 NmqfbxoCTFr/2OhTELeNLr1QbQ==
X-Google-Smtp-Source: APXvYqxRprHyHT6NlQk7WcwvlRTrpIwhUGLkLhawVE7G3xLGTBOWzBMT9iOE+OiXjWCjQTl9u9p9vw==
X-Received: by 2002:ac8:2fa2:: with SMTP id l31mr43692903qta.277.1558631833831; 
 Thu, 23 May 2019 10:17:13 -0700 (PDT)
Received: from rosewood.cam.corp.google.com
 ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id v25sm662660qtv.2.2019.05.23.10.17.13
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 23 May 2019 10:17:13 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org
Date: Thu, 23 May 2019 13:16:45 -0400
Message-Id: <20190523171653.138678-6-sean@poorly.run>
X-Mailer: git-send-email 2.22.0.rc1.257.g3120a18244-goog
In-Reply-To: <20190523171653.138678-1-sean@poorly.run>
References: <20190523171653.138678-1-sean@poorly.run>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hZe31Z2x4VZIoxtbM4ZpRRber9rntpgDGP2PgN5budQ=;
 b=b3u8Er9VI4JeQuWJ/pKPImBGjjHWw+5VyWes76BQby1qFilLFyRvguFRcg+EjEZ72N
 Iy8uiJIgS21AY13yoVx2lAKHp14UAzvZDzRYLYsqGOF7G0N/uXdqIj0hFD+AQsHLRnyp
 ib80Eiy/80UZ1pYDBN3JfBAC6sFN8VfoTKHxMSnZeQAdEnLVetLjJ6hsH4d+V0dK2tSJ
 Q6y4weOLCjuVD8ttzNYu4cGQaKmCx16rsLgH9bbWiHfeD2jqYyNtXlhkePcqLB3CROyz
 jKfANJS9/vInV8vQuBdNvhbvKw4IShqwFetNDLeB/ifaR6RsgTuoRCz6Y9WJbn2nBusU
 r9Rw==
Subject: [Freedreno] [PATCH v2 6/6] drm/msm/a6xx: Rename a6xx_gmu_probe to
 a6xx_gmu_init
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
Cc: Sean Paul <sean@poorly.run>, Jordan Crouse <jcrouse@codeaurora.org>,
 Sean Paul <seanpaul@chromium.org>, Rob Clark <robdclark@gmail.com>,
 linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

RnJvbTogU2VhbiBQYXVsIDxzZWFucGF1bEBjaHJvbWl1bS5vcmc+CgpUaGlzIHJlbmFtZSBtYWtl
cyBpdCBtb3JlIGNsZWFyIHRoYXQgZXZlcnl0aGluZyBpbml0aWFsaXplZCBpbiB0aGUgX2luaXQK
ZnVuY3Rpb24gbXVzdCBiZSBjbGVhbmVkIHVwIGluIGE2eHhfZ211X3JlbW92ZS4gVGhpcyB3aWxs
IGhvcGVmdWxseQpkaXNzdWFkZSBwZW9wbGUgZnJvbSB1c2luZyBkZXZpY2UgbWFuYWdlZCByZXNv
dXJjZXMgKGZvciByZWFzb25zIGxhaWQKb3V0IGluIHRoZSBwcmV2aW91cyBwYXRjaCkuCgpDaGFu
Z2VzIGluIHYyOgotIE5vbmUKCkNjOiBKb3JkYW4gQ3JvdXNlIDxqY3JvdXNlQGNvZGVhdXJvcmEu
b3JnPgpTaWduZWQtb2ZmLWJ5OiBTZWFuIFBhdWwgPHNlYW5wYXVsQGNocm9taXVtLm9yZz4KLS0t
CiBkcml2ZXJzL2dwdS9kcm0vbXNtL2FkcmVuby9hNnh4X2dtdS5jIHwgMiArLQogZHJpdmVycy9n
cHUvZHJtL21zbS9hZHJlbm8vYTZ4eF9ncHUuYyB8IDIgKy0KIGRyaXZlcnMvZ3B1L2RybS9tc20v
YWRyZW5vL2E2eHhfZ3B1LmggfCAyICstCiAzIGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygr
KSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2FkcmVu
by9hNnh4X2dtdS5jIGIvZHJpdmVycy9ncHUvZHJtL21zbS9hZHJlbm8vYTZ4eF9nbXUuYwppbmRl
eCBlMmI4MzliNWQzYmQuLjVhYjY5ZGNkNTQ3OSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJt
L21zbS9hZHJlbm8vYTZ4eF9nbXUuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL2FkcmVuby9h
Nnh4X2dtdS5jCkBAIC0xMjU5LDcgKzEyNTksNyBAQCB2b2lkIGE2eHhfZ211X3JlbW92ZShzdHJ1
Y3QgYTZ4eF9ncHUgKmE2eHhfZ3B1KQogCWdtdS0+aW5pdGlhbGl6ZWQgPSBmYWxzZTsKIH0KIAot
aW50IGE2eHhfZ211X3Byb2JlKHN0cnVjdCBhNnh4X2dwdSAqYTZ4eF9ncHUsIHN0cnVjdCBkZXZp
Y2Vfbm9kZSAqbm9kZSkKK2ludCBhNnh4X2dtdV9pbml0KHN0cnVjdCBhNnh4X2dwdSAqYTZ4eF9n
cHUsIHN0cnVjdCBkZXZpY2Vfbm9kZSAqbm9kZSkKIHsKIAlzdHJ1Y3QgYTZ4eF9nbXUgKmdtdSA9
ICZhNnh4X2dwdS0+Z211OwogCXN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYgPSBvZl9maW5k
X2RldmljZV9ieV9ub2RlKG5vZGUpOwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21zbS9h
ZHJlbm8vYTZ4eF9ncHUuYyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vYWRyZW5vL2E2eHhfZ3B1LmMK
aW5kZXggZTc0ZGNlNDc0MjUwLi4xZjlmNGIwYTk2NTYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9tc20vYWRyZW5vL2E2eHhfZ3B1LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL21zbS9hZHJl
bm8vYTZ4eF9ncHUuYwpAQCAtODU0LDcgKzg1NCw3IEBAIHN0cnVjdCBtc21fZ3B1ICphNnh4X2dw
dV9pbml0KHN0cnVjdCBkcm1fZGV2aWNlICpkZXYpCiAJLyogRklYTUU6IEhvdyBkbyB3ZSBncmFj
ZWZ1bGx5IGhhbmRsZSB0aGlzPyAqLwogCUJVR19PTighbm9kZSk7CiAKLQlyZXQgPSBhNnh4X2dt
dV9wcm9iZShhNnh4X2dwdSwgbm9kZSk7CisJcmV0ID0gYTZ4eF9nbXVfaW5pdChhNnh4X2dwdSwg
bm9kZSk7CiAJaWYgKHJldCkgewogCQlhNnh4X2Rlc3Ryb3koJihhNnh4X2dwdS0+YmFzZS5iYXNl
KSk7CiAJCXJldHVybiBFUlJfUFRSKHJldCk7CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
bXNtL2FkcmVuby9hNnh4X2dwdS5oIGIvZHJpdmVycy9ncHUvZHJtL21zbS9hZHJlbm8vYTZ4eF9n
cHUuaAppbmRleCBiNDYyNzllYjE4YzUuLjY0Mzk5NTU0ZjJkZCAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL21zbS9hZHJlbm8vYTZ4eF9ncHUuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vbXNt
L2FkcmVuby9hNnh4X2dwdS5oCkBAIC01Myw3ICs1Myw3IEBAIGJvb2wgYTZ4eF9nbXVfaXNpZGxl
KHN0cnVjdCBhNnh4X2dtdSAqZ211KTsKIGludCBhNnh4X2dtdV9zZXRfb29iKHN0cnVjdCBhNnh4
X2dtdSAqZ211LCBlbnVtIGE2eHhfZ211X29vYl9zdGF0ZSBzdGF0ZSk7CiB2b2lkIGE2eHhfZ211
X2NsZWFyX29vYihzdHJ1Y3QgYTZ4eF9nbXUgKmdtdSwgZW51bSBhNnh4X2dtdV9vb2Jfc3RhdGUg
c3RhdGUpOwogCi1pbnQgYTZ4eF9nbXVfcHJvYmUoc3RydWN0IGE2eHhfZ3B1ICphNnh4X2dwdSwg
c3RydWN0IGRldmljZV9ub2RlICpub2RlKTsKK2ludCBhNnh4X2dtdV9pbml0KHN0cnVjdCBhNnh4
X2dwdSAqYTZ4eF9ncHUsIHN0cnVjdCBkZXZpY2Vfbm9kZSAqbm9kZSk7CiB2b2lkIGE2eHhfZ211
X3JlbW92ZShzdHJ1Y3QgYTZ4eF9ncHUgKmE2eHhfZ3B1KTsKIAogdm9pZCBhNnh4X2dtdV9zZXRf
ZnJlcShzdHJ1Y3QgbXNtX2dwdSAqZ3B1LCB1bnNpZ25lZCBsb25nIGZyZXEpOwotLSAKU2VhbiBQ
YXVsLCBTb2Z0d2FyZSBFbmdpbmVlciwgR29vZ2xlIC8gQ2hyb21pdW0gT1MKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkZyZWVkcmVubyBtYWlsaW5nIGxp
c3QKRnJlZWRyZW5vQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ZyZWVkcmVubw==

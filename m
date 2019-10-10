Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A2B3D301A
	for <lists+freedreno@lfdr.de>; Thu, 10 Oct 2019 20:18:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AA996E0A5;
	Thu, 10 Oct 2019 18:18:05 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-xc44.google.com (mail-yw1-xc44.google.com
 [IPv6:2607:f8b0:4864:20::c44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D421C6E08C
 for <freedreno@lists.freedesktop.org>; Thu, 10 Oct 2019 18:18:03 +0000 (UTC)
Received: by mail-yw1-xc44.google.com with SMTP id l64so2393878ywe.13
 for <freedreno@lists.freedesktop.org>; Thu, 10 Oct 2019 11:18:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=I3NYY2QPFYsrCHTKk5YmsfIPZArib3V6JUbjM+pfbtk=;
 b=WWtU4fUPQQO5DBBkFA+wgqijaaaRMSLMEnbziwapk0a0d80/rwRKWlXxf1TiWLpgLY
 0S4nWud+g/f07RJvFRlY+pOxAZtX/0NOZ3NZnPTDf4NQ9rCfgN24xL7duwLHDaH9JImp
 LrSqEtR3/IS9QKyXfODw3E8Ci1lR8QeSayHKc1/3dIISAgGdxmCyssJgvyZOXL8z4mRq
 VmpSXPBaKn73NTGbDjrB6jciekDYctqJv9CDTp5FUTU5hJCYMGd+f5yJEOVY6ar/E8Xw
 UEj23twE5ClnYul3lM+CZZbPVrkQHMOrFKr8WieT1bPYgfry6vPFCvfwq59f385nre28
 TP/g==
X-Gm-Message-State: APjAAAVV8NEUHUNEUPK6DSBVFWax2wK/EZ3oo52HiiAEaYwbiQhR09H+
 bYATq/aLKAhpQHpMnTP990udow==
X-Google-Smtp-Source: APXvYqwWkZ/j2WUxUMUi7rtAQr9RIGT9e9QFfEaeBR3++xYI0pkcWkRXA/IBRy8ly+roicnd6RA+vg==
X-Received: by 2002:a81:35cc:: with SMTP id c195mr8670868ywa.412.1570731482895; 
 Thu, 10 Oct 2019 11:18:02 -0700 (PDT)
Received: from rosewood.cam.corp.google.com
 ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id p199sm1528659ywe.1.2019.10.10.11.18.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Oct 2019 11:18:02 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org
Date: Thu, 10 Oct 2019 14:17:44 -0400
Message-Id: <20191010181801.186069-1-sean@poorly.run>
X-Mailer: git-send-email 2.23.0.700.g56cf767bdb-goog
In-Reply-To: <CAKMK7uF2HsM5WrC5j_WNXWDjkXTyK5tP2DuoRt78FeaL5791QA@mail.gmail.com>
References: <CAKMK7uF2HsM5WrC5j_WNXWDjkXTyK5tP2DuoRt78FeaL5791QA@mail.gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=I3NYY2QPFYsrCHTKk5YmsfIPZArib3V6JUbjM+pfbtk=;
 b=Pm7yW+Mlg8HU+zV5SUUYNHDjOvAKZ1fA3D1kZr0I20jfIJ5rXh7hg2VRVeR2WCgKhK
 G9hQeneR5KwXOwrRSb2fEDoAc/etxWRvyhPanSJk4ZQCq81q3w9Z9IzZkroaMsQUSuIA
 z1PARH9axbw/cdU78pIIsPdYGYega3Pk5wL9PvDKdmsAaLDUlsw5K2wqs/6nmmRUHHe/
 K5Rhz+qsTQ0aaSqpIOLcDb0eBmZVleFf1fM2lTUMLSvg9L0gKIUYG5wJHoJEHW2KuQ/0
 c/Y1o2qcJUbkfglW/N/gh8a0tNdgCPY7soKbleJeRN/57kTiaPn/S7Chk6/SPV1Unn0X
 /+tg==
Subject: [Freedreno] [PATCH v2] drm/msm: Sanitize the modeset_is_locked
 checks in dpu
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
Cc: Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <seanpaul@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, Jeykumar Sankaran <jsanka@codeaurora.org>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

RnJvbTogU2VhbiBQYXVsIDxzZWFucGF1bEBjaHJvbWl1bS5vcmc+CgpBcyBEYW5pZWwgbWVudGlv
bnMgaW4gaGlzIGVtYWlsIFsxXSwgbm9uLWJsb2NraW5nIGNvbW1pdHMgZG9uJ3QgaG9sZCB0aGUK
bW9kZXNldCBsb2Nrcywgc28gd2UgY2FuIHNhZmVseSBhY2Nlc3Mgc3RhdGUgYXMgbG9uZyBhcyB0
aGVzZSBmdW5jdGlvbnMKYXJlIGluIHRoZSBjb21taXQgcGF0aC4gU28gcmVtb3ZlIHRoZSBXQVJO
X09OIGluIGRwdV9rbXNfZW5jb2Rlcl9lbmFibGUuCgpJbiBkcHVfY3J0Y19nZXRfaW50Zl9tb2Rl
LCB0aGluZ3MgYXJlIGEgYml0IG1vcmUgY29tcGxpY2F0ZWQuIFNvIGtlZXAKdGhlIFdBUk5fT04s
IGJ1dCBhZGQgYSBjb21tZW50IGV4cGxhaW5pbmcgdGhlIHNpdHVhdGlvbiBhbmQgaG9wZSBzb21l
b25lCmNvbWVzIGFsb25nIGFuZCBmaXhlcyB0aGUgaXNzdWUuCgpbMV0tIGh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL2FyY2hpdmVzL2RyaS1kZXZlbC8yMDE5LU9jdG9iZXIvMjM5NDQxLmh0
bWwKCkxpbmsgdG8gdjE6IGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9wYXRjaC9t
c2dpZC8yMDE5MTAxMDE1MTM1MS4xMjY3MzUtMS1zZWFuQHBvb3JseS5ydW4KCkNoYW5nZXMgaW4g
djI6Ci0gUmVzdG9yZWQgdGhlIFdBUk5fT04gaW4gZ2V0X2ludGZfbW9kZSBhbmQgYWRkZWQgYSBj
bGFyaWZ5aW5nIGNvbW1lbnQgKERhbmllbCkKCkZpeGVzOiAxZGZkYjBlMTA3ZGIgKCJkcm0vbXNt
OiBkcHU6IEFkZCBtb2Rlc2V0IGxvY2sgY2hlY2tzIHdoZXJlIGFwcGxpY2FibGUiKQpDYzogSmV5
a3VtYXIgU2Fua2FyYW4gPGpzYW5rYUBjb2RlYXVyb3JhLm9yZz4KQ2M6IFJvYiBDbGFyayA8cm9i
ZGNsYXJrQGNocm9taXVtLm9yZz4KU3VnZ2VzdGVkLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxA
ZmZ3bGwuY2g+ClBhcnRpYWxseS1SZXZpZXdlZC1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZl
dHRlckBmZndsbC5jaD4KU2lnbmVkLW9mZi1ieTogU2VhbiBQYXVsIDxzZWFucGF1bEBjaHJvbWl1
bS5vcmc+Ci0tLQogZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X2NydGMuYyB8IDkg
KysrKysrKysrCiBkcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvZHB1MS9kcHVfa21zLmMgIHwgMSAt
CiAyIGZpbGVzIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9kcHUxL2RwdV9jcnRjLmMgYi9kcml2ZXJz
L2dwdS9kcm0vbXNtL2Rpc3AvZHB1MS9kcHVfY3J0Yy5jCmluZGV4IDBiOWRjMDQyZDJlMjIuLmYx
OTdkY2U1NDU3NjEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9kcHUxL2Rw
dV9jcnRjLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X2NydGMuYwpA
QCAtMjcxLDYgKzI3MSwxNSBAQCBlbnVtIGRwdV9pbnRmX21vZGUgZHB1X2NydGNfZ2V0X2ludGZf
bW9kZShzdHJ1Y3QgZHJtX2NydGMgKmNydGMpCiAJCXJldHVybiBJTlRGX01PREVfTk9ORTsKIAl9
CiAKKwkvKgorCSAqIFRPRE86IFRoaXMgZnVuY3Rpb24gaXMgY2FsbGVkIGZyb20gZHB1IGRlYnVn
ZnMgYW5kIGFzIHBhcnQgb2YgYXRvbWljCisJICogY2hlY2suIFdoZW4gY2FsbGVkIGZyb20gZGVi
dWdmcywgdGhlIGNydGMtPm11dGV4IG11c3QgYmUgaGVsZCB0bworCSAqIHJlYWQgY3J0Yy0+c3Rh
dGUuIEhvd2V2ZXIgcmVhZGluZyBjcnRjLT5zdGF0ZSBmcm9tIGF0b21pYyBjaGVjayBpc24ndAor
CSAqIGFsbG93ZWQgKHVubGVzcyB5b3UgaGF2ZSBhIGdvb2QgcmVhc29uLCBhIGJpZyBjb21tZW50
LCBhbmQgYSBkZWVwCisJICogdW5kZXJzdGFuZGluZyBvZiBob3cgdGhlIGF0b21pYy9tb2Rlc2V0
IGxvY2tzIHdvcmsgKDwtIGFuZCB0aGlzIGlzCisJICogcHJvYmFibHkgbm90IHBvc3NpYmxlKSku
IFNvIHdlJ2xsIGtlZXAgdGhlIFdBUk5fT04gaGVyZSBmb3Igbm93LCBidXQKKwkgKiByZWFsbHkg
d2UgbmVlZCB0byBmaWd1cmUgb3V0IGEgYmV0dGVyIHdheSB0byB0cmFjayBvdXIgb3BlcmF0aW5n
IG1vZGUKKwkgKi8KIAlXQVJOX09OKCFkcm1fbW9kZXNldF9pc19sb2NrZWQoJmNydGMtPm11dGV4
KSk7CiAKIAkvKiBUT0RPOiBSZXR1cm5zIHRoZSBmaXJzdCBJTlRGX01PREUsIGNvdWxkIHRoZXJl
IGJlIG11bHRpcGxlIHZhbHVlcz8gKi8KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tc20v
ZGlzcC9kcHUxL2RwdV9rbXMuYyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9kcHUxL2RwdV9r
bXMuYwppbmRleCBiMTY0NWFkODNhMWUxLi42YzkyZjBmYmVhYzk4IDEwMDY0NAotLS0gYS9kcml2
ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvZHB1MS9kcHVfa21zLmMKKysrIGIvZHJpdmVycy9ncHUvZHJt
L21zbS9kaXNwL2RwdTEvZHB1X2ttcy5jCkBAIC0zMTYsNyArMzE2LDYgQEAgdm9pZCBkcHVfa21z
X2VuY29kZXJfZW5hYmxlKHN0cnVjdCBkcm1fZW5jb2RlciAqZW5jb2RlcikKIAlpZiAoZnVuY3Mg
JiYgZnVuY3MtPmNvbW1pdCkKIAkJZnVuY3MtPmNvbW1pdChlbmNvZGVyKTsKIAotCVdBUk5fT04o
IWRybV9tb2Rlc2V0X2lzX2xvY2tlZCgmZGV2LT5tb2RlX2NvbmZpZy5jb25uZWN0aW9uX211dGV4
KSk7CiAJZHJtX2Zvcl9lYWNoX2NydGMoY3J0YywgZGV2KSB7CiAJCWlmICghKGNydGMtPnN0YXRl
LT5lbmNvZGVyX21hc2sgJiBkcm1fZW5jb2Rlcl9tYXNrKGVuY29kZXIpKSkKIAkJCWNvbnRpbnVl
OwotLSAKU2VhbiBQYXVsLCBTb2Z0d2FyZSBFbmdpbmVlciwgR29vZ2xlIC8gQ2hyb21pdW0gT1MK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkZyZWVkcmVu
byBtYWlsaW5nIGxpc3QKRnJlZWRyZW5vQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ZyZWVkcmVubw==

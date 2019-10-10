Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 59031D2D5E
	for <lists+freedreno@lfdr.de>; Thu, 10 Oct 2019 17:13:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D52BB6EB6E;
	Thu, 10 Oct 2019 15:13:54 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-xc42.google.com (mail-yw1-xc42.google.com
 [IPv6:2607:f8b0:4864:20::c42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CDAF6EB68
 for <freedreno@lists.freedesktop.org>; Thu, 10 Oct 2019 15:13:53 +0000 (UTC)
Received: by mail-yw1-xc42.google.com with SMTP id x64so2297738ywg.3
 for <freedreno@lists.freedesktop.org>; Thu, 10 Oct 2019 08:13:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/ETAqkaGrUZ6wcJiRClzdVf0p22iN64aDCNAmSQb2kI=;
 b=S/Ylsbn5778QJQ6/qwMujXkS08EQWLEPg+g1hQo25NI334rooqmbuUBX2StKwnGUB8
 zLUY+y2jhkRHWno0ZfeT1BpuIcpf5959fecY+EfS08WubbtTsHX3zkygp36AfHiGLbN4
 4crMG0RgNoi9Gzv18MOdd1GZeutAWYLkNFIC2qJIB8ngblN7i1FTDOvJ/Bz71O81l/B+
 4Hdu82i8kDiVdQ/7+TUVlIRlewxhsCpucR42jAWgwegDqlsMOYvDuhjeqymmyNbm5SEZ
 BL6E2uicZ8oC59nNIELNVLpRl/Y/Kk5n1k2/YSLP0YhBVPr8KGs4k1OJHVNes6i4GaU/
 REFg==
X-Gm-Message-State: APjAAAX7BU9fRk59rTL6JPDS0OR3vtCt4lCbkPtWeldn3pBJ9QxoOfE2
 WAeE17g3++3NDkTuMxqoCccCmQ==
X-Google-Smtp-Source: APXvYqz6i78IG2fD7IiQje6iL9Cb+MroBUgJuXZPwgwWNAKs6ZG6tZzGdvSBvRsa17xsCnto2rm+VA==
X-Received: by 2002:a0d:eb01:: with SMTP id u1mr7890799ywe.116.1570720432646; 
 Thu, 10 Oct 2019 08:13:52 -0700 (PDT)
Received: from rosewood.cam.corp.google.com
 ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id l77sm1425220ywb.32.2019.10.10.08.13.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Oct 2019 08:13:52 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org
Date: Thu, 10 Oct 2019 11:13:21 -0400
Message-Id: <20191010151351.126735-1-sean@poorly.run>
X-Mailer: git-send-email 2.23.0.700.g56cf767bdb-goog
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/ETAqkaGrUZ6wcJiRClzdVf0p22iN64aDCNAmSQb2kI=;
 b=Dz8qx3cl6V8r5hcyRxz0ifUK4tg8h9IuwrTeWgWDOmpVOeWGYEJ7wa9PdxnX4Dh7AM
 ncXNWRlMWxinr0zh1dUv/gTHragMFEKu1nciild7GOesGLsf406xt94bqScfEvLHTjzi
 P9qTWKBYunU844KzFMIdkZL/CZ6OQ8UD76SnoC4Hq+M7WjGc9QqL9WwFkwGbIusvZmZH
 lzVTGz2n6zL/cO/DcyIYly1Tq2H0pY8j+3B40frwKZWGBKYORBW/Gt/aKZoZYKNT/77j
 rmUdrJfBhhH5SxkmNFVgRAmBsGRqcJmyqqdXRzkiHwy+pm00oGkZGwymIlmpCr5jlnUO
 SLLw==
Subject: [Freedreno] [PATCH] Revert "drm/msm: dpu: Add modeset lock checks
 where applicable"
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
Cc: Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org,
 Rob Clark <robdclark@gmail.com>, Sean Paul <seanpaul@chromium.org>,
 Daniel Vetter <daniel@ffwll.ch>, Jeykumar Sankaran <jsanka@codeaurora.org>,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

RnJvbTogU2VhbiBQYXVsIDxzZWFucGF1bEBjaHJvbWl1bS5vcmc+CgpUaGlzIHJldmVydHMgY29t
bWl0IDFkZmRiMGUxMDdkYmU2ZWJmZjNmNmJiYmU0YWFkMGI1YWE4N2JiYTQuCgpBcyBEYW5pZWwg
bWVudGlvbnMgaW4gaGlzIGVtYWlsIFsxXSwgbm9uLWJsb2NraW5nIGNvbW1pdHMgZG9uJ3QgaG9s
ZCB0aGUKbW9kZXNldCBsb2Nrcywgc28gd2UgY2FuIHNhZmVseSBhY2Nlc3Mgc3RhdGUgYXMgbG9u
ZyBhcyB0aGVzZSBmdW5jdGlvbnMKYXJlIGluIHRoZSBjb21taXQgcGF0aC4gSSdtIG5vdCBlbnRp
cmVseSBzdXJlIGlmIHRoZXNlIGhhdmUgYWx3YXlzIGJlZW4KaXNvbGF0ZWQgdG8gdGhlIGNvbW1p
dCBwYXRoLCBidXQgdGhleSBzZWVtIHRvIGJlIG5vdy4KClsxXS0gaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvYXJjaGl2ZXMvZHJpLWRldmVsLzIwMTktT2N0b2Jlci8yMzk0NDEuaHRtbAoK
Rml4ZXM6IDFkZmRiMGUxMDdkYiAoImRybS9tc206IGRwdTogQWRkIG1vZGVzZXQgbG9jayBjaGVj
a3Mgd2hlcmUgYXBwbGljYWJsZSIpCkNjOiBKZXlrdW1hciBTYW5rYXJhbiA8anNhbmthQGNvZGVh
dXJvcmEub3JnPgpDYzogUm9iIENsYXJrIDxyb2JkY2xhcmtAY2hyb21pdW0ub3JnPgpTdWdnZXN0
ZWQtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KU2lnbmVkLW9mZi1ieTogU2Vh
biBQYXVsIDxzZWFucGF1bEBjaHJvbWl1bS5vcmc+Ci0tLQogZHJpdmVycy9ncHUvZHJtL21zbS9k
aXNwL2RwdTEvZHB1X2NydGMuYyB8IDIgLS0KIGRyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9kcHUx
L2RwdV9rbXMuYyAgfCAxIC0KIDIgZmlsZXMgY2hhbmdlZCwgMyBkZWxldGlvbnMoLSkKCmRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvZHB1MS9kcHVfY3J0Yy5jIGIvZHJpdmVy
cy9ncHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X2NydGMuYwppbmRleCBkYjZjOWNjZjNiZTI2Li5j
NjQ1ZGQyMDEzNjhiIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvZHB1MS9k
cHVfY3J0Yy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9kcHUxL2RwdV9jcnRjLmMK
QEAgLTI4Miw4ICsyODIsNiBAQCBlbnVtIGRwdV9pbnRmX21vZGUgZHB1X2NydGNfZ2V0X2ludGZf
bW9kZShzdHJ1Y3QgZHJtX2NydGMgKmNydGMpCiAJCXJldHVybiBJTlRGX01PREVfTk9ORTsKIAl9
CiAKLQlXQVJOX09OKCFkcm1fbW9kZXNldF9pc19sb2NrZWQoJmNydGMtPm11dGV4KSk7Ci0KIAkv
KiBUT0RPOiBSZXR1cm5zIHRoZSBmaXJzdCBJTlRGX01PREUsIGNvdWxkIHRoZXJlIGJlIG11bHRp
cGxlIHZhbHVlcz8gKi8KIAlkcm1fZm9yX2VhY2hfZW5jb2Rlcl9tYXNrKGVuY29kZXIsIGNydGMt
PmRldiwgY3J0Yy0+c3RhdGUtPmVuY29kZXJfbWFzaykKIAkJcmV0dXJuIGRwdV9lbmNvZGVyX2dl
dF9pbnRmX21vZGUoZW5jb2Rlcik7CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rp
c3AvZHB1MS9kcHVfa21zLmMgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvZHB1MS9kcHVfa21z
LmMKaW5kZXggZTM5M2E0MjNkN2Q3YS4uMGU2OGUyMGQxOWM4NyAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X2ttcy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9t
c20vZGlzcC9kcHUxL2RwdV9rbXMuYwpAQCAtMzA1LDcgKzMwNSw2IEBAIHZvaWQgZHB1X2ttc19l
bmNvZGVyX2VuYWJsZShzdHJ1Y3QgZHJtX2VuY29kZXIgKmVuY29kZXIpCiAJaWYgKGZ1bmNzICYm
IGZ1bmNzLT5jb21taXQpCiAJCWZ1bmNzLT5jb21taXQoZW5jb2Rlcik7CiAKLQlXQVJOX09OKCFk
cm1fbW9kZXNldF9pc19sb2NrZWQoJmRldi0+bW9kZV9jb25maWcuY29ubmVjdGlvbl9tdXRleCkp
OwogCWRybV9mb3JfZWFjaF9jcnRjKGNydGMsIGRldikgewogCQlpZiAoIShjcnRjLT5zdGF0ZS0+
ZW5jb2Rlcl9tYXNrICYgZHJtX2VuY29kZXJfbWFzayhlbmNvZGVyKSkpCiAJCQljb250aW51ZTsK
LS0gClNlYW4gUGF1bCwgU29mdHdhcmUgRW5naW5lZXIsIEdvb2dsZSAvIENocm9taXVtIE9TCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpGcmVlZHJlbm8g
bWFpbGluZyBsaXN0CkZyZWVkcmVub0BsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9mcmVlZHJlbm8=

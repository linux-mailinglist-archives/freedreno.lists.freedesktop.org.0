Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 144B02C9F6
	for <lists+freedreno@lfdr.de>; Tue, 28 May 2019 17:13:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13213895B4;
	Tue, 28 May 2019 15:13:44 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-xc43.google.com (mail-yw1-xc43.google.com
 [IPv6:2607:f8b0:4864:20::c43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63DCC895B4
 for <freedreno@lists.freedesktop.org>; Tue, 28 May 2019 15:13:43 +0000 (UTC)
Received: by mail-yw1-xc43.google.com with SMTP id e68so8046756ywf.3
 for <freedreno@lists.freedesktop.org>; Tue, 28 May 2019 08:13:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=w3he60PeRSDt9ElFd+He/Tvuudq445P3hVqGQ2V87lo=;
 b=Hrk/p+fuYKuMPUN/tUII7nCUZ8vb84q8lgMFuqSKROMIPzy0DlQwJRyb9opHBGhsb0
 dIbgd3mPu5zunyKhr8f9sHx1SnTuy/ro27IcYu3i9QZJNiY3SkOzpoeKvRB3U5ffyquI
 +9gM6ENutEO6Zh8nR3WvyH98KN61hKp/BjEUTKJlGAEE1h/w/nk0IQh+Q9bunC52cCQc
 YPBv5LnVZwH4gF2pE28DojhvyPRYOn4o8EHaj1hP84tiiQQtf+P9x2qC1muFudip/pz8
 Wg72mSrzgSNpTZLL06Yh8M4HI9kzu7bf14XTDlmFyx6/zcTJ7QwUJLaVN/HWBNXHgG4u
 KrDg==
X-Gm-Message-State: APjAAAV76UQis2C+1gCZMguV/JdqGWwcBpbm/qcFZhzlqGzI0Ix2tz3m
 F6S1eOoUYy6/gVdVz/RgdrT4Cw==
X-Google-Smtp-Source: APXvYqyiOA+7OXMVX0rtwnER0dJIf62nXkL2sShVfKOobvZy4nFsmF2XFSTY1dhu8wS5LztzFf4R6A==
X-Received: by 2002:a81:2fca:: with SMTP id
 v193mr10170562ywv.296.1559056422487; 
 Tue, 28 May 2019 08:13:42 -0700 (PDT)
Received: from rosewood.cam.corp.google.com
 ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id 136sm869596ywu.53.2019.05.28.08.13.41
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 28 May 2019 08:13:41 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org
Date: Tue, 28 May 2019 11:13:39 -0400
Message-Id: <20190528151339.207978-1-sean@poorly.run>
X-Mailer: git-send-email 2.22.0.rc1.257.g3120a18244-goog
In-Reply-To: <5ce85778.1c69fb81.ccfd3.bac8@mx.google.com>
References: <5ce85778.1c69fb81.ccfd3.bac8@mx.google.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=w3he60PeRSDt9ElFd+He/Tvuudq445P3hVqGQ2V87lo=;
 b=IhmRmU/8g5t6Ek/54QV0E5Gqj0o27WWZHFRm8mzsa1t0nGlHH6z4mrZGWzMdJjiRjb
 Q5GATtw5zORXMA+dFR+g2T8invO1zejFOEkYm6ouJxw4SGrILidp6QCtjNUcJ/ZrCkDp
 I4ztmHcIBunUbVPyIujsCTLqFCzM3ybHhHgildrTDObkIGOvdQlX8dpjwghC6NfeU/sc
 H7+zZwQxh68pq30R/M9uCgNPbk1ajEcaYGxp9axUH2Jit/xkItXlyShGIYArflg4MZ9U
 e5gtFZXPb0q3HMJxkFhZfjc9XU7C+iKQBaO0Tm9dA2p8OReDUppjp4y0UaOZuK+7Tn2+
 ahgg==
Subject: [Freedreno] [PATCH v2] drm/msm/dpu: Use provided drm_minor to
 initialize debugfs
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
Cc: Rob Clark <robdclark@chromium.org>, Sean Paul <seanpaul@chromium.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>, Stephen Boyd <swboyd@chromium.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

RnJvbTogU2VhbiBQYXVsIDxzZWFucGF1bEBjaHJvbWl1bS5vcmc+CgpJbnN0ZWFkIG9mIHJlYWNo
aW5nIGludG8gZGV2LT5wcmltYXJ5IGZvciBkZWJ1Z2ZzX3Jvb3QsIHVzZSB0aGUgbWlub3IKcGFz
c2VkIGludG8gZGVidWdmc19pbml0LgoKVGhpcyBhdm9pZHMgY3JlYXRpbmcgYSBkZWJ1ZyBkaXJl
Y3RvcnkgdW5kZXIgL3N5cy9rZXJuZWwvZGVidWcvZGVidWcKYW5kIGluc3RlYWQgdXNlcyAvc3lz
L2tlcm5lbC9kZWJ1Zy9kcmkvPG5vZGU+LwoKU2luY2Ugd2UncmUgbm93IHB1dHRpbmcgZXZlcnl0
aGluZyB1bmRlciAqL2RyaS88bm9kZT4sIHRoZXJlJ3Mgbm8KbmVlZCB0byBjcmVhdGUgYSBkdXBs
aWNhdGUgImRlYnVnIiBkaXJlY3RvcnkuIEp1c3QgcHV0IGV2ZXJ5dGhpbmcgaW4KdGhlIHJvb3Qu
CgpDaGFuZ2VzIGluIHYyOgotIFJlbW92ZSB0aGUgdW5uZWNlc3NhcnkgImRlYnVnIiBkaXJlY3Rv
cnkgKFN0ZXBoZW4pCgpMaW5rIHRvIHYxOiBodHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5v
cmcvcGF0Y2gvbXNnaWQvMjAxOTA1MjQxNzMyMzEuNTA0MC0xLXNlYW5AcG9vcmx5LnJ1bgoKQ2M6
IFJvYiBDbGFyayA8cm9iZGNsYXJrQGNocm9taXVtLm9yZz4KUmVwb3J0ZWQtYnk6IFN0ZXBoZW4g
Qm95ZCA8c3dib3lkQGNocm9taXVtLm9yZz4KUmV2aWV3ZWQtYnk6IEFiaGluYXYgS3VtYXIgPGFi
aGluYXZrQGNvZGVhdXJvcmEub3JnPgpTaWduZWQtb2ZmLWJ5OiBTZWFuIFBhdWwgPHNlYW5wYXVs
QGNocm9taXVtLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvZHB1MS9kcHVfa21z
LmMgfCAxMCArKystLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCA3IGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9kcHUxL2Rw
dV9rbXMuYyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9kcHUxL2RwdV9rbXMuYwppbmRleCA4
ODViZjg4YWZhM2VjLi5hZDA5NDcwNDYxMGY5IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0v
bXNtL2Rpc3AvZHB1MS9kcHVfa21zLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL2Rw
dTEvZHB1X2ttcy5jCkBAIC0yMzEsMTggKzIzMSwxNCBAQCB2b2lkICpkcHVfZGVidWdmc19jcmVh
dGVfcmVnc2V0MzIoY29uc3QgY2hhciAqbmFtZSwgdW1vZGVfdCBtb2RlLAogCQkJcmVnc2V0LCAm
ZHB1X2ZvcHNfcmVnc2V0MzIpOwogfQogCi1zdGF0aWMgaW50IF9kcHVfZGVidWdmc19pbml0KHN0
cnVjdCBkcHVfa21zICpkcHVfa21zKQorc3RhdGljIGludCBfZHB1X2RlYnVnZnNfaW5pdChzdHJ1
Y3QgZHB1X2ttcyAqZHB1X2ttcywgc3RydWN0IGRybV9taW5vciAqbWlub3IpCiB7CiAJdm9pZCAq
cCA9IGRwdV9od191dGlsX2dldF9sb2dfbWFza19wdHIoKTsKLQlzdHJ1Y3QgZGVudHJ5ICplbnRy
eTsKKwlzdHJ1Y3QgZGVudHJ5ICplbnRyeSA9IG1pbm9yLT5kZWJ1Z2ZzX3Jvb3Q7CiAKIAlpZiAo
IXApCiAJCXJldHVybiAtRUlOVkFMOwogCi0JZW50cnkgPSBkZWJ1Z2ZzX2NyZWF0ZV9kaXIoImRl
YnVnIiwgZHB1X2ttcy0+ZGV2LT5wcmltYXJ5LT5kZWJ1Z2ZzX3Jvb3QpOwotCWlmIChJU19FUlJf
T1JfTlVMTChlbnRyeSkpCi0JCXJldHVybiAtRU5PREVWOwotCiAJLyogYWxsb3cgcm9vdCB0byBi
ZSBOVUxMICovCiAJZGVidWdmc19jcmVhdGVfeDMyKERQVV9ERUJVR0ZTX0hXTUFTS05BTUUsIDA2
MDAsIGVudHJ5LCBwKTsKIApAQCAtNTgxLDcgKzU3Nyw3IEBAIHN0YXRpYyBpbnQgX2RwdV9rbXNf
ZHJtX29ial9pbml0KHN0cnVjdCBkcHVfa21zICpkcHVfa21zKQogI2lmZGVmIENPTkZJR19ERUJV
R19GUwogc3RhdGljIGludCBkcHVfa21zX2RlYnVnZnNfaW5pdChzdHJ1Y3QgbXNtX2ttcyAqa21z
LCBzdHJ1Y3QgZHJtX21pbm9yICptaW5vcikKIHsKLQlyZXR1cm4gX2RwdV9kZWJ1Z2ZzX2luaXQo
dG9fZHB1X2ttcyhrbXMpKTsKKwlyZXR1cm4gX2RwdV9kZWJ1Z2ZzX2luaXQodG9fZHB1X2ttcyhr
bXMpLCBtaW5vcik7CiB9CiAjZW5kaWYKIAotLSAKU2VhbiBQYXVsLCBTb2Z0d2FyZSBFbmdpbmVl
ciwgR29vZ2xlIC8gQ2hyb21pdW0gT1MKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkZyZWVkcmVubyBtYWlsaW5nIGxpc3QKRnJlZWRyZW5vQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2ZyZWVkcmVubw==

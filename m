Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A7822CE66
	for <lists+freedreno@lfdr.de>; Tue, 28 May 2019 20:20:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A17B89007;
	Tue, 28 May 2019 18:20:30 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-xc43.google.com (mail-yw1-xc43.google.com
 [IPv6:2607:f8b0:4864:20::c43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E744C89FC0
 for <freedreno@lists.freedesktop.org>; Tue, 28 May 2019 18:20:28 +0000 (UTC)
Received: by mail-yw1-xc43.google.com with SMTP id t5so8279408ywf.10
 for <freedreno@lists.freedesktop.org>; Tue, 28 May 2019 11:20:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hAfYkP7d2WvxOZhRBCRJTvRlF3xI0tTIFNDwNnfuAj0=;
 b=cwicNdifWFNvOptQWT9006aFe00w7mBgtKtPHWQgy98i94Wk7rT5Oob/drVePhGKw8
 JzgPuTedlzUthgccCTf19gN5URyln0QGtHCs8Yk+JqG1Wr/Ty8FEYlaDAKYMykPMC1A/
 Js82hr8RIhHGlizOidg6WJBkPUJX7ssTPr/dmDYA8zoQAcggorqZv1HPh+OQac8JEAIu
 DXV2zilOdK8GYBFwwxX6MYQxP9OvGp/ETh8NzsaTAkG3zNeb1TNUgsRMZreUjWxXQ9MB
 GvXLhUbjjLspMspd4qtfENxoF+teFGAtPljiEB5hRYSGaEQvtwaH5AgaPLrFZGICxjSM
 wrrw==
X-Gm-Message-State: APjAAAVNZwrv8nDkPuyF5zWzQI3qPc/+se4hqLkrlT9GNj2qvhJ0U5Ga
 z5wOiM1sG0EBLu/lxIi1mytU/g==
X-Google-Smtp-Source: APXvYqwUsfLazM7BEkisBngaW/I05sfnDAWIIJL0Vzx/L8WKxqwvneq/w5ljZFczCxQdQccqOws/ow==
X-Received: by 2002:a81:2509:: with SMTP id l9mr58358293ywl.223.1559067628009; 
 Tue, 28 May 2019 11:20:28 -0700 (PDT)
Received: from rosewood.cam.corp.google.com
 ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id b1sm1113847ywa.70.2019.05.28.11.20.27
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 28 May 2019 11:20:27 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org
Date: Tue, 28 May 2019 14:20:10 -0400
Message-Id: <20190528182026.244751-1-sean@poorly.run>
X-Mailer: git-send-email 2.22.0.rc1.257.g3120a18244-goog
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hAfYkP7d2WvxOZhRBCRJTvRlF3xI0tTIFNDwNnfuAj0=;
 b=a0NY7VDvpEmMWaYG5YjSTHdlm8A5dz8YOT5/Xl9Ux5S6KbPv++phJXKQF8BvVN4gWD
 V0DBcUmq3FBXvTN8Mt3I2DTnvQOZXGI/z0DWr8qYOHrPPkKNiFxYequiXKor8A5/+EMf
 0oOgivtgIH2p4O//6kWq0JABwPVyU7qu4HrrMraxoJJ6HBD/hL9ir0Ahq9OHkHduN92m
 C+tsy4+c0xnlQkCcwOimJ/v5wbY8Xaco9PAdQ87wWEn/455XsCQ8CF4NH+ZY/TiZU9aQ
 SX1Qz0G9hGfWwabmpms6yvliBLge0mMgzzWhmbraS1/wQkbvb0bty6in5XUSoGJ+9mi/
 /ipA==
Subject: [Freedreno] [PATCH] drm/msm/dpu: Fix mmu init/destroy functions
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
Cc: Sean Paul <sean@poorly.run>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <seanpaul@chromium.org>, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

RnJvbTogU2VhbiBQYXVsIDxzZWFucGF1bEBjaHJvbWl1bS5vcmc+CgpUaGVyZSdzIGEgY29tbWVu
dCBpbiBfZHB1X2ttc19od19kZXN0cm95KCkgdGhhdCByZWFkcyAic2FmZSB0byBjYWxsCnRoZXNl
IG1vcmUgdGhhbiBvbmNlIGR1cmluZyBzaHV0ZG93biIsIHJlZmVycmluZyB0bwpfZHB1X2ttc19t
bXVfZGVzdHJveSgpLiBVbmZvcnR1bmF0ZWx5IHRoYXQncyBub3QgdGhlIGNhc2UsIG1tdV9kZXN0
cm95CndpbGwgZmFpbCBoYXJkIGlmIGl0J3MgY2FsbGVkIHR3aWNlLiBTbyBmaXggdGhhdCBmdW5j
dGlvbiB0byBlbnN1cmUgaXQKY2FuIGJlIGNhbGxlZCBtdWx0aXBsZSB0aW1lcyB3aXRob3V0IGJ1
cm5pbmcuCgpXaGlsZSBJJ20gYXQgaXQsIGZpeCB0aGUgZXJyb3IgcGF0aHMgaW4gX2RwdV9rbXNf
bW11X2luaXQoKSB0byBwcm9wZXJseQpjbGVhbiB1cCB0aGUgaW9tbXUgZG9tYWluIGFuZCBub3Qg
Y2FsbCBfZHB1X2ttc19tbXVfZGVzdHJveSgpIHdoZW4KdGhpbmdzIGFyZSBvbmx5IHBhcnRpYWxs
eSBzZXR1cC4KClNpZ25lZC1vZmYtYnk6IFNlYW4gUGF1bCA8c2VhbnBhdWxAY2hyb21pdW0ub3Jn
PgotLS0KIGRyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9kcHUxL2RwdV9rbXMuYyB8IDE3ICsrKysr
KysrLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCA5IGRlbGV0aW9u
cygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9kcHUxL2RwdV9rbXMu
YyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9kcHUxL2RwdV9rbXMuYwppbmRleCA4ODViZjg4
YWZhM2UuLmQ1MGFmYmIzN2EwYSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL21zbS9kaXNw
L2RwdTEvZHB1X2ttcy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9kcHUxL2RwdV9r
bXMuYwpAQCAtNzI5LDEyICs3MjksMTYgQEAgc3RhdGljIGludCBfZHB1X2ttc19tbXVfZGVzdHJv
eShzdHJ1Y3QgZHB1X2ttcyAqZHB1X2ttcykKIHsKIAlzdHJ1Y3QgbXNtX21tdSAqbW11OwogCisJ
aWYgKCFkcHVfa21zLT5iYXNlLmFzcGFjZSkKKwkJcmV0dXJuIDA7CisKIAltbXUgPSBkcHVfa21z
LT5iYXNlLmFzcGFjZS0+bW11OwogCiAJbW11LT5mdW5jcy0+ZGV0YWNoKG1tdSwgKGNvbnN0IGNo
YXIgKiopaW9tbXVfcG9ydHMsCiAJCQlBUlJBWV9TSVpFKGlvbW11X3BvcnRzKSk7CiAJbXNtX2dl
bV9hZGRyZXNzX3NwYWNlX3B1dChkcHVfa21zLT5iYXNlLmFzcGFjZSk7CiAKKwlkcHVfa21zLT5i
YXNlLmFzcGFjZSA9IE5VTEw7CiAJcmV0dXJuIDA7CiB9CiAKQEAgLTc1NCwyNSArNzU4LDIwIEBA
IHN0YXRpYyBpbnQgX2RwdV9rbXNfbW11X2luaXQoc3RydWN0IGRwdV9rbXMgKmRwdV9rbXMpCiAJ
YXNwYWNlID0gbXNtX2dlbV9hZGRyZXNzX3NwYWNlX2NyZWF0ZShkcHVfa21zLT5kZXYtPmRldiwK
IAkJCWRvbWFpbiwgImRwdTEiKTsKIAlpZiAoSVNfRVJSKGFzcGFjZSkpIHsKLQkJcmV0ID0gUFRS
X0VSUihhc3BhY2UpOwotCQlnb3RvIGZhaWw7CisJCWlvbW11X2RvbWFpbl9mcmVlKGRvbWFpbik7
CisJCXJldHVybiBQVFJfRVJSKGFzcGFjZSk7CiAJfQogCi0JZHB1X2ttcy0+YmFzZS5hc3BhY2Ug
PSBhc3BhY2U7Ci0KIAlyZXQgPSBhc3BhY2UtPm1tdS0+ZnVuY3MtPmF0dGFjaChhc3BhY2UtPm1t
dSwgaW9tbXVfcG9ydHMsCiAJCQlBUlJBWV9TSVpFKGlvbW11X3BvcnRzKSk7CiAJaWYgKHJldCkg
ewogCQlEUFVfRVJST1IoImZhaWxlZCB0byBhdHRhY2ggaW9tbXUgJWRcbiIsIHJldCk7CiAJCW1z
bV9nZW1fYWRkcmVzc19zcGFjZV9wdXQoYXNwYWNlKTsKLQkJZ290byBmYWlsOworCQlyZXR1cm4g
cmV0OwogCX0KIAorCWRwdV9rbXMtPmJhc2UuYXNwYWNlID0gYXNwYWNlOwogCXJldHVybiAwOwot
ZmFpbDoKLQlfZHB1X2ttc19tbXVfZGVzdHJveShkcHVfa21zKTsKLQotCXJldHVybiByZXQ7CiB9
CiAKIHN0YXRpYyBzdHJ1Y3QgZHNzX2NsayAqX2RwdV9rbXNfZ2V0X2NsayhzdHJ1Y3QgZHB1X2tt
cyAqZHB1X2ttcywKLS0gClNlYW4gUGF1bCwgU29mdHdhcmUgRW5naW5lZXIsIEdvb2dsZSAvIENo
cm9taXVtIE9TCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpGcmVlZHJlbm8gbWFpbGluZyBsaXN0CkZyZWVkcmVub0BsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9mcmVlZHJlbm8=

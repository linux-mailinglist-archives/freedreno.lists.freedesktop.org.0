Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19EAD5AB3C
	for <lists+freedreno@lfdr.de>; Sat, 29 Jun 2019 15:02:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 263F36E9AE;
	Sat, 29 Jun 2019 13:02:11 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7FF56E9AB
 for <freedreno@lists.freedesktop.org>; Sat, 29 Jun 2019 13:02:09 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id p24so5756583lfo.6
 for <freedreno@lists.freedesktop.org>; Sat, 29 Jun 2019 06:02:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gUhHBzqpeqf9laCyRDqe0YTreYPsBAWIdDU1MBCLr1k=;
 b=bmIq6/H4/DOcmv1WzZVbz4jfSfqpYB+QRa9/13mNCJ8QchXXoMMLcUpip1/3OiiFCK
 HNoZljQmojma95voMU4iYi4ZfkPUUYGlYqQQLeNwmFDp8hnMCCJ1juW2Eb1Z/K71+vd9
 mGpLTcHfUPmf0KCcB9cw8ZET+hwkl4eGKqSWTlg0cohvyNWBkwLIYvajE+FB/f/7wAfj
 c0bWlY7J3+uq9unZla+OTAOfzyY0GrKSLugu+XY5PoKcDO+DAdUxkQekAYjVmw5mtbzv
 hPf2hbBmPD70C50xIFOVKwyggb/aOx65VEGyTtUeyuuJZhd/wvHJHM8Sby2Fgz069KUz
 dPtQ==
X-Gm-Message-State: APjAAAWFmtbRtkPhZlyAN6QVJX4i0Za+fVo/7SRlFhCe8ejwOwX6fHIT
 O2/MuPa+WmQL0rte6BLJgA5W8A==
X-Google-Smtp-Source: APXvYqwiKTo2KmlXB88B2iDxqXfGg+cPGIjxT3oac4t0Fb8IeqR1+G3z9dw+lnnW3Vr5Kl66Lss03g==
X-Received: by 2002:ac2:4891:: with SMTP id x17mr7657045lfc.60.1561813328311; 
 Sat, 29 Jun 2019 06:02:08 -0700 (PDT)
Received: from localhost.localdomain
 (c-22cd225c.014-348-6c756e10.bbcust.telenor.se. [92.34.205.34])
 by smtp.gmail.com with ESMTPSA id v2sm1354500lfi.52.2019.06.29.06.02.07
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sat, 29 Jun 2019 06:02:07 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
To: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>
Date: Sat, 29 Jun 2019 14:59:33 +0200
Message-Id: <20190629125933.679-7-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190629125933.679-1-linus.walleij@linaro.org>
References: <20190629125933.679-1-linus.walleij@linaro.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gUhHBzqpeqf9laCyRDqe0YTreYPsBAWIdDU1MBCLr1k=;
 b=BYavBGMBtik6r+A9tFdwUyOfHqHK+Yl4c7/OJSbz75XF2NUDjc4Jw7+6wvc3ssAnDF
 9sq25tD60Ch3GCG0hM/5PRkqSgHcW/LYOm35ZiNdaPczwua7xlkaQTtJrqZOM9Tpv2HK
 ZvXChwFa1/VVDUg/f4Nyh3tUquPVnrg2zNpac70vRhAUi7CZ8hpGVSeRuy+q36Hhso+h
 Ks17fIaZ1Z+66/HbPp9dwbic5x4vw3gyVfV98DTntLs57UNkVYUKwuust+xKTjaLKoct
 7zQUCFkufCWR85bg3HzsRWlJ42Nostw2IEcGdvH3kk5vn0kj3ZdmlMrn0Ij8qrwefETN
 THcA==
Subject: [Freedreno] [PATCH 7/7] RFT: drm/msm/hdmi: Do not initialize HPD
 line value
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
Cc: linux-arm-msm@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>,
 freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

QWZ0ZXIgdW50YW5nbGluZyB0aGUgTVNNIEhETUkgR1BJTyBjb2RlIHdlIHNlZSB0aGF0IHRoZSBj
b2RlCmlzIGRlbGliZXJhdGVseSBzZXR0aW5nIHRoZSBvdXRwdXQgdmFsdWUgb2YgdGhlIEhQRCAo
aG90IHBsdWcKZGV0ZWN0KSBsaW5lIHRvIGhpZ2gsIGV2ZW4gdGhvdWdoIGl0IGlzIGJlaW5nIHVz
ZWQgYXMgaW5wdXQKd2hpY2ggaXMgb2YgY291cnNlIHRoZSBvbmx5IHZpYWJsZSB1c2Ugb2YgYSBI
UEQgcGluLgoKVGhpcyBzZWVtcyBkdWJpb3VzOiBHUElPIGxpbmVzIHNldCB1cCBhcyBpbnB1dCB3
aWxsIGhhdmUgaGlnaAppbXBlZGFuY2UgKHRyaXN0YXRlKSBhbmQgdGhlIHR5cGljYWwgZWxlY3Ry
b25pYyBjb25zdHJ1Y3Rpb24KaW52b2x2ZXMgdGhpcyBsaW5lIGJlaW5nIHVzZWQgd2l0aCBhIHB1
bGwtZG93biByZXNpc3RvciBhcm91bmQKMTBLT2htIHRvIGtlZXAgaXQgbG93ICh0aGlzIGlzIHNv
bWV0aW1lcyBwYXJ0IG9mIGEgbGV2ZWxzaGlmdGVyCmNvbXBvbmVudCkgYW5kIHRoZW4gYW4gaW5z
ZXJ0ZWQgY29ubmVjdG9yIHdpbGwgcHVsbCBpdCB1cCB0bwpWREQgYW5kIHRoaXMgYXNzZXJ0cyB0
aGUgSFBEIHNpZ25hbCwgYXMgY2FuIGJlIHNlZW4gZnJvbSB0aGUKY29kZSByZWFkaW5nIHRoZSBI
UEQgR1BJTy4KClN0b3AgdHJ5IGRyaXZpbmcgYSB2YWx1ZSB0byB0aGUgSFBEIGlucHV0IEdQSU8u
CgpDYzogUm9iIENsYXJrIDxyb2JkY2xhcmtAZ21haWwuY29tPgpDYzogU2VhbiBQYXVsIDxzZWFu
QHBvb3JseS5ydW4+CkNjOiBsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZwpDYzogZnJlZWRy
ZW5vQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpTaWduZWQtb2ZmLWJ5OiBMaW51cyBXYWxsZWlqIDxs
aW51cy53YWxsZWlqQGxpbmFyby5vcmc+Ci0tLQogZHJpdmVycy9ncHUvZHJtL21zbS9oZG1pL2hk
bWlfY29ubmVjdG9yLmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEg
ZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2hkbWkvaGRtaV9j
b25uZWN0b3IuYyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vaGRtaS9oZG1pX2Nvbm5lY3Rvci5jCmlu
ZGV4IDg5YzY0Y2M4NTAyNy4uZWNiY2Q4NjM4YjY2IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9k
cm0vbXNtL2hkbWkvaGRtaV9jb25uZWN0b3IuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL2hk
bWkvaGRtaV9jb25uZWN0b3IuYwpAQCAtODcsNyArODcsNyBAQCBzdGF0aWMgaW50IGdwaW9fY29u
ZmlnKHN0cnVjdCBoZG1pICpoZG1pLCBib29sIG9uKQogCQkJc3RydWN0IGhkbWlfZ3Bpb19kYXRh
IGdwaW8gPSBjb25maWctPmdwaW9zW2ldOwogCiAJCQkvKiBUaGUgdmFsdWUgaW5kaWNhdGVzIHRo
ZSB2YWx1ZSBmb3IgdHVybmluZyB0aGluZ3Mgb24gKi8KLQkJCWlmIChncGlvLmdwaW9kKQorCQkJ
aWYgKGdwaW8uZ3Bpb2QgJiYgZ3Bpby5vdXRwdXQpCiAJCQkJZ3Bpb2Rfc2V0X3ZhbHVlX2NhbnNs
ZWVwKGdwaW8uZ3Bpb2QsIGdwaW8udmFsdWUpOwogCQl9CiAKLS0gCjIuMjAuMQoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KRnJlZWRyZW5vIG1haWxpbmcg
bGlzdApGcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZnJlZWRyZW5v

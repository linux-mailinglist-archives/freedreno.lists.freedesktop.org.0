Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AA7F5398CE3
	for <lists+freedreno@lfdr.de>; Wed,  2 Jun 2021 16:33:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80A6D6ECC4;
	Wed,  2 Jun 2021 14:33:26 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 912CE6ECBE
 for <freedreno@lists.freedesktop.org>; Wed,  2 Jun 2021 14:33:24 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id n4so2556067wrw.3
 for <freedreno@lists.freedesktop.org>; Wed, 02 Jun 2021 07:33:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=d0nOIc1mzt8v7aTq8P9bTAYTfjAP1Kn9fRgBobUfORA=;
 b=tSzVDkn4KcWdhzDzNsZip5cu2zKF7f0SGaGpOeWTuwCH+0fxCugizjmJtvChNK7t+V
 mpDrlynprH5KJmIgn42ZQ/o5zYEvQ4vWLMnvKG8Ed2o7L7HWVaFJG8hn368YWJ1nd2LW
 4c746lB6R99b2g91Dwsihqjq/phbUmYHQmENAbEMiWVDBCMX5qsuKWp4lY775RukY5Di
 uubL1YluRv3Cs1hoU2hG30XhYEZtvTNlISLKXEeHvgS3XyefTL9FQKHXjDCT7eCskiWG
 9o1d7XI5noxEdG5lRVRx1J+GyQyt0ikUWamSHmpNQxwryL3VHl6CqkIFjXJbXNLc7HxC
 kqLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=d0nOIc1mzt8v7aTq8P9bTAYTfjAP1Kn9fRgBobUfORA=;
 b=l1Pi1fUEYkW12j8mLQSiXIEc+kub3HXjtu8EZQpiVNHhHiHCNQPNZZLlYk2o33ZMjn
 +iXfj29G8a1i34eUyc5NmGXYMFAkBq5pPvNT11eZNi5PZIF+zR1YW0lXW8kz9YAbGzfw
 tujBy7xRt5nagcHx9t5q4Bpe4XtFaA3YwnnbBxawC1YZU9B+9Fw+WvpcYgT2S2KjhEsN
 oUA+zR3PLoO6G1O5/96lb9SQQN1Nr3GFrg1VEdEXsCyFy0h5ugtSqCcGqYciBjcG1edD
 8vwz/8jo9vrkVuFgk8itwCCUcSv4/kEcMGtWyuTiZ66SmleOacm3ZgDhSDFeAzXzk3S9
 /+lw==
X-Gm-Message-State: AOAM533HZMQwX32uPhIDRywYfyePuEd6O/KTvXS6IQ/RIEt9d+RKs1op
 dyuiQj4rm8sZE4l7YhgjX3t/HA==
X-Google-Smtp-Source: ABdhPJyuJWVPFCq8ke4Ux8r5rzSxfpfkMshp25BkWH+joTfvu5tLeJqfuuvJvUX1vOUfItFxxByl1Q==
X-Received: by 2002:adf:ef06:: with SMTP id e6mr22764784wro.393.1622644403125; 
 Wed, 02 Jun 2021 07:33:23 -0700 (PDT)
Received: from dell.default ([91.110.221.214])
 by smtp.gmail.com with ESMTPSA id o11sm132315wrq.93.2021.06.02.07.33.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jun 2021 07:33:22 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Date: Wed,  2 Jun 2021 15:32:46 +0100
Message-Id: <20210602143300.2330146-13-lee.jones@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210602143300.2330146-1-lee.jones@linaro.org>
References: <20210602143300.2330146-1-lee.jones@linaro.org>
MIME-Version: 1.0
Subject: [Freedreno] [RESEND 12/26] drm/msm/msm_gem: Demote kernel-doc abuses
X-BeenThere: freedreno@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linaro-mm-sig@lists.linaro.org, Rob Clark <robdclark@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Sean Paul <sean@poorly.run>,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL21zbS9tc21fZ2VtLmM6MzY0OiB3YXJuaW5nOiBUaGlzIGNvbW1lbnQgc3RhcnRz
IHdpdGggJy8qKicsIGJ1dCBpc24ndCBhIGtlcm5lbC1kb2MgY29tbWVudC4gUmVmZXIgRG9jdW1l
bnRhdGlvbi9kb2MtZ3VpZGUva2VybmVsLWRvYy5yc3QKIGRyaXZlcnMvZ3B1L2RybS9tc20vbXNt
X2dlbS5jOjc2Mzogd2FybmluZzogVGhpcyBjb21tZW50IHN0YXJ0cyB3aXRoICcvKionLCBidXQg
aXNuJ3QgYSBrZXJuZWwtZG9jIGNvbW1lbnQuIFJlZmVyIERvY3VtZW50YXRpb24vZG9jLWd1aWRl
L2tlcm5lbC1kb2MucnN0CgpDYzogUm9iIENsYXJrIDxyb2JkY2xhcmtAZ21haWwuY29tPgpDYzog
U2VhbiBQYXVsIDxzZWFuQHBvb3JseS5ydW4+CkNjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGlu
dXguaWU+CkNjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+CkNjOiBTdW1pdCBTZW13
YWwgPHN1bWl0LnNlbXdhbEBsaW5hcm8ub3JnPgpDYzogIkNocmlzdGlhbiBLw7ZuaWciIDxjaHJp
c3RpYW4ua29lbmlnQGFtZC5jb20+CkNjOiBsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZwpD
YzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpDYzogZnJlZWRyZW5vQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpDYzogbGludXgtbWVkaWFAdmdlci5rZXJuZWwub3JnCkNjOiBsaW5hcm8t
bW0tc2lnQGxpc3RzLmxpbmFyby5vcmcKU2lnbmVkLW9mZi1ieTogTGVlIEpvbmVzIDxsZWUuam9u
ZXNAbGluYXJvLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vbXNtL21zbV9nZW0uYyB8IDQgKyst
LQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbXNtL21zbV9nZW0uYyBiL2RyaXZlcnMvZ3B1L2RybS9t
c20vbXNtX2dlbS5jCmluZGV4IDU2ZGY4NmU1Zjc0MDAuLjE1NDM0ZGViMTkzMzQgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9tc20vbXNtX2dlbS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9t
c20vbXNtX2dlbS5jCkBAIC0zNzIsNyArMzcyLDcgQEAgc3RhdGljIHZvaWQgZGVsX3ZtYShzdHJ1
Y3QgbXNtX2dlbV92bWEgKnZtYSkKIAlrZnJlZSh2bWEpOwogfQogCi0vKioKKy8qCiAgKiBJZiBj
bG9zZSBpcyB0cnVlLCB0aGlzIGFsc28gY2xvc2VzIHRoZSBWTUEgKHJlbGVhc2luZyB0aGUgYWxs
b2NhdGVkCiAgKiBpb3ZhIHJhbmdlKSBpbiBhZGRpdGlvbiB0byByZW1vdmluZyB0aGUgaW9tbXUg
bWFwcGluZy4gIEluIHRoZSBldmljdGlvbgogICogY2FzZSAoIWNsb3NlKSwgd2Uga2VlcCB0aGUg
aW92YSBhbGxvY2F0ZWQsIGJ1dCBvbmx5IHJlbW92ZSB0aGUgaW9tbXUKQEAgLTc3Myw3ICs3NzMs
NyBAQCB2b2lkIG1zbV9nZW1fcHVyZ2Uoc3RydWN0IGRybV9nZW1fb2JqZWN0ICpvYmopCiAJCQkw
LCAobG9mZl90KS0xKTsKIH0KIAotLyoqCisvKgogICogVW5waW4gdGhlIGJhY2tpbmcgcGFnZXMg
YW5kIG1ha2UgdGhlbSBhdmFpbGFibGUgdG8gYmUgc3dhcHBlZCBvdXQuCiAgKi8KIHZvaWQgbXNt
X2dlbV9ldmljdChzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKm9iaikKLS0gCjIuMzEuMQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KRnJlZWRyZW5vIG1haWxp
bmcgbGlzdApGcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZnJlZWRyZW5vCg==

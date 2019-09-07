Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 142F0AC87B
	for <lists+freedreno@lfdr.de>; Sat,  7 Sep 2019 19:50:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9BE5899EA;
	Sat,  7 Sep 2019 17:50:23 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2952899EA
 for <freedreno@lists.freedesktop.org>; Sat,  7 Sep 2019 17:50:22 +0000 (UTC)
Received: by mail-pg1-x544.google.com with SMTP id u72so5325319pgb.10
 for <freedreno@lists.freedesktop.org>; Sat, 07 Sep 2019 10:50:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wK8kJ2udIf0g3BsyoIaHFt8dADR/WXvxfITihNsDeFg=;
 b=VMtScnQ0rnTBp6w0wykNnc7dqtaXlIoQ/1P5jYBjBHk2YVqcXVm5pjv8miIx+GAMYS
 6UAXXE35njlAIckZ8TTEFg6UD5MpSp+s7p6Xb3ltJIxOw509jkOuv6L8kYa57HI5XeUA
 5x4DvBWT+dq7tjF1agMxBjdSj6p7nb4Bf5b0u9VjiCy2VP6DDnD5OQtECGtmYBqEWa9b
 HopFpmS60Sv1d4UN/PLvUkkcBOy9zi702Ef8PNrac5Y2Dc9HXuhoU4oiaoISwOVDMOae
 bCm0HTU7JmxHcewsz3IhSUx9e6xuduaAHX41IsiR4q/vt9NhQqva7VA0q8O7XkSAbL1E
 7YuQ==
X-Gm-Message-State: APjAAAUpgyIToKcXGBjtaXvG+fzRlYoPHzLw/uLjQtKWrKxCnDyRLE1X
 S+q7z3osOWc7Vq/oyOaUqGo=
X-Google-Smtp-Source: APXvYqzafbPVLonS9mDnmRUFSlGT5UrLrAnZgt7eKA+ZXKBawYn/MhQ8WUF6BIH88qCUmZL2MEVRGA==
X-Received: by 2002:a65:6795:: with SMTP id e21mr13501884pgr.428.1567878622201; 
 Sat, 07 Sep 2019 10:50:22 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:e554::8610])
 by smtp.gmail.com with ESMTPSA id 11sm8401943pgo.43.2019.09.07.10.50.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Sep 2019 10:50:21 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: iommu@lists.linux-foundation.org
Date: Sat,  7 Sep 2019 10:50:13 -0700
Message-Id: <20190907175013.24246-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wK8kJ2udIf0g3BsyoIaHFt8dADR/WXvxfITihNsDeFg=;
 b=Gwsp7VRn4r5cDdw7eygkYZ/sszfgRBn/LNffK8rKLuU3OXDMBJBQUafVm/8/Ym6kxl
 K6awj9C0Ux8gpf0vABsHPwAIKvMSSj1HLTzzX71l0KzyvaROHC2yWEmvxZUqIwm2nmrV
 lmAcCTAPwuKZNItjsz1tvAaLHs33eilTvmINw0ZqMFmLGcHNMeEFjmq9aeDH8XSCV7Je
 T+U7wuABMQprBiDBJ/RIg7QDfuYLkWl0B7++OvQOJnlTCNrryYx3AgCOz1cGCJhWOuVk
 XyZoKGE/8NngV3NN1lmVf04Gjw36Ts1U5JbkQX6QXEPMa5FYJCQ1regZqneDUa94+wOD
 YkPg==
Subject: [Freedreno] [PATCH] iommu/arm-smmu: fix "hang" when games exit
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
Cc: Rob Clark <robdclark@chromium.org>, Will Deacon <will@kernel.org>,
 linux-arm-msm@vger.kernel.org, Joerg Roedel <joro@8bytes.org>,
 Robin Murphy <robin.murphy@arm.com>, open list <linux-kernel@vger.kernel.org>,
 freedreno@lists.freedesktop.org,
 "moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

RnJvbTogUm9iIENsYXJrIDxyb2JkY2xhcmtAY2hyb21pdW0ub3JnPgoKV2hlbiBnYW1lcywgYnJv
d3Nlciwgb3IgYW55dGhpbmcgdXNpbmcgYSBsb3Qgb2YgR1BVIGJ1ZmZlcnMgZXhpdHMsIHRoZXJl
CmNhbiBiZSBtYW55IGh1bmRyZWRzIG9yIHRob3VzYW5kcyBvZiBidWZmZXJzIHRvIHVubWFwIGFu
ZCBmcmVlLiAgSWYgdGhlCkdQVSBpcyBvdGhlcndpc2Ugc3VzcGVuZGVkLCB0aGlzIGNhbiBjYXVz
ZSBhcm0tc21tdSB0byByZXN1bWUvc3VzcGVuZApmb3IgZWFjaCBidWZmZXIsIHJlc3VsdGluZyA1
LTEwIHNlY29uZHMgd29ydGggb2YgcmVwcm9ncmFtbWluZyB0aGUKY29udGV4dCBiYW5rIChhcm1f
c21tdV93cml0ZV9jb250ZXh0X2JhbmsoKS9hcm1fc21tdV93cml0ZV9zMmNyKCkvZXRjKS4KVG8g
dGhlIHVzZXIgaXQgd291bGQgYXBwZWFyIHRoYXQgdGhlIHN5c3RlbSBpcyBsb2NrZWQgdXAuCgpB
IHNpbXBsZSBzb2x1dGlvbiBpcyB0byB1c2UgcG1fcnVudGltZV9wdXRfYXV0b3N1c3BlbmQoKSBp
bnN0ZWFkLCBzbyB3ZQpkb24ndCBpbW1lZGlhdGVseSBzdXNwZW5kIHRoZSBTTU1VIGRldmljZS4K
ClNpZ25lZC1vZmYtYnk6IFJvYiBDbGFyayA8cm9iZGNsYXJrQGNocm9taXVtLm9yZz4KLS0tCk5v
dGU6IEkndmUgdGllZCB0aGUgYXV0b3N1c3BlbmQgZW5hYmxlL2RlbGF5IHRvIHRoZSBjb25zdW1l
ciBkZXZpY2UsCmJhc2VkIG9uIHRoZSByZWFzb25pbmcgdGhhdCBpZiB0aGUgY29uc3VtZXIgZGV2
aWNlIGJlbmVmaXRzIGZyb20gdXNpbmcKYW4gYXV0b3N1c3BlbmQgZGVsYXksIHRoZW4gaXQncyBj
b3JyZXNwb25kaW5nIFNNTVUgcHJvYmFibHkgZG9lcyB0b28uCk1heWJlIHRoYXQgaXMgb3Zlcmtp
bGwgYW5kIHdlIHNob3VsZCBqdXN0IHVuY29uZGl0aW9uYWxseSBlbmFibGUKYXV0b3N1c3BlbmQu
CgogZHJpdmVycy9pb21tdS9hcm0tc21tdS5jIHwgMTEgKysrKysrKysrKy0KIDEgZmlsZSBjaGFu
Z2VkLCAxMCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9pb21tdS9hcm0tc21tdS5jIGIvZHJpdmVycy9pb21tdS9hcm0tc21tdS5jCmluZGV4IGMyNzMz
YjQ0N2Q5Yy4uNzNhMGRkNTNjOGEzIDEwMDY0NAotLS0gYS9kcml2ZXJzL2lvbW11L2FybS1zbW11
LmMKKysrIGIvZHJpdmVycy9pb21tdS9hcm0tc21tdS5jCkBAIC0yODksNyArMjg5LDcgQEAgc3Rh
dGljIGlubGluZSBpbnQgYXJtX3NtbXVfcnBtX2dldChzdHJ1Y3QgYXJtX3NtbXVfZGV2aWNlICpz
bW11KQogc3RhdGljIGlubGluZSB2b2lkIGFybV9zbW11X3JwbV9wdXQoc3RydWN0IGFybV9zbW11
X2RldmljZSAqc21tdSkKIHsKIAlpZiAocG1fcnVudGltZV9lbmFibGVkKHNtbXUtPmRldikpCi0J
CXBtX3J1bnRpbWVfcHV0KHNtbXUtPmRldik7CisJCXBtX3J1bnRpbWVfcHV0X2F1dG9zdXNwZW5k
KHNtbXUtPmRldik7CiB9CiAKIHN0YXRpYyBzdHJ1Y3QgYXJtX3NtbXVfZG9tYWluICp0b19zbW11
X2RvbWFpbihzdHJ1Y3QgaW9tbXVfZG9tYWluICpkb20pCkBAIC0xNDQ1LDYgKzE0NDUsMTUgQEAg
c3RhdGljIGludCBhcm1fc21tdV9hdHRhY2hfZGV2KHN0cnVjdCBpb21tdV9kb21haW4gKmRvbWFp
biwgc3RydWN0IGRldmljZSAqZGV2KQogCS8qIExvb2tzIG9rLCBzbyBhZGQgdGhlIGRldmljZSB0
byB0aGUgZG9tYWluICovCiAJcmV0ID0gYXJtX3NtbXVfZG9tYWluX2FkZF9tYXN0ZXIoc21tdV9k
b21haW4sIGZ3c3BlYyk7CiAKKyNpZmRlZiBDT05GSUdfUE0KKwkvKiBUT0RPIG1heWJlIGRldmlj
ZV9saW5rX2FkZCgpIHNob3VsZCBkbyB0aGlzIGZvciB1cz8gKi8KKwlpZiAoZGV2LT5wb3dlci51
c2VfYXV0b3N1c3BlbmQpIHsKKwkJcG1fcnVudGltZV9zZXRfYXV0b3N1c3BlbmRfZGVsYXkoc21t
dS0+ZGV2LAorCQkJZGV2LT5wb3dlci5hdXRvc3VzcGVuZF9kZWxheSk7CisJCXBtX3J1bnRpbWVf
dXNlX2F1dG9zdXNwZW5kKHNtbXUtPmRldik7CisJfQorI2VuZGlmCisKIHJwbV9wdXQ6CiAJYXJt
X3NtbXVfcnBtX3B1dChzbW11KTsKIAlyZXR1cm4gcmV0OwotLSAKMi4yMS4wCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpGcmVlZHJlbm8gbWFpbGluZyBs
aXN0CkZyZWVkcmVub0BsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9mcmVlZHJlbm8=

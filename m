Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 145E9325DA
	for <lists+freedreno@lfdr.de>; Mon,  3 Jun 2019 03:01:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C17AA8938C;
	Mon,  3 Jun 2019 01:01:36 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from onstation.org (onstation.org [52.200.56.107])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5BCE8938C;
 Mon,  3 Jun 2019 01:01:35 +0000 (UTC)
Received: from localhost.localdomain (c-98-239-145-235.hsd1.wv.comcast.net
 [98.239.145.235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: masneyb)
 by onstation.org (Postfix) with ESMTPSA id BF7B03E915;
 Mon,  3 Jun 2019 01:01:33 +0000 (UTC)
From: Brian Masney <masneyb@onstation.org>
To: robdclark@gmail.com,
	sean@poorly.run
Date: Sun,  2 Jun 2019 21:01:31 -0400
Message-Id: <20190603010131.16773-1-masneyb@onstation.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=onstation.org; s=default; t=1559523694;
 bh=4MM1CQQTS49y5fDiBKAh42vrZ+Pf8egF6h5JW9RgQVA=;
 h=From:To:Cc:Subject:Date:From;
 b=HO8KxWKs9DywQfM1vvhUGimX6bCkiJiKL+F1eygfxD/riSC5yMnDKmhKJuKdw1ZFA
 u1Pndo/Qx/87U9FWyMXaD+CBoW+Jatmm1vFsW9OYtZKZQIatUH6x+TzNpSknW5JLxb
 IeNFo+7Zo119AfddpJMkyDwDv1Rx7nD8djCCDyPA=
Subject: [Freedreno] [PATCH] drm/msm: correct attempted NULL pointer
 dereference in put_iova
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
Cc: airlied@linux.ie, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, daniel@ffwll.ch,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

cHV0X2lvdmEoKSB3b3VsZCBhdHRlbXB0IHRvIGRlcmVmZXJlbmNlIGEgTlVMTCBwb2ludGVyIHZp
YSB0aGUKYWRkcmVzcyBzcGFjZSBwb2ludGVyIHdoZW4gbm8gSU9NTVUgaXMgcHJlc2VudC4gQ29y
cmVjdCB0aGlzIGJ5IGFkZGluZwp0aGUgYXBwcm9wcmlhdGUgY2hlY2suCgpTaWduZWQtb2ZmLWJ5
OiBCcmlhbiBNYXNuZXkgPG1hc25leWJAb25zdGF0aW9uLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9k
cm0vbXNtL21zbV9nZW0uYyB8IDYgKysrKy0tCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25z
KCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tc20vbXNt
X2dlbS5jIGIvZHJpdmVycy9ncHUvZHJtL21zbS9tc21fZ2VtLmMKaW5kZXggMzVmNTVkZDI1OTk0
Li5kMzFkOWY5Mjc4ODcgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tc20vbXNtX2dlbS5j
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vbXNtX2dlbS5jCkBAIC0zNTIsOCArMzUyLDEwIEBA
IHB1dF9pb3ZhKHN0cnVjdCBkcm1fZ2VtX29iamVjdCAqb2JqKQogCVdBUk5fT04oIW11dGV4X2lz
X2xvY2tlZCgmbXNtX29iai0+bG9jaykpOwogCiAJbGlzdF9mb3JfZWFjaF9lbnRyeV9zYWZlKHZt
YSwgdG1wLCAmbXNtX29iai0+dm1hcywgbGlzdCkgewotCQltc21fZ2VtX3B1cmdlX3ZtYSh2bWEt
PmFzcGFjZSwgdm1hKTsKLQkJbXNtX2dlbV9jbG9zZV92bWEodm1hLT5hc3BhY2UsIHZtYSk7CisJ
CWlmICh2bWEtPmFzcGFjZSkgeworCQkJbXNtX2dlbV9wdXJnZV92bWEodm1hLT5hc3BhY2UsIHZt
YSk7CisJCQltc21fZ2VtX2Nsb3NlX3ZtYSh2bWEtPmFzcGFjZSwgdm1hKTsKKwkJfQogCQlkZWxf
dm1hKHZtYSk7CiAJfQogfQotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpGcmVlZHJlbm8gbWFpbGluZyBsaXN0CkZyZWVkcmVub0BsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9mcmVlZHJlbm8=

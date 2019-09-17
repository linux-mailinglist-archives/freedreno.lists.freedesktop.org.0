Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D2CCEB57C0
	for <lists+freedreno@lfdr.de>; Tue, 17 Sep 2019 23:48:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 623E76ED84;
	Tue, 17 Sep 2019 21:48:52 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from smtp.codeaurora.org (smtp.codeaurora.org [198.145.29.96])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FE036ED84
 for <freedreno@lists.freedesktop.org>; Tue, 17 Sep 2019 21:48:51 +0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
 id 22FB260767; Tue, 17 Sep 2019 21:48:51 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
 version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: jcrouse@smtp.codeaurora.org)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 3B8E3602F2;
 Tue, 17 Sep 2019 21:48:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 3B8E3602F2
From: Jordan Crouse <jcrouse@codeaurora.org>
To: freedreno@lists.freedesktop.org
Date: Tue, 17 Sep 2019 15:48:42 -0600
Message-Id: <1568756922-2829-1-git-send-email-jcrouse@codeaurora.org>
X-Mailer: git-send-email 2.7.4
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1568756931;
 bh=X3NzP2/OYfzCgk/ZWQD94QYMs+1Ua5L9ueXra2kQULY=;
 h=From:To:Cc:Subject:Date:From;
 b=khpfHqSaFrHXavw8/J+fb+ITv0RESQd6ED4bU3KDprajNO7Oj1vnw/wD9hIOr5zxi
 64r+VrjPpvX1FPA5JIxcJocHDc0OrKqshyM0jgK9mKpy3RuVFXUiLVPrKuUHWzAUDt
 ts0jjHHZDcK89yTOAYpr8Mh9F0ZC9vTkEPGpOJEg=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1568756930;
 bh=X3NzP2/OYfzCgk/ZWQD94QYMs+1Ua5L9ueXra2kQULY=;
 h=From:To:Cc:Subject:Date:From;
 b=kHu0LIZD5zPhs2oNSz7DbpAMoX25nskyMUXcyYDKnfzR+1LL5ck9jd5bdIro7EJnx
 oDVP/ORHzdU87q3Dru7c7rcka2raGkjEN9x7Z6KCjnSVir/RzKJzePPt/N5Xttp5M5
 FC6CXQhSm0fYkCw3mnq3gvLqnot1AtVKy1B0y1TY=
X-Mailman-Original-Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 dmarc=none (p=none dis=none)
 header.from=codeaurora.org
X-Mailman-Original-Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 spf=none
 smtp.mailfrom=jcrouse@codeaurora.org
Subject: [Freedreno] [PATCH] idr: Prevent unintended underflow for the idr
 index
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
Cc: linux-fsdevel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

SXQgaXMgcG9zc2libGUgZm9yIHVuYXdhcmUgY2FsbGVycyBvZiBzZXZlcmFsIGlkciBmdW5jdGlv
bnMgdG8gYWNjaWRlbnRhbGx5CnVuZGVyZmxvdyB0aGUgaW5kZXggYnkgc3BlY2lmeWluZyBhIGlk
IHRoYXQgaXMgbGVzcyB0aGFuIHRoZSBpZHIgYmFzZS4KClNpZ25lZC1vZmYtYnk6IEpvcmRhbiBD
cm91c2UgPGpjcm91c2VAY29kZWF1cm9yYS5vcmc+Ci0tLQoKIGxpYi9pZHIuYyB8IDkgKysrKysr
KysrCiAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvbGliL2lk
ci5jIGIvbGliL2lkci5jCmluZGV4IDY2YTM3NDguLmQ5ZTE4MGMgMTAwNjQ0Ci0tLSBhL2xpYi9p
ZHIuYworKysgYi9saWIvaWRyLmMKQEAgLTE1MSw2ICsxNTEsOSBAQCBFWFBPUlRfU1lNQk9MKGlk
cl9hbGxvY19jeWNsaWMpOwogICovCiB2b2lkICppZHJfcmVtb3ZlKHN0cnVjdCBpZHIgKmlkciwg
dW5zaWduZWQgbG9uZyBpZCkKIHsKKwlpZiAoaWQgPCBpZHItPmlkcl9iYXNlKQorCQlyZXR1cm4g
TlVMTDsKKwogCXJldHVybiByYWRpeF90cmVlX2RlbGV0ZV9pdGVtKCZpZHItPmlkcl9ydCwgaWQg
LSBpZHItPmlkcl9iYXNlLCBOVUxMKTsKIH0KIEVYUE9SVF9TWU1CT0xfR1BMKGlkcl9yZW1vdmUp
OwpAQCAtMTcxLDYgKzE3NCw5IEBAIEVYUE9SVF9TWU1CT0xfR1BMKGlkcl9yZW1vdmUpOwogICov
CiB2b2lkICppZHJfZmluZChjb25zdCBzdHJ1Y3QgaWRyICppZHIsIHVuc2lnbmVkIGxvbmcgaWQp
CiB7CisJaWYgKGlkIDwgaWRyLT5pZHJfYmFzZSkKKwkJcmV0dXJuIE5VTEw7CisKIAlyZXR1cm4g
cmFkaXhfdHJlZV9sb29rdXAoJmlkci0+aWRyX3J0LCBpZCAtIGlkci0+aWRyX2Jhc2UpOwogfQog
RVhQT1JUX1NZTUJPTF9HUEwoaWRyX2ZpbmQpOwpAQCAtMzAyLDYgKzMwOCw5IEBAIHZvaWQgKmlk
cl9yZXBsYWNlKHN0cnVjdCBpZHIgKmlkciwgdm9pZCAqcHRyLCB1bnNpZ25lZCBsb25nIGlkKQog
CXZvaWQgX19yY3UgKipzbG90ID0gTlVMTDsKIAl2b2lkICplbnRyeTsKIAorCWlmIChpZCA8IGlk
ci0+aWRyX2Jhc2UpCisJCXJldHVybiBFUlJfUFRSKC1FTk9FTlQpOworCiAJaWQgLT0gaWRyLT5p
ZHJfYmFzZTsKIAogCWVudHJ5ID0gX19yYWRpeF90cmVlX2xvb2t1cCgmaWRyLT5pZHJfcnQsIGlk
LCAmbm9kZSwgJnNsb3QpOwotLSAKMi43LjQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkZyZWVkcmVubyBtYWlsaW5nIGxpc3QKRnJlZWRyZW5vQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2ZyZWVkcmVubw==

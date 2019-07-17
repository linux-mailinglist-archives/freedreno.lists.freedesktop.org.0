Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 691F56BF59
	for <lists+freedreno@lfdr.de>; Wed, 17 Jul 2019 17:53:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE6E76E0BA;
	Wed, 17 Jul 2019 15:53:19 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from smtp.codeaurora.org (smtp.codeaurora.org [198.145.29.96])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 941AD6E0BA
 for <freedreno@lists.freedesktop.org>; Wed, 17 Jul 2019 15:53:18 +0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
 id 76B0D60ACF; Wed, 17 Jul 2019 15:53:18 +0000 (UTC)
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
 by smtp.codeaurora.org (Postfix) with ESMTPSA id CC9EE6072E;
 Wed, 17 Jul 2019 15:53:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org CC9EE6072E
From: Jordan Crouse <jcrouse@codeaurora.org>
To: freedreno@lists.freedesktop.org
Date: Wed, 17 Jul 2019 09:53:13 -0600
Message-Id: <1563378793-22023-1-git-send-email-jcrouse@codeaurora.org>
X-Mailer: git-send-email 2.7.4
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1563378798;
 bh=neGF5FCENe6mEc6GArZIeGpuo6QccxA0L5Slvsy0ytU=;
 h=From:To:Cc:Subject:Date:From;
 b=M3Ni/Dqjle3iHnjI78cK4D5tQKQixrIpLLXoW3oy++K3PWkYs9dU7JsSbUX03bvzm
 zXx0OwigUZ2lPAj3+7E5Ll6ABls0M4xcZHxgH8/fX0K9cbb8OilM0IvVqtd9Dh+ZfR
 62RR9eezE6iiPLtQ6fti5/Qq9jZ0oEpIJ08SpllU=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1563378797;
 bh=neGF5FCENe6mEc6GArZIeGpuo6QccxA0L5Slvsy0ytU=;
 h=From:To:Cc:Subject:Date:From;
 b=YAO018CN2k4FCloPKulgx4Y9bWyS5Pw0CAz+cVs2F+PPTo9c/FPeSl3LG1PaumX3q
 dRmoWnR+Imc/NjLnxV/aajAwq1WxP5VYxePipvXXicNE6+qP5azXCOREGGWWr4wH7I
 7L7tE4o45tx1RbDJzlhJsZ4Ip6ZDfhvYFW6Zudy4=
X-Mailman-Original-Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 dmarc=none (p=none dis=none)
 header.from=codeaurora.org
X-Mailman-Original-Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 spf=none
 smtp.mailfrom=jcrouse@codeaurora.org
Subject: [Freedreno] [PATCH] qcom: Add BCM vote macro to TCS header
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
Cc: linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, ilina@codeaurora.org, bjorn.andersson@linaro.org,
 David Brown <david.brown@linaro.org>, Andy Gross <agross@kernel.org>,
 "Raju P.L.S.S.S.N" <rplsssn@codeaurora.org>,
 Georgi Djakov <georgi.djakov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

VGhlIEE2WFggZmFtaWx5IG9mIEFkcmVubyBHUFVzIHVzZSBhIG1pY3JvY29udHJvbGxlciB0byBj
b250cm9sIHRoZQpHUFUgY2xvY2sgaW5kZXBlbmRlbnRseS4gVGhlIG1pY3JvY29udHJvbGxlciBh
bHNvIGhhcyB0aGUgY2FwYWJpbGl0eQp0byB2b3RlIGZvciB0aGUgYnVzIGJ1dCBkb2Vzbid0IGN1
cnJlbnRseSBkbyBzbyBleGNlcHQgZm9yIG9uZSBpbml0aWFsCnZvdGUgdGhhdCBpcyBoYXJkIGNv
ZGVkIFsxXS4KCkN1cnJlbnRseSB0aGVyZSBpcyBubyBnb29kIHdheSB0byBjb25zdHJ1Y3QgYSB2
YWxpZCBUQ1MgY29tbWFuZCBvdXRzaWRlCm9mIHRoZSBpbm5lciB3b3JraW5ncyBvZiB0aGUgUUNP
TSBpbnRlcmNvbm5lY3QgZHJpdmVyIHdoaWNoIGlzIHNvbWV0aGluZwp0aGF0IHdpbGwgbmVlZCB0
byBiZSBhZGRyZXNzZWQgZm9yIHRoZSBuZXh0IGdlbmVyYXRpb24gb2YgR1BVIGRyaXZlcnMuCgpU
byBzdGFydCB0aGUgcHJvY2VzcywgdGhpcyBjaGFuZ2UgbW92ZXMgdGhlIFRDUyBjb21tYW5kIG1h
Y3JvcyBmcm9tIHRoZQpzZG04NDUgaW50ZXJjb25uZWN0IGRyaXZlciBpbnRvIGEgc29jIHNwZWNp
ZmljIGhlYWRlciB0byBtYWtlIGl0IGF2YWlsYWJsZQpmb3IgZnV0dXJlIGVmZm9ydHMgaW50byB0
aGlzIGFyZWEuCgpbMV0gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5l
bC9naXQvdG9ydmFsZHMvbGludXguZ2l0L3RyZWUvZHJpdmVycy9ncHUvZHJtL21zbS9hZHJlbm8v
YTZ4eF9oZmkuYyNuMjE5CgpTaWduZWQtb2ZmLWJ5OiBKb3JkYW4gQ3JvdXNlIDxqY3JvdXNlQGNv
ZGVhdXJvcmEub3JnPgotLS0KCiBkcml2ZXJzL2ludGVyY29ubmVjdC9xY29tL3NkbTg0NS5jIHwg
MTcgLS0tLS0tLS0tLS0tLS0tLS0KIGluY2x1ZGUvc29jL3Fjb20vdGNzLmggICAgICAgICAgICAg
fCAxNyArKysrKysrKysrKysrKysrKwogMiBmaWxlcyBjaGFuZ2VkLCAxNyBpbnNlcnRpb25zKCsp
LCAxNyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2ludGVyY29ubmVjdC9xY29t
L3NkbTg0NS5jIGIvZHJpdmVycy9pbnRlcmNvbm5lY3QvcWNvbS9zZG04NDUuYwppbmRleCA0OTE1
Yjc4Li43OWI2ZjAxIDEwMDY0NAotLS0gYS9kcml2ZXJzL2ludGVyY29ubmVjdC9xY29tL3NkbTg0
NS5jCisrKyBiL2RyaXZlcnMvaW50ZXJjb25uZWN0L3Fjb20vc2RtODQ1LmMKQEAgLTIwLDIzICsy
MCw2IEBACiAjaW5jbHVkZSA8c29jL3Fjb20vcnBtaC5oPgogI2luY2x1ZGUgPHNvYy9xY29tL3Rj
cy5oPgogCi0jZGVmaW5lIEJDTV9UQ1NfQ01EX0NPTU1JVF9TSEZUCQkzMAotI2RlZmluZSBCQ01f
VENTX0NNRF9DT01NSVRfTUFTSwkJMHg0MDAwMDAwMAotI2RlZmluZSBCQ01fVENTX0NNRF9WQUxJ
RF9TSEZUCQkyOQotI2RlZmluZSBCQ01fVENTX0NNRF9WQUxJRF9NQVNLCQkweDIwMDAwMDAwCi0j
ZGVmaW5lIEJDTV9UQ1NfQ01EX1ZPVEVfWF9TSEZUCQkxNAotI2RlZmluZSBCQ01fVENTX0NNRF9W
T1RFX01BU0sJCTB4M2ZmZgotI2RlZmluZSBCQ01fVENTX0NNRF9WT1RFX1lfU0hGVAkJMAotI2Rl
ZmluZSBCQ01fVENTX0NNRF9WT1RFX1lfTUFTSwkJMHhmZmZjMDAwCi0KLSNkZWZpbmUgQkNNX1RD
U19DTUQoY29tbWl0LCB2YWxpZCwgdm90ZV94LCB2b3RlX3kpCQlcCi0JKCgoY29tbWl0KSA8PCBC
Q01fVENTX0NNRF9DT01NSVRfU0hGVCkgfAkJXAotCSgodmFsaWQpIDw8IEJDTV9UQ1NfQ01EX1ZB
TElEX1NIRlQpIHwJCQlcCi0JKChjcHVfdG9fbGUzMih2b3RlX3gpICYJCQkJCVwKLQlCQ01fVENT
X0NNRF9WT1RFX01BU0spIDw8IEJDTV9UQ1NfQ01EX1ZPVEVfWF9TSEZUKSB8CVwKLQkoKGNwdV90
b19sZTMyKHZvdGVfeSkgJgkJCQkJXAotCUJDTV9UQ1NfQ01EX1ZPVEVfTUFTSykgPDwgQkNNX1RD
U19DTURfVk9URV9ZX1NIRlQpKQotCiAjZGVmaW5lIHRvX3Fjb21fcHJvdmlkZXIoX3Byb3ZpZGVy
KSBcCiAJY29udGFpbmVyX29mKF9wcm92aWRlciwgc3RydWN0IHFjb21faWNjX3Byb3ZpZGVyLCBw
cm92aWRlcikKIApkaWZmIC0tZ2l0IGEvaW5jbHVkZS9zb2MvcWNvbS90Y3MuaCBiL2luY2x1ZGUv
c29jL3Fjb20vdGNzLmgKaW5kZXggMjYyODc2YS4uNjAxMmE5ZSAxMDA2NDQKLS0tIGEvaW5jbHVk
ZS9zb2MvcWNvbS90Y3MuaAorKysgYi9pbmNsdWRlL3NvYy9xY29tL3Rjcy5oCkBAIC01Myw0ICs1
MywyMSBAQCBzdHJ1Y3QgdGNzX3JlcXVlc3QgewogCXN0cnVjdCB0Y3NfY21kICpjbWRzOwogfTsK
IAorI2RlZmluZSBCQ01fVENTX0NNRF9DT01NSVRfU0hGVAkJMzAKKyNkZWZpbmUgQkNNX1RDU19D
TURfQ09NTUlUX01BU0sJCTB4NDAwMDAwMDAKKyNkZWZpbmUgQkNNX1RDU19DTURfVkFMSURfU0hG
VAkJMjkKKyNkZWZpbmUgQkNNX1RDU19DTURfVkFMSURfTUFTSwkJMHgyMDAwMDAwMAorI2RlZmlu
ZSBCQ01fVENTX0NNRF9WT1RFX1hfU0hGVAkJMTQKKyNkZWZpbmUgQkNNX1RDU19DTURfVk9URV9N
QVNLCQkweDNmZmYKKyNkZWZpbmUgQkNNX1RDU19DTURfVk9URV9ZX1NIRlQJCTAKKyNkZWZpbmUg
QkNNX1RDU19DTURfVk9URV9ZX01BU0sJCTB4ZmZmYzAwMAorCisjZGVmaW5lIEJDTV9UQ1NfQ01E
KGNvbW1pdCwgdmFsaWQsIHZvdGVfeCwgdm90ZV95KQkJXAorCSgoKGNvbW1pdCkgPDwgQkNNX1RD
U19DTURfQ09NTUlUX1NIRlQpIHwJCVwKKwkoKHZhbGlkKSA8PCBCQ01fVENTX0NNRF9WQUxJRF9T
SEZUKSB8CQkJXAorCSgoY3B1X3RvX2xlMzIodm90ZV94KSAmCQkJCQlcCisJQkNNX1RDU19DTURf
Vk9URV9NQVNLKSA8PCBCQ01fVENTX0NNRF9WT1RFX1hfU0hGVCkgfAlcCisJKChjcHVfdG9fbGUz
Mih2b3RlX3kpICYJCQkJCVwKKwlCQ01fVENTX0NNRF9WT1RFX01BU0spIDw8IEJDTV9UQ1NfQ01E
X1ZPVEVfWV9TSEZUKSkKKwogI2VuZGlmIC8qIF9fU09DX1FDT01fVENTX0hfXyAqLwotLSAKMi43
LjQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkZyZWVk
cmVubyBtYWlsaW5nIGxpc3QKRnJlZWRyZW5vQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ZyZWVkcmVubw==

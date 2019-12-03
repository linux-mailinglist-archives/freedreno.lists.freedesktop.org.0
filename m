Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 908121100E3
	for <lists+freedreno@lfdr.de>; Tue,  3 Dec 2019 16:11:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3397D6E835;
	Tue,  3 Dec 2019 15:11:32 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
X-Greylist: delayed 315 seconds by postgrey-1.36 at gabe;
 Tue, 03 Dec 2019 15:11:30 UTC
Received: from a27-188.smtp-out.us-west-2.amazonses.com
 (a27-188.smtp-out.us-west-2.amazonses.com [54.240.27.188])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89CF66E835
 for <freedreno@lists.freedesktop.org>; Tue,  3 Dec 2019 15:11:30 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
 autolearn=unavailable autolearn_force=no version=3.4.0
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org B8CB3C447B1
From: Sharat Masetty <smasetty@codeaurora.org>
To: freedreno@lists.freedesktop.org
Date: Tue, 3 Dec 2019 15:06:15 +0000
Message-ID: <0101016ecc4c2f8d-4be7b987-5ec7-4026-b3cd-aeebc1c6e49b-000000@us-west-2.amazonses.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1575385543-11290-1-git-send-email-smasetty@codeaurora.org>
References: <1575385543-11290-1-git-send-email-smasetty@codeaurora.org>
X-SES-Outgoing: 2019.12.03-54.240.27.188
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/simple; 
 s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1575385575;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
 bh=0qr+z4ustFTx1MdUx01PQS/J5bobm+p6WhtCLpPaZH4=;
 b=BH/igWNyaNI52FCYD65LTDiBoXDAmYNFPGq3aHSN/nyXyyJRp/BjIX/5rnWOlgPy
 dqc34Q293sDsl5GPPa+Z8UulvjDRuEQ6FxBVb02Oktvz/gtgw3OM5orxytNg8wqtm4u
 ikze7L4ukAqtuGWR8cIxauuv0BnrzEOXxCPtaw24=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/simple; 
 s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1575385575;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:Feedback-ID;
 bh=0qr+z4ustFTx1MdUx01PQS/J5bobm+p6WhtCLpPaZH4=;
 b=SOfjD8+8nG2weqmw12VGjdThEjN5JEa2X8niHwNA9wO1I6/+nW8hel1oO1F9rKaS
 +FlBGCeFopq2lqX6RTnhJ1GtIKneBgMstXWmSWCBKkrd4bNR1+5yaUg2lNdMMo3o/VP
 ehMoShrPsGOazinkoAFOqIQQ5yB2k1KAXe7WdYYA=
X-Mailman-Original-Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
X-Mailman-Original-Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=smasetty@codeaurora.org
Subject: [Freedreno] [PATCH 4/5] drm: msm: a6xx: fix debug bus register
 configuration
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
Cc: linux-arm-msm@vger.kernel.org, Sharat Masetty <smasetty@codeaurora.org>,
 dri-devel@freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Rml4IHRoZSBjeCBkZWJ1Z2J1cyByZWxhdGVkIHJlZ2lzdGVyIGNvbmZpZ3VyYXRpb24sIHRvIGNv
bGxlY3QgYWNjdXJhdGUKYnVzIGRhdGEgZHVyaW5nIGdwdSBzbmFwc2hvdC4gVGhpcyBoZWxwcyB3
aXRoIGNvbXBsZXRlIHNuYXBzaG90IGR1bXAKYW5kIGFsc28gY29tcGxldGUgcHJvcGVyIEdQVSBy
ZWNvdmVyeS4KCkNoYW5nZS1JZDogSTRmMGFlM2ViMmRkNWQyNGE4OGQ4MDUyNzdmYWQyMTJkZGEy
ZDczNWUKU2lnbmVkLW9mZi1ieTogU2hhcmF0IE1hc2V0dHkgPHNtYXNldHR5QGNvZGVhdXJvcmEu
b3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9tc20vYWRyZW5vL2E2eHhfZ3B1X3N0YXRlLmMgfCAy
NCArKysrKysrKysrKystLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxMiBpbnNlcnRpb25z
KCspLCAxMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2Fk
cmVuby9hNnh4X2dwdV9zdGF0ZS5jIGIvZHJpdmVycy9ncHUvZHJtL21zbS9hZHJlbm8vYTZ4eF9n
cHVfc3RhdGUuYwppbmRleCA5OWI1YTQxLi5kNjAyM2JhIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dw
dS9kcm0vbXNtL2FkcmVuby9hNnh4X2dwdV9zdGF0ZS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9t
c20vYWRyZW5vL2E2eHhfZ3B1X3N0YXRlLmMKQEAgLTM1MywyNiArMzUzLDI2IEBAIHN0YXRpYyB2
b2lkIGE2eHhfZ2V0X2RlYnVnYnVzKHN0cnVjdCBtc21fZ3B1ICpncHUsCiAJCWN4ZGJnID0gaW9y
ZW1hcChyZXMtPnN0YXJ0LCByZXNvdXJjZV9zaXplKHJlcykpOwogCiAJaWYgKGN4ZGJnKSB7Ci0J
CWN4ZGJnX3dyaXRlKGN4ZGJnLCBSRUdfQTZYWF9EQkdDX0NGR19EQkdCVVNfQ05UTFQsCisJCWN4
ZGJnX3dyaXRlKGN4ZGJnLCBSRUdfQTZYWF9DWF9EQkdDX0NGR19EQkdCVVNfQ05UTFQsCiAJCQlB
NlhYX0RCR0NfQ0ZHX0RCR0JVU19DTlRMVF9TRUdUKDB4ZikpOwogCi0JCWN4ZGJnX3dyaXRlKGN4
ZGJnLCBSRUdfQTZYWF9EQkdDX0NGR19EQkdCVVNfQ05UTE0sCisJCWN4ZGJnX3dyaXRlKGN4ZGJn
LCBSRUdfQTZYWF9DWF9EQkdDX0NGR19EQkdCVVNfQ05UTE0sCiAJCQlBNlhYX0RCR0NfQ0ZHX0RC
R0JVU19DTlRMTV9FTkFCTEUoMHhmKSk7CiAKLQkJY3hkYmdfd3JpdGUoY3hkYmcsIFJFR19BNlhY
X0RCR0NfQ0ZHX0RCR0JVU19JVlRMXzAsIDApOwotCQljeGRiZ193cml0ZShjeGRiZywgUkVHX0E2
WFhfREJHQ19DRkdfREJHQlVTX0lWVExfMSwgMCk7Ci0JCWN4ZGJnX3dyaXRlKGN4ZGJnLCBSRUdf
QTZYWF9EQkdDX0NGR19EQkdCVVNfSVZUTF8yLCAwKTsKLQkJY3hkYmdfd3JpdGUoY3hkYmcsIFJF
R19BNlhYX0RCR0NfQ0ZHX0RCR0JVU19JVlRMXzMsIDApOworCQljeGRiZ193cml0ZShjeGRiZywg
UkVHX0E2WFhfQ1hfREJHQ19DRkdfREJHQlVTX0lWVExfMCwgMCk7CisJCWN4ZGJnX3dyaXRlKGN4
ZGJnLCBSRUdfQTZYWF9DWF9EQkdDX0NGR19EQkdCVVNfSVZUTF8xLCAwKTsKKwkJY3hkYmdfd3Jp
dGUoY3hkYmcsIFJFR19BNlhYX0NYX0RCR0NfQ0ZHX0RCR0JVU19JVlRMXzIsIDApOworCQljeGRi
Z193cml0ZShjeGRiZywgUkVHX0E2WFhfQ1hfREJHQ19DRkdfREJHQlVTX0lWVExfMywgMCk7CiAK
LQkJY3hkYmdfd3JpdGUoY3hkYmcsIFJFR19BNlhYX0RCR0NfQ0ZHX0RCR0JVU19CWVRFTF8wLAor
CQljeGRiZ193cml0ZShjeGRiZywgUkVHX0E2WFhfQ1hfREJHQ19DRkdfREJHQlVTX0JZVEVMXzAs
CiAJCQkweDc2NTQzMjEwKTsKLQkJY3hkYmdfd3JpdGUoY3hkYmcsIFJFR19BNlhYX0RCR0NfQ0ZH
X0RCR0JVU19CWVRFTF8xLAorCQljeGRiZ193cml0ZShjeGRiZywgUkVHX0E2WFhfQ1hfREJHQ19D
RkdfREJHQlVTX0JZVEVMXzEsCiAJCQkweEZFRENCQTk4KTsKIAotCQljeGRiZ193cml0ZShjeGRi
ZywgUkVHX0E2WFhfREJHQ19DRkdfREJHQlVTX01BU0tMXzAsIDApOwotCQljeGRiZ193cml0ZShj
eGRiZywgUkVHX0E2WFhfREJHQ19DRkdfREJHQlVTX01BU0tMXzEsIDApOwotCQljeGRiZ193cml0
ZShjeGRiZywgUkVHX0E2WFhfREJHQ19DRkdfREJHQlVTX01BU0tMXzIsIDApOwotCQljeGRiZ193
cml0ZShjeGRiZywgUkVHX0E2WFhfREJHQ19DRkdfREJHQlVTX01BU0tMXzMsIDApOworCQljeGRi
Z193cml0ZShjeGRiZywgUkVHX0E2WFhfQ1hfREJHQ19DRkdfREJHQlVTX01BU0tMXzAsIDApOwor
CQljeGRiZ193cml0ZShjeGRiZywgUkVHX0E2WFhfQ1hfREJHQ19DRkdfREJHQlVTX01BU0tMXzEs
IDApOworCQljeGRiZ193cml0ZShjeGRiZywgUkVHX0E2WFhfQ1hfREJHQ19DRkdfREJHQlVTX01B
U0tMXzIsIDApOworCQljeGRiZ193cml0ZShjeGRiZywgUkVHX0E2WFhfQ1hfREJHQ19DRkdfREJH
QlVTX01BU0tMXzMsIDApOwogCX0KIAogCW5yX2RlYnVnYnVzX2Jsb2NrcyA9IEFSUkFZX1NJWkUo
YTZ4eF9kZWJ1Z2J1c19ibG9ja3MpICsKLS0gCjEuOS4xCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpGcmVlZHJlbm8gbWFpbGluZyBsaXN0CkZyZWVkcmVu
b0BsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9mcmVlZHJlbm8=

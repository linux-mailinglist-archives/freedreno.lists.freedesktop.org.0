Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2214110151
	for <lists+freedreno@lfdr.de>; Tue,  3 Dec 2019 16:30:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B3D46E9D6;
	Tue,  3 Dec 2019 15:30:48 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
X-Greylist: delayed 871 seconds by postgrey-1.36 at gabe;
 Tue, 03 Dec 2019 15:30:47 UTC
Received: from a27-21.smtp-out.us-west-2.amazonses.com
 (a27-21.smtp-out.us-west-2.amazonses.com [54.240.27.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DC886E9D6
 for <freedreno@lists.freedesktop.org>; Tue,  3 Dec 2019 15:30:47 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
 autolearn=unavailable autolearn_force=no version=3.4.0
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 78C28C447B0
From: Sharat Masetty <smasetty@codeaurora.org>
To: freedreno@lists.freedesktop.org
Date: Tue, 3 Dec 2019 15:16:16 +0000
Message-ID: <0101016ecc555c33-87dc5f8e-0450-43d0-b123-8a7db3dfbc60-000000@us-west-2.amazonses.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1575386150-13299-1-git-send-email-smasetty@codeaurora.org>
References: <1575386150-13299-1-git-send-email-smasetty@codeaurora.org>
X-SES-Outgoing: 2019.12.03-54.240.27.21
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/simple; 
 s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1575386176;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
 bh=A74fUr+wlRBeqINSy7GC0MlEpjVR7ldbwLR8jac705A=;
 b=bd86+bcX7YzovHmbSzvO3WW9xi2vsAowvMIIbLEPuKX+xKgWDEaTubMBCW1q1kdi
 6zoXrSadh3ZxcByFBftJ3LmSyZAWvUPGRFSZwNehzv8NMYwQm8O7zzlCByxWHJmt0Bw
 2NqqTpXdTaOFzvx55FeeQsDD4YAYWum2y7v5dWEE=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/simple; 
 s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1575386176;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:Feedback-ID;
 bh=A74fUr+wlRBeqINSy7GC0MlEpjVR7ldbwLR8jac705A=;
 b=WaaJ1YqWLHUqW2TKV0hJukTUxxKFDunM1hzq7ti+EOrp7QeBstoDPEMaRvMN713s
 IXknWFh7jIR3w+ghUc4mESqw8YCEZFmU1fFWD8F8hlbmPVq33MsUrYmIgH4jtWmA3mw
 SDmzFCleDzEXkpipstoprji8H96s7zGPppei5Eyc=
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
ZWNvdmVyeS4KClNpZ25lZC1vZmYtYnk6IFNoYXJhdCBNYXNldHR5IDxzbWFzZXR0eUBjb2RlYXVy
b3JhLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vbXNtL2FkcmVuby9hNnh4X2dwdV9zdGF0ZS5j
IHwgMjQgKysrKysrKysrKysrLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTIgaW5zZXJ0
aW9ucygrKSwgMTIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21z
bS9hZHJlbm8vYTZ4eF9ncHVfc3RhdGUuYyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vYWRyZW5vL2E2
eHhfZ3B1X3N0YXRlLmMKaW5kZXggOTliNWE0MS4uZDYwMjNiYSAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL21zbS9hZHJlbm8vYTZ4eF9ncHVfc3RhdGUuYworKysgYi9kcml2ZXJzL2dwdS9k
cm0vbXNtL2FkcmVuby9hNnh4X2dwdV9zdGF0ZS5jCkBAIC0zNTMsMjYgKzM1MywyNiBAQCBzdGF0
aWMgdm9pZCBhNnh4X2dldF9kZWJ1Z2J1cyhzdHJ1Y3QgbXNtX2dwdSAqZ3B1LAogCQljeGRiZyA9
IGlvcmVtYXAocmVzLT5zdGFydCwgcmVzb3VyY2Vfc2l6ZShyZXMpKTsKCiAJaWYgKGN4ZGJnKSB7
Ci0JCWN4ZGJnX3dyaXRlKGN4ZGJnLCBSRUdfQTZYWF9EQkdDX0NGR19EQkdCVVNfQ05UTFQsCisJ
CWN4ZGJnX3dyaXRlKGN4ZGJnLCBSRUdfQTZYWF9DWF9EQkdDX0NGR19EQkdCVVNfQ05UTFQsCiAJ
CQlBNlhYX0RCR0NfQ0ZHX0RCR0JVU19DTlRMVF9TRUdUKDB4ZikpOwoKLQkJY3hkYmdfd3JpdGUo
Y3hkYmcsIFJFR19BNlhYX0RCR0NfQ0ZHX0RCR0JVU19DTlRMTSwKKwkJY3hkYmdfd3JpdGUoY3hk
YmcsIFJFR19BNlhYX0NYX0RCR0NfQ0ZHX0RCR0JVU19DTlRMTSwKIAkJCUE2WFhfREJHQ19DRkdf
REJHQlVTX0NOVExNX0VOQUJMRSgweGYpKTsKCi0JCWN4ZGJnX3dyaXRlKGN4ZGJnLCBSRUdfQTZY
WF9EQkdDX0NGR19EQkdCVVNfSVZUTF8wLCAwKTsKLQkJY3hkYmdfd3JpdGUoY3hkYmcsIFJFR19B
NlhYX0RCR0NfQ0ZHX0RCR0JVU19JVlRMXzEsIDApOwotCQljeGRiZ193cml0ZShjeGRiZywgUkVH
X0E2WFhfREJHQ19DRkdfREJHQlVTX0lWVExfMiwgMCk7Ci0JCWN4ZGJnX3dyaXRlKGN4ZGJnLCBS
RUdfQTZYWF9EQkdDX0NGR19EQkdCVVNfSVZUTF8zLCAwKTsKKwkJY3hkYmdfd3JpdGUoY3hkYmcs
IFJFR19BNlhYX0NYX0RCR0NfQ0ZHX0RCR0JVU19JVlRMXzAsIDApOworCQljeGRiZ193cml0ZShj
eGRiZywgUkVHX0E2WFhfQ1hfREJHQ19DRkdfREJHQlVTX0lWVExfMSwgMCk7CisJCWN4ZGJnX3dy
aXRlKGN4ZGJnLCBSRUdfQTZYWF9DWF9EQkdDX0NGR19EQkdCVVNfSVZUTF8yLCAwKTsKKwkJY3hk
Ymdfd3JpdGUoY3hkYmcsIFJFR19BNlhYX0NYX0RCR0NfQ0ZHX0RCR0JVU19JVlRMXzMsIDApOwoK
LQkJY3hkYmdfd3JpdGUoY3hkYmcsIFJFR19BNlhYX0RCR0NfQ0ZHX0RCR0JVU19CWVRFTF8wLAor
CQljeGRiZ193cml0ZShjeGRiZywgUkVHX0E2WFhfQ1hfREJHQ19DRkdfREJHQlVTX0JZVEVMXzAs
CiAJCQkweDc2NTQzMjEwKTsKLQkJY3hkYmdfd3JpdGUoY3hkYmcsIFJFR19BNlhYX0RCR0NfQ0ZH
X0RCR0JVU19CWVRFTF8xLAorCQljeGRiZ193cml0ZShjeGRiZywgUkVHX0E2WFhfQ1hfREJHQ19D
RkdfREJHQlVTX0JZVEVMXzEsCiAJCQkweEZFRENCQTk4KTsKCi0JCWN4ZGJnX3dyaXRlKGN4ZGJn
LCBSRUdfQTZYWF9EQkdDX0NGR19EQkdCVVNfTUFTS0xfMCwgMCk7Ci0JCWN4ZGJnX3dyaXRlKGN4
ZGJnLCBSRUdfQTZYWF9EQkdDX0NGR19EQkdCVVNfTUFTS0xfMSwgMCk7Ci0JCWN4ZGJnX3dyaXRl
KGN4ZGJnLCBSRUdfQTZYWF9EQkdDX0NGR19EQkdCVVNfTUFTS0xfMiwgMCk7Ci0JCWN4ZGJnX3dy
aXRlKGN4ZGJnLCBSRUdfQTZYWF9EQkdDX0NGR19EQkdCVVNfTUFTS0xfMywgMCk7CisJCWN4ZGJn
X3dyaXRlKGN4ZGJnLCBSRUdfQTZYWF9DWF9EQkdDX0NGR19EQkdCVVNfTUFTS0xfMCwgMCk7CisJ
CWN4ZGJnX3dyaXRlKGN4ZGJnLCBSRUdfQTZYWF9DWF9EQkdDX0NGR19EQkdCVVNfTUFTS0xfMSwg
MCk7CisJCWN4ZGJnX3dyaXRlKGN4ZGJnLCBSRUdfQTZYWF9DWF9EQkdDX0NGR19EQkdCVVNfTUFT
S0xfMiwgMCk7CisJCWN4ZGJnX3dyaXRlKGN4ZGJnLCBSRUdfQTZYWF9DWF9EQkdDX0NGR19EQkdC
VVNfTUFTS0xfMywgMCk7CiAJfQoKIAlucl9kZWJ1Z2J1c19ibG9ja3MgPSBBUlJBWV9TSVpFKGE2
eHhfZGVidWdidXNfYmxvY2tzKSArCi0tCjEuOS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpGcmVlZHJlbm8gbWFpbGluZyBsaXN0CkZyZWVkcmVub0Bs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9mcmVlZHJlbm8=

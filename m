Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CFF5D2E695
	for <lists+freedreno@lfdr.de>; Wed, 29 May 2019 22:55:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A25EA6E111;
	Wed, 29 May 2019 20:55:19 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from smtp.codeaurora.org (smtp.codeaurora.org [198.145.29.96])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F69D6E112
 for <freedreno@lists.freedesktop.org>; Wed, 29 May 2019 20:55:18 +0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
 id 5B5BA61132; Wed, 29 May 2019 20:55:18 +0000 (UTC)
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
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 29D3A61196;
 Wed, 29 May 2019 20:55:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 29D3A61196
From: Jordan Crouse <jcrouse@codeaurora.org>
To: freedreno@lists.freedesktop.org
Date: Wed, 29 May 2019 14:54:40 -0600
Message-Id: <1559163292-4792-5-git-send-email-jcrouse@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1559163292-4792-1-git-send-email-jcrouse@codeaurora.org>
References: <1559163292-4792-1-git-send-email-jcrouse@codeaurora.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1559163318;
 bh=n2zt0GanUIWLgrJz7fCZ/sI6rrlNw5KuRp/QXgNCtHw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=i07xyBpW+ItVIUgetfisBNxNETW/8YdqkSOA/1K+BYUcH6NGATUnGlzXuOcei13RG
 Pd46vFoBmrBTNKh1brFPrK/A2gYNfEARPkMscsnpbPrkBzKZsyVuiP+2HTqGKsAE39
 TDH/wZXGVErxssIWKOTBT8c3mbwAkIuMCm875OgA=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1559163316;
 bh=n2zt0GanUIWLgrJz7fCZ/sI6rrlNw5KuRp/QXgNCtHw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=kZvKvIeP81tykgOcfXH3sVPApm3sFC85c/7tkGXe1a5MFNhkk+42UCooFgk+5meM+
 0xgvg0tjAVTvAbqCdzV2LuLIHRl4Jpczd9i5o01dUQ+VADD2Xr2/MZCJBQjTNKPnm5
 SaderNpmoB/EFBVrUYIcuNZUh+tG1mpG06kXFcZ0=
X-Mailman-Original-Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 dmarc=none (p=none dis=none)
 header.from=codeaurora.org
X-Mailman-Original-Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 spf=none
 smtp.mailfrom=jcrouse@codeaurora.org
Subject: [Freedreno] [PATCH v3 04/16] iommu/arm-smmu: Add support for
 DOMAIN_ATTR_SPLIT_TABLES
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
Cc: jean-philippe.brucker@arm.com, linux-arm-msm@vger.kernel.org,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will.deacon@arm.com>,
 dianders@chromium.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, hoegsberg@google.com,
 Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

SWYgRE9NQUlOX0FUVFJfU1BMSVRfVEFCTEVTIGlzIHNwZWNpZmllZCBmb3IgYSBkb21haW4gcGFz
cwpBUk1fNjRfTFBBRV9TUExJVF9TMSB0byBpb19wZ3RhYmxlX29wcyB0byBhbGxvY2F0ZSBhbmQK
aW5pdGlhbGl6ZSBUVEJSMCBhbmQgVFRCUjEgcGFnZXRhYmxlcy4KCnYzOiBNb3ZlZCBhbGwgdGhl
IHBhZ2V0YWJsZSBzcGVjaWZpYyB3b3JrIGludG8gaW8tcGd0YWJsZS1hcm0KaW4gcHJldmlvdXMg
cGF0Y2gKClNpZ25lZC1vZmYtYnk6IEpvcmRhbiBDcm91c2UgPGpjcm91c2VAY29kZWF1cm9yYS5v
cmc+Ci0tLQoKIGRyaXZlcnMvaW9tbXUvYXJtLXNtbXUuYyB8IDE2ICsrKysrKysrKysrKysrKy0K
IDEgZmlsZSBjaGFuZ2VkLCAxNSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9pb21tdS9hcm0tc21tdS5jIGIvZHJpdmVycy9pb21tdS9hcm0tc21tdS5j
CmluZGV4IDc1Mzc2MzkuLjMzZTY5MjggMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvaW9tbXUvYXJtLXNt
bXUuYworKysgYi9kcml2ZXJzL2lvbW11L2FybS1zbW11LmMKQEAgLTI2MCw2ICsyNjAsNyBAQCBz
dHJ1Y3QgYXJtX3NtbXVfZG9tYWluIHsKIAlib29sCQkJCW5vbl9zdHJpY3Q7CiAJc3RydWN0IG11
dGV4CQkJaW5pdF9tdXRleDsgLyogUHJvdGVjdHMgc21tdSBwb2ludGVyICovCiAJc3BpbmxvY2tf
dAkJCWNiX2xvY2s7IC8qIFNlcmlhbGlzZXMgQVRTMSogb3BzIGFuZCBUTEIgc3luY3MgKi8KKwl1
MzIgYXR0cmlidXRlczsKIAlzdHJ1Y3QgaW9tbXVfZG9tYWluCQlkb21haW47CiB9OwogCkBAIC04
MzUsNyArODM2LDExIEBAIHN0YXRpYyBpbnQgYXJtX3NtbXVfaW5pdF9kb21haW5fY29udGV4dChz
dHJ1Y3QgaW9tbXVfZG9tYWluICpkb21haW4sCiAJCWlhcyA9IHNtbXUtPnZhX3NpemU7CiAJCW9h
cyA9IHNtbXUtPmlwYV9zaXplOwogCQlpZiAoY2ZnLT5mbXQgPT0gQVJNX1NNTVVfQ1RYX0ZNVF9B
QVJDSDY0KSB7Ci0JCQlmbXQgPSBBUk1fNjRfTFBBRV9TMTsKKwkJCWlmIChzbW11X2RvbWFpbi0+
YXR0cmlidXRlcyAmCisJCQkJKDEgPDwgRE9NQUlOX0FUVFJfU1BMSVRfVEFCTEVTKSkKKwkJCQlm
bXQgPSBBUk1fNjRfTFBBRV9TUExJVF9TMTsKKwkJCWVsc2UKKwkJCQlmbXQgPSBBUk1fNjRfTFBB
RV9TMTsKIAkJfSBlbHNlIGlmIChjZmctPmZtdCA9PSBBUk1fU01NVV9DVFhfRk1UX0FBUkNIMzJf
TCkgewogCQkJZm10ID0gQVJNXzMyX0xQQUVfUzE7CiAJCQlpYXMgPSBtaW4oaWFzLCAzMlVMKTsK
QEAgLTE2MjIsNiArMTYyNywxMCBAQCBzdGF0aWMgaW50IGFybV9zbW11X2RvbWFpbl9nZXRfYXR0
cihzdHJ1Y3QgaW9tbXVfZG9tYWluICpkb21haW4sCiAJCWNhc2UgRE9NQUlOX0FUVFJfTkVTVElO
RzoKIAkJCSooaW50ICopZGF0YSA9IChzbW11X2RvbWFpbi0+c3RhZ2UgPT0gQVJNX1NNTVVfRE9N
QUlOX05FU1RFRCk7CiAJCQlyZXR1cm4gMDsKKwkJY2FzZSBET01BSU5fQVRUUl9TUExJVF9UQUJM
RVM6CisJCQkqKGludCAqKWRhdGEgPSAhIShzbW11X2RvbWFpbi0+YXR0cmlidXRlcyAmCisJCQkJ
KDEgPDwgRE9NQUlOX0FUVFJfU1BMSVRfVEFCTEVTKSk7CisJCQlyZXR1cm4gMDsKIAkJZGVmYXVs
dDoKIAkJCXJldHVybiAtRU5PREVWOwogCQl9CkBAIC0xNjYyLDYgKzE2NzEsMTEgQEAgc3RhdGlj
IGludCBhcm1fc21tdV9kb21haW5fc2V0X2F0dHIoc3RydWN0IGlvbW11X2RvbWFpbiAqZG9tYWlu
LAogCQkJZWxzZQogCQkJCXNtbXVfZG9tYWluLT5zdGFnZSA9IEFSTV9TTU1VX0RPTUFJTl9TMTsK
IAkJCWJyZWFrOworCQljYXNlIERPTUFJTl9BVFRSX1NQTElUX1RBQkxFUzoKKwkJCWlmICgqKChp
bnQgKilkYXRhKSkKKwkJCQlzbW11X2RvbWFpbi0+YXR0cmlidXRlcyB8PQorCQkJCQkoMSA8PCBE
T01BSU5fQVRUUl9TUExJVF9UQUJMRVMpOworCQkJYnJlYWs7CiAJCWRlZmF1bHQ6CiAJCQlyZXQg
PSAtRU5PREVWOwogCQl9Ci0tIAoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KRnJlZWRyZW5vIG1haWxpbmcgbGlzdApGcmVlZHJlbm9AbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZnJlZWRyZW5v

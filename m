Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1F6B2E68E
	for <lists+freedreno@lfdr.de>; Wed, 29 May 2019 22:55:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EF186E0E2;
	Wed, 29 May 2019 20:55:09 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from smtp.codeaurora.org (smtp.codeaurora.org [198.145.29.96])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E616F6E0E2
 for <freedreno@lists.freedesktop.org>; Wed, 29 May 2019 20:55:07 +0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
 id CDD0B60E7A; Wed, 29 May 2019 20:55:07 +0000 (UTC)
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
 by smtp.codeaurora.org (Postfix) with ESMTPSA id F21AB606DB;
 Wed, 29 May 2019 20:55:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org F21AB606DB
From: Jordan Crouse <jcrouse@codeaurora.org>
To: freedreno@lists.freedesktop.org
Date: Wed, 29 May 2019 14:54:37 -0600
Message-Id: <1559163292-4792-2-git-send-email-jcrouse@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1559163292-4792-1-git-send-email-jcrouse@codeaurora.org>
References: <1559163292-4792-1-git-send-email-jcrouse@codeaurora.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1559163307;
 bh=H1gJftayyhVU3QVkkOlFv2DhgJ/CrcDyVexTTU22x4A=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=lBBCCLNWLtMP6MTlifW0/hhWULMbqAHn8agLMArTbyVmXfLZY0mTYUbtDvXrhGJRB
 +rMjk9pU/Y5kmWw2na3O35JtABPJw1UFGa73g5+eW6WGZz0ZGgzD6SIKgOIL0poPBS
 VGANA337XjlLLCTgDmOZQgtPBQchIWcqJZaSBX0U=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1559163307;
 bh=H1gJftayyhVU3QVkkOlFv2DhgJ/CrcDyVexTTU22x4A=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=lBBCCLNWLtMP6MTlifW0/hhWULMbqAHn8agLMArTbyVmXfLZY0mTYUbtDvXrhGJRB
 +rMjk9pU/Y5kmWw2na3O35JtABPJw1UFGa73g5+eW6WGZz0ZGgzD6SIKgOIL0poPBS
 VGANA337XjlLLCTgDmOZQgtPBQchIWcqJZaSBX0U=
X-Mailman-Original-Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 dmarc=none (p=none dis=none)
 header.from=codeaurora.org
X-Mailman-Original-Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 spf=none
 smtp.mailfrom=jcrouse@codeaurora.org
Subject: [Freedreno] [PATCH v3 01/16] iommu/arm-smmu: Allow client devices
 to select direct mapping
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

U29tZSBjbGllbnQgZGV2aWNlcyB3YW50IHRvIGRpcmVjdGx5IG1hcCB0aGUgSU9NTVUgdGhlbXNl
bHZlcyBpbnN0ZWFkCm9mIHVzaW5nIHRoZSBETUEgZG9tYWluLiBBbGxvdyB0aG9zZSBkZXZpY2Vz
IHRvIG9wdCBpbiB0byBkaXJlY3QKbWFwcGluZyBieSB3YXkgb2YgYSBsaXN0IG9mIGNvbXBhdGli
bGUgc3RyaW5ncy4KCnYzOiB1c2UgaW9tbXVfcmVxdWVzdF9kbV9mb3JfZGV2KCkgdG8gc2V0IHVw
IGEgZGVmYXVsdCBpZGVudGl0eSBkb21haW4KZm9yIGEgZ3JvdXAsIHBlciBSb2JpbgoKU2lnbmVk
LW9mZi1ieTogSm9yZGFuIENyb3VzZSA8amNyb3VzZUBjb2RlYXVyb3JhLm9yZz4KLS0tCgogZHJp
dmVycy9pb21tdS9hcm0tc21tdS5jIHwgMzUgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysKIDEgZmlsZSBjaGFuZ2VkLCAzNSBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9pb21tdS9hcm0tc21tdS5jIGIvZHJpdmVycy9pb21tdS9hcm0tc21tdS5jCmluZGV4IDVl
NTRjYzAuLjc1Mzc2MzkgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvaW9tbXUvYXJtLXNtbXUuYworKysg
Yi9kcml2ZXJzL2lvbW11L2FybS1zbW11LmMKQEAgLTEyMzUsNiArMTIzNSwzNSBAQCBzdGF0aWMg
aW50IGFybV9zbW11X2RvbWFpbl9hZGRfbWFzdGVyKHN0cnVjdCBhcm1fc21tdV9kb21haW4gKnNt
bXVfZG9tYWluLAogCXJldHVybiAwOwogfQogCitzdHJ1Y3QgYXJtX3NtbXVfY2xpZW50X21hdGNo
X2RhdGEgeworCWJvb2wgZGlyZWN0X21hcHBpbmc7Cit9OworCitzdGF0aWMgY29uc3Qgc3RydWN0
IGFybV9zbW11X2NsaWVudF9tYXRjaF9kYXRhIHFjb21fYWRyZW5vID0geworCS5kaXJlY3RfbWFw
cGluZyA9IHRydWUsCit9OworCitzdGF0aWMgY29uc3Qgc3RydWN0IGFybV9zbW11X2NsaWVudF9t
YXRjaF9kYXRhIHFjb21fbWRzcyA9IHsKKwkuZGlyZWN0X21hcHBpbmcgPSB0cnVlLAorfTsKKwor
c3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgYXJtX3NtbXVfY2xpZW50X29mX21hdGNo
W10gPSB7CisJeyAuY29tcGF0aWJsZSA9ICJxY29tLGFkcmVubyIsIC5kYXRhID0gJnFjb21fYWRy
ZW5vIH0sCisJeyAuY29tcGF0aWJsZSA9ICJxY29tLG1kcDQiLCAuZGF0YSA9ICZxY29tX21kc3Mg
fSwKKwl7IC5jb21wYXRpYmxlID0gInFjb20sbWRzcyIsIC5kYXRhID0gJnFjb21fbWRzcyB9LAor
CXsgLmNvbXBhdGlibGUgPSAicWNvbSxzZG04NDUtbWRzcyIsIC5kYXRhID0gJnFjb21fbWRzcyB9
LAorCXt9LAorfTsKKworc3RhdGljIGNvbnN0IHN0cnVjdCBhcm1fc21tdV9jbGllbnRfbWF0Y2hf
ZGF0YSAqCithcm1fc21tdV9jbGllbnRfZGF0YShzdHJ1Y3QgZGV2aWNlICpkZXYpCit7CisJY29u
c3Qgc3RydWN0IG9mX2RldmljZV9pZCAqbWF0Y2ggPQorCQlvZl9tYXRjaF9kZXZpY2UoYXJtX3Nt
bXVfY2xpZW50X29mX21hdGNoLCBkZXYpOworCisJcmV0dXJuIG1hdGNoID8gbWF0Y2gtPmRhdGEg
OiBOVUxMOworfQorCiBzdGF0aWMgaW50IGFybV9zbW11X2F0dGFjaF9kZXYoc3RydWN0IGlvbW11
X2RvbWFpbiAqZG9tYWluLCBzdHJ1Y3QgZGV2aWNlICpkZXYpCiB7CiAJaW50IHJldDsKQEAgLTE0
NTAsNiArMTQ3OSw3IEBAIHN0YXRpYyBpbnQgYXJtX3NtbXVfYWRkX2RldmljZShzdHJ1Y3QgZGV2
aWNlICpkZXYpCiAJc3RydWN0IGFybV9zbW11X2RldmljZSAqc21tdTsKIAlzdHJ1Y3QgYXJtX3Nt
bXVfbWFzdGVyX2NmZyAqY2ZnOwogCXN0cnVjdCBpb21tdV9md3NwZWMgKmZ3c3BlYyA9IGRldl9p
b21tdV9md3NwZWNfZ2V0KGRldik7CisJY29uc3Qgc3RydWN0IGFybV9zbW11X2NsaWVudF9tYXRj
aF9kYXRhICpjbGllbnQ7CiAJaW50IGksIHJldDsKIAogCWlmICh1c2luZ19sZWdhY3lfYmluZGlu
ZykgewpAQCAtMTUxMiw2ICsxNTQyLDExIEBAIHN0YXRpYyBpbnQgYXJtX3NtbXVfYWRkX2Rldmlj
ZShzdHJ1Y3QgZGV2aWNlICpkZXYpCiAJZGV2aWNlX2xpbmtfYWRkKGRldiwgc21tdS0+ZGV2LAog
CQkJRExfRkxBR19QTV9SVU5USU1FIHwgRExfRkxBR19BVVRPUkVNT1ZFX1NVUFBMSUVSKTsKIAor
CWNsaWVudCA9IGFybV9zbW11X2NsaWVudF9kYXRhKGRldik7CisKKwlpZiAoY2xpZW50ICYmIGNs
aWVudC0+ZGlyZWN0X21hcHBpbmcpCisJCWlvbW11X3JlcXVlc3RfZG1fZm9yX2RldihkZXYpOwor
CiAJcmV0dXJuIDA7CiAKIG91dF9jZmdfZnJlZToKLS0gCjIuNy40CgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpGcmVlZHJlbm8gbWFpbGluZyBsaXN0CkZy
ZWVkcmVub0BsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9mcmVlZHJlbm8=

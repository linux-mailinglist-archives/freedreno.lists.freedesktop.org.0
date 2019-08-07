Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6181B855B3
	for <lists+freedreno@lfdr.de>; Thu,  8 Aug 2019 00:21:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29ECB6E772;
	Wed,  7 Aug 2019 22:21:58 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from smtp.codeaurora.org (smtp.codeaurora.org [198.145.29.96])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 637106E775
 for <freedreno@lists.freedesktop.org>; Wed,  7 Aug 2019 22:21:56 +0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
 id 0477660A97; Wed,  7 Aug 2019 22:21:50 +0000 (UTC)
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
 by smtp.codeaurora.org (Postfix) with ESMTPSA id D67C46090F;
 Wed,  7 Aug 2019 22:21:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org D67C46090F
From: Jordan Crouse <jcrouse@codeaurora.org>
To: freedreno@lists.freedesktop.org
Date: Wed,  7 Aug 2019 16:21:40 -0600
Message-Id: <1565216500-28506-3-git-send-email-jcrouse@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1565216500-28506-1-git-send-email-jcrouse@codeaurora.org>
References: <1565216500-28506-1-git-send-email-jcrouse@codeaurora.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1565216516;
 bh=V2MOW7b4CUVhygGGVaa1wzt2YduOq9ESSFH7yL59gh0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=HSBjfd8LLORFVD8v0C15o+aLxNsqBegYnvUQfelCxcuF+gTjYqcDWhSUyr/iOAGVs
 U7H8L63/0BBKZpTRboLPW9NWdpml8svfTuExtVuVyPE7myE6tK+4UmDQF7WmDNAa1B
 hBP7J4A+vtdi7UsymgeOWEzRNn7HEhK8FC0wMmnM=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1565216508;
 bh=V2MOW7b4CUVhygGGVaa1wzt2YduOq9ESSFH7yL59gh0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YCBPHDtUPurdyKZZfpBRRfq/JJw9kwWNNS2y/AGWUNciNkNOSznkrzR2oOGovZ5N0
 ReynarRaHNZmERQJcmNSSypbBOAIv5Gt3CjPg1cjyNkCP2f1goXjghA4j+VyOHrCdX
 djOwH/NDrReRX7RKsXlGL58MJyDoTAApdxp57ado=
X-Mailman-Original-Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 dmarc=none (p=none dis=none)
 header.from=codeaurora.org
X-Mailman-Original-Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 spf=none
 smtp.mailfrom=jcrouse@codeaurora.org
Subject: [Freedreno] [PATCH v3 2/2] iommu/arm-smmu: Add support for Adreno
 GPU pagetable formats
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
Cc: Will Deacon <will@kernel.org>, jean-philippe.brucker@arm.com,
 linux-arm-msm@vger.kernel.org, Joerg Roedel <joro@8bytes.org>,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 robin.murphy@arm.com, linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

QWRkIHN1cHBvcnQgZm9yIGFuIEFkcmVubyBHUFUgdmFyaWFudCBvZiB0aGUgYXJtLXNtbXUgZGV2
aWNlIHRvIGVuYWJsZQphIHNwZWNpYWwgcGFnZXRhYmxlIGZvcm1hdCB0aGF0IGVuYWJsZXMgVFRC
UjEgYW5kIGxlYXZlcyBUVEJSMCBmcmVlCnRvIGJlIHN3aXRjaGVkIGJ5IHRoZSBHUFUgaGFyZHdh
cmUuCgpTaWduZWQtb2ZmLWJ5OiBKb3JkYW4gQ3JvdXNlIDxqY3JvdXNlQGNvZGVhdXJvcmEub3Jn
PgotLS0KCiBkcml2ZXJzL2lvbW11L2FybS1zbW11LmMgfCA4ICsrKysrKystCiAxIGZpbGUgY2hh
bmdlZCwgNyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9pb21tdS9hcm0tc21tdS5jIGIvZHJpdmVycy9pb21tdS9hcm0tc21tdS5jCmluZGV4IGFhMDY0
OTguLjEyOWFjODMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvaW9tbXUvYXJtLXNtbXUuYworKysgYi9k
cml2ZXJzL2lvbW11L2FybS1zbW11LmMKQEAgLTEyNCw2ICsxMjQsNyBAQCBlbnVtIGFybV9zbW11
X2ltcGxlbWVudGF0aW9uIHsKIAlBUk1fTU1VNTAwLAogCUNBVklVTV9TTU1VVjIsCiAJUUNPTV9T
TU1VVjIsCisJQURSRU5PX1NNTVVWMiwKIH07CiAKIHN0cnVjdCBhcm1fc21tdV9zMmNyIHsKQEAg
LTgzMiw3ICs4MzMsMTAgQEAgc3RhdGljIGludCBhcm1fc21tdV9pbml0X2RvbWFpbl9jb250ZXh0
KHN0cnVjdCBpb21tdV9kb21haW4gKmRvbWFpbiwKIAkJaWFzID0gc21tdS0+dmFfc2l6ZTsKIAkJ
b2FzID0gc21tdS0+aXBhX3NpemU7CiAJCWlmIChjZmctPmZtdCA9PSBBUk1fU01NVV9DVFhfRk1U
X0FBUkNINjQpIHsKLQkJCWZtdCA9IEFSTV82NF9MUEFFX1MxOworCQkJaWYgKHNtbXUtPm1vZGVs
ID09IEFEUkVOT19TTU1VVjIpCisJCQkJZm10ID0gQVJNX0FEUkVOT19HUFVfTFBBRTsKKwkJCWVs
c2UKKwkJCQlmbXQgPSBBUk1fNjRfTFBBRV9TMTsKIAkJfSBlbHNlIGlmIChjZmctPmZtdCA9PSBB
Uk1fU01NVV9DVFhfRk1UX0FBUkNIMzJfTCkgewogCQkJZm10ID0gQVJNXzMyX0xQQUVfUzE7CiAJ
CQlpYXMgPSBtaW4oaWFzLCAzMlVMKTsKQEAgLTIwMzAsNiArMjAzNCw3IEBAIEFSTV9TTU1VX01B
VENIX0RBVEEoYXJtX21tdTQwMSwgQVJNX1NNTVVfVjFfNjRLLCBHRU5FUklDX1NNTVUpOwogQVJN
X1NNTVVfTUFUQ0hfREFUQShhcm1fbW11NTAwLCBBUk1fU01NVV9WMiwgQVJNX01NVTUwMCk7CiBB
Uk1fU01NVV9NQVRDSF9EQVRBKGNhdml1bV9zbW11djIsIEFSTV9TTU1VX1YyLCBDQVZJVU1fU01N
VVYyKTsKIEFSTV9TTU1VX01BVENIX0RBVEEocWNvbV9zbW11djIsIEFSTV9TTU1VX1YyLCBRQ09N
X1NNTVVWMik7CitBUk1fU01NVV9NQVRDSF9EQVRBKGFkcmVub19zbW11djIsIEFSTV9TTU1VX1Yy
LCBBRFJFTk9fU01NVVYyKTsKIAogc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgYXJt
X3NtbXVfb2ZfbWF0Y2hbXSA9IHsKIAl7IC5jb21wYXRpYmxlID0gImFybSxzbW11LXYxIiwgLmRh
dGEgPSAmc21tdV9nZW5lcmljX3YxIH0sCkBAIC0yMDM5LDYgKzIwNDQsNyBAQCBzdGF0aWMgY29u
c3Qgc3RydWN0IG9mX2RldmljZV9pZCBhcm1fc21tdV9vZl9tYXRjaFtdID0gewogCXsgLmNvbXBh
dGlibGUgPSAiYXJtLG1tdS01MDAiLCAuZGF0YSA9ICZhcm1fbW11NTAwIH0sCiAJeyAuY29tcGF0
aWJsZSA9ICJjYXZpdW0sc21tdS12MiIsIC5kYXRhID0gJmNhdml1bV9zbW11djIgfSwKIAl7IC5j
b21wYXRpYmxlID0gInFjb20sc21tdS12MiIsIC5kYXRhID0gJnFjb21fc21tdXYyIH0sCisJeyAu
Y29tcGF0aWJsZSA9ICJxY29tLGFkcmVuby1zbW11LXYyIiwgLmRhdGEgPSAmYWRyZW5vX3NtbXV2
MiB9LAogCXsgfSwKIH07CiAKLS0gCjIuNy40CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpGcmVlZHJlbm8gbWFpbGluZyBsaXN0CkZyZWVkcmVub0BsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9mcmVlZHJlbm8=

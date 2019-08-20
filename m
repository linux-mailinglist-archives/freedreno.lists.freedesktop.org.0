Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DC26968E8
	for <lists+freedreno@lfdr.de>; Tue, 20 Aug 2019 21:06:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BD8D6E857;
	Tue, 20 Aug 2019 19:06:46 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from smtp.codeaurora.org (smtp.codeaurora.org [198.145.29.96])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1267B6E857
 for <freedreno@lists.freedesktop.org>; Tue, 20 Aug 2019 19:06:45 +0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
 id F14EA61156; Tue, 20 Aug 2019 19:06:44 +0000 (UTC)
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
 by smtp.codeaurora.org (Postfix) with ESMTPSA id A27D66115D;
 Tue, 20 Aug 2019 19:06:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org A27D66115D
From: Jordan Crouse <jcrouse@codeaurora.org>
To: freedreno@lists.freedesktop.org
Date: Tue, 20 Aug 2019 13:06:30 -0600
Message-Id: <1566327992-362-6-git-send-email-jcrouse@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1566327992-362-1-git-send-email-jcrouse@codeaurora.org>
References: <1566327992-362-1-git-send-email-jcrouse@codeaurora.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1566328004;
 bh=OnE1CRltdThiSh478OmHpFjhtqzYCN7pRfxgwT3K5Vs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=IgFkJdL0ALFRYYrWGproQZN4BP4rNXrgT0RY8B79h72JQ+sULJ6FfqUF2RNG/gX/3
 lllx+JQXaHzpnVfSVyZoXp6rbwz+5Bkr8/no/PrqNpNATtAVCy9GOcBIdfhyy2GlV2
 Lq/pB9YInwIuZoDUHMrwosVAtDV50gJYZn9CQ3jM=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1566328004;
 bh=OnE1CRltdThiSh478OmHpFjhtqzYCN7pRfxgwT3K5Vs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=IgFkJdL0ALFRYYrWGproQZN4BP4rNXrgT0RY8B79h72JQ+sULJ6FfqUF2RNG/gX/3
 lllx+JQXaHzpnVfSVyZoXp6rbwz+5Bkr8/no/PrqNpNATtAVCy9GOcBIdfhyy2GlV2
 Lq/pB9YInwIuZoDUHMrwosVAtDV50gJYZn9CQ3jM=
X-Mailman-Original-Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 dmarc=none (p=none dis=none)
 header.from=codeaurora.org
X-Mailman-Original-Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 spf=none
 smtp.mailfrom=jcrouse@codeaurora.org
Subject: [Freedreno] [PATCH 5/7] iommu/arm-smmu: Support
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
Cc: linux-arm-msm@vger.kernel.org, Joerg Roedel <joro@8bytes.org>,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Robin Murphy <robin.murphy@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

U3VwcG9ydCB0aGUgRE9NQUlOX0FUVFJfU1BMSVRfVEFCTEVTIGF0dHJpYnV0ZSB0byBsZXQgdGhl
IGxlYWYgZHJpdmVyCmtub3cgaWYgc3BsaXQgcGFnZXRhYmxlcyBhcmUgZW5hYmxlZCBmb3IgdGhl
IGRvbWFpbi4KClNpZ25lZC1vZmYtYnk6IEpvcmRhbiBDcm91c2UgPGpjcm91c2VAY29kZWF1cm9y
YS5vcmc+Ci0tLQoKIGRyaXZlcnMvaW9tbXUvYXJtLXNtbXUuYyB8IDMgKysrCiAxIGZpbGUgY2hh
bmdlZCwgMyBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9pb21tdS9hcm0tc21t
dS5jIGIvZHJpdmVycy9pb21tdS9hcm0tc21tdS5jCmluZGV4IDNmNDFjZjcuLjZhNTEyZmYgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvaW9tbXUvYXJtLXNtbXUuYworKysgYi9kcml2ZXJzL2lvbW11L2Fy
bS1zbW11LmMKQEAgLTE0NDIsNiArMTQ0Miw5IEBAIHN0YXRpYyBpbnQgYXJtX3NtbXVfZG9tYWlu
X2dldF9hdHRyKHN0cnVjdCBpb21tdV9kb21haW4gKmRvbWFpbiwKIAkJY2FzZSBET01BSU5fQVRU
Ul9ORVNUSU5HOgogCQkJKihpbnQgKilkYXRhID0gKHNtbXVfZG9tYWluLT5zdGFnZSA9PSBBUk1f
U01NVV9ET01BSU5fTkVTVEVEKTsKIAkJCXJldHVybiAwOworCQljYXNlIERPTUFJTl9BVFRSX1NQ
TElUX1RBQkxFUzoKKwkJCSooaW50ICopZGF0YSA9ICEhKHNtbXVfZG9tYWluLT5zcGxpdF9wYWdl
dGFibGVzKTsKKwkJCXJldHVybiAwOwogCQlkZWZhdWx0OgogCQkJcmV0dXJuIC1FTk9ERVY7CiAJ
CX0KLS0gCjIuNy40CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpGcmVlZHJlbm8gbWFpbGluZyBsaXN0CkZyZWVkcmVub0BsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9mcmVlZHJl
bm8=

Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EDE1D968E7
	for <lists+freedreno@lfdr.de>; Tue, 20 Aug 2019 21:06:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A98586E855;
	Tue, 20 Aug 2019 19:06:44 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from smtp.codeaurora.org (smtp.codeaurora.org [198.145.29.96])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6C646E856
 for <freedreno@lists.freedesktop.org>; Tue, 20 Aug 2019 19:06:43 +0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
 id D30306115A; Tue, 20 Aug 2019 19:06:43 +0000 (UTC)
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
 by smtp.codeaurora.org (Postfix) with ESMTPSA id D68FD60FE9;
 Tue, 20 Aug 2019 19:06:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org D68FD60FE9
From: Jordan Crouse <jcrouse@codeaurora.org>
To: freedreno@lists.freedesktop.org
Date: Tue, 20 Aug 2019 13:06:29 -0600
Message-Id: <1566327992-362-5-git-send-email-jcrouse@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1566327992-362-1-git-send-email-jcrouse@codeaurora.org>
References: <1566327992-362-1-git-send-email-jcrouse@codeaurora.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1566328003;
 bh=+6w/KwG2LYGoBrIRsU609ZfylF5tzSCWZ9Tuvd8PIfs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=BgVEfFgGDG1IbPnat3dicEvXT3N8r9lx6wQF57rhdBUnbG5G5hq1ZKmorgALQrxsy
 nUYRvmxx13e0XjG8BBLAPNfH1T5imBQXTzs+mrbjA8rDQwBgjLFeYTKNWBd7m2w4ic
 Jr0rr01UC1noThxVjIk7Is0m/T/nBSY8plnEHsYs=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1566328003;
 bh=+6w/KwG2LYGoBrIRsU609ZfylF5tzSCWZ9Tuvd8PIfs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=BgVEfFgGDG1IbPnat3dicEvXT3N8r9lx6wQF57rhdBUnbG5G5hq1ZKmorgALQrxsy
 nUYRvmxx13e0XjG8BBLAPNfH1T5imBQXTzs+mrbjA8rDQwBgjLFeYTKNWBd7m2w4ic
 Jr0rr01UC1noThxVjIk7Is0m/T/nBSY8plnEHsYs=
X-Mailman-Original-Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 dmarc=none (p=none dis=none)
 header.from=codeaurora.org
X-Mailman-Original-Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 spf=none
 smtp.mailfrom=jcrouse@codeaurora.org
Subject: [Freedreno] [PATCH 4/7] iommu: Add DOMAIN_ATTR_SPLIT_TABLES
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
Cc: linux-arm-msm@vger.kernel.org, iommu@lists.linux-foundation.org,
 Joerg Roedel <joro@8bytes.org>, linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

QWRkIGEgbmV3IGF0dHJpYnV0ZSB0byBxdWVyeSB0aGUgc3RhdGUgb2Ygc3BsaXQgcGFnZXRhYmxl
cyBmb3IgdGhlIGRvbWFpbi4KClNpZ25lZC1vZmYtYnk6IEpvcmRhbiBDcm91c2UgPGpjcm91c2VA
Y29kZWF1cm9yYS5vcmc+Ci0tLQoKIGluY2x1ZGUvbGludXgvaW9tbXUuaCB8IDEgKwogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCgpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9pb21t
dS5oIGIvaW5jbHVkZS9saW51eC9pb21tdS5oCmluZGV4IGZkYzM1NWMuLmIwNmRiNmMgMTAwNjQ0
Ci0tLSBhL2luY2x1ZGUvbGludXgvaW9tbXUuaAorKysgYi9pbmNsdWRlL2xpbnV4L2lvbW11LmgK
QEAgLTEyNSw2ICsxMjUsNyBAQCBlbnVtIGlvbW11X2F0dHIgewogCURPTUFJTl9BVFRSX0ZTTF9Q
QU1VVjEsCiAJRE9NQUlOX0FUVFJfTkVTVElORywJLyogdHdvIHN0YWdlcyBvZiB0cmFuc2xhdGlv
biAqLwogCURPTUFJTl9BVFRSX0RNQV9VU0VfRkxVU0hfUVVFVUUsCisJRE9NQUlOX0FUVFJfU1BM
SVRfVEFCTEVTLAogCURPTUFJTl9BVFRSX01BWCwKIH07CiAKLS0gCjIuNy40CgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpGcmVlZHJlbm8gbWFpbGluZyBs
aXN0CkZyZWVkcmVub0BsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9mcmVlZHJlbm8=

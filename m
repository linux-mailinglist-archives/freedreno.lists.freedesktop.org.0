Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 401B7968E4
	for <lists+freedreno@lfdr.de>; Tue, 20 Aug 2019 21:06:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B159F6E853;
	Tue, 20 Aug 2019 19:06:43 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from smtp.codeaurora.org (smtp.codeaurora.org [198.145.29.96])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5AE26E853
 for <freedreno@lists.freedesktop.org>; Tue, 20 Aug 2019 19:06:42 +0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
 id D144160F3F; Tue, 20 Aug 2019 19:06:41 +0000 (UTC)
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
 by smtp.codeaurora.org (Postfix) with ESMTPSA id C9FEB60E40;
 Tue, 20 Aug 2019 19:06:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org C9FEB60E40
From: Jordan Crouse <jcrouse@codeaurora.org>
To: freedreno@lists.freedesktop.org
Date: Tue, 20 Aug 2019 13:06:27 -0600
Message-Id: <1566327992-362-3-git-send-email-jcrouse@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1566327992-362-1-git-send-email-jcrouse@codeaurora.org>
References: <1566327992-362-1-git-send-email-jcrouse@codeaurora.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1566328002;
 bh=zzjtL5wslsQS8yWsr2CKph8GttmF/LKM4t/Yy33PQbM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=JmGGSHOGPovm0LqZtDwvxCWxW+kXqIdyBZeTz8qZK9g7OlcX1ZUWJAhzeOIweqfkO
 XlV2UzEXl5V6DDYEix+Z3dKV9mzm5uj3gkCfedr2nbksxAa/A7uCElMOPWiXDW0ExQ
 SD7/BFxrRmppyV76P9SUo1xRdmVNyjYguVR4/qVw=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1566328001;
 bh=zzjtL5wslsQS8yWsr2CKph8GttmF/LKM4t/Yy33PQbM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Qg0TuwlYiNw6G05Dy5nOOSnh4PuCp/NgTjhzAREkbQU0ac+BrGd9PGFZygmo85kQe
 C5rXdpyWGH4ojSU1ynbdTZOJweG81C5ZS5HeLIPtAFFh9Xb5U7dEGDwMv5646bE3CJ
 bwi9cwYDHojU/JleqC8XYl2s89+adAx2Fa7YPbTA=
X-Mailman-Original-Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 dmarc=none (p=none dis=none)
 header.from=codeaurora.org
X-Mailman-Original-Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 spf=none
 smtp.mailfrom=jcrouse@codeaurora.org
Subject: [Freedreno] [PATCH 2/7] dt-bindings: arm-smmu: Add Adreno GPU
 variant
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Joerg Roedel <joro@8bytes.org>,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 Rob Herring <robh+dt@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

QWRkIGEgY29tcGF0aWJsZSBzdHJpbmcgdG8gaWRlbnRpZnkgU01NVXMgdGhhdCBhcmUgYXR0YWNo
ZWQKdG8gQWRyZW5vIEdQVSBkZXZpY2VzIHRoYXQgd2lzaCB0byBzdXBwb3J0IHNwbGl0IHBhZ2V0
YWJsZXMuCgpTaWduZWQtb2ZmLWJ5OiBKb3JkYW4gQ3JvdXNlIDxqY3JvdXNlQGNvZGVhdXJvcmEu
b3JnPgotLS0KCiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaW9tbXUvYXJtLHNt
bXUudHh0IHwgNyArKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspCgpkaWZm
IC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2lvbW11L2FybSxzbW11
LnR4dCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9pb21tdS9hcm0sc21tdS50
eHQKaW5kZXggMzEzM2YzYi4uM2IwNzg5NiAxMDA2NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL2lvbW11L2FybSxzbW11LnR4dAorKysgYi9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvaW9tbXUvYXJtLHNtbXUudHh0CkBAIC0xOCw2ICsxOCw3IEBAIGNv
bmRpdGlvbnMuCiAgICAgICAgICAgICAgICAgICAgICAgICAiYXJtLG1tdS01MDAiCiAgICAgICAg
ICAgICAgICAgICAgICAgICAiY2F2aXVtLHNtbXUtdjIiCiAgICAgICAgICAgICAgICAgICAgICAg
ICAicWNvbSxzbW11LXYyIgorCQkJInFjb20sYWRyZW5vLXNtbXUtdjIiCiAKICAgICAgICAgICAg
ICAgICAgIGRlcGVuZGluZyBvbiB0aGUgcGFydGljdWxhciBpbXBsZW1lbnRhdGlvbiBhbmQvb3Ig
dGhlCiAgICAgICAgICAgICAgICAgICB2ZXJzaW9uIG9mIHRoZSBhcmNoaXRlY3R1cmUgaW1wbGVt
ZW50ZWQuCkBAIC0zMSw2ICszMiwxMiBAQCBjb25kaXRpb25zLgogICAgICAgICAgICAgICAgICAg
YXMgYmVsb3csIFNvQy1zcGVjaWZpYyBjb21wYXRpYmxlczoKICAgICAgICAgICAgICAgICAgICJx
Y29tLHNkbTg0NS1zbW11LTUwMCIsICJhcm0sbW11LTUwMCIKIAorCQkgICJxY29tLGFkcmVuby1z
bW11LXYyIiBpcyBhIHNwZWNpYWwgaW1wbGVtZW50YXRpb24gZm9yCisJCSAgU01NVSBkZXZpY2Vz
IGF0dGFjaGVkIHRvIHRoZSBBZHJlbm8gR1BVIG9uIFFjb20gZGV2aWNlcy4KKwkJICBJZiBzZWxl
Y3RlZCwgdGhpcyB3aWxsIGVuYWJsZSBzcGxpdCBwYWdldGFibGUgKFRUQlIxKQorCQkgIHN1cHBv
cnQuIE9ubHkgdXNlIHRoaXMgaWYgdGhlIEdQVSB0YXJnZXQgaXMgY2FwYWJsZSBvZgorCQkgIHN1
cHBvcnRpbmcgNjQgYml0IGFkZHJlc3Nlcy4KKwogLSByZWcgICAgICAgICAgIDogQmFzZSBhZGRy
ZXNzIGFuZCBzaXplIG9mIHRoZSBTTU1VLgogCiAtICNnbG9iYWwtaW50ZXJydXB0cyA6IFRoZSBu
dW1iZXIgb2YgZ2xvYmFsIGludGVycnVwdHMgZXhwb3NlZCBieSB0aGUKLS0gCjIuNy40CgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpGcmVlZHJlbm8gbWFp
bGluZyBsaXN0CkZyZWVkcmVub0BsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9mcmVlZHJlbm8=

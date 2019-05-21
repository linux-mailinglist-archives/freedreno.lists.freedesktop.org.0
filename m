Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5300125528
	for <lists+freedreno@lfdr.de>; Tue, 21 May 2019 18:14:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 053AF8945B;
	Tue, 21 May 2019 16:14:32 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from smtp.codeaurora.org (smtp.codeaurora.org [198.145.29.96])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE0968945B
 for <freedreno@lists.freedesktop.org>; Tue, 21 May 2019 16:14:31 +0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
 id 5B10361A1D; Tue, 21 May 2019 16:14:16 +0000 (UTC)
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
 by smtp.codeaurora.org (Postfix) with ESMTPSA id E0AB06118D;
 Tue, 21 May 2019 16:14:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org E0AB06118D
From: Jordan Crouse <jcrouse@codeaurora.org>
To: freedreno@lists.freedesktop.org
Date: Tue, 21 May 2019 10:13:52 -0600
Message-Id: <1558455243-32746-5-git-send-email-jcrouse@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1558455243-32746-1-git-send-email-jcrouse@codeaurora.org>
References: <1558455243-32746-1-git-send-email-jcrouse@codeaurora.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1558455271;
 bh=3x0zc3WxCeO54aoJuwmbDxEraXdWNxdZfplRLlNxmIA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Li99mglejj3VbvXPGJqrtC6SGnej24vpxtnQn1CAqZhafVGukISgYQ8eY75Q4bF7L
 8z1z9/EO6gRp5SxUL5WVD1QGhZYRBj8Wan+itg9kyNdL87wwG+uUQsAlZFw18B/I2I
 zxqr6lHJw+aSP0X2AM1E9zHb59sOlOqS4gbl2pFs=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1558455255;
 bh=3x0zc3WxCeO54aoJuwmbDxEraXdWNxdZfplRLlNxmIA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YBu+P3VVUo2YGJ1LgV4StfL0acSXyC2goopPHgncZ66a00FIYX5t1f/vAmW0x3tTV
 ereZtP5GPm3Zb1sC5ZW5Pck5HR++4oRqOJtxyb6b7MY0Bl47b/OMo25iRriFktc7Nu
 5BYP7Lct1hpcDS4JJcl3+3bDMBXJ9ycfkKTqQusk=
X-Mailman-Original-Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 dmarc=none (p=none dis=none)
 header.from=codeaurora.org
X-Mailman-Original-Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 spf=none
 smtp.mailfrom=jcrouse@codeaurora.org
Subject: [Freedreno] [PATCH v2 04/15] iommu: Add DOMAIN_ATTR_PTBASE
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
 Joerg Roedel <joro@8bytes.org>, dianders@chromium.org,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 hoegsberg@google.com
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

QWRkIGFuIGF0dHJpYnV0ZSB0byByZXR1cm4gdGhlIGJhc2UgYWRkcmVzcyBvZiB0aGUgcGFnZXRh
YmxlLiBUaGlzIGlzIHVzZWQKYnkgYXV4aWxpYXJ5IGRvbWFpbnMgZnJvbSBhcm0tc21tdSB0byBy
ZXR1cm4gdGhlIGFkZHJlc3Mgb2YgdGhlIHBhZ2V0YWJsZQp0byB0aGUgbGVhZiBkcml2ZXIgc28g
dGhhdCBpdCBjYW4gc2V0IHRoZSBhcHByb3ByaWF0ZSBwYWdldGFibGUgdGhyb3VnaAppdCdzIG93
biBtZWFucy4KClNpZ25lZC1vZmYtYnk6IEpvcmRhbiBDcm91c2UgPGpjcm91c2VAY29kZWF1cm9y
YS5vcmc+Ci0tLQoKIGluY2x1ZGUvbGludXgvaW9tbXUuaCB8IDEgKwogMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspCgpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9pb21tdS5oIGIvaW5j
bHVkZS9saW51eC9pb21tdS5oCmluZGV4IDIwNGFjZDguLjIyNTJlZGMgMTAwNjQ0Ci0tLSBhL2lu
Y2x1ZGUvbGludXgvaW9tbXUuaAorKysgYi9pbmNsdWRlL2xpbnV4L2lvbW11LmgKQEAgLTEyOSw2
ICsxMjksNyBAQCBlbnVtIGlvbW11X2F0dHIgewogCURPTUFJTl9BVFRSX05FU1RJTkcsCS8qIHR3
byBzdGFnZXMgb2YgdHJhbnNsYXRpb24gKi8KIAlET01BSU5fQVRUUl9ETUFfVVNFX0ZMVVNIX1FV
RVVFLAogCURPTUFJTl9BVFRSX1NQTElUX1RBQkxFUywKKwlET01BSU5fQVRUUl9QVEJBU0UsCiAJ
RE9NQUlOX0FUVFJfTUFYLAogfTsKIAotLSAKMi43LjQKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkZyZWVkcmVubyBtYWlsaW5nIGxpc3QKRnJlZWRyZW5v
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2ZyZWVkcmVubw==

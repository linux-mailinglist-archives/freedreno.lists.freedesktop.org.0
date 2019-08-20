Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D9A18968E6
	for <lists+freedreno@lfdr.de>; Tue, 20 Aug 2019 21:06:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C01B6E856;
	Tue, 20 Aug 2019 19:06:44 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from smtp.codeaurora.org (smtp.codeaurora.org [198.145.29.96])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 254916E853
 for <freedreno@lists.freedesktop.org>; Tue, 20 Aug 2019 19:06:43 +0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
 id 09A3B609CD; Tue, 20 Aug 2019 19:06:42 +0000 (UTC)
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
 by smtp.codeaurora.org (Postfix) with ESMTPSA id D662660F3B;
 Tue, 20 Aug 2019 19:06:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org D662660F3B
From: Jordan Crouse <jcrouse@codeaurora.org>
To: freedreno@lists.freedesktop.org
Date: Tue, 20 Aug 2019 13:06:28 -0600
Message-Id: <1566327992-362-4-git-send-email-jcrouse@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1566327992-362-1-git-send-email-jcrouse@codeaurora.org>
References: <1566327992-362-1-git-send-email-jcrouse@codeaurora.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1566328003;
 bh=yf4KbiMcwWuAOC3/YzyfVZGuYYAc192j4/wc6uDR1eE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ENZeW8wEm2x/+0HwKwiCPLFSbU8UYDtgcMdvAYT8LQLf9Nt118c24rn2klDoRXXlu
 47DC3JBGW6aiQdY/aQCJAsV0C3llohlVQVX9pRPoBADYDp7ZfvMK+1sS2TaHGFepZD
 UGdvEzwCA0rZXG5dX+YD7bSEcSOiF6+kyAFlZepQ=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1566328002;
 bh=yf4KbiMcwWuAOC3/YzyfVZGuYYAc192j4/wc6uDR1eE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=V5eq3529o9GLKf4CR+s250JMtUhyKHm+uRJ+x+QqAeY38tMkk0gtU3WVq/VhgTNcx
 WE+Opu/0m9nG63xUwRt9QhUJ3PCMQk6u+3Jd9imYe0S/7XMQGRWKbY60/ab9KW33Wr
 QPPGaV3ihwUQGZ5rdTmc/TRU8+sVn3MYiI5qVD64=
X-Mailman-Original-Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 dmarc=none (p=none dis=none)
 header.from=codeaurora.org
X-Mailman-Original-Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 spf=none
 smtp.mailfrom=jcrouse@codeaurora.org
Subject: [Freedreno] [PATCH 3/7] iommu/arm-smmu: Add a SMMU variant for the
 Adreno GPU
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

QWRkIGEgU01NVSBtb2RlbCBmb3IgdGhlIEFkcmVubyBHUFUgYW5kIHVzZSBpdCB0byBlbmFibGUg
c3BsaXQKcGFnZXRhYmxlIHN1cHBvcnQgaWYgdGhlIGNvbmRpdGlvbnMgYXJlIHJpZ2h0LgoKU2ln
bmVkLW9mZi1ieTogSm9yZGFuIENyb3VzZSA8amNyb3VzZUBjb2RlYXVyb3JhLm9yZz4KLS0tCgog
ZHJpdmVycy9pb21tdS9hcm0tc21tdS1pbXBsLmMgfCAxNSArKysrKysrKysrKysrKysKIGRyaXZl
cnMvaW9tbXUvYXJtLXNtbXUuYyAgICAgIHwgIDIgKysKIGRyaXZlcnMvaW9tbXUvYXJtLXNtbXUu
aCAgICAgIHwgIDEgKwogMyBmaWxlcyBjaGFuZ2VkLCAxOCBpbnNlcnRpb25zKCspCgpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9pb21tdS9hcm0tc21tdS1pbXBsLmMgYi9kcml2ZXJzL2lvbW11L2FybS1z
bW11LWltcGwuYwppbmRleCAzZjg4Y2QwLi41ZDE5N2RkIDEwMDY0NAotLS0gYS9kcml2ZXJzL2lv
bW11L2FybS1zbW11LWltcGwuYworKysgYi9kcml2ZXJzL2lvbW11L2FybS1zbW11LWltcGwuYwpA
QCAtMTQ3LDYgKzE0NywxOCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGFybV9zbW11X2ltcGwgYXJt
X21tdTUwMF9pbXBsID0gewogCS5yZXNldCA9IGFybV9tbXU1MDBfcmVzZXQsCiB9OwogCitzdGF0
aWMgaW50IHFjb21fYWRyZW5vX2luaXRfY29udGV4dChzdHJ1Y3QgYXJtX3NtbXVfZG9tYWluICpz
bW11X2RvbWFpbikKK3sKKwlpZiAoc21tdV9kb21haW4tPnN0YWdlID09IEFSTV9TTU1VX0RPTUFJ
Tl9TMSAmJgorCQlzbW11X2RvbWFpbi0+Y2ZnLmZtdCA9PSBBUk1fU01NVV9DVFhfRk1UX0FBUkNI
NjQpCisJCXNtbXVfZG9tYWluLT5zcGxpdF9wYWdldGFibGVzID0gdHJ1ZTsKKworCXJldHVybiAw
OworfQorCitzdGF0aWMgY29uc3Qgc3RydWN0IGFybV9zbW11X2ltcGwgcWNvbV9hZHJlbm9faW1w
bCA9IHsKKwkuaW5pdF9jb250ZXh0ID0gcWNvbV9hZHJlbm9faW5pdF9jb250ZXh0LAorfTsKIAog
c3RydWN0IGFybV9zbW11X2RldmljZSAqYXJtX3NtbXVfaW1wbF9pbml0KHN0cnVjdCBhcm1fc21t
dV9kZXZpY2UgKnNtbXUpCiB7CkBAIC0xNjIsNiArMTc0LDkgQEAgc3RydWN0IGFybV9zbW11X2Rl
dmljZSAqYXJtX3NtbXVfaW1wbF9pbml0KHN0cnVjdCBhcm1fc21tdV9kZXZpY2UgKnNtbXUpCiAJ
CWJyZWFrOwogCWNhc2UgQ0FWSVVNX1NNTVVWMjoKIAkJcmV0dXJuIGNhdml1bV9zbW11X2ltcGxf
aW5pdChzbW11KTsKKwljYXNlIFFDT01fQURSRU5PX1NNTVVWMjoKKwkJc21tdS0+aW1wbCA9ICZx
Y29tX2FkcmVub19pbXBsOworCQlicmVhazsKIAlkZWZhdWx0OgogCQlicmVhazsKIAl9CmRpZmYg
LS1naXQgYS9kcml2ZXJzL2lvbW11L2FybS1zbW11LmMgYi9kcml2ZXJzL2lvbW11L2FybS1zbW11
LmMKaW5kZXggMzllODFlZi4uM2Y0MWNmNyAxMDA2NDQKLS0tIGEvZHJpdmVycy9pb21tdS9hcm0t
c21tdS5jCisrKyBiL2RyaXZlcnMvaW9tbXUvYXJtLXNtbXUuYwpAQCAtMTg1OCw2ICsxODU4LDcg
QEAgQVJNX1NNTVVfTUFUQ0hfREFUQShhcm1fbW11NDAxLCBBUk1fU01NVV9WMV82NEssIEdFTkVS
SUNfU01NVSk7CiBBUk1fU01NVV9NQVRDSF9EQVRBKGFybV9tbXU1MDAsIEFSTV9TTU1VX1YyLCBB
Uk1fTU1VNTAwKTsKIEFSTV9TTU1VX01BVENIX0RBVEEoY2F2aXVtX3NtbXV2MiwgQVJNX1NNTVVf
VjIsIENBVklVTV9TTU1VVjIpOwogQVJNX1NNTVVfTUFUQ0hfREFUQShxY29tX3NtbXV2MiwgQVJN
X1NNTVVfVjIsIFFDT01fU01NVVYyKTsKK0FSTV9TTU1VX01BVENIX0RBVEEocWNvbV9hZHJlbm9f
c21tdXYyLCBBUk1fU01NVV9WMiwgUUNPTV9BRFJFTk9fU01NVVYyKTsKIAogc3RhdGljIGNvbnN0
IHN0cnVjdCBvZl9kZXZpY2VfaWQgYXJtX3NtbXVfb2ZfbWF0Y2hbXSA9IHsKIAl7IC5jb21wYXRp
YmxlID0gImFybSxzbW11LXYxIiwgLmRhdGEgPSAmc21tdV9nZW5lcmljX3YxIH0sCkBAIC0xODY3
LDYgKzE4NjgsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBhcm1fc21tdV9v
Zl9tYXRjaFtdID0gewogCXsgLmNvbXBhdGlibGUgPSAiYXJtLG1tdS01MDAiLCAuZGF0YSA9ICZh
cm1fbW11NTAwIH0sCiAJeyAuY29tcGF0aWJsZSA9ICJjYXZpdW0sc21tdS12MiIsIC5kYXRhID0g
JmNhdml1bV9zbW11djIgfSwKIAl7IC5jb21wYXRpYmxlID0gInFjb20sc21tdS12MiIsIC5kYXRh
ID0gJnFjb21fc21tdXYyIH0sCisJeyAuY29tcGF0aWJsZSA9ICJxY29tLGFkcmVuby1zbW11LXYy
IiwgLmRhdGEgPSAmcWNvbV9hZHJlbm9fc21tdXYyIH0sCiAJeyB9LAogfTsKIApkaWZmIC0tZ2l0
IGEvZHJpdmVycy9pb21tdS9hcm0tc21tdS5oIGIvZHJpdmVycy9pb21tdS9hcm0tc21tdS5oCmlu
ZGV4IDkxYTRlYjguLmU1YTJjYzggMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvaW9tbXUvYXJtLXNtbXUu
aAorKysgYi9kcml2ZXJzL2lvbW11L2FybS1zbW11LmgKQEAgLTIyMiw2ICsyMjIsNyBAQCBlbnVt
IGFybV9zbW11X2ltcGxlbWVudGF0aW9uIHsKIAlBUk1fTU1VNTAwLAogCUNBVklVTV9TTU1VVjIs
CiAJUUNPTV9TTU1VVjIsCisJUUNPTV9BRFJFTk9fU01NVVYyLAogfTsKIAogc3RydWN0IGFybV9z
bW11X2RldmljZSB7Ci0tIAoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KRnJlZWRyZW5vIG1haWxpbmcgbGlzdApGcmVlZHJlbm9AbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZnJlZWRyZW5v

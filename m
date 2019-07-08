Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 52DC2628D7
	for <lists+freedreno@lfdr.de>; Mon,  8 Jul 2019 21:01:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 187E16E046;
	Mon,  8 Jul 2019 19:01:01 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from smtp.codeaurora.org (smtp.codeaurora.org [198.145.29.96])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D44A56E047
 for <freedreno@lists.freedesktop.org>; Mon,  8 Jul 2019 19:00:59 +0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
 id BC2DA611FC; Mon,  8 Jul 2019 19:00:58 +0000 (UTC)
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
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 3F59660E40;
 Mon,  8 Jul 2019 19:00:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 3F59660E40
From: Jordan Crouse <jcrouse@codeaurora.org>
To: freedreno@lists.freedesktop.org
Date: Mon,  8 Jul 2019 13:00:47 -0600
Message-Id: <1562612447-19856-4-git-send-email-jcrouse@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1562612447-19856-1-git-send-email-jcrouse@codeaurora.org>
References: <1562612447-19856-1-git-send-email-jcrouse@codeaurora.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1562612459;
 bh=8vvsLWPcHr0znTAIRbRfTb5WuDfVnCumJ8bN1RXKkaU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=WCBItDyqdXQ80M9E9W6GK6F8HiOenmBMy9khHqj+UHTf1bVEVKH2STolV1x8ZzkRp
 ubmbSGE7TN9Y6LO+rWtkn1xf7oAMVPY/7icta+tV0M+6uK/16Vcn5phSInNFl3O9wj
 yZT6sC8ILmXaZzoc8ADGFpNJm2Qoj1aLxvnalEoQ=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1562612456;
 bh=8vvsLWPcHr0znTAIRbRfTb5WuDfVnCumJ8bN1RXKkaU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Upbw5W/djHsjIjuGf3gIhOy7HFDE4loB2ekFEU8qBMXVqNg4kaM4fLsyTssaxk5D1
 jHSu0mL/YhTYrNDb71e9+JvNqt7t87D7uj2fjYpvwVSQ3zTjPtmx0/wb2H8ffeXsmY
 92papmWE9htJ+GplCCwMzha46zOrNt6UtgY+Rvf0=
X-Mailman-Original-Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 dmarc=none (p=none dis=none)
 header.from=codeaurora.org
X-Mailman-Original-Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 spf=none
 smtp.mailfrom=jcrouse@codeaurora.org
Subject: [Freedreno] [RESEND PATCH v2 3/3] iommu/arm-smmu: Add support for
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
 Joerg Roedel <joro@8bytes.org>, dianders@chromium.org,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 hoegsberg@google.com, Robin Murphy <robin.murphy@arm.com>,
 Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
 baolu.lu@linux.intel.com
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

V2hlbiBET01BSU5fQVRUUl9TUExJVF9UQUJMRVMgaXMgc3BlY2lmaWVkIGZvciBwYXNzIEFSTV82
NF9MUEFFX1NQTElUX1MxCnRvIGlvX3BndGFibGVfb3BzIHRvIGFsbG9jYXRlIGFuZCBpbml0aWFs
aXplIFRUQlIwIGFuZCBUVEJSMSBwYWdldGFibGVzLgoKdjM6IE1vdmVkIGFsbCB0aGUgcGFnZXRh
YmxlIHNwZWNpZmljIHdvcmsgaW50byBpby1wZ3RhYmxlLWFybQppbiBhIHByZXZpb3VzIHBhdGNo
LgoKU2lnbmVkLW9mZi1ieTogSm9yZGFuIENyb3VzZSA8amNyb3VzZUBjb2RlYXVyb3JhLm9yZz4K
LS0tCgogZHJpdmVycy9pb21tdS9hcm0tc21tdS5jIHwgMTYgKysrKysrKysrKysrKysrLQogMSBm
aWxlIGNoYW5nZWQsIDE1IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQg
YS9kcml2ZXJzL2lvbW11L2FybS1zbW11LmMgYi9kcml2ZXJzL2lvbW11L2FybS1zbW11LmMKaW5k
ZXggNjUzYjZiMy4uN2E2YjRiYiAxMDA2NDQKLS0tIGEvZHJpdmVycy9pb21tdS9hcm0tc21tdS5j
CisrKyBiL2RyaXZlcnMvaW9tbXUvYXJtLXNtbXUuYwpAQCAtMjU3LDYgKzI1Nyw3IEBAIHN0cnVj
dCBhcm1fc21tdV9kb21haW4gewogCWJvb2wJCQkJbm9uX3N0cmljdDsKIAlzdHJ1Y3QgbXV0ZXgJ
CQlpbml0X211dGV4OyAvKiBQcm90ZWN0cyBzbW11IHBvaW50ZXIgKi8KIAlzcGlubG9ja190CQkJ
Y2JfbG9jazsgLyogU2VyaWFsaXNlcyBBVFMxKiBvcHMgYW5kIFRMQiBzeW5jcyAqLworCXUzMiBh
dHRyaWJ1dGVzOwogCXN0cnVjdCBpb21tdV9kb21haW4JCWRvbWFpbjsKIH07CiAKQEAgLTgzMiw3
ICs4MzMsMTEgQEAgc3RhdGljIGludCBhcm1fc21tdV9pbml0X2RvbWFpbl9jb250ZXh0KHN0cnVj
dCBpb21tdV9kb21haW4gKmRvbWFpbiwKIAkJaWFzID0gc21tdS0+dmFfc2l6ZTsKIAkJb2FzID0g
c21tdS0+aXBhX3NpemU7CiAJCWlmIChjZmctPmZtdCA9PSBBUk1fU01NVV9DVFhfRk1UX0FBUkNI
NjQpIHsKLQkJCWZtdCA9IEFSTV82NF9MUEFFX1MxOworCQkJaWYgKHNtbXVfZG9tYWluLT5hdHRy
aWJ1dGVzICYKKwkJCQkoMSA8PCBET01BSU5fQVRUUl9TUExJVF9UQUJMRVMpKQorCQkJCWZtdCA9
IEFSTV82NF9MUEFFX1NQTElUX1MxOworCQkJZWxzZQorCQkJCWZtdCA9IEFSTV82NF9MUEFFX1Mx
OwogCQl9IGVsc2UgaWYgKGNmZy0+Zm10ID09IEFSTV9TTU1VX0NUWF9GTVRfQUFSQ0gzMl9MKSB7
CiAJCQlmbXQgPSBBUk1fMzJfTFBBRV9TMTsKIAkJCWlhcyA9IG1pbihpYXMsIDMyVUwpOwpAQCAt
MTU4Miw2ICsxNTg3LDEwIEBAIHN0YXRpYyBpbnQgYXJtX3NtbXVfZG9tYWluX2dldF9hdHRyKHN0
cnVjdCBpb21tdV9kb21haW4gKmRvbWFpbiwKIAkJY2FzZSBET01BSU5fQVRUUl9ORVNUSU5HOgog
CQkJKihpbnQgKilkYXRhID0gKHNtbXVfZG9tYWluLT5zdGFnZSA9PSBBUk1fU01NVV9ET01BSU5f
TkVTVEVEKTsKIAkJCXJldHVybiAwOworCQljYXNlIERPTUFJTl9BVFRSX1NQTElUX1RBQkxFUzoK
KwkJCSooaW50ICopZGF0YSA9ICEhKHNtbXVfZG9tYWluLT5hdHRyaWJ1dGVzICYKKwkJCQkoMSA8
PCBET01BSU5fQVRUUl9TUExJVF9UQUJMRVMpKTsKKwkJCXJldHVybiAwOwogCQlkZWZhdWx0Ogog
CQkJcmV0dXJuIC1FTk9ERVY7CiAJCX0KQEAgLTE2MjIsNiArMTYzMSwxMSBAQCBzdGF0aWMgaW50
IGFybV9zbW11X2RvbWFpbl9zZXRfYXR0cihzdHJ1Y3QgaW9tbXVfZG9tYWluICpkb21haW4sCiAJ
CQllbHNlCiAJCQkJc21tdV9kb21haW4tPnN0YWdlID0gQVJNX1NNTVVfRE9NQUlOX1MxOwogCQkJ
YnJlYWs7CisJCWNhc2UgRE9NQUlOX0FUVFJfU1BMSVRfVEFCTEVTOgorCQkJaWYgKCooKGludCAq
KWRhdGEpKQorCQkJCXNtbXVfZG9tYWluLT5hdHRyaWJ1dGVzIHw9CisJCQkJCSgxIDw8IERPTUFJ
Tl9BVFRSX1NQTElUX1RBQkxFUyk7CisJCQlicmVhazsKIAkJZGVmYXVsdDoKIAkJCXJldCA9IC1F
Tk9ERVY7CiAJCX0KLS0gCjIuNy40CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpGcmVlZHJlbm8gbWFpbGluZyBsaXN0CkZyZWVkcmVub0BsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9mcmVlZHJlbm8=

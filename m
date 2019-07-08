Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DABF3628D3
	for <lists+freedreno@lfdr.de>; Mon,  8 Jul 2019 21:00:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 884566E043;
	Mon,  8 Jul 2019 19:00:55 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from smtp.codeaurora.org (smtp.codeaurora.org [198.145.29.96])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9AD86E034
 for <freedreno@lists.freedesktop.org>; Mon,  8 Jul 2019 19:00:54 +0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
 id 9527060F3B; Mon,  8 Jul 2019 19:00:54 +0000 (UTC)
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
 by smtp.codeaurora.org (Postfix) with ESMTPSA id C46AA60DB3;
 Mon,  8 Jul 2019 19:00:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org C46AA60DB3
From: Jordan Crouse <jcrouse@codeaurora.org>
To: freedreno@lists.freedesktop.org
Date: Mon,  8 Jul 2019 13:00:45 -0600
Message-Id: <1562612447-19856-2-git-send-email-jcrouse@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1562612447-19856-1-git-send-email-jcrouse@codeaurora.org>
References: <1562612447-19856-1-git-send-email-jcrouse@codeaurora.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1562612454;
 bh=I0b5kpNA6visZ/gWW+mc9BO8uDwDyEu2oJKHrjDh8wg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=BZ4h87lsLGeBEAx2O+AgC1rYn8+otI0cj8XmmIXtmCctr4x3OrcbSMfLhLEmJh822
 uKBlN96iyQbsVD+LxdawaI5q+WM447Yf7u6Hl7OV8aMrsFrdlQEHhXOwThf40Tx0kf
 zhZ4qB0UndPmaqgFVRsGZzHth8nyWAmpphCRPE30=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1562612453;
 bh=I0b5kpNA6visZ/gWW+mc9BO8uDwDyEu2oJKHrjDh8wg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=j/6RQ0lcgs09AsxsnGCao8bbrT6qUd2DPh0MR0efFnAhUe6KgnozkZtRwbylGFr6A
 b9CEmNA4tJEH2UbDmLJMrf80JLikoi0asSPHlIxSOHUe6uuQVvy7+2yckYhGNF5DwH
 hkIXSF3uzZzUSu0Ik1jvhMMkpkGra0iYDuRkNqMQ=
X-Mailman-Original-Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 dmarc=none (p=none dis=none)
 header.from=codeaurora.org
X-Mailman-Original-Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 spf=none
 smtp.mailfrom=jcrouse@codeaurora.org
Subject: [Freedreno] [RESEND PATCH v2 1/3] iommu: Add
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
 hoegsberg@google.com, baolu.lu@linux.intel.com
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

QWRkIGEgbmV3IGRvbWFpbiBhdHRyaWJ1dGUgdG8gZW5hYmxlIHNwbGl0IHBhZ2V0YWJsZSBzdXBw
b3J0IGZvciBkZXZpY2VzCmRldmljZXMgdGhhdCBzdXBwb3J0IGl0LgoKU2lnbmVkLW9mZi1ieTog
Sm9yZGFuIENyb3VzZSA8amNyb3VzZUBjb2RlYXVyb3JhLm9yZz4KLS0tCgogaW5jbHVkZS9saW51
eC9pb21tdS5oIHwgMSArCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKCmRpZmYgLS1n
aXQgYS9pbmNsdWRlL2xpbnV4L2lvbW11LmggYi9pbmNsdWRlL2xpbnV4L2lvbW11LmgKaW5kZXgg
ZmRjMzU1Yy4uYjA2ZGI2YyAxMDA2NDQKLS0tIGEvaW5jbHVkZS9saW51eC9pb21tdS5oCisrKyBi
L2luY2x1ZGUvbGludXgvaW9tbXUuaApAQCAtMTI1LDYgKzEyNSw3IEBAIGVudW0gaW9tbXVfYXR0
ciB7CiAJRE9NQUlOX0FUVFJfRlNMX1BBTVVWMSwKIAlET01BSU5fQVRUUl9ORVNUSU5HLAkvKiB0
d28gc3RhZ2VzIG9mIHRyYW5zbGF0aW9uICovCiAJRE9NQUlOX0FUVFJfRE1BX1VTRV9GTFVTSF9R
VUVVRSwKKwlET01BSU5fQVRUUl9TUExJVF9UQUJMRVMsCiAJRE9NQUlOX0FUVFJfTUFYLAogfTsK
IAotLSAKMi43LjQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkZyZWVkcmVubyBtYWlsaW5nIGxpc3QKRnJlZWRyZW5vQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ZyZWVkcmVu
bw==

Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8773A2551F
	for <lists+freedreno@lfdr.de>; Tue, 21 May 2019 18:14:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 445B4893ED;
	Tue, 21 May 2019 16:14:21 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from smtp.codeaurora.org (smtp.codeaurora.org [198.145.29.96])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C15B893EA
 for <freedreno@lists.freedesktop.org>; Tue, 21 May 2019 16:14:19 +0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
 id 3DE53619EC; Tue, 21 May 2019 16:14:14 +0000 (UTC)
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
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 66B1C60FE9;
 Tue, 21 May 2019 16:14:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 66B1C60FE9
From: Jordan Crouse <jcrouse@codeaurora.org>
To: freedreno@lists.freedesktop.org
Date: Tue, 21 May 2019 10:13:50 -0600
Message-Id: <1558455243-32746-3-git-send-email-jcrouse@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1558455243-32746-1-git-send-email-jcrouse@codeaurora.org>
References: <1558455243-32746-1-git-send-email-jcrouse@codeaurora.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1558455259;
 bh=iTP2SCI8f9rdcYNbxAtXbYBJX0GWnxavwP2EzTqTloY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=O2EOYqD/2ZZBWheaY/e0Q6NAP6DIPi8pFyI7fUuopKWHStQRlAdaiJTfajLhjpWb5
 xWnSdoathHLgJSPlS5exj2POpvM7mRJHFMUPqrEq81RMocrrQaxEif4C3c8WpKGBj2
 JXTDR++xpq2FXQeDKSspJIpo52/48SI2kqr/sPEE=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1558455253;
 bh=iTP2SCI8f9rdcYNbxAtXbYBJX0GWnxavwP2EzTqTloY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Y15t+RN32pOZUwGE2jIg1zCcFBLj4ZDB8aXj/U4se/Tpxzv8Wcmdfh2N8fCF6B2S8
 AYjAskvkiR7dnPHco4zNvgzm10c99gUH6gVraI7DfYIScK8ndvQpaLu88zrfFT9PMe
 W0Cqtj4XWnk9TjFwn+DJdn9jyWdtT5ZitAsRV4mY=
X-Mailman-Original-Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 dmarc=none (p=none dis=none)
 header.from=codeaurora.org
X-Mailman-Original-Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 spf=none
 smtp.mailfrom=jcrouse@codeaurora.org
Subject: [Freedreno] [PATCH v2 02/15] iommu: Add DOMAIN_ATTR_SPLIT_TABLES
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

QWRkIGEgbmV3IGRvbWFpbiBhdHRyaWJ1dGUgdG8gZW5hYmxlIHNwbGl0IHBhZ2V0YWJsZSBzdXBw
b3J0IGZvciBkZXZpY2VzCmRldmljZXMgdGhhdCBzdXBwb3J0IGl0LgoKU2lnbmVkLW9mZi1ieTog
Sm9yZGFuIENyb3VzZSA8amNyb3VzZUBjb2RlYXVyb3JhLm9yZz4KLS0tCgogaW5jbHVkZS9saW51
eC9pb21tdS5oIHwgMSArCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKCmRpZmYgLS1n
aXQgYS9pbmNsdWRlL2xpbnV4L2lvbW11LmggYi9pbmNsdWRlL2xpbnV4L2lvbW11LmgKaW5kZXgg
NGVmOGJkNS4uMjA0YWNkOCAxMDA2NDQKLS0tIGEvaW5jbHVkZS9saW51eC9pb21tdS5oCisrKyBi
L2luY2x1ZGUvbGludXgvaW9tbXUuaApAQCAtMTI4LDYgKzEyOCw3IEBAIGVudW0gaW9tbXVfYXR0
ciB7CiAJRE9NQUlOX0FUVFJfRlNMX1BBTVVWMSwKIAlET01BSU5fQVRUUl9ORVNUSU5HLAkvKiB0
d28gc3RhZ2VzIG9mIHRyYW5zbGF0aW9uICovCiAJRE9NQUlOX0FUVFJfRE1BX1VTRV9GTFVTSF9R
VUVVRSwKKwlET01BSU5fQVRUUl9TUExJVF9UQUJMRVMsCiAJRE9NQUlOX0FUVFJfTUFYLAogfTsK
IAotLSAKMi43LjQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkZyZWVkcmVubyBtYWlsaW5nIGxpc3QKRnJlZWRyZW5vQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ZyZWVkcmVu
bw==

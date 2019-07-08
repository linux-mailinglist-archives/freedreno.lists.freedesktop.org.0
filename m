Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 707C4628D2
	for <lists+freedreno@lfdr.de>; Mon,  8 Jul 2019 21:00:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DCA26E034;
	Mon,  8 Jul 2019 19:00:55 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from smtp.codeaurora.org (smtp.codeaurora.org [198.145.29.96])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97BA16E034
 for <freedreno@lists.freedesktop.org>; Mon,  8 Jul 2019 19:00:53 +0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
 id 68C4C60F3C; Mon,  8 Jul 2019 19:00:53 +0000 (UTC)
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
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 7647C60E3F;
 Mon,  8 Jul 2019 19:00:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 7647C60E3F
From: Jordan Crouse <jcrouse@codeaurora.org>
To: freedreno@lists.freedesktop.org
Date: Mon,  8 Jul 2019 13:00:44 -0600
Message-Id: <1562612447-19856-1-git-send-email-jcrouse@codeaurora.org>
X-Mailer: git-send-email 2.7.4
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1562612453;
 bh=3cZ120rfFscLjFKv5nknwSkEb05XjN6zsQhL+0Uk7mA=;
 h=From:To:Cc:Subject:Date:From;
 b=g1j6LoPaI/+wTOsEw8t+ilntBs99VUFNL2oAqVgkWMt7JpF/I6zD4AusUlN+gbTIN
 KhIxdl59ekJSr0ovtRKdFugLystTw/kd7nrVGV8R3ZBHh0CeNToUU3E2WnXHeBLywI
 On01R9Eygl+8egTxC+YzUsCatNy0mC1kglBnJ6Nw=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1562612452;
 bh=3cZ120rfFscLjFKv5nknwSkEb05XjN6zsQhL+0Uk7mA=;
 h=From:To:Cc:Subject:Date:From;
 b=RlxX3GiGklNIZkgVbwds5vGc/pv3hVX+zqgSNP+HNfsm24k64LSUODh3aC3fMWjJL
 X0hcGZee8Nkg+jE3I1wgIg51HApyOTNFneQmhTD8a5DQnMbqfk4jLyPETtxuDtki4E
 Q9prYAIIOOnhj6gIaNiBYZLNVn2siZMldjiyVJXw=
X-Mailman-Original-Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 dmarc=none (p=none dis=none)
 header.from=codeaurora.org
X-Mailman-Original-Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 spf=none
 smtp.mailfrom=jcrouse@codeaurora.org
Subject: [Freedreno] [RESEND PATCH v2 0/3] iommu/arm-smmu: Split pagetable
 support
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
Cc: Rob Herring <robh@kernel.org>, jean-philippe.brucker@arm.com,
 linux-arm-msm@vger.kernel.org, Joerg Roedel <joro@8bytes.org>,
 dianders@chromium.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, hoegsberg@google.com,
 linux-arm-kernel@lists.infradead.org, Zhen Lei <thunder.leizhen@huawei.com>,
 Robin Murphy <robin.murphy@arm.com>, Will Deacon <will@kernel.org>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, baolu.lu@linux.intel.com
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

KFJFU0VORCBiZWNhdXNlIEkgZmF0IGZpbmdlcmVkIGEgZW1haWwgYWRkcmVzcyBhbmQgSSBkaWRu
J3Qgd2FudCBldmVyeWJvZHkgdG8KZ2V0IGEgYnVuY2ggb2YgU01UUCBlcnJvcnMpCgpUaGlzIHNl
cmllcyBpbXBsZW1lbnRzIHNwbGl0IHBhZ2V0YWJsZSBzdXBwb3J0IGZvciBhcm0tc21tdS12MiBk
ZXZpY2VzLiBZb3UgaGF2ZQpzZWVuIHRoaXMgY29kZSBiZWZvcmUgYXMgcGFydCBvZiBbMV0gYnV0
IEkgc3BsaXQgaXQgYXBhcnQgZnJvbSB0aGUgb3RoZXIKZmVhdHVyZXMgdG8gbWFrZSBpdCBlYXNp
ZXIgdG8gcmV2aWV3IC8gbWVyZ2UuCgpUaGlzIHNlcmllcyBhZGRzIGEgbmV3IGZvcm1hdCB0eXBl
IHRvIGlvLXBndGFibGUtYXJtIHRvIGVuYWJsZSBUVEJSMCBhbmQKVFRCUjEuIEJlY2F1c2Ugb2Yg
dGhlIHdheSB0aGF0IHRoZSByZWdpc3RlcnMgYXJlIG1peGVkIHVwIGl0IG1ha2VzIHRoZSBtb3N0
CnNlbnNlIHRvIGVuYWJsZSB0aGVtIHRvZ2V0aGVyIGluc3RlYWQgb2YgdHJ5aW5nIHRvIGNyZWF0
ZSB0d28gZGlmZmVyZW50CnBhZ2V0YWJsZXMgYW5kIG1lcmdlIHRoZW0gdG9nZXRoZXIgbGF0ZXIg
aW4gdGhlIGFybS1zbW11IGRyaXZlLgoKVGhpcyB3aWxsIGJlIHVzZWQgbGF0ZXIgYnkgdGhlIGRy
bS9tc20gZHJpdmVyIHRvIGVuYWJsZSBzcGxpdCBwYWdldGFibGVzCmFzIHBhcnQgb2YgdGhlIGVm
Zm9ydCB0byBpbXBsZW1lbnQgcGVyLWNvbnRleHQgcGFnZXRhYmxlcyBbMl0uCgpUaGFua3MsCkpv
cmRhbgoKWzFdIGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMvNTc0NDEv
ClsyXSBodHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvcGF0Y2gvMzA3NjE2Lz9zZXJp
ZXM9NTc0NDEmcmV2PTMKCgpKb3JkYW4gQ3JvdXNlICgzKToKICBpb21tdTogQWRkIERPTUFJTl9B
VFRSX1NQTElUX1RBQkxFUwogIGlvbW11L2lvLXBndGFibGUtYXJtOiBBZGQgc3VwcG9ydCBmb3Ig
QUFSQ0g2NCBzcGxpdCBwYWdldGFibGVzCiAgaW9tbXUvYXJtLXNtbXU6IEFkZCBzdXBwb3J0IGZv
ciBET01BSU5fQVRUUl9TUExJVF9UQUJMRVMKCiBkcml2ZXJzL2lvbW11L2FybS1zbW11LmMgICAg
ICAgfCAgMTYgKystCiBkcml2ZXJzL2lvbW11L2lvLXBndGFibGUtYXJtLmMgfCAyNjEgKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0KIGRyaXZlcnMvaW9tbXUvaW8tcGd0
YWJsZS5jICAgICB8ICAgMSArCiBpbmNsdWRlL2xpbnV4L2lvLXBndGFibGUuaCAgICAgfCAgIDIg
KwogaW5jbHVkZS9saW51eC9pb21tdS5oICAgICAgICAgIHwgICAxICsKIDUgZmlsZXMgY2hhbmdl
ZCwgMjU2IGluc2VydGlvbnMoKyksIDI1IGRlbGV0aW9ucygtKQoKLS0gCjIuNy40CgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpGcmVlZHJlbm8gbWFpbGlu
ZyBsaXN0CkZyZWVkcmVub0BsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9mcmVlZHJlbm8=

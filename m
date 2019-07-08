Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9683627FF
	for <lists+freedreno@lfdr.de>; Mon,  8 Jul 2019 20:10:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 619B889E11;
	Mon,  8 Jul 2019 18:10:26 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from smtp.codeaurora.org (smtp.codeaurora.org [198.145.29.96])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1685E89E11
 for <freedreno@lists.freedesktop.org>; Mon,  8 Jul 2019 18:10:25 +0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
 id DC92A60F3E; Mon,  8 Jul 2019 18:10:24 +0000 (UTC)
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
 by smtp.codeaurora.org (Postfix) with ESMTPSA id D16A0602F0;
 Mon,  8 Jul 2019 18:10:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org D16A0602F0
From: Jordan Crouse <jcrouse@codeaurora.org>
To: freedreno@lists.freedesktop.org
Date: Mon,  8 Jul 2019 12:10:15 -0600
Message-Id: <1562609418-25446-1-git-send-email-jcrouse@codeaurora.org>
X-Mailer: git-send-email 2.7.4
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1562609424;
 bh=RYakAtzfd68XjS32CGKsM0PJUck7IxLNDzXB/YezXpk=;
 h=From:To:Cc:Subject:Date:From;
 b=Ad8kI3O0+s4YwlFbID8kBOAt4b+HDkQfXy2QX0s0abp4uoLt2JeVkl/JMoUFDReJx
 QcUmPJrxrh2tq5JHtIuKztBpxSxPNlycZqPUsd7JE2ThrlOES8O+KGPYSfOAjdK2/g
 eM6KtmEGxjI1Fjn3YPRMS2eXN4+9Rr+RgTxFDfmk=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1562609424;
 bh=RYakAtzfd68XjS32CGKsM0PJUck7IxLNDzXB/YezXpk=;
 h=From:To:Cc:Subject:Date:From;
 b=Ad8kI3O0+s4YwlFbID8kBOAt4b+HDkQfXy2QX0s0abp4uoLt2JeVkl/JMoUFDReJx
 QcUmPJrxrh2tq5JHtIuKztBpxSxPNlycZqPUsd7JE2ThrlOES8O+KGPYSfOAjdK2/g
 eM6KtmEGxjI1Fjn3YPRMS2eXN4+9Rr+RgTxFDfmk=
X-Mailman-Original-Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 dmarc=none (p=none dis=none)
 header.from=codeaurora.org
X-Mailman-Original-Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 spf=none
 smtp.mailfrom=jcrouse@codeaurora.org
Subject: [Freedreno] [PATCH v2 0/3] iommu/arm-smmu: Split pagetable support
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
 Robin Murphy <robin.murphy@arm.com>, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, dianders@chromimum.org, hoegsberg@google.com,
 Zhen Lei <thunder.leizhen@huawei.com>, Will Deacon <will@kernel.org>,
 linux-arm-kernel@lists.infradead.org, baolu.lu@linux.intel.com
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

VGhpcyBzZXJpZXMgaW1wbGVtZW50cyBzcGxpdCBwYWdldGFibGUgc3VwcG9ydCBmb3IgYXJtLXNt
bXUtdjIgZGV2aWNlcy4gWW91IGhhdmUKc2VlbiB0aGlzIGNvZGUgYmVmb3JlIGFzIHBhcnQgb2Yg
WzFdIGJ1dCBJIHNwbGl0IGl0IGZyb20gdGhlIG90aGVyIGZlYXR1cmVzCnRvIG1ha2UgaXQgZWFz
aWVyIHRvIHJldmlldyAvIG1lcmdlLgoKVGhpcyBzZXJpZXMgYWRkcyBhIG5ldyBmb3JtYXQgdHlw
ZSB0byBpby1wZ3RhYmxlLWFybSB0byBlbmFibGUgVFRCUjAgYW5kClRUQlIxLiBCZWNhdXNlIG9m
IHRoZSB3YXkgdGhhdCB0aGUgcmVnaXN0ZXJzIGFyZSBtaXhlZCB1cCBpdCBtYWtlcyB0aGUgbW9z
dApzZW5zZSB0byBlbmFibGUgdGhlbSB0b2dldGhlciBpbnN0ZWFkIG9mIHRyeWluZyB0byBjcmVh
dGUgdHdvIGRpZmZlcmVudApwYWdldGFibGVzIGFuZCBtZXJnZSB0aGVtIHRvZ2V0aGVyIGxhdGVy
IGluIHRoZSBhcm0tc21tdSBkcml2ZS4KClRoaXMgd2lsbCBiZSB1c2VkIGxhdGVyIGJ5IHRoZSBk
cm0vbXNtIGRyaXZlciB0byBlbmFibGUgc3BsaXQgcGFnZXRhYmxlcwphcyBwYXJ0IG9mIHRoZSBl
ZmZvcnQgdG8gaW1wbGVtZW50IHBlci1jb250ZXh0IHBhZ2V0YWJsZXMgWzJdLgoKVGhhbmtzLApK
b3JkYW4KClsxXSBodHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvc2VyaWVzLzU3NDQx
LwpbMl0gaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3BhdGNoLzMwNzYxNi8/c2Vy
aWVzPTU3NDQxJnJldj0zCgpKb3JkYW4gQ3JvdXNlICgzKToKICBpb21tdTogQWRkIERPTUFJTl9B
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

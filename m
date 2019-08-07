Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FC69855A1
	for <lists+freedreno@lfdr.de>; Thu,  8 Aug 2019 00:19:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB3D46E772;
	Wed,  7 Aug 2019 22:19:54 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from smtp.codeaurora.org (smtp.codeaurora.org [198.145.29.96])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84C596E772
 for <freedreno@lists.freedesktop.org>; Wed,  7 Aug 2019 22:19:53 +0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
 id 4957F60A4E; Wed,  7 Aug 2019 22:19:53 +0000 (UTC)
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
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 6D93A608A5;
 Wed,  7 Aug 2019 22:19:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 6D93A608A5
From: Jordan Crouse <jcrouse@codeaurora.org>
To: freedreno@lists.freedesktop.org
Date: Wed,  7 Aug 2019 16:19:44 -0600
Message-Id: <1565216386-28309-1-git-send-email-jcrouse@codeaurora.org>
X-Mailer: git-send-email 2.7.4
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1565216393;
 bh=AsxvbLeJVZmEE+jtGajQWWI22/FywEfAo7Ps7nevM1w=;
 h=From:To:Cc:Subject:Date:From;
 b=Nv37NQ2cJqFLUaZYxTPgpGRuiBMG3a/aduUmxQqm0hOEdFD0v8BHw/XkJvXx9MXLY
 QD6k4BLVMZrYqORNFL7AT6s57PpXlFeOzdBUsKxd4bF1CiiObO2CDt2MMO8KLcslDK
 PYuUm1tcheUeIatIS646Zg62x8xk/GzNpsgTy3DU=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1565216392;
 bh=AsxvbLeJVZmEE+jtGajQWWI22/FywEfAo7Ps7nevM1w=;
 h=From:To:Cc:Subject:Date:From;
 b=Q3Ox/+VICQiHcBcLyDCeEOg2zst+yk0qsF7GtHJI8k0lKTmAURfRpS2R1Iok0vbyh
 xOX7U18y23C8rJNCp+s0JyzOUKNjBrOa0M0d0yES4EM6nJ0VLIdOPQ29/8s0tGrRGi
 iF2L2ibuY46XWUR5y1HhjpQ7DsPxegjXw1f4G4B4=
X-Mailman-Original-Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 dmarc=none (p=none dis=none)
 header.from=codeaurora.org
X-Mailman-Original-Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 spf=none
 smtp.mailfrom=jcrouse@codeaurora.org
Subject: [Freedreno] [PATCH v3 0/2] iommu/arm-smmu: Split pagetable support
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
Cc: Rob Herring <robh@kernel.org>, Will Deacon <will@kernel.org>,
 jean-philippe.brucker@arm.com, linux-arm-msm@vger.kernel.org,
 Joerg Roedel <joro@8bytes.org>, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, Zhen Lei <thunder.leizhen@huawei.com>,
 robin.murphy@arm.com, linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

VGhpcyBpcyBwYXJ0IG9mIGFuIG9uZ29pbmcgZXZvbHV0aW9uIGZvciBlbmFibGluZyBzcGxpdCBw
YWdldGFibGUgc3VwcG9ydCBmb3IKYXJtLXNtbXUuIFByZXZpb3VzIHZlcnNpb25zIGNhbiBiZSBm
b3VuZCBbMV0uCgpJbiB0aGUgZGlzY3Vzc2lvbiBmb3IgdjIgUm9iaW4gcG9pbnRlZCBvdXQgdGhh
dCB0aGlzIGlzIGEgdmVyeSBBZHJlbm8gc3BlY2lmaWMKdXNlIGNhc2UgYW5kIHRoYXQgaXMgZXhh
Y3RseSB0cnVlLiBOb3Qgb25seSBkbyB3ZSB3YW50IHRvIGNvbmZpZ3VyZSBhbmQgdXNlIGEKcGFn
ZXRhYmxlIGluIHRoZSBUVEJSMSBzcGFjZSwgd2UgYWxzbyB3YW50IHRvIGNvbmZpZ3VyZSB0aGUg
VFRCUjAgcmVnaW9uIGJ1dApub3QgYWxsb2NhdGUgYSBwYWdldGFibGUgZm9yIGl0IG9yIHRvdWNo
IGl0IHVudGlsIHRoZSBHUFUgaGFyZHdhcmUgZG9lcyBzby4gQXMKbXVjaCBhcyBJIHdhbnQgaXQg
dG8gYmUgYSBnZW5lcmljIGNvbmNlcHQgaXQgcmVhbGx5IGlzbid0LgoKVGhpcyByZXZpc2lvbiBs
ZWFucyBpbnRvIHRoYXQgaWRlYS4gTW9zdCBvZiB0aGUgc2FtZSBpby1wZ3RhYmxlIGNvZGUgaXMg
dGhlcmUKYnV0IG5vdyBpdCBpcyB3cmFwcGVkIGFzIGFuIEFkcmVubyBHUFUgc3BlY2lmaWMgZm9y
bWF0IHRoYXQgaXMgc2VsZWN0ZWQgYnkgdGhlCmNvbXBhdGlibGUgc3RyaW5nIGluIHRoZSBhcm0t
c21tdSBkZXZpY2UuCgpBZGRpdGlvbmFsbHksIHBlciBSb2JpbidzIHN1Z2dlc3Rpb24gd2UgYXJl
IHNraXBwaW5nIGNyZWF0aW5nIGEgVFRCUjAgcGFnZXRhYmxlCnRvIHNhdmUgb24gd2FzdGVkIG1l
bW9yeS4KClRoaXMgaXNuJ3QgYXMgY2xlYW4gYXMgSSB3b3VsZCBsaWtlIGl0IHRvIGJlIGJ1dCBJ
IHRoaW5rIHRoYXQgdGhpcyBpcyBhIGJldHRlcgpkaXJlY3Rpb24gdGhhbiB0cnlpbmcgdG8gcHJl
dGVuZCB0aGF0IHRoZSBnZW5lcmljIGZvcm1hdCB3b3VsZCB3b3JrLgoKSSdtIHRlbXB0aW5nIGZh
dGUgYnkgcG9zdGluZyB0aGlzIGFuZCB0aGVuIHRha2luZyBzb21lIHRpbWUgb2ZmLCBidXQgSSB3
YW50ZWQKdG8gdHJ5IHRvIGtpY2sgb2ZmIGEgY29udmVyc2F0aW9uIG9yIGF0IGxlYXN0IGdldCBz
b21lIGZsYW1lcyBzbyBJIGNhbiB0cnkgdG8KcmVmaW5lIHRoaXMgYWdhaW4gbmV4dCB3ZWVrLiBQ
bGVhc2UgdGFrZSBhIGxvb2sgYW5kIGdpdmUgc29tZSBhZHZpY2Ugb24gdGhlCmRpcmVjdGlvbi4K
ClsxXSBodHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvc2VyaWVzLzYzNDAzLwoKSm9y
ZGFuCgpKb3JkYW4gQ3JvdXNlICgyKToKICBpb21tdS9pby1wZ3RhYmxlLWFybTogQWRkIHN1cHBv
cnQgZm9yIEFSTV9BRFJFTk9fR1BVX0xQQUUgaW8tcGd0YWJsZQogICAgZm9ybWF0CiAgaW9tbXUv
YXJtLXNtbXU6IEFkZCBzdXBwb3J0IGZvciBBZHJlbm8gR1BVIHBhZ2V0YWJsZSBmb3JtYXRzCgog
ZHJpdmVycy9pb21tdS9hcm0tc21tdS5jICAgICAgIHwgICA4ICstCiBkcml2ZXJzL2lvbW11L2lv
LXBndGFibGUtYXJtLmMgfCAyMTQgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KystLS0KIGRyaXZlcnMvaW9tbXUvaW8tcGd0YWJsZS5jICAgICB8ICAgMSArCiBpbmNsdWRlL2xp
bnV4L2lvLXBndGFibGUuaCAgICAgfCAgIDIgKwogNCBmaWxlcyBjaGFuZ2VkLCAyMDkgaW5zZXJ0
aW9ucygrKSwgMTYgZGVsZXRpb25zKC0pCgotLSAKMi43LjQKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkZyZWVkcmVubyBtYWlsaW5nIGxpc3QKRnJlZWRy
ZW5vQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2ZyZWVkcmVubw==

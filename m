Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 11739855AC
	for <lists+freedreno@lfdr.de>; Thu,  8 Aug 2019 00:21:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8E946E773;
	Wed,  7 Aug 2019 22:21:47 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from smtp.codeaurora.org (smtp.codeaurora.org [198.145.29.96])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B51166E773
 for <freedreno@lists.freedesktop.org>; Wed,  7 Aug 2019 22:21:46 +0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
 id 1ABA56053B; Wed,  7 Aug 2019 22:21:45 +0000 (UTC)
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
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 906AF60208;
 Wed,  7 Aug 2019 22:21:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 906AF60208
From: Jordan Crouse <jcrouse@codeaurora.org>
To: freedreno@lists.freedesktop.org
Date: Wed,  7 Aug 2019 16:21:38 -0600
Message-Id: <1565216500-28506-1-git-send-email-jcrouse@codeaurora.org>
X-Mailer: git-send-email 2.7.4
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1565216506;
 bh=JrXJYfR7OdbsMs6A8nQtELu4a/CLP38j/wkYUh2M0hU=;
 h=From:To:Cc:Subject:Date:From;
 b=TZENzMG5F6+WoSkwv3a3cXdF71Ta2+7OHwXJ0zpN9sVsV305w+6c46Rp+VGgx7AeW
 RAOqk0nUwmEk80csh09v6PNMiQH+2ViWRKU+MXYvSHWcFgSISR+YoY+ZhehdYfwN9S
 Qov/TRFMqBu9ctFcYTmqiMvmXWlNRhGUzFyoTQms=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1565216504;
 bh=JrXJYfR7OdbsMs6A8nQtELu4a/CLP38j/wkYUh2M0hU=;
 h=From:To:Cc:Subject:Date:From;
 b=BMz2D2uMljPCVrJz3Hv0xbOq51J/gbDucu3HyzydzaCDx7CBDj0OClpGor3Ps7DW9
 /DI9yx9PRBSlyd8ry1fY+4PxD5lOn6j5P/+yXSl1/+wvKFfCCo4Kkhn0bmv0VXU3hG
 9u51P08ZTEqNKWQ+8dsANbmCK1hxTGV1B25pIwsw=
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

KFNpZ2gsIHJlc2VuZC4gSSBmcmVha2VkIG91dCBteSBTTVRQIHNlcnZlcikKClRoaXMgaXMgcGFy
dCBvZiBhbiBvbmdvaW5nIGV2b2x1dGlvbiBmb3IgZW5hYmxpbmcgc3BsaXQgcGFnZXRhYmxlIHN1
cHBvcnQgZm9yCmFybS1zbW11LiBQcmV2aW91cyB2ZXJzaW9ucyBjYW4gYmUgZm91bmQgWzFdLgoK
SW4gdGhlIGRpc2N1c3Npb24gZm9yIHYyIFJvYmluIHBvaW50ZWQgb3V0IHRoYXQgdGhpcyBpcyBh
IHZlcnkgQWRyZW5vIHNwZWNpZmljCnVzZSBjYXNlIGFuZCB0aGF0IGlzIGV4YWN0bHkgdHJ1ZS4g
Tm90IG9ubHkgZG8gd2Ugd2FudCB0byBjb25maWd1cmUgYW5kIHVzZSBhCnBhZ2V0YWJsZSBpbiB0
aGUgVFRCUjEgc3BhY2UsIHdlIGFsc28gd2FudCB0byBjb25maWd1cmUgdGhlIFRUQlIwIHJlZ2lv
biBidXQKbm90IGFsbG9jYXRlIGEgcGFnZXRhYmxlIGZvciBpdCBvciB0b3VjaCBpdCB1bnRpbCB0
aGUgR1BVIGhhcmR3YXJlIGRvZXMgc28uIEFzCm11Y2ggYXMgSSB3YW50IGl0IHRvIGJlIGEgZ2Vu
ZXJpYyBjb25jZXB0IGl0IHJlYWxseSBpc24ndC4KClRoaXMgcmV2aXNpb24gbGVhbnMgaW50byB0
aGF0IGlkZWEuIE1vc3Qgb2YgdGhlIHNhbWUgaW8tcGd0YWJsZSBjb2RlIGlzIHRoZXJlCmJ1dCBu
b3cgaXQgaXMgd3JhcHBlZCBhcyBhbiBBZHJlbm8gR1BVIHNwZWNpZmljIGZvcm1hdCB0aGF0IGlz
IHNlbGVjdGVkIGJ5IHRoZQpjb21wYXRpYmxlIHN0cmluZyBpbiB0aGUgYXJtLXNtbXUgZGV2aWNl
LgoKQWRkaXRpb25hbGx5LCBwZXIgUm9iaW4ncyBzdWdnZXN0aW9uIHdlIGFyZSBza2lwcGluZyBj
cmVhdGluZyBhIFRUQlIwIHBhZ2V0YWJsZQp0byBzYXZlIG9uIHdhc3RlZCBtZW1vcnkuCgpUaGlz
IGlzbid0IGFzIGNsZWFuIGFzIEkgd291bGQgbGlrZSBpdCB0byBiZSBidXQgSSB0aGluayB0aGF0
IHRoaXMgaXMgYSBiZXR0ZXIKZGlyZWN0aW9uIHRoYW4gdHJ5aW5nIHRvIHByZXRlbmQgdGhhdCB0
aGUgZ2VuZXJpYyBmb3JtYXQgd291bGQgd29yay4KCkknbSB0ZW1wdGluZyBmYXRlIGJ5IHBvc3Rp
bmcgdGhpcyBhbmQgdGhlbiB0YWtpbmcgc29tZSB0aW1lIG9mZiwgYnV0IEkgd2FudGVkCnRvIHRy
eSB0byBraWNrIG9mZiBhIGNvbnZlcnNhdGlvbiBvciBhdCBsZWFzdCBnZXQgc29tZSBmbGFtZXMg
c28gSSBjYW4gdHJ5IHRvCnJlZmluZSB0aGlzIGFnYWluIG5leHQgd2Vlay4gUGxlYXNlIHRha2Ug
YSBsb29rIGFuZCBnaXZlIHNvbWUgYWR2aWNlIG9uIHRoZQpkaXJlY3Rpb24uCgpbMV0gaHR0cHM6
Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3Nlcmllcy82MzQwMy8KCkpvcmRhbgoKCkpvcmRh
biBDcm91c2UgKDIpOgogIGlvbW11L2lvLXBndGFibGUtYXJtOiBBZGQgc3VwcG9ydCBmb3IgQVJN
X0FEUkVOT19HUFVfTFBBRSBpby1wZ3RhYmxlCiAgICBmb3JtYXQKICBpb21tdS9hcm0tc21tdTog
QWRkIHN1cHBvcnQgZm9yIEFkcmVubyBHUFUgcGFnZXRhYmxlIGZvcm1hdHMKCiBkcml2ZXJzL2lv
bW11L2FybS1zbW11LmMgICAgICAgfCAgIDggKy0KIGRyaXZlcnMvaW9tbXUvaW8tcGd0YWJsZS1h
cm0uYyB8IDIxNCArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLQogZHJp
dmVycy9pb21tdS9pby1wZ3RhYmxlLmMgICAgIHwgICAxICsKIGluY2x1ZGUvbGludXgvaW8tcGd0
YWJsZS5oICAgICB8ICAgMiArCiA0IGZpbGVzIGNoYW5nZWQsIDIwOSBpbnNlcnRpb25zKCspLCAx
NiBkZWxldGlvbnMoLSkKCi0tIAoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KRnJlZWRyZW5vIG1haWxpbmcgbGlzdApGcmVlZHJlbm9AbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZnJlZWRyZW5v

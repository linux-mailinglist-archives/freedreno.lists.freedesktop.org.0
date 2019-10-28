Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C8479E7C8B
	for <lists+freedreno@lfdr.de>; Mon, 28 Oct 2019 23:51:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DFAA6E0BE;
	Mon, 28 Oct 2019 22:51:57 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 126046E0BE
 for <freedreno@lists.freedesktop.org>; Mon, 28 Oct 2019 22:51:56 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6C8621F1;
 Mon, 28 Oct 2019 15:51:56 -0700 (PDT)
Received: from [192.168.1.124] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 324343F6C4;
 Mon, 28 Oct 2019 15:51:55 -0700 (PDT)
To: Rob Clark <robdclark@chromium.org>, Will Deacon <will@kernel.org>
References: <418d8426-f299-1269-2b2e-f86677cf22c2@arm.com>
 <20191007204906.19571-1-robdclark@gmail.com>
 <20191028222042.GB8532@willie-the-truck>
 <CAJs_Fx7zRWsTPiAg0PFt+8nJPpHpzSkxW6XMMJwozVO6vyB78A@mail.gmail.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <e3fc88d9-4934-0227-d9c7-b1cb37a8811e@arm.com>
Date: Mon, 28 Oct 2019 22:51:53 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:68.0) Gecko/20100101
 Thunderbird/68.1.2
MIME-Version: 1.0
In-Reply-To: <CAJs_Fx7zRWsTPiAg0PFt+8nJPpHpzSkxW6XMMJwozVO6vyB78A@mail.gmail.com>
Content-Language: en-GB
Subject: Re: [Freedreno] [PATCH v2] iommu/arm-smmu: fix "hang" when games
 exit
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
Cc: Joerg Roedel <joro@8bytes.org>, open list <linux-kernel@vger.kernel.org>,
 iommu@lists.linux-foundation.org, Rob Clark <robdclark@gmail.com>,
 freedreno <freedreno@lists.freedesktop.org>,
 "moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

T24gMjAxOS0xMC0yOCAxMDozOCBwbSwgUm9iIENsYXJrIHdyb3RlOgo+IE9uIE1vbiwgT2N0IDI4
LCAyMDE5IGF0IDM6MjAgUE0gV2lsbCBEZWFjb24gPHdpbGxAa2VybmVsLm9yZz4gd3JvdGU6Cj4+
Cj4+IEhpIFJvYiwKPj4KPj4gT24gTW9uLCBPY3QgMDcsIDIwMTkgYXQgMDE6NDk6MDZQTSAtMDcw
MCwgUm9iIENsYXJrIHdyb3RlOgo+Pj4gRnJvbTogUm9iIENsYXJrIDxyb2JkY2xhcmtAY2hyb21p
dW0ub3JnPgo+Pj4KPj4+IFdoZW4gZ2FtZXMsIGJyb3dzZXIsIG9yIGFueXRoaW5nIHVzaW5nIGEg
bG90IG9mIEdQVSBidWZmZXJzIGV4aXRzLCB0aGVyZQo+Pj4gY2FuIGJlIG1hbnkgaHVuZHJlZHMg
b3IgdGhvdXNhbmRzIG9mIGJ1ZmZlcnMgdG8gdW5tYXAgYW5kIGZyZWUuICBJZiB0aGUKPj4+IEdQ
VSBpcyBvdGhlcndpc2Ugc3VzcGVuZGVkLCB0aGlzIGNhbiBjYXVzZSBhcm0tc21tdSB0byByZXN1
bWUvc3VzcGVuZAo+Pj4gZm9yIGVhY2ggYnVmZmVyLCByZXN1bHRpbmcgNS0xMCBzZWNvbmRzIHdv
cnRoIG9mIHJlcHJvZ3JhbW1pbmcgdGhlCj4+PiBjb250ZXh0IGJhbmsgKGFybV9zbW11X3dyaXRl
X2NvbnRleHRfYmFuaygpL2FybV9zbW11X3dyaXRlX3MyY3IoKS9ldGMpLgo+Pj4gVG8gdGhlIHVz
ZXIgaXQgd291bGQgYXBwZWFyIHRoYXQgdGhlIHN5c3RlbSBqdXN0IGxvY2tlZCB1cC4KPj4+Cj4+
PiBBIHNpbXBsZSBzb2x1dGlvbiBpcyB0byB1c2UgcG1fcnVudGltZV9wdXRfYXV0b3N1c3BlbmQo
KSBpbnN0ZWFkLCBzbyB3ZQo+Pj4gZG9uJ3QgaW1tZWRpYXRlbHkgc3VzcGVuZCB0aGUgU01NVSBk
ZXZpY2UuCj4+Cj4+IFBsZWFzZSBjYW4geW91IHJld29yZCB0aGUgc3ViamVjdCB0byBiZSBhIGJp
dCBtb3JlIHVzZWZ1bD8gVGhlIGNvbW1pdAo+PiBtZXNzYWdlIGlzIGdyZWF0LCBidXQgdGhlIHN1
YmplY3QgaXMgYSBiaXQgbGlrZSAiZml4IGJ1ZyBpbiBjb2RlIiB0byBtZS4KPiAKPiB5ZWFoLCBu
b3QgdGhlIGJlc3QgJHN1YmplY3QsIGJ1dCBJIHdhc24ndCBxdWl0ZSBzdXJlIGhvdyB0byBmaXQK
PiBzb21ldGhpbmcgYmV0dGVyIGluIGEgcmVhc29uYWJsZSAjIG9mIGNoYXJzLi4gbWF5YmUgc29t
ZXRoaW5nIGxpa2U6Cj4gImlvbW11L2FybS1zbW11OiBvcHRpbWl6ZSB1bm1hcCBidXQgYXZvaWRp
bmcgdG9nZ2xpbmcgcnVucG0gc3RhdGUiPwoKRldJVywgSSdkIGJlIGluY2xpbmVkIHRvIGZyYW1l
IGl0IGFzIHNvbWV0aGluZyBsaWtlICJhdm9pZCBwYXRob2xvZ2ljYWwgClJQTSBiZWhhdmlvdXIg
Zm9yIHVubWFwcyIuCgpSb2Jpbi4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KRnJlZWRyZW5vIG1haWxpbmcgbGlzdApGcmVlZHJlbm9AbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZnJlZWRyZW5v

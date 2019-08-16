Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 810A9908BB
	for <lists+freedreno@lfdr.de>; Fri, 16 Aug 2019 21:44:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 371156E99D;
	Fri, 16 Aug 2019 19:43:59 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 19E046E99D
 for <freedreno@lists.freedesktop.org>; Fri, 16 Aug 2019 19:43:58 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A4B8428;
 Fri, 16 Aug 2019 12:43:57 -0700 (PDT)
Received: from [10.1.197.57] (e110467-lin.cambridge.arm.com [10.1.197.57])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 60F9C3F706;
 Fri, 16 Aug 2019 12:43:55 -0700 (PDT)
To: Rob Clark <robdclark@gmail.com>, Jordan Crouse <jcrouse@codeaurora.org>
References: <1565216500-28506-1-git-send-email-jcrouse@codeaurora.org>
 <20190815153304.GD28465@jcrouse1-lnx.qualcomm.com>
 <ac248f33-2528-c1d4-17ed-17e92e6ed5ad@arm.com>
 <CAF6AEGujjF+MQFw45g799i+2QE4X=eRZdDSsD_F3y3mfbc6UPw@mail.gmail.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <3ea2755f-6d4d-736d-bebd-455a7967e381@arm.com>
Date: Fri, 16 Aug 2019 20:43:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAF6AEGujjF+MQFw45g799i+2QE4X=eRZdDSsD_F3y3mfbc6UPw@mail.gmail.com>
Content-Language: en-GB
Subject: Re: [Freedreno] [PATCH v3 0/2] iommu/arm-smmu: Split pagetable
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
Cc: Rob Herring <robh@kernel.org>,
 Jean-Philippe Brucker <jean-philippe.brucker@arm.com>,
 Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>,
 Zhen Lei <thunder.leizhen@huawei.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 iommu@lists.linux-foundation.org,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

T24gMTYvMDgvMjAxOSAxOToxMiwgUm9iIENsYXJrIHdyb3RlOgo+IE9uIEZyaSwgQXVnIDE2LCAy
MDE5IGF0IDk6NTggQU0gUm9iaW4gTXVycGh5IDxyb2Jpbi5tdXJwaHlAYXJtLmNvbT4gd3JvdGU6
Cj4+Cj4+IEhpIEpvcmRhbiwKPj4KPj4gT24gMTUvMDgvMjAxOSAxNjozMywgSm9yZGFuIENyb3Vz
ZSB3cm90ZToKPj4+IE9uIFdlZCwgQXVnIDA3LCAyMDE5IGF0IDA0OjIxOjM4UE0gLTA2MDAsIEpv
cmRhbiBDcm91c2Ugd3JvdGU6Cj4+Pj4gKFNpZ2gsIHJlc2VuZC4gSSBmcmVha2VkIG91dCBteSBT
TVRQIHNlcnZlcikKPj4+Pgo+Pj4+IFRoaXMgaXMgcGFydCBvZiBhbiBvbmdvaW5nIGV2b2x1dGlv
biBmb3IgZW5hYmxpbmcgc3BsaXQgcGFnZXRhYmxlIHN1cHBvcnQgZm9yCj4+Pj4gYXJtLXNtbXUu
IFByZXZpb3VzIHZlcnNpb25zIGNhbiBiZSBmb3VuZCBbMV0uCj4+Pj4KPj4+PiBJbiB0aGUgZGlz
Y3Vzc2lvbiBmb3IgdjIgUm9iaW4gcG9pbnRlZCBvdXQgdGhhdCB0aGlzIGlzIGEgdmVyeSBBZHJl
bm8gc3BlY2lmaWMKPj4+PiB1c2UgY2FzZSBhbmQgdGhhdCBpcyBleGFjdGx5IHRydWUuIE5vdCBv
bmx5IGRvIHdlIHdhbnQgdG8gY29uZmlndXJlIGFuZCB1c2UgYQo+Pj4+IHBhZ2V0YWJsZSBpbiB0
aGUgVFRCUjEgc3BhY2UsIHdlIGFsc28gd2FudCB0byBjb25maWd1cmUgdGhlIFRUQlIwIHJlZ2lv
biBidXQKPj4+PiBub3QgYWxsb2NhdGUgYSBwYWdldGFibGUgZm9yIGl0IG9yIHRvdWNoIGl0IHVu
dGlsIHRoZSBHUFUgaGFyZHdhcmUgZG9lcyBzby4gQXMKPj4+PiBtdWNoIGFzIEkgd2FudCBpdCB0
byBiZSBhIGdlbmVyaWMgY29uY2VwdCBpdCByZWFsbHkgaXNuJ3QuCj4+Pj4KPj4+PiBUaGlzIHJl
dmlzaW9uIGxlYW5zIGludG8gdGhhdCBpZGVhLiBNb3N0IG9mIHRoZSBzYW1lIGlvLXBndGFibGUg
Y29kZSBpcyB0aGVyZQo+Pj4+IGJ1dCBub3cgaXQgaXMgd3JhcHBlZCBhcyBhbiBBZHJlbm8gR1BV
IHNwZWNpZmljIGZvcm1hdCB0aGF0IGlzIHNlbGVjdGVkIGJ5IHRoZQo+Pj4+IGNvbXBhdGlibGUg
c3RyaW5nIGluIHRoZSBhcm0tc21tdSBkZXZpY2UuCj4+Pj4KPj4+PiBBZGRpdGlvbmFsbHksIHBl
ciBSb2JpbidzIHN1Z2dlc3Rpb24gd2UgYXJlIHNraXBwaW5nIGNyZWF0aW5nIGEgVFRCUjAgcGFn
ZXRhYmxlCj4+Pj4gdG8gc2F2ZSBvbiB3YXN0ZWQgbWVtb3J5Lgo+Pj4+Cj4+Pj4gVGhpcyBpc24n
dCBhcyBjbGVhbiBhcyBJIHdvdWxkIGxpa2UgaXQgdG8gYmUgYnV0IEkgdGhpbmsgdGhhdCB0aGlz
IGlzIGEgYmV0dGVyCj4+Pj4gZGlyZWN0aW9uIHRoYW4gdHJ5aW5nIHRvIHByZXRlbmQgdGhhdCB0
aGUgZ2VuZXJpYyBmb3JtYXQgd291bGQgd29yay4KPj4+Pgo+Pj4+IEknbSB0ZW1wdGluZyBmYXRl
IGJ5IHBvc3RpbmcgdGhpcyBhbmQgdGhlbiB0YWtpbmcgc29tZSB0aW1lIG9mZiwgYnV0IEkgd2Fu
dGVkCj4+Pj4gdG8gdHJ5IHRvIGtpY2sgb2ZmIGEgY29udmVyc2F0aW9uIG9yIGF0IGxlYXN0IGdl
dCBzb21lIGZsYW1lcyBzbyBJIGNhbiB0cnkgdG8KPj4+PiByZWZpbmUgdGhpcyBhZ2FpbiBuZXh0
IHdlZWsuIFBsZWFzZSB0YWtlIGEgbG9vayBhbmQgZ2l2ZSBzb21lIGFkdmljZSBvbiB0aGUKPj4+
PiBkaXJlY3Rpb24uCj4+Pgo+Pj4gV2lsbCwgUm9iaW4gLQo+Pj4KPj4+IE1vZHVsbyB0aGUgaW1w
bCBjaGFuZ2VzIGZyb20gUm9iaW4sIGRvIHlvdSB0aGluayB0aGF0IHVzaW5nIGEgZGVkaWNhdGVk
Cj4+PiBwYWdldGFibGUgZm9ybWF0IGlzIHRoZSByaWdodCBhcHByb2FjaCBmb3Igc3VwcG9ydGlu
ZyBzcGxpdCBwYWdldGFibGVzIGZvciB0aGUKPj4+IEFkcmVubyBHUFU/Cj4+Cj4+IEhvdyBtYW55
IGRpZmZlcmVudCBBZHJlbm8gZHJpdmVycyB3b3VsZCBiZW5lZml0IGZyb20gc2hhcmluZyBpdD8K
PiAKPiBIeXBvdGhldGljYWxseSBldmVyeXRoaW5nIGJhY2sgdG8gYTN4eCwgc28gSSAqY291bGQq
IHNlZSB1c2VmdWxuZXNzIG9mCj4gdGhpcyBpbiBxY29tX2lvbW11IChvciBtYXliZSBldmVuIG1z
bS1pb21tdSkuICBPVE9IIG1heWJlIHdpdGgKPiAibW9kdWxhcml6aW5nIiBhcm0tc21tdSB3ZSBj
b3VsZCByZS1jb21iaW5lIHFjb21faW9tbXUgYW5kIGFybS1zbW11LgoKSW5kZWVkLCB0aGF0J3Mg
Y2VydGFpbmx5IHNvbWV0aGluZyBJJ20gcGxhbm5pbmcgdG8gaW52ZXN0aWdhdGUgYXMgYSAKZnV0
dXJlIHJlZmFjdG9yaW5nIHN0ZXAuCgo+IEFuZCBhcyBhIHByYWN0aWNhbCBtYXR0ZXIsIEknbSBu
b3Qgc3VyZSBpZiBhbnlvbmUgd2lsbCBnZXQgYXJvdW5kIHRvCj4gYmFja3BvcnRpbmcgcGVyLWNv
bnRleHQgcGFnZXRhYmxlcyBhcyBmYXIgYmFjayBhcyBhM3h4Lgo+IAo+IEJSLAo+IC1SCj4gCj4+
IFRoZSBtb3JlIEkgY29tZSBiYWNrIHRvIHRoaXMsIHRoZSBtb3JlIEknbSBjb252aW5jZWQgdGhh
dCBpby1wZ3RhYmxlCj4+IHNob3VsZCBmb2N1cyBvbiB0aGUgaGVhdnkgbGlmdGluZyBvZiBwYWdl
dGFibGUgbWFuYWdlbWVudCAtIHRoZSBjb2RlCj4+IHRoYXQgbm9ib2R5IHdhbnRzIHRvIGhhdmUg
dG8gd3JpdGUgYXQgYWxsLCBsZXQgYWxvbmUgbW9yZSB0aGFuIG9uY2UgLQo+PiBhbmQgYW55IHN1
YnRsZXRpZXMgd2hpY2ggYXJlbid0IGVzc2VudGlhbCB0byB0aGF0IHNob3VsZCBiZSBwdXNoZWQg
YmFjawo+PiBpbnRvIHdoaWNoZXZlciBjYWxsZXJzIGFjdHVhbGx5IGNhcmUuIENvbnNpZGVyIHRo
YXQgYWxyZWFkeSwgbGl0ZXJhbGx5Cj4+IG5vIGNhbGxlciBhY3R1YWxseSB1c2VzIGFuIHVubW9k
aWZpZWQgc3RhZ2UgMSBUQ1IgdmFsdWUgYXMgcHJvdmlkZWQgaW4KPj4gdGhlIGlvX3BndGFibGVf
Y2ZnLgo+Pgo+PiBJIGZlZWwgaXQgd291bGQgYmUgbW9zdCBwcm9kdWN0aXZlIHRvIGVsYWJvcmF0
ZSBmdXJ0aGVyIGluIHRoZSBmb3JtIG9mCj4+IHBhdGNoZXMsIHNvIGxldCBtZSBnZXQgcmlnaHQg
b24gdGhhdCBhbmQgdHJ5IHRvIGJhc2ggc29tZXRoaW5nIG91dAo+PiBiZWZvcmUgSSBnbyBob21l
IHRvbmlnaHQuLi4KCi4uLmFuZCBub3cgdGhlcmUncyBhIHJvdWdoIFdJUCBicmFuY2ggaGVyZToK
Cmh0dHA6Ly9saW51eC1hcm0ub3JnL2dpdD9wPWxpbnV4LXJtLmdpdDthPXNob3J0bG9nO2g9cmVm
cy9oZWFkcy9pb21tdS9wZ3RhYmxlCgpJJ2xsIGZpbmlzaCB0ZXN0aW5nIGFuZCBwb2xpc2hpbmcg
dGhvc2UgcGF0Y2hlcyBhdCBzb21lIHBvaW50IG5leHQgd2VlaywgCnByb2JhYmx5LCBidXQgaG9w
ZWZ1bGx5IHRoZXkncmUgc3VmZmljaWVudGx5IGlsbHVzdHJhdGl2ZSBmb3IgdGhlIG1vbWVudC4K
ClJvYmluLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpG
cmVlZHJlbm8gbWFpbGluZyBsaXN0CkZyZWVkcmVub0BsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9mcmVlZHJlbm8=

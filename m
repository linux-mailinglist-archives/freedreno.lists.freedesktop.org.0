Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F420464AEB
	for <lists+freedreno@lfdr.de>; Wed, 10 Jul 2019 18:45:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B68606E114;
	Wed, 10 Jul 2019 16:45:47 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id DAE296E114
 for <freedreno@lists.freedesktop.org>; Wed, 10 Jul 2019 16:45:46 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 85F4C360;
 Wed, 10 Jul 2019 09:45:46 -0700 (PDT)
Received: from [10.1.197.57] (e110467-lin.cambridge.arm.com [10.1.197.57])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 12B3A3F246;
 Wed, 10 Jul 2019 09:45:44 -0700 (PDT)
To: Jordan Crouse <jcrouse@codeaurora.org>, freedreno@lists.freedesktop.org
References: <1562612447-19856-1-git-send-email-jcrouse@codeaurora.org>
 <1562612447-19856-4-git-send-email-jcrouse@codeaurora.org>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <aeae2aa1-9473-d661-dcf3-f086fe36d02a@arm.com>
Date: Wed, 10 Jul 2019 17:45:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1562612447-19856-4-git-send-email-jcrouse@codeaurora.org>
Content-Language: en-GB
Subject: Re: [Freedreno] [RESEND PATCH v2 3/3] iommu/arm-smmu: Add support
 for DOMAIN_ATTR_SPLIT_TABLES
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
 hoegsberg@google.com, Will Deacon <will@kernel.org>,
 linux-arm-kernel@lists.infradead.org, baolu.lu@linux.intel.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

T24gMDgvMDcvMjAxOSAyMDowMCwgSm9yZGFuIENyb3VzZSB3cm90ZToKPiBXaGVuIERPTUFJTl9B
VFRSX1NQTElUX1RBQkxFUyBpcyBzcGVjaWZpZWQgZm9yIHBhc3MgQVJNXzY0X0xQQUVfU1BMSVRf
UzEKPiB0byBpb19wZ3RhYmxlX29wcyB0byBhbGxvY2F0ZSBhbmQgaW5pdGlhbGl6ZSBUVEJSMCBh
bmQgVFRCUjEgcGFnZXRhYmxlcy4KPiAKPiB2MzogTW92ZWQgYWxsIHRoZSBwYWdldGFibGUgc3Bl
Y2lmaWMgd29yayBpbnRvIGlvLXBndGFibGUtYXJtCj4gaW4gYSBwcmV2aW91cyBwYXRjaC4KPiAK
PiBTaWduZWQtb2ZmLWJ5OiBKb3JkYW4gQ3JvdXNlIDxqY3JvdXNlQGNvZGVhdXJvcmEub3JnPgo+
IC0tLQo+IAo+ICAgZHJpdmVycy9pb21tdS9hcm0tc21tdS5jIHwgMTYgKysrKysrKysrKysrKysr
LQo+ICAgMSBmaWxlIGNoYW5nZWQsIDE1IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiAK
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9pb21tdS9hcm0tc21tdS5jIGIvZHJpdmVycy9pb21tdS9h
cm0tc21tdS5jCj4gaW5kZXggNjUzYjZiMy4uN2E2YjRiYiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJz
L2lvbW11L2FybS1zbW11LmMKPiArKysgYi9kcml2ZXJzL2lvbW11L2FybS1zbW11LmMKPiBAQCAt
MjU3LDYgKzI1Nyw3IEBAIHN0cnVjdCBhcm1fc21tdV9kb21haW4gewo+ICAgCWJvb2wJCQkJbm9u
X3N0cmljdDsKPiAgIAlzdHJ1Y3QgbXV0ZXgJCQlpbml0X211dGV4OyAvKiBQcm90ZWN0cyBzbW11
IHBvaW50ZXIgKi8KPiAgIAlzcGlubG9ja190CQkJY2JfbG9jazsgLyogU2VyaWFsaXNlcyBBVFMx
KiBvcHMgYW5kIFRMQiBzeW5jcyAqLwo+ICsJdTMyIGF0dHJpYnV0ZXM7Cj4gICAJc3RydWN0IGlv
bW11X2RvbWFpbgkJZG9tYWluOwo+ICAgfTsKPiAgIAo+IEBAIC04MzIsNyArODMzLDExIEBAIHN0
YXRpYyBpbnQgYXJtX3NtbXVfaW5pdF9kb21haW5fY29udGV4dChzdHJ1Y3QgaW9tbXVfZG9tYWlu
ICpkb21haW4sCj4gICAJCWlhcyA9IHNtbXUtPnZhX3NpemU7Cj4gICAJCW9hcyA9IHNtbXUtPmlw
YV9zaXplOwo+ICAgCQlpZiAoY2ZnLT5mbXQgPT0gQVJNX1NNTVVfQ1RYX0ZNVF9BQVJDSDY0KSB7
Cj4gLQkJCWZtdCA9IEFSTV82NF9MUEFFX1MxOwo+ICsJCQlpZiAoc21tdV9kb21haW4tPmF0dHJp
YnV0ZXMgJgo+ICsJCQkJKDEgPDwgRE9NQUlOX0FUVFJfU1BMSVRfVEFCTEVTKSkKPiArCQkJCWZt
dCA9IEFSTV82NF9MUEFFX1NQTElUX1MxOwo+ICsJCQllbHNlCj4gKwkJCQlmbXQgPSBBUk1fNjRf
TFBBRV9TMTsKPiAgIAkJfSBlbHNlIGlmIChjZmctPmZtdCA9PSBBUk1fU01NVV9DVFhfRk1UX0FB
UkNIMzJfTCkgewo+ICAgCQkJZm10ID0gQVJNXzMyX0xQQUVfUzE7Cj4gICAJCQlpYXMgPSBtaW4o
aWFzLCAzMlVMKTsKPiBAQCAtMTU4Miw2ICsxNTg3LDEwIEBAIHN0YXRpYyBpbnQgYXJtX3NtbXVf
ZG9tYWluX2dldF9hdHRyKHN0cnVjdCBpb21tdV9kb21haW4gKmRvbWFpbiwKPiAgIAkJY2FzZSBE
T01BSU5fQVRUUl9ORVNUSU5HOgo+ICAgCQkJKihpbnQgKilkYXRhID0gKHNtbXVfZG9tYWluLT5z
dGFnZSA9PSBBUk1fU01NVV9ET01BSU5fTkVTVEVEKTsKPiAgIAkJCXJldHVybiAwOwo+ICsJCWNh
c2UgRE9NQUlOX0FUVFJfU1BMSVRfVEFCTEVTOgo+ICsJCQkqKGludCAqKWRhdGEgPSAhIShzbW11
X2RvbWFpbi0+YXR0cmlidXRlcyAmCj4gKwkJCQkoMSA8PCBET01BSU5fQVRUUl9TUExJVF9UQUJM
RVMpKTsKCkknbSBub3QgcmVhbGx5IGEgZmFuIG9mIGFsd2F5cyBjbGFpbWluZyB0byBzdXBwb3J0
IHRoaXMgYnV0IHNpbGVudGx5IAppZ25vcmluZyBpdCBkZXBlbmRpbmcgb24gaGFyZHdhcmUva2Vy
bmVsIGNvbmZpZ3VyYXRpb24gLSBpdCBzZWVtcyAKc29tZXdoYXQgdHJpY2t5IHRvIG1ha2UgY2Fs
bGVycyBwcm9wZXJseSByb2J1c3QgYWdhaW5zdCBtYWtpbmcgZmFsc2UgCmFzc3VtcHRpb25zIChl
LmcuIGNvbnNpZGVyIGlmIHRoZSBzeXN0ZW0gaXMgYm9vdGVkIHdpdGggCiJhcm0tc21tdS5mb3Jj
ZV9zdGFnZT0yIikuCgpSb2Jpbi4KCj4gKwkJCXJldHVybiAwOwo+ICAgCQlkZWZhdWx0Ogo+ICAg
CQkJcmV0dXJuIC1FTk9ERVY7Cj4gICAJCX0KPiBAQCAtMTYyMiw2ICsxNjMxLDExIEBAIHN0YXRp
YyBpbnQgYXJtX3NtbXVfZG9tYWluX3NldF9hdHRyKHN0cnVjdCBpb21tdV9kb21haW4gKmRvbWFp
biwKPiAgIAkJCWVsc2UKPiAgIAkJCQlzbW11X2RvbWFpbi0+c3RhZ2UgPSBBUk1fU01NVV9ET01B
SU5fUzE7Cj4gICAJCQlicmVhazsKPiArCQljYXNlIERPTUFJTl9BVFRSX1NQTElUX1RBQkxFUzoK
PiArCQkJaWYgKCooKGludCAqKWRhdGEpKQo+ICsJCQkJc21tdV9kb21haW4tPmF0dHJpYnV0ZXMg
fD0KPiArCQkJCQkoMSA8PCBET01BSU5fQVRUUl9TUExJVF9UQUJMRVMpOwo+ICsJCQlicmVhazsK
PiAgIAkJZGVmYXVsdDoKPiAgIAkJCXJldCA9IC1FTk9ERVY7Cj4gICAJCX0KPiAKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KRnJlZWRyZW5vIG1haWxpbmcg
bGlzdApGcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZnJlZWRyZW5v

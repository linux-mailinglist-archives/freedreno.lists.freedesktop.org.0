Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 30CF439FCEA
	for <lists+freedreno@lfdr.de>; Tue,  8 Jun 2021 18:55:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDCF26E105;
	Tue,  8 Jun 2021 16:55:30 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com
 [IPv6:2607:f8b0:4864:20::732])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A66C06E105
 for <freedreno@lists.freedesktop.org>; Tue,  8 Jun 2021 16:55:29 +0000 (UTC)
Received: by mail-qk1-x732.google.com with SMTP id k11so19220349qkk.1
 for <freedreno@lists.freedesktop.org>; Tue, 08 Jun 2021 09:55:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek-ca.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=u0jkiDRYCG9tDKJ5bWYS1XDj3QKmjRotfMyh8Z3wS/8=;
 b=A5JfgkNIXbw7zRFkCQvIO7v0/mtkxi+fmo+QnohaqF2ZVD9FOYLVvx37F/fINlIt7U
 IUhslFH3Q9p0bAyz2sjljW5BZE9qoSUtMFiG+tNzeFL6P1doG3yJDeVJJZl5w/m46n4j
 K1Blp0UxBcATeQHcNooWc5Jc8QetEa169iQrHKhPhqMUiD/Yx+LOc9gmn/kYmYThJcK5
 QHkkwGuIz4reZ0citIlB+tRh4QEymvX/R5qaLVS0LL7upgmuSgF7cdObCyguqYbSnbyn
 FUgHFL8qabZUglarZxie3yMRqr5x2KX1vGoCdyPp35YzDoK3tX7sCr4SLC+k1ERg2G6t
 GqnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=u0jkiDRYCG9tDKJ5bWYS1XDj3QKmjRotfMyh8Z3wS/8=;
 b=NdldcnM2UlwTyXb9E5RdeaH5yaSfHzrO2Q8q/bZxcfqTXZr/Nat3Sa4ALsWXaZQY4H
 pLhtTpyePGMo6W0b+T/BRqCV4f5h8L9hiQ+XGp4sXN7onZrf63Nwchz6Dp+0+zGV5HeB
 QCqMnvvCgmt2Y69LAzyVaSvQbsLRAwh5wTGhXpMKTtNXzQTdbRHqPDKFLk+aJl0jUCPo
 11ZEh5C2F4S/KK10XZnOAip5c/DwOVM7znuNqrErpwEgNUftdQSsBzreCfoBgi1Trn21
 xdwcQpuiR66TcdIyfqHfPHdVwV1KNKuhhEpHYGVYlczxyg3encmIOCIUDJrmLetItOmW
 5TWA==
X-Gm-Message-State: AOAM533rOQJc3sncuT3uXnYrgNz44uLfrBgGmhDq5tbgC7eKqPLDptbI
 13ZI7CIwJ8ya51cYufeqAVX9fw==
X-Google-Smtp-Source: ABdhPJzsgmTE+FYjCjQ89/qlYNd7CK3mU8AEGjcZnqOY3tWmhR+skZOgk9rTfy7cVDsI+1rBwYiq9g==
X-Received: by 2002:a37:6884:: with SMTP id
 d126mr22160972qkc.497.1623171328720; 
 Tue, 08 Jun 2021 09:55:28 -0700 (PDT)
Received: from [192.168.0.189] (modemcable068.184-131-66.mc.videotron.ca.
 [66.131.184.68])
 by smtp.gmail.com with ESMTPSA id h19sm9936019qtq.5.2021.06.08.09.55.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jun 2021 09:55:28 -0700 (PDT)
To: Akhil P Oommen <akhilpo@codeaurora.org>, freedreno@lists.freedesktop.org
References: <20210513171431.18632-1-jonathan@marek.ca>
 <20210513171431.18632-7-jonathan@marek.ca>
 <055b924e-43fe-1b2b-7292-43a88f9798c2@codeaurora.org>
From: Jonathan Marek <jonathan@marek.ca>
Message-ID: <8dd37a7b-b58f-3cf6-346e-ca5add2a163c@marek.ca>
Date: Tue, 8 Jun 2021 12:53:44 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <055b924e-43fe-1b2b-7292-43a88f9798c2@codeaurora.org>
Content-Language: en-US
Subject: Re: [Freedreno] [PATCH v2 6/8] drm/msm/a6xx: add support for Adreno
 660 GPU
X-BeenThere: freedreno@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Shawn Guo <shawn.guo@linaro.org>, kbuild test robot <lkp@intel.com>,
 David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Sharat Masetty <smasetty@codeaurora.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Douglas Anderson <dianders@chromium.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>, Eric Anholt <eric@anholt.net>,
 Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Sean Paul <sean@poorly.run>,
 open list <linux-kernel@vger.kernel.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

T24gNS8zMS8yMSAxMTowNSBBTSwgQWtoaWwgUCBPb21tZW4gd3JvdGU6Cj4gT24gNS8xMy8yMDIx
IDEwOjQ0IFBNLCBKb25hdGhhbiBNYXJlayB3cm90ZToKCi4uLgoKPj4gQEAgLTUxOSw3ICs1MTks
NyBAQCBzdGF0aWMgdm9pZCBhNnh4X2dtdV9ycG1oX2luaXQoc3RydWN0IGE2eHhfZ211ICpnbXUp
Cj4+IMKgwqDCoMKgwqAgaWYgKCFwZGNwdHIpCj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBnb3RvIGVy
cjsKPj4gLcKgwqDCoCBpZiAoYWRyZW5vX2lzX2E2NTAoYWRyZW5vX2dwdSkpCj4+ICvCoMKgwqAg
aWYgKGFkcmVub19pc19hNjUwKGFkcmVub19ncHUpIHx8IGFkcmVub19pc19hNjYwKGFkcmVub19n
cHUpKQo+IAo+IHdoeSBub3QgYWRyZW5vX2lzX2E2NTBfZmFtaWx5KCkgaGVyZT8KPiAKCkJhc2Vk
IG9uIGRvd25zdHJlYW0sIGE2MjAgaXMgcGFydCBvZiBhNjUwX2ZhbWlseSBidXQgZG9lcyBub3Qg
aGF2ZSAKcGRjX2luX2FvcCBmbGFnLgoKPj4gQEAgLTc1MSw3ICs3NTEsNyBAQCBzdGF0aWMgaW50
IGE2eHhfZ211X2Z3X3N0YXJ0KHN0cnVjdCBhNnh4X2dtdSAqZ211LCAKPj4gdW5zaWduZWQgaW50
IHN0YXRlKQo+PiDCoMKgwqDCoMKgIGludCByZXQ7Cj4+IMKgwqDCoMKgwqAgdTMyIGNoaXBpZDsK
PiBXZSBuZWVkIHRvIHByb2dyYW0gdGhpcyByZWdpc3RlciBoZXJlOgo+IGdtdV93cml0ZShnbXUs
IFJFR19BNlhYX0dQVV9HTVVfQ1hfR01VX0NYX0ZBTE5FWFRfSU5URiwgMSk7Cj4gCgptc20tNC4x
OSBkb2VzIG5vdCBoYXZlIHRoaXMgd3JpdGUgZm9yIGE2NTAsIGJ1dCBtc20tNS40IHRoZW4gYWRk
cyBpdC4gCldpbGwgbWFrZSBpdCBhIHNlcGFyYXRlIGNoYW5nZSBzaW5jZSBpdCBhZmZlY3RzIGE2
NTAgYW5kIG5vdCBqdXN0IGE2NjAuCgo+PiAtwqDCoMKgIGlmIChhZHJlbm9faXNfYTY1MChhZHJl
bm9fZ3B1KSkKPj4gK8KgwqDCoCBpZiAoYWRyZW5vX2lzX2E2NTAoYWRyZW5vX2dwdSkgfHwgYWRy
ZW5vX2lzX2E2NjAoYWRyZW5vX2dwdSkpCj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBnbXVfd3JpdGUo
Z211LCBSRUdfQTZYWF9HUFVfR01VX0NYX0dNVV9DWF9GQUxfSU5URiwgMSk7Cj4+IMKgwqDCoMKg
wqAgaWYgKHN0YXRlID09IEdNVV9XQVJNX0JPT1QpIHsKPj4gQEAgLTE0OTQsMTIgKzE0OTQsMjgg
QEAgaW50IGE2eHhfZ211X2luaXQoc3RydWN0IGE2eHhfZ3B1ICphNnh4X2dwdSwgCj4+IHN0cnVj
dCBkZXZpY2Vfbm9kZSAqbm9kZSkKPj4gwqDCoMKgwqDCoCBpZiAocmV0KQo+PiDCoMKgwqDCoMKg
wqDCoMKgwqAgZ290byBlcnJfcHV0X2RldmljZTsKPj4gKwo+PiArwqDCoMKgIC8qIEE2NjAgbm93
IHJlcXVpcmVzIGhhbmRsaW5nICJwcmVhbGxvYyByZXF1ZXN0cyIgaW4gR01VIGZpcm13YXJlCj4+
ICvCoMKgwqDCoCAqIEZvciBub3cganVzdCBoYXJkY29kZSBhbGxvY2F0aW9ucyBiYXNlZCBvbiB0
aGUga25vd24gZmlybXdhcmUuCj4+ICvCoMKgwqDCoCAqIG5vdGU6IHRoZXJlIGlzIG5vIGluZGlj
YXRpb24gdGhhdCB0aGVzZSBjb3JyZXNwb25kIHRvICJkdW1teSIgb3IKPj4gK8KgwqDCoMKgICog
ImRlYnVnIiByZWdpb25zLCBidXQgdGhpcyAiZ3Vlc3MiIGFsbG93cyByZXVzaW5nIHRoZXNlIEJP
cyB3aGljaAo+PiArwqDCoMKgwqAgKiBhcmUgb3RoZXJ3aXNlIHVudXNlZCBieSBhNjYwLgo+PiAr
wqDCoMKgwqAgKi8KPj4gK8KgwqDCoCBnbXUtPmR1bW15LnNpemUgPSBTWl80SzsKPj4gK8KgwqDC
oCBpZiAoYWRyZW5vX2lzX2E2NjAoYWRyZW5vX2dwdSkpIHsKPj4gK8KgwqDCoMKgwqDCoMKgIHJl
dCA9IGE2eHhfZ211X21lbW9yeV9hbGxvYyhnbXUsICZnbXUtPmRlYnVnLCBTWl80SyAqIDcsIAo+
PiAweDYwNDAwMDAwKTsKPj4gK8KgwqDCoMKgwqDCoMKgIGlmIChyZXQpCj4+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIGdvdG8gZXJyX21lbW9yeTsKPiAKPiBJIHRoaW5rIHdlIGNhbiBzaW1wbHkg
aWdub3JlIHRoaXMgYWxsb2NhdGlvbiBmb3IgYTY2MCBiZWNhdXNlIGl0IHdhcyAKPiByZXF1aXJl
ZCBmb3IgYW4gdW51c2VkIGZlYXR1cmUuIERvIHlvdSBzZWUgYW55IGlzc3VlIGlmIHlvdSBpZ25v
cmUgdGhpcyAKPiBhbGxvY2F0aW9uPwo+IAoKWWVzLCB3aXRob3V0IGl0IHRoZXJlIHdpbGwgYmUg
YW4gZXJyb3I6Cgphcm0tc21tdSAzZGEwMDAwLmlvbW11OiBVbmhhbmRsZWQgY29udGV4dCBmYXVs
dDogZnNyPTB4NDAyLCAKaW92YT0weDYwNDAwMDAwLCBmc3lucj0weDMyLCBjYmZyc3lucmE9MHg1
LCBjYj0yCgo+PiArCj4+ICvCoMKgwqDCoMKgwqDCoCBnbXUtPmR1bW15LnNpemUgPSBTWl84SzsK
Pj4gK8KgwqDCoCB9Cj4+ICsKPj4gwqDCoMKgwqDCoCAvKiBBbGxvY2F0ZSBtZW1vcnkgZm9yIHRo
ZSBHTVUgZHVtbXkgcGFnZSAqLwo+PiAtwqDCoMKgIHJldCA9IGE2eHhfZ211X21lbW9yeV9hbGxv
YyhnbXUsICZnbXUtPmR1bW15LCBTWl80SywgMHg2MDAwMDAwMCk7Cj4+ICvCoMKgwqAgcmV0ID0g
YTZ4eF9nbXVfbWVtb3J5X2FsbG9jKGdtdSwgJmdtdS0+ZHVtbXksIGdtdS0+ZHVtbXkuc2l6ZSwg
Cj4+IDB4NjAwMDAwMDApOwo+PiDCoMKgwqDCoMKgIGlmIChyZXQpCj4+IMKgwqDCoMKgwqDCoMKg
wqDCoCBnb3RvIGVycl9tZW1vcnk7Cj4+IC3CoMKgwqAgaWYgKGFkcmVub19pc19hNjUwKGFkcmVu
b19ncHUpKSB7Cj4+ICvCoMKgwqAgaWYgKGFkcmVub19pc19hNjUwX2ZhbWlseShhZHJlbm9fZ3B1
KSkgewo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0ID0gYTZ4eF9nbXVfbWVtb3J5X2FsbG9jKGdt
dSwgJmdtdS0+aWNhY2hlLAo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBTWl8xNk0gLSBT
Wl8xNkssIDB4MDQwMDApOwo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKHJldCkKPj4gQEAgLTg4
NSw2ICs5MzcsMTMgQEAgc3RhdGljIGludCBhNnh4X2h3X2luaXQoc3RydWN0IG1zbV9ncHUgKmdw
dSkKPj4gwqDCoMKgwqDCoCAvKiBQcm90ZWN0IHJlZ2lzdGVycyBmcm9tIHRoZSBDUCAqLwo+PiDC
oMKgwqDCoMKgIGE2eHhfc2V0X2NwX3Byb3RlY3QoZ3B1KTsKPj4gK8KgwqDCoCBpZiAoYWRyZW5v
X2lzX2E2NjAoYWRyZW5vX2dwdSkpIHsKPj4gK8KgwqDCoMKgwqDCoMKgIGdwdV93cml0ZShncHUs
IFJFR19BNlhYX0NQX0NISUNLRU5fREJHLCAweDEpOwo+PiArwqDCoMKgwqDCoMKgwqAgZ3B1X3dy
aXRlKGdwdSwgUkVHX0E2WFhfUkJCTV9HQklGX0NMSUVOVF9RT1NfQ05UTCwgMHgwKTsKPj4gK8Kg
wqDCoMKgwqDCoMKgIC8qIFNldCBkdWFsUSArIGRpc2FibGUgYWZ1bGwgZm9yIEE2NjAgR1BVIGJ1
dCBub3QgZm9yIEE2MzUgKi8KPj4gK8KgwqDCoMKgwqDCoMKgIGdwdV93cml0ZShncHUsIFJFR19B
NlhYX1VDSEVfQ01EUV9DT05GSUcsIDB4NjY5MDYpOwo+PiArwqDCoMKgIH0KPj4gKwo+IGdwdV9y
bXcoZ3B1LCBSRUdfQTZYWF9QQ19EQkdfRUNPX0NOVEwsIDAsICgxIDw8IDkpKTsKPiBXZSBuZWVk
IHRoaXMgZm9yIGE2NDAsIGE2NTAgYW5kIGE2NjAuCj4gCgpXaWxsIG1ha2UgdGhpcyBhIHNlcGFy
YXRlIHBhdGNoIHRvbywgc2luY2UgaXQgYWZmZWN0cyBub24tYTY2MCBHUFVzIHRvby4KCj4+IMKg
wqDCoMKgwqAgLyogRW5hYmxlIGV4cGFuZGVkIGFwcml2IGZvciB0YXJnZXRzIHRoYXQgc3VwcG9y
dCBpdCAqLwo+PiDCoMKgwqDCoMKgIGlmIChncHUtPmh3X2Fwcml2KSB7Cj4+IMKgwqDCoMKgwqDC
oMKgwqDCoCBncHVfd3JpdGUoZ3B1LCBSRUdfQTZYWF9DUF9BUFJJVl9DTlRMLAo+PiArLyogY2hl
Y2sgZm9yIGE2NTAsIGE2NjAsIG9yIGFueSBkZXJpdmF0aXZlcyAqLwo+PiArc3RhdGljIGlubGlu
ZSBpbnQgYWRyZW5vX2lzX2E2NTBfZmFtaWx5KHN0cnVjdCBhZHJlbm9fZ3B1ICpncHUpCj4+ICt7
Cj4+ICvCoMKgwqDCoMKgwqAgcmV0dXJuIGdwdS0+cmV2biA9PSA2NTAgfHwgZ3B1LT5yZXZuID09
IDYyMCB8fAo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZ3B1LT5yZXZuID09IDY2MCB8
fCBncHUtPnJldm4gPT0gNjM1Owo+IFdlIGNhbiByZW1vdmUgNjM1IHJlZmVyZW5jZXMgdGhyb3Vn
aG91dCBzaW5jZSB0aGF0IGlzIG5vdCBhIHZhbGlkIGFkcmVubyAKPiBjaGlwaWQgYW55bW9yZS4K
PiAKPiAtQWtoaWwKCkkgd2lsbCByZW1vdmUgaXQgZm9yIG15IHBhdGNoIChpdCBjYW4gZGlzY3Vz
c2VkIHdoZW4gYWRkaW5nIDYzNSBzdXBwb3J0LCAKYnV0IEkgdGhpbmsgeW91IHdpbGwgbmVlZCB0
byBoYXZlIGEgNnh4IElEIGZvciB0aGUgR1BVKQoKPj4gK30KPj4gKwo+PiDCoCBpbnQgYWRyZW5v
X2dldF9wYXJhbShzdHJ1Y3QgbXNtX2dwdSAqZ3B1LCB1aW50MzJfdCBwYXJhbSwgdWludDY0X3Qg
Cj4+ICp2YWx1ZSk7Cj4+IMKgIGNvbnN0IHN0cnVjdCBmaXJtd2FyZSAqYWRyZW5vX3JlcXVlc3Rf
Zncoc3RydWN0IGFkcmVub19ncHUgKmFkcmVub19ncHUsCj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBj
b25zdCBjaGFyICpmd25hbWUpOwo+PgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpGcmVlZHJlbm8gbWFpbGluZyBsaXN0CkZyZWVkcmVub0BsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9mcmVlZHJlbm8K

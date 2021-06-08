Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F280039FB51
	for <lists+freedreno@lfdr.de>; Tue,  8 Jun 2021 17:56:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACE0E6E200;
	Tue,  8 Jun 2021 15:56:29 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com
 [IPv6:2607:f8b0:4864:20::82a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFB766E203
 for <freedreno@lists.freedesktop.org>; Tue,  8 Jun 2021 15:56:28 +0000 (UTC)
Received: by mail-qt1-x82a.google.com with SMTP id z4so12624847qts.4
 for <freedreno@lists.freedesktop.org>; Tue, 08 Jun 2021 08:56:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek-ca.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=SvrvGcdTqd/A2IzqKVxAjzaPvjwWLLId9Ilxa/8ESFQ=;
 b=TGN6mpHcaPFQwHVw/GHM7ip0el1hd+0GbdCjU7WFXQjIeCWukpCfBh8rMkDIHRdosp
 Q/LfJzQq7YCqM7ulA9Kg9TU02S0vhVEVeohZ8FHyWFLQ8d7dKe9CMMYkVTfvKgQBUc1q
 gpQWsG9Cx4HioXDP4E7cBUteCE5WUgXDnzHrmpn/qVQTEuEMNT41YRN+fUY/jUt+u1eM
 AXtwi4Zd9ZuwfRHh0bOxl1UYTGZDg6GM6nB//CR9MshABAVf8HuWx3+MXKq4+i51En1C
 Yj7hqYtCJc/4fgsc5rh1FlzLxQ7EEvICLUzEsSaDKeajNFR1fip2MmgC+oHi2l9VqD5l
 wonA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=SvrvGcdTqd/A2IzqKVxAjzaPvjwWLLId9Ilxa/8ESFQ=;
 b=OvuMWrfWYTs2t3WqAwR836OshaTrKev+hURrW92Icp2BfB3+VAZsYi8XHijcN/5MQR
 UoMM+84DZmKQRmvfbtZ5JLzRj/0BJltnClrrjGWVLl/pe+Vj6U+kbYeWzA5/Iy/BQ76n
 yMg4mfoLuGshqjCQ6/Ac+ruSDoA4tLKdhavEvWkRrgUc/9HoeZEPkruy3LdDtMovSRuR
 4fYypC+25FQ3GKhXuedkTZhRO44nR9APokcohUCR0+sNFZx6NsW2oNc4mXHrwSs1KdQb
 yyVuGzyW9rgjn87iCsTnoTYuoBngjQAxRQtKLSp/h3m/EDELiexfpL7KwpkgAM9sst8H
 qqMA==
X-Gm-Message-State: AOAM533+eGvlUebajtRtGLJ1nqjaAsSxH644ipLBr39oY+GB3UXtE6xz
 kxmQ2MSuaMmAPeYMmyGrJl3BEA==
X-Google-Smtp-Source: ABdhPJy/UH8rRqmpAvUYWlHIcj680L6hW8fGJr7C6UkJboop+ydDiBFqBIFuB1C1L+iH8lasHCi7vw==
X-Received: by 2002:a05:622a:587:: with SMTP id
 c7mr21989371qtb.315.1623167787791; 
 Tue, 08 Jun 2021 08:56:27 -0700 (PDT)
Received: from [192.168.0.189] (modemcable068.184-131-66.mc.videotron.ca.
 [66.131.184.68])
 by smtp.gmail.com with ESMTPSA id c68sm12078843qkd.112.2021.06.08.08.56.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jun 2021 08:56:27 -0700 (PDT)
To: Akhil P Oommen <akhilpo@codeaurora.org>, freedreno@lists.freedesktop.org
References: <20210513171431.18632-1-jonathan@marek.ca>
 <20210513171431.18632-3-jonathan@marek.ca>
 <bd5dc0e5-2c49-31fe-a290-0d8e75b45c94@codeaurora.org>
From: Jonathan Marek <jonathan@marek.ca>
Message-ID: <b16de5ab-1485-a814-0885-c266a8706f0c@marek.ca>
Date: Tue, 8 Jun 2021 11:54:44 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <bd5dc0e5-2c49-31fe-a290-0d8e75b45c94@codeaurora.org>
Content-Language: en-US
Subject: Re: [Freedreno] [PATCH v2 2/8] drm/msm/a6xx: use AOP-initialized
 PDC for a650
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
Cc: David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Sharat Masetty <smasetty@codeaurora.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>, Eric Anholt <eric@anholt.net>,
 Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Sean Paul <sean@poorly.run>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

T24gNS8zMS8yMSAzOjI0IEFNLCBBa2hpbCBQIE9vbW1lbiB3cm90ZToKPiBPbiA1LzEzLzIwMjEg
MTA6NDMgUE0sIEpvbmF0aGFuIE1hcmVrIHdyb3RlOgo+PiBTTTgyNTAgQU9QIGZpcm13YXJlIGFs
cmVhZHkgc2V0cyB1cCBQREMgcmVnaXN0ZXJzIGZvciB1cywgYW5kIGl0IG9ubHkgCj4+IG5lZWRz
Cj4+IHRvIGJlIGVuYWJsZWQuIFRoaXMgcGF0aCB3aWxsIGJlIHVzZWQgZm9yIG90aGVyIG5ld2Vy
IEdQVXMuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEpvbmF0aGFuIE1hcmVrIDxqb25hdGhhbkBtYXJl
ay5jYT4KPj4gLS0tCj4+IMKgIGRyaXZlcnMvZ3B1L2RybS9tc20vYWRyZW5vL2E2eHhfZ211LmMg
fCAyMSArKysrKysrKysrKysrKysrLS0tLS0KPj4gwqAgMSBmaWxlIGNoYW5nZWQsIDE2IGluc2Vy
dGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vbXNtL2FkcmVuby9hNnh4X2dtdS5jIAo+PiBiL2RyaXZlcnMvZ3B1L2RybS9tc20vYWRyZW5v
L2E2eHhfZ211LmMKPj4gaW5kZXggM2Q1NWUxNTNmYTljLi5jMWVlMDJkNjM3MWQgMTAwNjQ0Cj4+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tc20vYWRyZW5vL2E2eHhfZ211LmMKPj4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL21zbS9hZHJlbm8vYTZ4eF9nbXUuYwo+PiBAQCAtNTEyLDE5ICs1MTIsMjYg
QEAgc3RhdGljIHZvaWQgYTZ4eF9nbXVfcnBtaF9pbml0KHN0cnVjdCBhNnh4X2dtdSAKPj4gKmdt
dSkKPj4gwqDCoMKgwqDCoCBzdHJ1Y3QgYWRyZW5vX2dwdSAqYWRyZW5vX2dwdSA9ICZhNnh4X2dw
dS0+YmFzZTsKPj4gwqDCoMKgwqDCoCBzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2ID0gdG9f
cGxhdGZvcm1fZGV2aWNlKGdtdS0+ZGV2KTsKPj4gwqDCoMKgwqDCoCB2b2lkIF9faW9tZW0gKnBk
Y3B0ciA9IGE2eHhfZ211X2dldF9tbWlvKHBkZXYsICJnbXVfcGRjIik7Cj4+IC3CoMKgwqAgdm9p
ZCBfX2lvbWVtICpzZXFwdHIgPSBhNnh4X2dtdV9nZXRfbW1pbyhwZGV2LCAiZ211X3BkY19zZXEi
KTsKPj4gK8KgwqDCoCB2b2lkIF9faW9tZW0gKnNlcXB0cjsKPj4gwqDCoMKgwqDCoCB1aW50MzJf
dCBwZGNfYWRkcmVzc19vZmZzZXQ7Cj4+ICvCoMKgwqAgYm9vbCBwZGNfaW5fYW9wID0gZmFsc2U7
Cj4+IC3CoMKgwqAgaWYgKCFwZGNwdHIgfHwgIXNlcXB0cikKPj4gK8KgwqDCoCBpZiAoIXBkY3B0
cikKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIGdvdG8gZXJyOwo+PiAtwqDCoMKgIGlmIChhZHJlbm9f
aXNfYTYxOChhZHJlbm9fZ3B1KSB8fCBhZHJlbm9faXNfYTY0MChhZHJlbm9fZ3B1KSkKPj4gK8Kg
wqDCoCBpZiAoYWRyZW5vX2lzX2E2NTAoYWRyZW5vX2dwdSkpCj4+ICvCoMKgwqDCoMKgwqDCoCBw
ZGNfaW5fYW9wID0gdHJ1ZTsKPj4gK8KgwqDCoCBlbHNlIGlmIChhZHJlbm9faXNfYTYxOChhZHJl
bm9fZ3B1KSB8fCBhZHJlbm9faXNfYTY0MChhZHJlbm9fZ3B1KSkKPj4gwqDCoMKgwqDCoMKgwqDC
oMKgIHBkY19hZGRyZXNzX29mZnNldCA9IDB4MzAwOTA7Cj4+IC3CoMKgwqAgZWxzZSBpZiAoYWRy
ZW5vX2lzX2E2NTAoYWRyZW5vX2dwdSkpCj4+IC3CoMKgwqDCoMKgwqDCoCBwZGNfYWRkcmVzc19v
ZmZzZXQgPSAweDMwMGEwOwo+PiDCoMKgwqDCoMKgIGVsc2UKPj4gwqDCoMKgwqDCoMKgwqDCoMKg
IHBkY19hZGRyZXNzX29mZnNldCA9IDB4MzAwODA7Cj4+ICvCoMKgwqAgaWYgKCFwZGNfaW5fYW9w
KSB7Cj4+ICvCoMKgwqDCoMKgwqDCoCBzZXFwdHIgPSBhNnh4X2dtdV9nZXRfbW1pbyhwZGV2LCAi
Z211X3BkY19zZXEiKTsKPj4gK8KgwqDCoMKgwqDCoMKgIGlmICghc2VxcHRyKQo+PiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBnb3RvIGVycjsKPj4gK8KgwqDCoCB9Cj4+ICsKPj4gwqDCoMKgwqDC
oCAvKiBEaXNhYmxlIFNERSBjbG9jayBnYXRpbmcgKi8KPj4gwqDCoMKgwqDCoCBnbXVfd3JpdGVf
cnNjYyhnbXUsIFJFR19BNlhYX0dQVV9SU0NDX1JTQ19TVEFUVVMwX0RSVjAsIEJJVCgyNCkpOwo+
PiBAQCAtNTU2LDYgKzU2Myw5IEBAIHN0YXRpYyB2b2lkIGE2eHhfZ211X3JwbWhfaW5pdChzdHJ1
Y3QgYTZ4eF9nbXUgKmdtdSkKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIGdtdV93cml0ZV9yc2NjKGdt
dSwgUkVHX0E2WFhfUlNDQ19TRVFfTUVNXzBfRFJWMCArIDQsIAo+PiAweDAwMjBlOGE4KTsKPj4g
wqDCoMKgwqDCoCB9Cj4+ICvCoMKgwqAgaWYgKHBkY19pbl9hb3ApCj4+ICvCoMKgwqDCoMKgwqDC
oCBnb3RvIHNldHVwX3BkYzsKPj4gKwo+PiDCoMKgwqDCoMKgIC8qIExvYWQgUERDIHNlcXVlbmNl
ciB1Q29kZSBmb3IgcG93ZXIgdXAgYW5kIHBvd2VyIGRvd24gc2VxdWVuY2UgKi8KPj4gwqDCoMKg
wqDCoCBwZGNfd3JpdGUoc2VxcHRyLCBSRUdfQTZYWF9QRENfR1BVX1NFUV9NRU1fMCwgMHhmZWJl
YTFlMSk7Cj4+IMKgwqDCoMKgwqAgcGRjX3dyaXRlKHNlcXB0ciwgUkVHX0E2WFhfUERDX0dQVV9T
RVFfTUVNXzAgKyAxLCAweGE1YTRhM2EyKTsKPj4gQEAgLTU5Niw2ICs2MDYsNyBAQCBzdGF0aWMg
dm9pZCBhNnh4X2dtdV9ycG1oX2luaXQoc3RydWN0IGE2eHhfZ211ICpnbXUpCj4+IMKgwqDCoMKg
wqAgcGRjX3dyaXRlKHBkY3B0ciwgUkVHX0E2WFhfUERDX0dQVV9UQ1MzX0NNRDBfREFUQSArIDgs
IDB4Myk7Cj4+IMKgwqDCoMKgwqAgLyogU2V0dXAgR1BVIFBEQyAqLwo+PiArc2V0dXBfcGRjOgo+
PiDCoMKgwqDCoMKgIHBkY193cml0ZShwZGNwdHIsIFJFR19BNlhYX1BEQ19HUFVfU0VRX1NUQVJU
X0FERFIsIDApOwo+PiDCoMKgwqDCoMKgIHBkY193cml0ZShwZGNwdHIsIFJFR19BNlhYX1BEQ19H
UFVfRU5BQkxFX1BEQywgMHg4MDAwMDAwMSk7Cj4+Cj4gCj4gV2UgY2FuIHNpbXBseSBzd2FwIHRo
ZSBvcmRlciBvZiBQREMgYW5kIHJzYyBwcm9ncmFtbWluZyBoZXJlIGFuZCBza2lwIAo+IHBkYyBz
ZXF1ZW5jZSB0byBqdW1wIHRvIHRoZSByc2NjIHByb2dyYW1taW5nIGZvciBhNjUwLiBUaGlzIGlz
IHRoZSBvcmRlciAKPiBmb2xsb3dlZCBpbiB0aGUgZG93bnN0cmVhbSBkcml2ZXIgYW55d2F5Lgo+
IAo+IC1Ba2hpbC4KClRoZSBvcmRlciBpcyB0aGUgc2FtZSBhcyB0aGUgbXNtLTQuMTkga2VybmVs
IChtc20tNC4xOSBpcyB3aGF0IGE2NTAgCmhhcmR3YXJlIGFyZSB1c2luZykuCgpMb29rcyBsaWtl
IHRoZSBvcmRlciB3YXMgc3dhcHBlZCBmb3IgdGhlIG1zbS01LjQga2VybmVsLCBidXQgaWYgdGhl
IApvcmRlciBpc24ndCBpbXBvcnRhbnQsIEkgdGhpbmsgaXQgaXMgcHJlZmVyYWJsZSB0byBrZWVw
IHRoZSBjdXJyZW50IApvcmRlciAodG8gYXZvaWQgYSBsYXJnZSBkaWZmIG1haW5seSkuCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkZyZWVkcmVubyBtYWls
aW5nIGxpc3QKRnJlZWRyZW5vQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ZyZWVkcmVubwo=

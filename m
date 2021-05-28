Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58FD23948AC
	for <lists+freedreno@lfdr.de>; Sat, 29 May 2021 00:30:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADC6D6E489;
	Fri, 28 May 2021 22:30:01 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E82A96E489
 for <freedreno@lists.freedesktop.org>; Fri, 28 May 2021 22:30:00 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id p20so7121157ljj.8
 for <freedreno@lists.freedesktop.org>; Fri, 28 May 2021 15:30:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=hUkZ7gxrrggMcSwtimLivRd00/zcYtdWINyTkTf1Yn0=;
 b=WbYfgllPpb7xpL0JvhDJ0S3gf34DHM1z6KtNsKWLhvjm0ZrI5pYGdFogwYLwrMFiu6
 IU4Fh+7zf+H9gmUvTEh6SUUsQoQA7QrvnATnwjHRpHM3xdunSInRhtCHF/LQEtKusgxH
 c0R/CH1ThXouZkf+4OvcBUo2SH1K7MCUNNpiydsqoMJBNPMOkU3kF6j614gTlnYAS0xb
 hvn1JVFB0Q/82b4H7FEyMi7M1PbQOVE23kqyOIJryAv3OZNvviA+89nlpjpEncC8xid+
 Wczrj2RLmXCQV+9dDyNioa011/+zmON5j02dgQoptR4fVJcWjc2VZESntK1q5StS+eqa
 MTJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hUkZ7gxrrggMcSwtimLivRd00/zcYtdWINyTkTf1Yn0=;
 b=SWi4O2LwA5dSTqui4JWsoIVQXEVsGFYvdEtr4zy30zAHVGe6DUCxcxT3vG3ZxLjTup
 8CNREf7UPz2lBc/NcMTo6wlzbtLJ+2tOHOKpJiIrWnwixVX38LMAe3GoR2gddYjpkiEQ
 VFBZhn7Dwbnl3QmzFnL9y7R3vWQRlMuruZDWc211tSIYhXcz+uGmNr/5b4OjYNKBt66u
 QIEwNE8ZUzDEVY1cY736Vh7F/r753CY/TC6SUH36UkeuaE3i2/c0Y/qyuPAW04wXs/YA
 7RcjLS5+QdCmlV1P+WA2m2uFs7LM5GROjXluTfJmrjQXnUXIoRvOI+4LS9PJ92P41I8K
 hjkg==
X-Gm-Message-State: AOAM53179buonQItXXOoMOnTDoSu6BYIEV4Ke+pN43djUFaw1HBubQn1
 Agx2cl44tLPX79zH96oCu+sNl3eNTjD2Jg==
X-Google-Smtp-Source: ABdhPJxYDy/1GEifpniZzO2atvjxU0F4Rer+fv1ZPsAFE/uscYxRE3toeCkCR4d4eD+IyuGSiymVgg==
X-Received: by 2002:a2e:a7c7:: with SMTP id x7mr8118747ljp.46.1622240998840;
 Fri, 28 May 2021 15:29:58 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id c26sm573001lfv.63.2021.05.28.15.29.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 May 2021 15:29:58 -0700 (PDT)
To: abhinavk@codeaurora.org
References: <20210521124946.3617862-1-vkoul@kernel.org>
 <20210521124946.3617862-16-vkoul@kernel.org>
 <06ffdec5-8b12-c077-0c51-6ea9100b96a4@linaro.org>
 <57a4c00413dcaba38cebf3aa145b4d64@codeaurora.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <30f44396-29f6-ad37-9457-1b15f2f934c3@linaro.org>
Date: Sat, 29 May 2021 01:29:57 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <57a4c00413dcaba38cebf3aa145b4d64@codeaurora.org>
Content-Language: en-GB
Subject: Re: [Freedreno] [RFC PATCH 11/13] drm/msm/disp/dpu1: Add support
 for DSC in topology
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
Cc: Jonathan Marek <jonathan@marek.ca>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

T24gMjkvMDUvMjAyMSAwMToyMywgYWJoaW5hdmtAY29kZWF1cm9yYS5vcmcgd3JvdGU6Cj4gT24g
MjAyMS0wNS0yOCAwMzozOSwgRG1pdHJ5IEJhcnlzaGtvdiB3cm90ZToKPj4gT24gMjEvMDUvMjAy
MSAxNTo0OSwgVmlub2QgS291bCB3cm90ZToKPj4+IEZvciBEU0MgdG8gd29yayB3ZSB0eXBpY2Fs
bHkgbmVlZCBhIDIsMiwxIGNvbmZpZ3VyYXRpb24uIFRoaXMgc2hvdWxkCj4+PiBzdWZmaWNlIGZv
ciByZXNvbHV0aW9ucyB1cHRvIDRrLiBGb3IgbW9yZSByZXNvbHV0aW9ucyBsaWtlIDhrIHRoaXMg
d29uJ3QKPj4+IHdvcmsuCj4+Pgo+Pj4gRnVydGhlcm1vcmUsIHdlIGNhbiB1c2UgMSBEU0MgZW5j
b2RlciBpbiBsZXNzZXIgcmVzdWx1dGlvbnMsIGJ1dCB0aGF0IGlzCj4+PiBub3QgcG93ZXIgZWZm
aWNpZW50IGFjY29yZGluZyB0byBBYmhpbmF2LCBzbyBpdCBpcyByZWNvbW1lbmRlZCB0byBhbHdh
eXMKPj4+IHVzZSAyIGVuY29kZXJzLgo+Pgo+PiBOb3QgcG93ZXIgZWZmaWNpZW50IGJlY2F1c2Ug
dGhlIHNlY29uZCBEU0Mgd291bGQgYWxzbyBiZSBwb3dlcmVkIG9uIG9yCj4+IGJlY2F1c2Ugc2lu
Z2xlIERTQyBlbmMgd291bGQgY29uc3VtZSBtb3JlIHBvd2VyIHRoYW4gdHdvIERTQ3M/Cj4gCj4g
SSBoYXZlbnQgZ290IHRocm91Z2ggdGhlIHNlcmllcyB5ZXQgYnV0IGp1c3QgdGhvdWdodCBvZiBh
bnN3ZXJpbmcgdGhpcywKPiAKPiBTbyBiZWZvcmUgY29taW5nIHRvIHRoZSBwb3dlciBhc3BlY3Rz
IG9mIHRoaXMsIGhhcmQtY29kaW5nIHdhcyBkb25lIGZvciAKPiB0aGUgZm9sbCByZWFzb25zOgo+
IAo+IC0+IFdlIGRvIG5vdCBoYXZlIGEgdG9wb2xvZ3kgRFRTSSBwcm9wZXJ0eSBpbiB1cHN0cmVh
bSBhbmQgd2lsbCBwcm9iYWJseSAKPiBub3QgaGF2ZSBhcyB3ZWxsIHRpbGwKPiBvdGhlciBmZWF0
dXJlcyBhcmUgYWRkZWQgd2hpY2ggc3VwcG9ydCBhbGwgdGhlIHRvcG9sb2dpZXMKPiAtPiBUaGUg
RFNDIHBhbmVsIHdoaWNoIGlzIGJlaW5nIHVwc3RyZWFtZWQgYXMgcGFydCBvZiB0aGlzIHNlcmll
cyBpcyAKPiB3b3JraW5nIHdpdGggdGhpcyAyLDIsMSB0b3BvbG9neQo+IGRvd25zdHJlYW0gKCBk
dWFsIGxtLCBkdWFsIERTQyBlbmNvZGVycywgc2luZ2xlIERTSSApLiBPdGhlciB0b3BvbG9naWVz
IAo+IGhhdmUgbm90IGJlZW4gdHJpZWQgb24gaXQgeWV0Cj4gLT4gVGhlcmUgbmVlZHMgdG8gYmUg
YSBiZXR0ZXIgYXBwcm9hY2ggdG8gaGFuZGxlIGFsbCB0b3BvbG9naWVzIG9uY2Ugd2UgCj4gaGF2
ZSBhZGRlZCBzdXBwb3J0IGZvciB0aGVtLgo+IEl0IGNhbiBiZSBlaXRoZXIgYSBEVFNJIHByb3Bl
cnR5IGlmIG90aGVycyBhZ3JlZSBPUiBzb21lIGhlbHBlciBBUEkgCj4gd2hpY2ggd2lsbCBkZXRl
cm1pbmUgdGhlIGJlc3QgdG9wb2xvZ3kKPiBiYXNlZCBvbiB2YXJpb3VzIGZhY3RvcnMuIFRpbGwg
dGhlbiwgc2luY2UgdGhpcyB3aWxsIGJlIHRoZSBvbmx5IERTQyAKPiBwYW5lbCB3ZSBhcmUgYWRk
aW5nIHN1cHBvcnQgZm9yCj4gSSB0aG91Z2h0IHdlIGNhbiBzdGFydCB3aXRoIGEgZml4ZWQgdG9w
b2xvZ3kgZm9yIG5vdy4KPiAKPiBDb21pbmcgdG8gdGhlIHBvd2VyIGFzcGVjdCwgSSBvbmx5IHJl
Y29tbWVuZGVkIDItMi0xIGhlcmUgYmVjYXVzZSB1c2luZyAKPiB0d28gbWl4ZXJzIGlzIGJldHRl
ciBwb3dlciB3aXNlCj4gYXMgaXQgd2lsbCBzcGxpdCB0aGUgd2lkdGgvMi4gV2UgY2FuIGFsc28g
ZG8gMi0xLTEgYnkgZW5hYmxpbmcgM0QgbXV4IAo+IGJ1dCB0aGlzIHBhbmVsIGhhcyBub3QgYmVl
biB2YWxpZGF0ZWQKPiB3aXRoIGEgc2luZ2xlIERTQy4gU28gdG8ga2VlcCB0aGluZ3Mgc2ltcGxl
IHdpdGggd2hhdCBoYXMgYmVlbiAKPiB2YWxpZGF0ZWQsIEkgdGhvdWdodCB3ZSBjYW4gZ28gYWhl
YWQgd2l0aAo+IDItMi0xIGZvciBub3cuCj4gCj4gU28gcmF0aGVyIHRoYW4gZ2l2aW5nIHRvbyBt
dWNoIGltcG9ydGFuY2UgdG8gdGhlIHBvd2VyIGFzcGVjdCBvZiBpdCwgdGhlIAo+IG90aGVyIHJl
YXNvbnMgc2hvdWxkIGFsc28KPiBiZSBoaWdobGlnaHRlZCBoZXJlIGFzIHRoZSBtYWluIHJlYXNv
biBhbmQgdGhlIGNvbW1pdCB0ZXh0IHNob3VsZCBnaXZlIAo+IHRoZXNlIGRldGFpbHMgYXMgd2Vs
bC4KClNvdW5kcyByZWFzb25hYmxlIG5vdywgdGhhbmsgeW91IQoKCj4gCj4+Pgo+Pj4gU28gZm9y
IG5vdyB3ZSBibGluZGx5IGNyZWF0ZSAyLDIsMSB0b3BvbG9neSB3aGVuIERTQyBpcyBlbmFibGVk
Cj4+Pgo+Pj4gQ28tZGV2ZWxvcGVkLWJ5OiBBYmhpbmF2IEt1bWFyIDxhYmhpbmF2a0Bjb2RlYXVy
b3JhLm9yZz4KPj4+IFNpZ25lZC1vZmYtYnk6IEFiaGluYXYgS3VtYXIgPGFiaGluYXZrQGNvZGVh
dXJvcmEub3JnPgo+Pj4gU2lnbmVkLW9mZi1ieTogVmlub2QgS291bCA8dmtvdWxAa2VybmVsLm9y
Zz4KPj4+IC0tLQo+Pj4gwqAgZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X2VuY29k
ZXIuYyB8IDE0ICsrKysrKysrKysrKysrCj4+PiDCoCAxIGZpbGUgY2hhbmdlZCwgMTQgaW5zZXJ0
aW9ucygrKQo+Pj4KPj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvZHB1
MS9kcHVfZW5jb2Rlci5jIAo+Pj4gYi9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvZHB1MS9kcHVf
ZW5jb2Rlci5jCj4+PiBpbmRleCAxOGNiMTI3NGE4YmIuLmJmZmI0MDA4NWM2NyAxMDA2NDQKPj4+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9kcHUxL2RwdV9lbmNvZGVyLmMKPj4+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9kcHUxL2RwdV9lbmNvZGVyLmMKPj4+IEBAIC02
MDksOCArNjA5LDIyIEBAIHN0YXRpYyBzdHJ1Y3QgbXNtX2Rpc3BsYXlfdG9wb2xvZ3kgCj4+PiBk
cHVfZW5jb2Rlcl9nZXRfdG9wb2xvZ3koCj4+PiDCoMKgwqDCoMKgIHRvcG9sb2d5Lm51bV9lbmMg
PSAwOwo+Pj4gwqDCoMKgwqDCoCB0b3BvbG9neS5udW1faW50ZiA9IGludGZfY291bnQ7Cj4+PiDC
oCArwqDCoMKgIGRybV9lbmMgPSAmZHB1X2VuYy0+YmFzZTsKPj4+ICvCoMKgwqAgcHJpdiA9IGRy
bV9lbmMtPmRldi0+ZGV2X3ByaXZhdGU7Cj4+PiArwqDCoMKgIGlmIChwcml2ICYmIHByaXYtPmRz
Yykgewo+Pj4gK8KgwqDCoMKgwqDCoMKgIC8qIEluIGNhc2Ugb2YgRGlzcGxheSBTdHJlYW0gQ29t
cHJlc3Npb24gRFNDLCB3ZSB3b3VsZCB1c2UKPj4+ICvCoMKgwqDCoMKgwqDCoMKgICogMiBlbmNv
ZGVycywgMiBsaW5lIG1peGVycyBhbmQgMSBpbnRlcmZhY2UKPj4+ICvCoMKgwqDCoMKgwqDCoMKg
ICogdGhpcyBpcyBwb3dlciBvcHRpbWFsIGFuZCBjYW4gZHJpdmUgdXB0byAoaW5jbHVkaW5nKSA0
awo+Pj4gK8KgwqDCoMKgwqDCoMKgwqAgKiBzY3JlZW5zCj4+PiArwqDCoMKgwqDCoMKgwqDCoCAq
Lwo+Pj4gK8KgwqDCoMKgwqDCoMKgIHRvcG9sb2d5Lm51bV9lbmMgPSAyOwo+Pj4gK8KgwqDCoMKg
wqDCoMKgIHRvcG9sb2d5Lm51bV9pbnRmID0gMTsKPj4+ICvCoMKgwqDCoMKgwqDCoCB0b3BvbG9n
eS5udW1fbG0gPSAyOwo+Pj4gK8KgwqDCoCB9Cj4+PiArCj4+PiDCoMKgwqDCoMKgIHJldHVybiB0
b3BvbG9neTsKPj4+IMKgIH0KPj4+ICsKPj4+IMKgIHN0YXRpYyBpbnQgZHB1X2VuY29kZXJfdmly
dF9hdG9taWNfY2hlY2soCj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAgc3RydWN0IGRybV9lbmNvZGVy
ICpkcm1fZW5jLAo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIHN0cnVjdCBkcm1fY3J0Y19zdGF0ZSAq
Y3J0Y19zdGF0ZSwKPj4+CgoKLS0gCldpdGggYmVzdCB3aXNoZXMKRG1pdHJ5Cl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkZyZWVkcmVubyBtYWlsaW5nIGxp
c3QKRnJlZWRyZW5vQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ZyZWVkcmVubwo=

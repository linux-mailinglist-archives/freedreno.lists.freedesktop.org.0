Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EDB7399590
	for <lists+freedreno@lfdr.de>; Wed,  2 Jun 2021 23:44:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97C9A6EC76;
	Wed,  2 Jun 2021 21:44:25 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74F756EE76
 for <freedreno@lists.freedesktop.org>; Wed,  2 Jun 2021 21:44:23 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id f11so5596768lfq.4
 for <freedreno@lists.freedesktop.org>; Wed, 02 Jun 2021 14:44:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ZCY+568MVSGvjT+7poACtfhiCq62TpxLzXfU4H/PG1A=;
 b=J24S+30G4HqpRD45/gRq6+oZ7LSf6/8vaT+32gHcY27Tf+RY/W67SeZi9WU7vOJT+M
 vP3ZmLGxmdouyJ1mGViFEPiAzl7h7tqC0CkUffs3QCCyZL2QRR02+wJ0rB4KP8cNO4zo
 W2CM7s+JAjq3AYJK/vjJjnW7rau2D4iA+yoIKuPhnH/oU6rwm5QrYKtYyCIfq+7FX4vA
 Kk+M1ugjZDOIKSJuUOyVmHoF/lTsTS/uq+P/ekihn90Wo0DfPb95aTb08qEe5qPUbrTY
 4xHpzxycwcBpIRBdlPIdbQynUbevg51r4yfuS86n1p56djXQ6D0GRRzGPJPq2eVuBjo+
 CHcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZCY+568MVSGvjT+7poACtfhiCq62TpxLzXfU4H/PG1A=;
 b=HsAyFOVYuQ7bE7Hvm+2gLSSerKZgKerIGlgOaIqHnSChBnLXZDzDKCDfOe+/8yWqY4
 4z6ZfuAj5gzy9cVhwm89Ug6GgQmdy9+hB9/utvBDGFr8Sv28lNOAygr6y3R6HZgumCOE
 Bia3oU4Yc/PZ+iIIxqPQVw7bPlIdotcaPVb5+ZqOdBiJACNc783Co7FU+ZTyjfqBl+WX
 Ue08I/hFB9rWcKEwrmoOMV2U2RfS3Potp4+7CGpLCC7sQoZdawpR6t20ruFOiHEsJnb0
 YwjZetRyMgDN4qQO/r39F9VFG9pnD7K+o8ZH3c8GzB1VIG5bm59ShauiKe+fvH9yclaL
 cMRA==
X-Gm-Message-State: AOAM5335duPtflj5INteurh65B/CkQJCPO37z2iXj3RrHYyAbRrd8IHY
 dkoAITbkCT9zxmK8q5u24et7ECr8WMitpA==
X-Google-Smtp-Source: ABdhPJz7ZnQkutNs0D9yhynyPCtUwpuRuz2nbNSHLTMlLc7lbcMcd77KF6odb98MtRHdD51BerqPcg==
X-Received: by 2002:a19:690f:: with SMTP id e15mr8959094lfc.192.1622670261718; 
 Wed, 02 Jun 2021 14:44:21 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id y13sm109198lfa.11.2021.06.02.14.44.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Jun 2021 14:44:21 -0700 (PDT)
To: Arnaud Vrac <rawoul@gmail.com>
References: <20210515225757.1989955-1-dmitry.baryshkov@linaro.org>
 <20210515225757.1989955-6-dmitry.baryshkov@linaro.org>
 <CAN5H-g7hWgyqtFbUpzesyKXmWr=FtFtXBKDSbCKx+1dUjxP10w@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <7b9aa146-3cb3-8164-5f26-388171230100@linaro.org>
Date: Thu, 3 Jun 2021 00:44:20 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <CAN5H-g7hWgyqtFbUpzesyKXmWr=FtFtXBKDSbCKx+1dUjxP10w@mail.gmail.com>
Content-Language: en-GB
Subject: Re: [Freedreno] [PATCH v2 5/6] drm/msm/dpu: drop unused
 lm_max_width from RM
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
Cc: freedreno@lists.freedesktop.org, Jonathan Marek <jonathan@marek.ca>,
 Stephen Boyd <sboyd@kernel.org>, MSM <linux-arm-msm@vger.kernel.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, David Airlie <airlied@linux.ie>,
 Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, Sean Paul <sean@poorly.run>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

T24gMTYvMDUvMjAyMSAwNDoyMSwgQXJuYXVkIFZyYWMgd3JvdGU6Cj4gSGkgRG1pdHJ5LAo+IAo+
IExlIGRpbS4gMTYgbWFpIDIwMjEgw6AgMDA6NTgsIERtaXRyeSBCYXJ5c2hrb3YKPiA8ZG1pdHJ5
LmJhcnlzaGtvdkBsaW5hcm8ub3JnPiBhIMOpY3JpdCA6Cj4+Cj4+IE5vIGNvZGUgdXNlcyBsbV9t
YXhfd2lkdGggZnJvbSByZXNvdXJjZSBtYW5hZ2VyLCBzbyBkcm9wIGl0Lgo+IAo+IEkgaGF2ZSBh
IHBlbmRpbmcgcGF0Y2ggd2hpY2ggdXNlcyB0aGlzIHZhbHVlIHRvIHByb3Blcmx5IGRldGVybWlu
ZSB0aGUKPiBudW1iZXIgb2YgTE1zIHRvIHVzZSBpbiB0aGUgdG9wb2xvZ3kuIEN1cnJlbnRseSB0
aGUgY29kZSB1c2VzIGEKPiBoYXJkY29kZWQgdmFsdWUgb2YgTUFYX0hESVNQTEFZX1NQTElUICgx
MDgwKSwgYnV0IGluIHJlYWxpdHkgSSBiZWxpZXZlCj4gaXQgc2hvdWxkIGJlIHRoZSBsbSBtYXgg
d2lkdGggKHR5cGljYWxseSAyNTYwKS4gVGhpcyB3aWxsIGF2b2lkIHVzaW5nCj4gdHdvIExNcyB0
byByZW5kZXIgcmVzb2x1dGlvbnMgbGlrZSAxMjgweDcyMCBvciAxOTIweDEwODAuCgpBcyBhIHNl
Y29uZCB0aG91Z2h0LCBJIHRoaW5rIHdlIGJldHRlciBoYXZlIHRoaXMgdmFsdWUgaW4gdGhlIGh3
X2NhdGFsb2cgCml0c2VsZiByYXRoZXIgdGhhbiBjYWxjdWxhdGluZyBpdCBpbiB0aGUgZHB1X3Jt
LiBXRFlUPwoKPiAKPiBJIGhhdmVuJ3QgbWFuYWdlZCB0byBtYWtlIGhkbWkgd29yayB5ZXQgb24g
RFBVICh0ZXN0aW5nIG9uIE1TTTg5OTgpIHNvCj4gSSdtIG5vdCByZWFkeSB0byBzZW5kIHRoZSBw
YXRjaCB5ZXQsIGJ1dCBpdCBkb2Vzbid0IHNlZW0gdG8gdHJpZ2dlcgo+IGFueSBlcnJvci4KPiAK
PiAtQXJuYXVkCj4gCj4gCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IERtaXRyeSBCYXJ5c2hrb3YgPGRt
aXRyeS5iYXJ5c2hrb3ZAbGluYXJvLm9yZz4KPj4gLS0tCj4+ICAgZHJpdmVycy9ncHUvZHJtL21z
bS9kaXNwL2RwdTEvZHB1X3JtLmMgfCAxMiAtLS0tLS0tLS0tLS0KPj4gICBkcml2ZXJzL2dwdS9k
cm0vbXNtL2Rpc3AvZHB1MS9kcHVfcm0uaCB8ICA0IC0tLS0KPj4gICAyIGZpbGVzIGNoYW5nZWQs
IDE2IGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21zbS9k
aXNwL2RwdTEvZHB1X3JtLmMgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvZHB1MS9kcHVfcm0u
Ywo+PiBpbmRleCBjMzY3MDBhMDZmZjIuLmVjNDM4N2FkMTE4MiAxMDA2NDQKPj4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X3JtLmMKPj4gKysrIGIvZHJpdmVycy9ncHUv
ZHJtL21zbS9kaXNwL2RwdTEvZHB1X3JtLmMKPj4gQEAgLTg4LDE4ICs4OCw2IEBAIGludCBkcHVf
cm1faW5pdChzdHJ1Y3QgZHB1X3JtICpybSwKPj4gICAgICAgICAgICAgICAgICAgICAgICAgIGdv
dG8gZmFpbDsKPj4gICAgICAgICAgICAgICAgICB9Cj4+ICAgICAgICAgICAgICAgICAgcm0tPm1p
eGVyX2Jsa3NbbG0tPmlkIC0gTE1fMF0gPSAmaHctPmJhc2U7Cj4+IC0KPj4gLSAgICAgICAgICAg
ICAgIGlmICghcm0tPmxtX21heF93aWR0aCkgewo+PiAtICAgICAgICAgICAgICAgICAgICAgICBy
bS0+bG1fbWF4X3dpZHRoID0gbG0tPnNibGstPm1heHdpZHRoOwo+PiAtICAgICAgICAgICAgICAg
fSBlbHNlIGlmIChybS0+bG1fbWF4X3dpZHRoICE9IGxtLT5zYmxrLT5tYXh3aWR0aCkgewo+PiAt
ICAgICAgICAgICAgICAgICAgICAgICAvKgo+PiAtICAgICAgICAgICAgICAgICAgICAgICAgKiBE
b24ndCBleHBlY3QgdG8gaGF2ZSBodyB3aGVyZSBsbSBtYXggd2lkdGhzIGRpZmZlci4KPj4gLSAg
ICAgICAgICAgICAgICAgICAgICAgICogSWYgZm91bmQsIHRha2UgdGhlIG1pbi4KPj4gLSAgICAg
ICAgICAgICAgICAgICAgICAgICovCj4+IC0gICAgICAgICAgICAgICAgICAgICAgIERQVV9FUlJP
UigidW5zdXBwb3J0ZWQ6IGxtIG1heHdpZHRoIGRpZmZlcnNcbiIpOwo+PiAtICAgICAgICAgICAg
ICAgICAgICAgICBpZiAocm0tPmxtX21heF93aWR0aCA+IGxtLT5zYmxrLT5tYXh3aWR0aCkKPj4g
LSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBybS0+bG1fbWF4X3dpZHRoID0gbG0tPnNi
bGstPm1heHdpZHRoOwo+PiAtICAgICAgICAgICAgICAgfQo+PiAgICAgICAgICB9Cj4+Cj4+ICAg
ICAgICAgIGZvciAoaSA9IDA7IGkgPCBjYXQtPmN0bF9jb3VudDsgaSsrKSB7Cj4+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvZHB1MS9kcHVfcm0uaCBiL2RyaXZlcnMvZ3B1
L2RybS9tc20vZGlzcC9kcHUxL2RwdV9ybS5oCj4+IGluZGV4IGVlOTBiMTIzMzQzMC4uMGM5MTEz
NTgxZDcxIDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvZHB1MS9kcHVf
cm0uaAo+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvZHB1MS9kcHVfcm0uaAo+PiBA
QCAtMTcsMTQgKzE3LDEwIEBAIHN0cnVjdCBkcHVfZ2xvYmFsX3N0YXRlOwo+PiAgICAqIHN0cnVj
dCBkcHVfcm0gLSBEUFUgZHluYW1pYyBoYXJkd2FyZSByZXNvdXJjZSBtYW5hZ2VyCj4+ICAgICog
QG1peGVyX2Jsa3M6IGFycmF5IG9mIGxheWVyIG1peGVyIGhhcmR3YXJlIHJlc291cmNlcwo+PiAg
ICAqIEBjdGxfYmxrczogYXJyYXkgb2YgY3RsIGhhcmR3YXJlIHJlc291cmNlcwo+PiAtICogQGxt
X21heF93aWR0aDogY2FjaGVkIGxheWVyIG1peGVyIG1heGltdW0gd2lkdGgKPj4gLSAqIEBybV9s
b2NrOiByZXNvdXJjZSBtYW5hZ2VyIG11dGV4Cj4+ICAgICovCj4+ICAgc3RydWN0IGRwdV9ybSB7
Cj4+ICAgICAgICAgIHN0cnVjdCBkcHVfaHdfYmxrICptaXhlcl9ibGtzW0xNX01BWCAtIExNXzBd
Owo+PiAgICAgICAgICBzdHJ1Y3QgZHB1X2h3X2JsayAqY3RsX2Jsa3NbQ1RMX01BWCAtIENUTF8w
XTsKPj4gLQo+PiAtICAgICAgIHVpbnQzMl90IGxtX21heF93aWR0aDsKPj4gICB9Owo+Pgo+PiAg
IHN0cnVjdCBkcHVfa21zOwo+PiAtLQo+PiAyLjMwLjIKPj4KPj4gX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPj4gRnJlZWRyZW5vIG1haWxpbmcgbGlzdAo+
PiBGcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4+IGh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZnJlZWRyZW5vCgoKLS0gCldpdGggYmVzdCB3aXNo
ZXMKRG1pdHJ5Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkZyZWVkcmVubyBtYWlsaW5nIGxpc3QKRnJlZWRyZW5vQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ZyZWVkcmVubwo=

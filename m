Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F9D732D81D
	for <lists+freedreno@lfdr.de>; Thu,  4 Mar 2021 17:54:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0187C6EA2F;
	Thu,  4 Mar 2021 16:54:31 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AB806EA2F
 for <freedreno@lists.freedesktop.org>; Thu,  4 Mar 2021 16:54:30 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id u16so10406245wrt.1
 for <freedreno@lists.freedesktop.org>; Thu, 04 Mar 2021 08:54:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=cCLKoMFPN0gPx/rfyorI0twY4bbHy1nmLr1AxawYDHU=;
 b=mOCVJrRupIKBqltJhO/hxffcZOiabNKzUrjWiiEl5nNPYF+CqEOmIl9yWWh7RQCCOt
 c1aKLGID9U62OoI2uVF/cGTlokFOWuR6DgcdMxha5K5zg/owKCIS8gHdvnGfJfpXk3eO
 iTw0Y/5nTCeGqlqIW/k2uwednxdTKegLaGc2FY/bKtmc+oD0VHye+ZkquYpoLFbDpEnL
 /stI/unoZkmvPnrc0+M9nyzuOPVu6GWW8GJ66ROL+a37ocYrDpE7jx43bv9YiBn2xIAZ
 va42vr8HJmnXt52Vi1iTj6byuKhMhqOVtG4RCqP38TKGyxF9xGPpVTwrh80Fwf5Luivq
 kbJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=cCLKoMFPN0gPx/rfyorI0twY4bbHy1nmLr1AxawYDHU=;
 b=j+J5/+htL0fHOPOlzMjra1hkYXWBhAXIWvRMy2tVvj3ssgB4O6jhDnsKqnFh7gsxTY
 xDdnf+Ov5cFjaGlJstIfClFYVMuOeRqp850QP8e9GSkZ316URg4hOoH/laIF34PMUsT3
 S4ocK58wOPXwwXhKr4JKTIYLeAk6PiM7nUKPOeZ7S/rexfSPG9JJQTRWxw2/HQXcknGr
 BQ4wF9BSwUXj86U2MZHLkkccI6c+24C82GI8aUZiWmZ1gIYDSAHpsVXZx9823aWKggJX
 wUj01XrVOKZ7O4X1XfxvSvSdxFi3Y44eHPIw8aoP7Etv8xdueFOCFySbj2s2ZNzjUJd1
 PIRA==
X-Gm-Message-State: AOAM531F8rKjngrvxuRHxuZNhvwnHPJ6RLDxuVSLu7QfdToZffyy58Fm
 11z0pvckslsrBbis7wEIiy7zbfrRwVEIAQ==
X-Google-Smtp-Source: ABdhPJzU8MAa7xzsW9jiUKg20K9ykL5kVNj6KlOTciEUf7Wp5tDMw82GCSRJJf5DbLGtrPkwRNcwKw==
X-Received: by 2002:a5d:6a81:: with SMTP id s1mr4964478wru.401.1614876868875; 
 Thu, 04 Mar 2021 08:54:28 -0800 (PST)
Received: from [192.168.0.41] (lns-bzn-59-82-252-144-192.adsl.proxad.net.
 [82.252.144.192])
 by smtp.googlemail.com with ESMTPSA id l2sm38451757wrv.50.2021.03.04.08.54.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Mar 2021 08:54:28 -0800 (PST)
To: Chanwoo Choi <cwchoi00@gmail.com>, kyungmin.park@samsung.com,
 myungjoo.ham@samsung.com
References: <20210304125034.28404-1-daniel.lezcano@linaro.org>
 <97e495cb-c685-e163-0909-0311530a5332@gmail.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <91afb936-71d7-057d-4d66-4a2e41b52332@linaro.org>
Date: Thu, 4 Mar 2021 17:54:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <97e495cb-c685-e163-0909-0311530a5332@gmail.com>
Content-Language: en-US
Subject: Re: [Freedreno] [PATCH] devfreq: Register devfreq as a cooling
 device
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
Cc: Rob Herring <robh@kernel.org>,
 "moderated list:DRM DRIVERS FOR LIMA" <lima@lists.freedesktop.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, linux-pm@vger.kernel.org,
 David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 linux-kernel@vger.kernel.org,
 "open list:DRM DRIVERS FOR LIMA" <dri-devel@lists.freedesktop.org>,
 Steven Price <steven.price@arm.com>, Chanwoo Choi <cw00.choi@samsung.com>,
 Rob Clark <robdclark@gmail.com>, Qiang Yu <yuq825@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <freedreno@lists.freedesktop.org>,
 Sean Paul <sean@poorly.run>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

T24gMDQvMDMvMjAyMSAxNjowNiwgQ2hhbndvbyBDaG9pIHdyb3RlOgo+IEhpIERhbmllbCwKPiAK
PiBBcyBMdWthc3oncyBjb21tZW50LCBhY3R1YWxseSBzb21lIGRldmZyZXEgZGV2aWNlcyBsaWtl
IG1lbW9yeSBidXMKPiBtaWdodCBub3QgYWZmZWN0IHRoZSB0aGVybWFsIGNyaXRpY2FsbHkuIElu
IHRoZSBtYWlubGluZSwKPiB0aGVyZSBhcmUgZm91ciB0eXBlcyBkZXZmcmVxIGFzIGZvbGxvd2lu
ZzoKPiAxLiBHUFUKPiAyLiBVRlMgU3RvcmFnZQo+IDMuIERNQyAoTWVtb3J5IENvbnRyb2xsZXIp
Cj4gNC4gTWVtb3J5IGJ1cyBsaWtlIEFNQkEgQVhJCj4gCj4gSSB0aGluayB0aGF0IHlvdSBjYW4g
c3BlY2lmeSB0aGlzIGRldmZyZXEgZGV2aWNlIHdpbGwgYmUgdXNlZAo+IGZvciBjb29saW5nIGRl
dmljZSBieSBlZGl0aW5nIHRoZSBkZXZmcmVxX2Rldl9wcm9maWxlIHN0cnVjdHVyZS4KClRoYW5r
cyBmb3IgdGhlIHN1Z2dlc3Rpb24sIGl0IG1ha2VzIHNlbnNlLgoKSSB3aWxsIGRvIHRoZSBjaGFu
Z2UgZm9sbG93aW5nIHlvdXIgZXhhbXBsZSBiZWxvdy4KCiAgLS0gRGFuaWVsCgo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2RldmZyZXEvZGV2ZnJlcS5jIGIvZHJpdmVycy9kZXZmcmVxL2RldmZyZXEu
Ywo+IGluZGV4IGJmMzA0Nzg5NmU0MS4uNzc5NjZhMTdkMDNmIDEwMDY0NAo+IC0tLSBhL2RyaXZl
cnMvZGV2ZnJlcS9kZXZmcmVxLmMKPiArKysgYi9kcml2ZXJzL2RldmZyZXEvZGV2ZnJlcS5jCj4g
QEAgLTkzNSw2ICs5MzUsMTMgQEAgc3RydWN0IGRldmZyZXEgKmRldmZyZXFfYWRkX2RldmljZShz
dHJ1Y3QgZGV2aWNlICpkZXYsCj4gCj4gwqDCoMKgwqDCoMKgwqAgbXV0ZXhfdW5sb2NrKCZkZXZm
cmVxX2xpc3RfbG9jayk7Cj4gCj4gK8KgwqDCoMKgwqDCoCBpZiAoZGV2ZnJlcS0+cHJvZmlsZS0+
aXNfY29vbGluZ19kZXZpY2UpIHsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBkZXZm
cmVxLT5jZGV2ID0gZGV2ZnJlcV9jb29saW5nX2VtX3JlZ2lzdGVyKGRldmZyZXEsIE5VTEwpOwo+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmIChJU19FUlIoZGV2ZnJlcS0+Y2Rldikp
Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGRldl9pbmZv
KGRldiwKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgICJGYWlsZWQgdG8gcmVnaXN0ZXIgZGV2ZnJlcSBjb29saW5nCj4gZGV2aWNl
XG4iKTsKPiArwqDCoMKgwqDCoMKgIH0KPiArCj4gwqDCoMKgwqDCoMKgwqAgcmV0dXJuIGRldmZy
ZXE7Cj4gCj4gwqBlcnJfaW5pdDoKPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9kZXZmcmVx
LmggYi9pbmNsdWRlL2xpbnV4L2RldmZyZXEuaAo+IGluZGV4IDI2ZWEwODUwYmU5Yi4uMjZkYzY5
ZjEwNDdiIDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUvbGludXgvZGV2ZnJlcS5oCj4gKysrIGIvaW5j
bHVkZS9saW51eC9kZXZmcmVxLmgKPiBAQCAtMTAzLDYgKzEwMyw3IEBAIHN0cnVjdCBkZXZmcmVx
X2Rldl9wcm9maWxlIHsKPiDCoMKgwqDCoMKgwqDCoCB1bnNpZ25lZCBsb25nIGluaXRpYWxfZnJl
cTsKPiDCoMKgwqDCoMKgwqDCoCB1bnNpZ25lZCBpbnQgcG9sbGluZ19tczsKPiDCoMKgwqDCoMKg
wqDCoCBlbnVtIGRldmZyZXFfdGltZXIgdGltZXI7Cj4gK8KgwqDCoMKgwqDCoCBib29sIGlzX2Nv
b2xpbmdfZGV2aWNlOwo+IAo+IMKgwqDCoMKgwqDCoMKgIGludCAoKnRhcmdldCkoc3RydWN0IGRl
dmljZSAqZGV2LCB1bnNpZ25lZCBsb25nICpmcmVxLCB1MzIgZmxhZ3MpOwo+IMKgwqDCoMKgwqDC
oMKgIGludCAoKmdldF9kZXZfc3RhdHVzKShzdHJ1Y3QgZGV2aWNlICpkZXYsCj4gCgoKCi0tIAo8
aHR0cDovL3d3dy5saW5hcm8ub3JnLz4gTGluYXJvLm9yZyDilIIgT3BlbiBzb3VyY2Ugc29mdHdh
cmUgZm9yIEFSTSBTb0NzCgpGb2xsb3cgTGluYXJvOiAgPGh0dHA6Ly93d3cuZmFjZWJvb2suY29t
L3BhZ2VzL0xpbmFybz4gRmFjZWJvb2sgfAo8aHR0cDovL3R3aXR0ZXIuY29tLyMhL2xpbmFyb29y
Zz4gVHdpdHRlciB8CjxodHRwOi8vd3d3LmxpbmFyby5vcmcvbGluYXJvLWJsb2cvPiBCbG9nCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkZyZWVkcmVubyBt
YWlsaW5nIGxpc3QKRnJlZWRyZW5vQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ZyZWVkcmVubwo=

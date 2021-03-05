Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31AE832E45F
	for <lists+freedreno@lfdr.de>; Fri,  5 Mar 2021 10:10:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9B236EB26;
	Fri,  5 Mar 2021 09:10:20 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC74A6EB24
 for <freedreno@lists.freedesktop.org>; Fri,  5 Mar 2021 09:10:19 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id l12so1253189wry.2
 for <freedreno@lists.freedesktop.org>; Fri, 05 Mar 2021 01:10:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=63BZTwf3MLMQAkn2BdrHZ1xTK2bwmRKITVezIt3sV9k=;
 b=qIhQjiqOP57bI/hD1kFs2/6tOxvCVgreYU6SWkrNvwDFlxQwEnv3kFFVIEiRAtV0bs
 ghqevsOeKImy2rOLICgbeqWEThfUBb62WD98f6OLGoRbJPi+3ECHQTjzD7T09L6iNH1X
 oAm7OJWf/W0mgFiXr47BHOFHjWLpDx1yqdw07vCbJeqMn/SZ6et48VCP9iSh47jL2RrG
 gVVStZeH/O8pcqGXOJ9EMd4F8njNQwNN9alPkOkaB3F9hedHZi9ivpiK4dy/1O75s2EC
 b80SYjFrOOr3XHujkCejze9BNQcAsrZT3Cpqt9O3cmDicy//qO7rhTZOo3V9VbGlcI9b
 TE4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=63BZTwf3MLMQAkn2BdrHZ1xTK2bwmRKITVezIt3sV9k=;
 b=E5t+uCMcHQFbn0sEW4UhO5mM8CaGA8fW0EVlou3wGC9E0TAXoQc2sJOwoNcSPGRUwp
 moKgkQthnOHR6uqXyxgybloWAkA3yileHQLNnQjmdeUi6kcAIF7McTW9s1VY8Wc79XYQ
 WW86X+9mAaasgOCzrbpjEIkyr0xONHP50UFF1MkfvGJw669Sj86e0NIs3L9Qapp7NDJQ
 h9C/3+Mx3fKqWpeb0o2MDxwKMI39oTvGeSfFqSjYp39AzQMfVJmJwVpV01WyiTQpu8Df
 KytVirnWp8hK90UQlMynwtDB7paS6rcjIm5zYSfkP+FivYYAnXCNswf0fDA2x0ZEVVMN
 ZAjg==
X-Gm-Message-State: AOAM5333u47y8WDAdrjEWIm/cLAVhrAWplsPMZt2qrA/i6YYgVpM32r3
 Fo6T3EnaPuQDl4qlEq2BmgtVGzF7JkmDoA==
X-Google-Smtp-Source: ABdhPJwGPV9w/pRUAVZfWeOAHCnQFfI/8tinbzeWQre8iQkJRqLUzFYfp3bIvMhEWSuLcWlSXdr0MQ==
X-Received: by 2002:a5d:5411:: with SMTP id g17mr8376871wrv.194.1614935418378; 
 Fri, 05 Mar 2021 01:10:18 -0800 (PST)
Received: from [192.168.0.41] (lns-bzn-59-82-252-144-192.adsl.proxad.net.
 [82.252.144.192])
 by smtp.googlemail.com with ESMTPSA id 36sm3695411wrh.94.2021.03.05.01.10.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Mar 2021 01:10:17 -0800 (PST)
To: Steven Price <steven.price@arm.com>, cwchoi00@gmail.com,
 kyungmin.park@samsung.com, myungjoo.ham@samsung.com
References: <20210304125034.28404-1-daniel.lezcano@linaro.org>
 <23db1b13-9418-91f5-4871-f45b983f6e3c@arm.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <e8c5f550-0ca5-b4e4-1113-3af760d2780e@linaro.org>
Date: Fri, 5 Mar 2021 10:10:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <23db1b13-9418-91f5-4871-f45b983f6e3c@arm.com>
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
 Chanwoo Choi <cw00.choi@samsung.com>, Rob Clark <robdclark@gmail.com>,
 Qiang Yu <yuq825@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <freedreno@lists.freedesktop.org>,
 Sean Paul <sean@poorly.run>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

T24gMDUvMDMvMjAyMSAwOToxMiwgU3RldmVuIFByaWNlIHdyb3RlOgo+IE9uIDA0LzAzLzIwMjEg
MTI6NTAsIERhbmllbCBMZXpjYW5vIHdyb3RlOgo+PiBDdXJyZW50bHkgdGhlIGRlZmF1bHQgYmVo
YXZpb3IgaXMgdG8gbWFudWFsbHkgaGF2aW5nIHRoZSBkZXZmcmVxCj4+IGJhY2tlbmQgdG8gcmVn
aXN0ZXIgdGhlbXNlbHZlcyBhcyBhIGRldmZyZXEgY29vbGluZyBkZXZpY2UuCj4+Cj4+IFRoZXJl
IGFyZSBubyBzbyBtYW55IGFuZCBhY3R1YWxseSBpdCBtYWtlcyBtb3JlIHNlbnNlIHRvIHJlZ2lz
dGVyIHRoZQo+PiBkZXZmcmVxIGRldmljZSB3aGVuIGFkZGluZyBpdC4KPj4KPj4gQ29uc2VxdWVu
dGx5LCBldmVyeSBkZXZmcmVxIGJlY29tZXMgYSBjb29saW5nIGRldmljZSBsaWtlIGNwdWZyZXEg
aXMuCj4+Cj4+IEhhdmluZyBhIGRldmZyZXEgYmVpbmcgcmVnaXN0ZXJlZCBhcyBhIGNvb2xpbmcg
ZGV2aWNlIGNhbiBub3QgbWl0aWdhdGUKPj4gYSB0aGVybWFsIHpvbmUgaWYgaXQgaXMgbm90IGJv
dW5kIHRvIHRoaXMgb25lLiBUaHVzLCB0aGUgY3VycmVudAo+PiBjb25maWd1cmF0aW9ucyBhcmUg
bm90IGltcGFjdGVkIGJ5IHRoaXMgY2hhbmdlLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBEYW5pZWwg
TGV6Y2FubyA8ZGFuaWVsLmxlemNhbm9AbGluYXJvLm9yZz4KPj4gLS0tCgpbIC4uLiBdCgo+PiDC
oMKgwqDCoMKgIGlmIChwZmRldmZyZXEtPm9wcF9vZl90YWJsZV9hZGRlZCkgewo+PiDCoMKgwqDC
oMKgwqDCoMKgwqAgZGV2X3BtX29wcF9vZl9yZW1vdmVfdGFibGUoJnBmZGV2LT5wZGV2LT5kZXYp
Owo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgcGZkZXZmcmVxLT5vcHBfb2ZfdGFibGVfYWRkZWQgPSBm
YWxzZTsKPiAKPiBZb3UndmUgcmVtb3ZlZCBhbGwgcmVmZXJlbmNlcyB0byBwZmRldmZyZXEtPmNv
b2xpbmcsIHNvIHBsZWFzZSBhbHNvCj4gcmVtb3ZlIHRoZSBtZW1iZXIgZnJvbSBzdHJ1Y3QgcGFu
ZnJvc3RfZGV2ZnJlcSAoYXMgYWxyZWFkeSBkb25lIHdpdGgKPiBsaW1hIGFuZCBtc20pLgoKU3Vy
ZSwgdGhhbmtzIGZvciBzcG90dGluZyB0aGlzLgoKCi0tIAo8aHR0cDovL3d3dy5saW5hcm8ub3Jn
Lz4gTGluYXJvLm9yZyDilIIgT3BlbiBzb3VyY2Ugc29mdHdhcmUgZm9yIEFSTSBTb0NzCgpGb2xs
b3cgTGluYXJvOiAgPGh0dHA6Ly93d3cuZmFjZWJvb2suY29tL3BhZ2VzL0xpbmFybz4gRmFjZWJv
b2sgfAo8aHR0cDovL3R3aXR0ZXIuY29tLyMhL2xpbmFyb29yZz4gVHdpdHRlciB8CjxodHRwOi8v
d3d3LmxpbmFyby5vcmcvbGluYXJvLWJsb2cvPiBCbG9nCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkZyZWVkcmVubyBtYWlsaW5nIGxpc3QKRnJlZWRyZW5v
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2ZyZWVkcmVubwo=

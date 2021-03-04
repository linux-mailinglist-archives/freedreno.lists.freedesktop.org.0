Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BC92632D816
	for <lists+freedreno@lfdr.de>; Thu,  4 Mar 2021 17:53:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 716F16EA3B;
	Thu,  4 Mar 2021 16:53:32 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C389D6EA2F
 for <freedreno@lists.freedesktop.org>; Thu,  4 Mar 2021 16:53:30 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id e10so28172610wro.12
 for <freedreno@lists.freedesktop.org>; Thu, 04 Mar 2021 08:53:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=YnxlDtU5po5D1M53NldIE72sMInCUbrZRLnykBeu2V8=;
 b=Ewxi+OReE6dJAiv1zXYkq05geSl/fq+jZkRgzrMwoyzv7/mX7eQzNkoXLfZA/H4WjA
 dLxCRUQXjLaUaurQNnE2V1uuSVtL1ssUBtAdfk47+VjVE3TodqBAoyI+HNZr9jaugwih
 QozPefxrDjjzljWSRoqtM5xVlGU9Pye4vHHgjW0WwQ5jmtTxzIbIessoty315fsV3Pto
 3rUuogs9lyEX7c3FT883rgCuhQlAV95l3Ki/0K1GkqZhT2pUmINFxC/lBZLVmiOR6r0I
 /mSml0hG8PHwm/dAmJQhv/t8QNpecklP1K6I1reeFu194Rh1icR2BB1MMK/v7koexmb3
 k6ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YnxlDtU5po5D1M53NldIE72sMInCUbrZRLnykBeu2V8=;
 b=RS5XMmkGq5Ymw4uNlB7CfMzR0FWRcHZyEXx0wKqmvrBhrI8DZ0YdCWzlUr8H1QufDd
 93ZLPTXk6LJ0J4pMHKensJPtSP8yvLnWRHKq1iVDVE4I1wEaOlvk/zT5EpfWYRfwI4d/
 BlJ2P4T6qVrvC9HqHeWwDzxLQ8xP2mueLs5DXzoqGZiqOMHbt8LRcXjTiXP3UxFOcn8q
 Wbq92GR8VB/5htxV0LOaPRGyvS8nhivGjj/jYfFcPkpt35RUy5z+6pBP4u+oDAgx4ai3
 JJLcgeLXrienUq0rNzSSrXJqcXHiHuBikdiUig1zzqqRY5diojJgFlavkV0HItM2HLls
 GoWA==
X-Gm-Message-State: AOAM532An7kt8a/RMWNXbZXMmVytPJU6Hxh7Hr/cNFEPWrR3gaw7y6s5
 6rNT/XKI7qGxxhZYwbcj57I/6IFCilh9bA==
X-Google-Smtp-Source: ABdhPJxucLioKZo95wCuntF7BE0hNv7s/6tGhLvI6FsbewLBgkboHJnD6mezrJaZmVK15Kbq98zepg==
X-Received: by 2002:adf:d1c2:: with SMTP id b2mr4922891wrd.424.1614876808222; 
 Thu, 04 Mar 2021 08:53:28 -0800 (PST)
Received: from [192.168.0.41] (lns-bzn-59-82-252-144-192.adsl.proxad.net.
 [82.252.144.192])
 by smtp.googlemail.com with ESMTPSA id b15sm36807595wrr.47.2021.03.04.08.53.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Mar 2021 08:53:27 -0800 (PST)
To: Lukasz Luba <lukasz.luba@arm.com>
References: <20210304125034.28404-1-daniel.lezcano@linaro.org>
 <5f06e0c5-b2d9-5e11-01b6-fdd0dac635a7@arm.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <8d153937-c5fc-1de2-d510-d3f91f7a9724@linaro.org>
Date: Thu, 4 Mar 2021 17:53:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <5f06e0c5-b2d9-5e11-01b6-fdd0dac635a7@arm.com>
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
Cc: Rob Clark <robdclark@gmail.com>,
 "moderated list:DRM DRIVERS FOR LIMA" <lima@lists.freedesktop.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, linux-pm@vger.kernel.org,
 David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 linux-kernel@vger.kernel.org,
 "open list:DRM DRIVERS FOR LIMA" <dri-devel@lists.freedesktop.org>,
 Steven Price <steven.price@arm.com>, Chanwoo Choi <cw00.choi@samsung.com>,
 kyungmin.park@samsung.com, myungjoo.ham@samsung.com,
 Qiang Yu <yuq825@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <freedreno@lists.freedesktop.org>,
 Sean Paul <sean@poorly.run>, Rob Herring <robh@kernel.org>, cwchoi00@gmail.com,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

CkhpIEx1a2FzeiwKCnRoYW5rcyBmb3IgY29tbWVudGluZyB0aGlzIHBhdGNoLAoKT24gMDQvMDMv
MjAyMSAxNDo0NywgTHVrYXN6IEx1YmEgd3JvdGU6Cj4gSGkgRGFuaWVsLAo+IAo+IE9uIDMvNC8y
MSAxMjo1MCBQTSwgRGFuaWVsIExlemNhbm8gd3JvdGU6Cj4+IEN1cnJlbnRseSB0aGUgZGVmYXVs
dCBiZWhhdmlvciBpcyB0byBtYW51YWxseSBoYXZpbmcgdGhlIGRldmZyZXEKPj4gYmFja2VuZCB0
byByZWdpc3RlciB0aGVtc2VsdmVzIGFzIGEgZGV2ZnJlcSBjb29saW5nIGRldmljZS4KPj4KPj4g
VGhlcmUgYXJlIG5vIHNvIG1hbnkgYW5kIGFjdHVhbGx5IGl0IG1ha2VzIG1vcmUgc2Vuc2UgdG8g
cmVnaXN0ZXIgdGhlCj4+IGRldmZyZXEgZGV2aWNlIHdoZW4gYWRkaW5nIGl0Lgo+Pgo+PiBDb25z
ZXF1ZW50bHksIGV2ZXJ5IGRldmZyZXEgYmVjb21lcyBhIGNvb2xpbmcgZGV2aWNlIGxpa2UgY3B1
ZnJlcSBpcy4KPj4KPj4gSGF2aW5nIGEgZGV2ZnJlcSBiZWluZyByZWdpc3RlcmVkIGFzIGEgY29v
bGluZyBkZXZpY2UgY2FuIG5vdCBtaXRpZ2F0ZQo+PiBhIHRoZXJtYWwgem9uZSBpZiBpdCBpcyBu
b3QgYm91bmQgdG8gdGhpcyBvbmUuIFRodXMsIHRoZSBjdXJyZW50Cj4+IGNvbmZpZ3VyYXRpb25z
IGFyZSBub3QgaW1wYWN0ZWQgYnkgdGhpcyBjaGFuZ2UuCj4gCj4gVGhlcmUgYXJlIGFsc28gZGlm
ZmVyZW50IHR5cGUgb2YgZGV2aWNlcywgd2hpY2ggcmVnaXN0ZXIgaW50byBkZXZmcmVxCj4gZnJh
bWV3b3JrIGxpa2UgTm9DIGJ1c2VzLCBVRlMvZU1NQywganBlZyBhbmQgdmlkZW8gYWNjZWxlcmF0
b3JzLCBJU1AsCj4gZXRjLgo+IEluIHNvbWUgcGxhdGZvcm1zIHRoZXJlIGFyZSBwbGVudHkgb2Yg
dGhvc2UgZGV2aWNlcyBhbmQgdGhleSBhbGwgd291bGQKPiBvY2N1cHkgbWVtb3J5IGR1ZSB0byBw
cml2YXRlIGZyZXFfdGFibGUgaW4gZGV2ZnJlcV9jb29saW5nLCBmdW5jdGlvbjoKPiBkZXZmcmVx
X2Nvb2xpbmdfZ2VuX3RhYmxlcygpLgo+IAo+IElJUkMgaW4gT2Ryb2lkWFU0IHRoZXJlIGFyZSB+
MjAgZGV2ZnJlcSBkZXZzIGZvciBOb0MgYnVzZXMuCgpJJ20gY3VyaW91cywgZG8geW91IGhhdmUg
YSBwb2ludGVyIHRvIHN1Y2gga2VybmVscyBoYXZpbmcgYWxsIHRob3NlCmRldmZyZXEgPwoKPiBJ
dCdzIHRydWUgdGhhdCB0aGV5IHdpbGwgbm90IGFmZmVjdCB0aGVybWFsIHpvbmVzLCBidXQgdW5u
ZWNlc3NhcmlseSwKPiB0aGV5IGFsbCB3aWxsIHNob3cgdXAgaW4gdGhlIC9zeXMvY2xhc3MvdGhl
cm1hbC8gYXMKPiB0aGVybWFsLWRldmZyZXEtWAo+Cj4KPiBJTU8gdGhlIGRldmZyZXEgc2hvdWxk
bid0IGJlIHRpZ2h0IHdpdGggZGV2ZnJlcSBjb29saW5nIHRoZXJtYWwuCgpUaGUgZW5lcmd5IG1v
ZGVsIGlzIHRpZWQgd2l0aCBhIGNvb2xpbmcgZGV2aWNlIGluaXRpYWxpemF0aW9uLgoKU28gaWYg
d2Ugd2FudCB0byBkbyBwb3dlciBsaW1pdGF0aW9uLCB0aGUgZW5lcmd5IG1vZGVsIG11c3QgYmUK
aW5pdGlhbGl6ZWQgd2l0aCB0aGUgZGV2aWNlLCB0aHVzIHRoZSBjb29saW5nIGRldmljZSBhbHNv
LgoKVGhhdCBpcyB0aGUgcmVhc29uIHdoeSBJJ20gZW5kaW5nIHVwIHdpdGggdGhpcyBjaGFuZ2Uu
IENoYW53b28Kc3VnZ2VzdGlvbiBtYWtlcyBzZW5zZSBhbmQgdGhhdCB3aWxsIGFsbG93IHRvIG1v
dmUgdGhlIGluaXRpYWxpemF0aW9uIHRvCmRldmZyZXEgd2hpY2ggaXMgbW9yZSBzYW5lIGJ1dCBp
dCBkb2VzIG5vdCBzb2x2ZSB0aGUgaW5pdGlhbCBwcm9ibGVtCndpdGggdGhlIGVuZXJneSBtb2Rl
bC4KCgoKCi0tIAo8aHR0cDovL3d3dy5saW5hcm8ub3JnLz4gTGluYXJvLm9yZyDilIIgT3BlbiBz
b3VyY2Ugc29mdHdhcmUgZm9yIEFSTSBTb0NzCgpGb2xsb3cgTGluYXJvOiAgPGh0dHA6Ly93d3cu
ZmFjZWJvb2suY29tL3BhZ2VzL0xpbmFybz4gRmFjZWJvb2sgfAo8aHR0cDovL3R3aXR0ZXIuY29t
LyMhL2xpbmFyb29yZz4gVHdpdHRlciB8CjxodHRwOi8vd3d3LmxpbmFyby5vcmcvbGluYXJvLWJs
b2cvPiBCbG9nCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkZyZWVkcmVubyBtYWlsaW5nIGxpc3QKRnJlZWRyZW5vQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ZyZWVkcmVubwo=

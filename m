Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B6E93D20D7
	for <lists+freedreno@lfdr.de>; Thu, 22 Jul 2021 11:28:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC5296EB7D;
	Thu, 22 Jul 2021 09:28:05 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78DCB6EB2C;
 Thu, 22 Jul 2021 09:28:04 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id t5so5154465wrw.12;
 Thu, 22 Jul 2021 02:28:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-transfer-encoding:content-language;
 bh=XLvwPVxwh3uPjr5/i+Rh3eq9y11uGtNueSrPtY+YdAQ=;
 b=ON+lbzS3fMryHArG/XyP5b5AcMqId+7dvYMQ50OEXQJT7FL7n6YTj0vO+b59eGQLYw
 PyfVxGkzo8jk/c0vyVwNna0atjVQHuOcbyFXmC9kY/R+HSITp7uLC5ewRgG4puie5fIb
 YsfBCRU8af/jKO+WZRqmwRFH80sYZXb+4xLFe2FCjvs8qksZq8fMl1m1yOANYKXZfe7f
 /DZIxCEsmkY6NGd6co+jHAMAloGodIk0pLrAXCf61qE8yXmJoTKh/sKZ1XlWa2rb5iPG
 XUnBsBMasmuROI/V/vXUohkS0YVCyf80IvSq1Xm0IAQ1GFoi72sxrTNfJKtRjpZPaUsc
 LnDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=XLvwPVxwh3uPjr5/i+Rh3eq9y11uGtNueSrPtY+YdAQ=;
 b=XFVR8JvAiPsSTQaH9TCMmmbnidQnr76hHi9AZa2IPoDol1yvjX8nkxdQjjRcpLfviN
 TdbJQ5jn7d3uNSjAHOYe5y4HXfR0q4AT63uoCFaBUSRrKv7x1sx1suWaUARIbfu3Q9x6
 lqEJwVkgC7uI21Sxffy/NaZSEGoIUWrc2dyy7adTzsSiLb7fNMhpH7D0YV+S3JE97Wha
 4tetJOcixRgezsdoAgJwmNJvLJ5RYG45yHsfMsEHUNwS5X9te6gC/Js+q3SuGU6jk8YM
 E35BQRMXcDX7dJcCr4VgNcvP8bugsbzXh7rSwdn6GJtqntJGqQYvnEwFiNn/YRFZLP/V
 fIsQ==
X-Gm-Message-State: AOAM5322gKo04Y5CqTrgV36U9dR2Fi6BqV26+qIqAk9I1f4qigFSRuoR
 EGTqnhnnhJyJytJ+oUwmTPA=
X-Google-Smtp-Source: ABdhPJyEcGGH+JNsJ5UL1qrA/2Kbg0TJtGufoUH1n8b14LtUFryFarh3g4lvw3p6yg/2o0VGPpzwZQ==
X-Received: by 2002:adf:d0ce:: with SMTP id z14mr24733425wrh.67.1626946083157; 
 Thu, 22 Jul 2021 02:28:03 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:b706:b115:9c6f:aeee?
 ([2a02:908:1252:fb60:b706:b115:9c6f:aeee])
 by smtp.gmail.com with ESMTPSA id w18sm7412066wrs.44.2021.07.22.02.28.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Jul 2021 02:28:02 -0700 (PDT)
To: Rob Clark <robdclark@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Rob Clark <robdclark@chromium.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <freedreno@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK"
 <linaro-mm-sig@lists.linaro.org>, Sean Paul <sean@poorly.run>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
References: <20210720150716.1213775-1-robdclark@gmail.com>
 <60ffb6f3-e932-d9af-3b90-81adf0c15250@gmail.com>
 <CAF6AEGtOW3EjZWo36ij8U1om=gAqvg8CSkJJq2GkyHFGWUH4kQ@mail.gmail.com>
 <CAKMK7uF1=Y6_9znGoWG8GrteXBBRmyW8C3bFE+eJQqOj0A1buA@mail.gmail.com>
 <CAF6AEGsOVPdMkXwU9C+nDfQpPThveJ2A0jbXi43RRkkJKtnz3w@mail.gmail.com>
 <CAKMK7uHMXFqic=9APJrSf6totB8nGZTDe4x8+sv-drmV4Q+4Bg@mail.gmail.com>
 <CAF6AEGsKoucxt4a2pcdQM9+L0+YU-6TcAt8eF=3ur169646Jhw@mail.gmail.com>
 <YPhvein5e8do2AR+@phenom.ffwll.local>
 <113b5858-9020-d1c1-292b-96b7f9cc717a@gmail.com>
 <YPk1izQFR+tRV8js@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <9c1e797b-8860-d1f5-e6f2-e06380ec9012@gmail.com>
Date: Thu, 22 Jul 2021 11:28:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YPk1izQFR+tRV8js@phenom.ffwll.local>
Content-Language: en-US
Subject: Re: [Freedreno] [Linaro-mm-sig] [PATCH] drm/msm: Add fence->wait()
 op
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

QW0gMjIuMDcuMjEgdW0gMTE6MDggc2NocmllYiBEYW5pZWwgVmV0dGVyOgo+IFtTTklQXQo+PiBB
cyBmYXIgYXMgSSBrbm93IHdha2VfdXBfc3RhdGUoKSB0cmllcyB0byBydW4gdGhlIHRocmVhZCBv
biB0aGUgQ1BVIGl0IHdhcwo+PiBzY2hlZHVsZWQgbGFzdCwgd2hpbGUgd2FpdF9ldmVudF8qIG1h
a2VzIHRoZSB0aHJlYWQgcnVuIG9uIHRoZSBDUFUgd2hvCj4+IGlzc3VlcyB0aGUgd2FrZSBieSBk
ZWZhdWx0Lgo+Pgo+PiBBbmQgeWVzIEkndmUgYWxzbyBub3RpY2VkIHRoaXMgYWxyZWFkeSBhbmQg
aXQgd2FzIG9uZSBvZiB0aGUgcmVhc29uIHdoeSBJCj4+IHN1Z2dlc3RlZCB0byB1c2UgYSB3YWl0
X3F1ZXVlIGluc3RlYWQgb2YgdGhlIGhhbmQgd2lyZWQgZG1hX2ZlbmNlX3dhaXQKPj4gaW1wbGVt
ZW50YXRpb24uCj4gVGhlIGZpcnN0IHZlcnNpb25zIGhhZCB1c2VkIHdhaXRfcXVldWUsIGJ1dCBp
aXJjIHdlIGhhZCBzb21lIGlzc3VlcyB3aXRoCj4gdGhlIGNhbGxiYWNrcyBhbmQgc3R1ZmYgYW5k
IHRoYXQgd2FzIHRoZSByZWFzb25zIGZvciBoYW5kLXJvbGxpbmcuIE9yCj4gbWF5YmUgaXQgd2Fz
IHRoZSBpbnRlZ3JhdGlvbiBvZiB0aGUgbG9ja2xlc3MgZmFzdHBhdGggZm9yCj4gZG1hX2ZlbmNl
X2lzX3NpZ25hbGxlZCgpLgo+Cj4+IFtTTklQXQo+PiBXZWxsIGl0IHdvdWxkIGhhdmUgYmVlbiBu
aWNlciBpZiB3ZSB1c2VkIHRoZSBleGlzdGluZyBpbmZyYXN0cnVjdHVyZSBpbnN0ZWFkCj4+IG9m
IHJlLWludmVudGluZyBzdHVmZiBmb3IgZG1hX2ZlbmNlLCBidXQgdGhhdCBjaGFuY2UgaXMgbG9u
ZyBnb25lLgo+Pgo+PiBBbmQgeW91IGRvbid0IG5lZWQgYSBkbWFfZmVuY2VfY29udGV4dCBiYXNl
IGNsYXNzLCBidXQgcmF0aGVyIGp1c3QgYSBmbGFnIGluCj4+IHRoZSBkbWFfZmVuY2Vfb3BzIGlm
IHlvdSB3YW50IHRvIGNoYW5nZSB0aGUgYmVoYXZpb3IuCj4gSWYgdGhlcmUncyBzb21ldGhpbmcg
YnJva2VuIHdlIHNob3VsZCBqdXN0IGZpeCBpdCwgbm90IGZvcmNlIGV2ZXJ5b25lIHRvCj4gc2V0
IGEgcmFuZG9tIGZsYWcuIGRtYV9mZW5jZSB3b3JrIGxpa2Ugc3BlY2lhbCB3YWl0X3F1ZXVlcywg
c28gaWYgd2UKPiBkaWZmZXIgdGhlbiB3ZSBzaG91bGQgZ28gYmFjayB0byB0aGF0LgoKV2FpdCBh
IHNlY29uZCB3aXRoIHRoYXQsIHRoaXMgaXMgbm90IGJyb2tlbi4gSXQncyBqdXN0IGRpZmZlcmVu
dCAKYmVoYXZpb3IgYW5kIHRoZXJlIGFyZSBnb29kIGFyZ3VtZW50cyBmb3IgYm90aCBzaWRlcy4K
CklmIGEgd2FpdCBpcyBzaG9ydCB5b3UgY2FuIGhhdmUgc2l0dWF0aW9ucyB3aGVyZSB5b3Ugd2Fu
dCB0byBzdGFydCB0aGUgCnRocmVhZCBvbiB0aGUgb3JpZ2luYWwgQ1BVLgogwqDCoMKgIFRoaXMg
aXMgYmVjYXVzZSB5b3UgY2FuIGFzc3VtZSB0aGF0IHRoZSBjYWNoZXMgb24gdGhhdCBDUFUgYXJl
IApzdGlsbCBob3QgYW5kIGhlYXRpbmcgdXAgdGhlIGNhY2hlcyBvbiB0aGUgbG9jYWwgQ1BVIHdv
dWxkIHRha2UgbG9uZ2VyIAp0aGFuIGFuIGludGVyIENQVSBpbnRlcnJ1cHQuCgpCdXQgaWYgdGhl
IHdhaXQgaXMgbG9uZyBpdCBtYWtlcyBtb3JlIHNlbnNlIHRvIHJ1biB0aGUgdGhyZWFkIG9uIHRo
ZSBDUFUgCndoZXJlIHlvdSBub3RpY2VkIHRoZSB3YWtlIHVwIGV2ZW50LgogwqDCoMKgIFRoaXMg
aXMgYmVjYXVzZSB5b3UgY2FuIGFzc3VtZSB0aGF0IHRoZSBjYWNoZXMgYXJlIGNvbGQgYW55d2F5
IGFuZCAKc3RhcnRpbmcgdGhlIHRocmVhZCBvbiB0aGUgY3VycmVudCBDUFUgKG1vc3QgbGlrZWx5
IGZyb20gYW4gaW50ZXJydXB0IApoYW5kbGVyKSBnaXZlcyB5b3UgdGhlIGFic29sdXRlbHkgYmVz
dCBsYXRlbmN5LgogwqDCoMKgIEluIG90aGVyIHdvcmRzIHlvdSB1c3VhbGx5IHJldHVybiBmcm9t
IHRoZSBpbnRlcnJ1cHQgaGFuZGxlciBhbmQgCmp1c3QgZGlyZWN0bHkgc3dpdGNoIHRvIHRoZSBu
b3cgcnVubmluZyB0aHJlYWQuCgpJJ20gbm90IHN1cmUgaWYgYWxsIGRyaXZlcnMgd2FudCB0aGUg
c2FtZSBiZWhhdmlvci4gUm9iIGhlcmUgc2VlbXMgdG8gCnByZWZlciBudW1iZXIgMiwgYnV0IHdl
IGhhdmUgdXNlZCAxIGZvciBkbWFfZmVuY2UgZm9yIGEgcmF0aGVyIGxvbmcgdGltZSAKbm93IGFu
ZCBpdCBjb3VsZCBiZSB0aGF0IHNvbWUgcGVvcGxlIHN0YXJ0IHRvIGNvbXBsYWluIHdoZW4gd2Ug
c3dpdGNoIAp1bmNvbmRpdGlvbmFsbHkuCgpSZWdhcmRzLApDaHJpc3RpYW4uCgo+IC1EYW5pZWwK
PgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KRnJlZWRy
ZW5vIG1haWxpbmcgbGlzdApGcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZnJlZWRyZW5vCg==

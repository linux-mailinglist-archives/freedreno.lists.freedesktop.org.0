Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BB8B5D78F
	for <lists+freedreno@lfdr.de>; Tue,  2 Jul 2019 22:35:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57EA26E067;
	Tue,  2 Jul 2019 20:35:34 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AC5B6E08C
 for <freedreno@lists.freedesktop.org>; Tue,  2 Jul 2019 20:35:33 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id n9so232089wru.0
 for <freedreno@lists.freedesktop.org>; Tue, 02 Jul 2019 13:35:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YiKm32fbrJXvadhbbH8R2AC30oRr6R/vtBXdk9UU6tg=;
 b=ZYMytGJGM7Hn1JV9KRWDhPY/VzF8BawVh390Y1JqL7LbO/BlSLcXWUR+fZW3hyRCAB
 oqzmvIAenFTAFfFBM/W2wu2Gnk027bigj8qf9ypCEk3yLdg7Wpa/HiFMcfGwG40RGB+7
 xWZby8Uw0UUg4fXE9LIAvwYz93Kex6PXlo7NtEKmo0OcFQN69HN6ODtb8JfhJ+637dj4
 opYETed7YBXXJpRakmXGIFxLqP7E0HsR0GozYDZTDc98u/8kBKUFBMCHdyLJ8/lJ11xJ
 eJVws7hOIQARpztJQlWLk6AaoGxTK0Sttci8JLoVVBP8Ad41OqndwYtqr89lVu0izWs3
 +qog==
X-Gm-Message-State: APjAAAUHyvHi2SlQGtuO4ZHenuDIbYqfboqKVE+OmllBiD4kUttzBMK0
 zHdcKj9OydbFn4Ih/YUgO+pTCCpRFBzIN7aQ8VF6sw==
X-Google-Smtp-Source: APXvYqyzF5MuwoPkI10B4TbfC/rzEV0YiPHBluGmH1/zHhhFfHwqiAfVyxlK7Fj4GY/VFsoeVVgftVQDaSC75isjmzg=
X-Received: by 2002:adf:b69a:: with SMTP id j26mr17416154wre.93.1562099731858; 
 Tue, 02 Jul 2019 13:35:31 -0700 (PDT)
MIME-Version: 1.0
References: <20190630203614.5290-1-robdclark@gmail.com>
 <20190630203614.5290-3-robdclark@gmail.com>
 <CAKv+Gu_8BOt+f8RTspHo+se-=igZba1zL0+jWLV2HuuUXCKYpA@mail.gmail.com>
In-Reply-To: <CAKv+Gu_8BOt+f8RTspHo+se-=igZba1zL0+jWLV2HuuUXCKYpA@mail.gmail.com>
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Date: Tue, 2 Jul 2019 22:35:16 +0200
Message-ID: <CAKv+Gu-KhPJxxJA3+J813OPcnoAD4nHq6MhiRTJSd_5y1dPNnw@mail.gmail.com>
To: Rob Clark <robdclark@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=YiKm32fbrJXvadhbbH8R2AC30oRr6R/vtBXdk9UU6tg=;
 b=rouFNaQrAD+LVzdQfwSGl8KyN3XCFATAsscS1nSiY3nqrVKn88L+2X9hpP8G0LkkWC
 NbXBVmKrNM2i/FYXzVyY65owea83CsnsL2EYq3GhtYm+wIktVkTqWtRAWOulqc+2Eijb
 tNZhEVAQRLz89yF0sk+uF/rQSzJNULI8c49x9De777zT65pYsUUSurWdrSNR9lmy2NEt
 9eY0VkqUb2j+lxdkUSL9dhgUIzql3NanYjEhvjtxJVfIfVj1EIEm0MIgXIiUzfQXV33O
 rHDGqg4EVcvtwueBiup5u0kebQrjrGClyg1D+nX2fPJPU7N/NtWIDb7JpF1b7OEh92lu
 QbyA==
Subject: Re: [Freedreno] [PATCH 2/4] efi/libstub: detect panel-id
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
Cc: Rob Clark <robdclark@chromium.org>, aarch64-laptops@lists.linaro.org,
 linux-efi <linux-efi@vger.kernel.org>, Will Deacon <will@kernel.org>,
 Steve Capper <steve.capper@arm.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Julien Thierry <julien.thierry@arm.com>, Alexander Graf <agraf@suse.de>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Lukas Wunner <lukas@wunner.de>, Leif Lindholm <leif.lindholm@linaro.org>,
 freedreno@lists.freedesktop.org, Ingo Molnar <mingo@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

T24gVHVlLCAyIEp1bCAyMDE5IGF0IDIyOjI2LCBBcmQgQmllc2hldXZlbCA8YXJkLmJpZXNoZXV2
ZWxAbGluYXJvLm9yZz4gd3JvdGU6Cj4KPiBPbiBTdW4sIDMwIEp1biAyMDE5IGF0IDIyOjM2LCBS
b2IgQ2xhcmsgPHJvYmRjbGFya0BnbWFpbC5jb20+IHdyb3RlOgo+ID4KPiA+IEZyb206IFJvYiBD
bGFyayA8cm9iZGNsYXJrQGNocm9taXVtLm9yZz4KPiA+Cj4gPiBPbiBzbmFwZHJhZ29uIGFhcmNo
NjQgbGFwdG9wcywgYSAnVUVGSURpc3BsYXlJbmZvJyB2YXJpYWJsZSBpcyBwcm92aWRlZAo+ID4g
dG8gY29tbXVuaWNhdGUgc29tZSBpbmZvcm1hdGlvbiBhYm91dCB0aGUgZGlzcGxheS4gIENydXRp
YWxseSBpdCBoYXMgdGhlCj4gPiBwYW5lbC1pZCwgc28gdGhlIGFwcHJvcHJpYXRlIHBhbmVsIGRy
aXZlciBjYW4gYmUgc2VsZWN0ZWQuICBSZWFkIHRoaXMKPiA+IG91dCBhbmQgc3Rhc2ggaW4gL2No
b3Nlbi9wYW5lbC1pZCBzbyB0aGF0IGRpc3BsYXkgZHJpdmVyIGNhbiB1c2UgaXQgdG8KPiA+IHBp
Y2sgdGhlIGFwcHJvcHJpYXRlIHBhbmVsLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IFJvYiBDbGFy
ayA8cm9iZGNsYXJrQGNocm9taXVtLm9yZz4KPgo+IEhpIFJvYiwKPgo+IEkgdW5kZXJzdGFuZCB3
aHkgeW91IGFyZSBkb2luZyB0aGlzLCBidXQgdGhpcyAqcmVhbGx5KiBiZWxvbmdzIGVsc2V3aGVy
ZS4KPgo+IFNvIHdlIGFyZSBkZWFsaW5nIHdpdGggYSBwbGF0Zm9ybSB0aGF0IHZpb2xhdGVzIHRo
ZSBVRUZJIHNwZWMsIHNpbmNlCj4gaXQgZG9lcyBub3QgYm90aGVyIHRvIGltcGxlbWVudCB2YXJp
YWJsZSBzZXJ2aWNlcyBhdCBydW50aW1lIChiZWNhdXNlCj4gTVMgbGV0IHRoZSB2ZW5kb3IgZ2V0
IGF3YXkgd2l0aCB0aGlzKS4KPgoKVG8gY2xhcmlmeSwgdGhlIGFib3ZlIHJlbWFyayBhcHBsaWVz
IHRvIHBvcHVsYXRpbmcgdGhlIERUIGZyb20gdGhlIE9TCnJhdGhlciB0aGFuIGZyb20gdGhlIGZp
cm13YXJlLgoKPiBGaXJzdCBvZiBhbGwsIHRvIHBhc3MgZGF0YSBiZXR3ZWVuIHRoZSBFRkkgc3R1
YiBhbmQgdGhlIE9TIHByb3Blciwgd2UKPiBzaG91bGQgdXNlIGEgY29uZmlndXJhdGlvbiB0YWJs
ZSByYXRoZXIgdGhhbiBhIERUIHByb3BlcnR5LCBzaW5jZSB0aGUKPiBmb3JtZXIgaXMgQUNQSS9E
VCBhZ25vc3RpYy4gQWxzbywgSSdkIGxpa2UgdGhlIGNvbnN1bWVyIG9mIHRoZSBkYXRhIHRvCj4g
YWN0dWFsbHkgaW50ZXJwcmV0IGl0LCBpLmUuLCBqdXN0IGR1bXAgdGhlIHdob2xlIG9wYXF1ZSB0
aGluZyBpbnRvIGEKPiBjb25maWcgdGFibGUgaW4gdGhlIHN0dWIsIGFuZCBkbyB0aGUgcGFyc2lu
ZyBpbiB0aGUgT1MgcHJvcGVyLgo+Cj4gSG93ZXZlciwgSSBhbSBub3QgdGhyaWxsZWQgYXQgYWRk
aW5nIGNvZGUgdG8gdGhlIHN0dWIgdGhhdAo+IHVuY29uZGl0aW9uYWxseSBsb29rcyBmb3Igc29t
ZSB2YXJpYWJsZSB3aXRoIHNvbWUgbWFnaWMgbmFtZSBvbiBhbGwKPiBBUk0vYXJtNjQgRUZJIHN5
c3RlbXMsIHNvIHRoaXMgd2lsbCBuZWVkIHRvIGxpdmUgdW5kZXIgYSBLY29uZmlnCj4gb3B0aW9u
IHRoYXQgZGVwZW5kcyBvbiBBUk02NCAoYW5kIGRvZXMgbm90IGRlZmF1bHQgdG8geSkKPgoKLi4u
IGJ1dCBzYXZpbmcgdmFyaWFibGVzIGF0IGJvb3QgdGltZSBmb3IgY29uc3VtcHRpb24gYXQgcnVu
dGltZSBpcwpzb21ldGhpbmcgdGhhdCB3ZSB3aWxsIGxpa2VseSBzZWUgbW9yZSBvZiBpbiB0aGUg
ZnV0dXJlLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpG
cmVlZHJlbm8gbWFpbGluZyBsaXN0CkZyZWVkcmVub0BsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9mcmVlZHJlbm8=

Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C8CA392526
	for <lists+freedreno@lfdr.de>; Thu, 27 May 2021 05:00:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 104506EDF3;
	Thu, 27 May 2021 03:00:25 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CCD26E8B6;
 Thu, 27 May 2021 03:00:23 +0000 (UTC)
Received: by mail-pl1-x632.google.com with SMTP id a7so1625014plh.3;
 Wed, 26 May 2021 20:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=an1polfQn6vieJpzgSqPdiPhq14M4oUVqX/Ylf5ziPs=;
 b=iLjcXPx4lqRNQzS3ska24bUU8Af/ko9/sGGaMUI2RpAPp4UphYKVzdDipO9Y6M1GkE
 dIeKh+Wbu7M0IJYH4YV7hRR2J2e+cpmie5MkvOZ6QXhbCNK8ozlr+ebLG9RAR3TZbFNY
 cqNFjJ22qsdDqQiBjJ4TrxeCjDN1GBfAqbGW2h8AsSMI7dp224h6CLRbild7A5zbTnwH
 ylEixnDV4NgDPWuBJDtBszWouxoysKzlIsbdbAXvfvDfFwPq3e3C6eFF0Q8gxmraFcp9
 XNWPwPB5nD4EkajG5bZMVM0b7TJgRdNN7ecydStYCcYAIoQVKl5hIrMS05Wg7CDmgVg/
 gu5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=an1polfQn6vieJpzgSqPdiPhq14M4oUVqX/Ylf5ziPs=;
 b=lqsdUNBFNhxydMV0ypmED/QjOn+/ig1Mkx6UoSG3Ees2yjpYAJvmvxUrMa0WmEw5/+
 mGfj78OKpPIwpjNkVhb+HKmkw4oiVilFaSxWWdAq0LBJJc39uP3eO/A3ke8Hu6n8E0DE
 dI4vu3VauH60/eDLeWIOkHmaTtRX8gAw6nsmXRw713VH3RVcnnjZaMmeU62CxX1XLRgG
 SOpAFIqlfj0WEeYUf+8XCycGvKCwWMFAAxGiAcqL7klBOZqhdYttX7JytvK48brDDIO9
 Pm9pnM+3MLRjE2DzjZAsJjoA7hHx/7O3C5Fi0B/jvnM099mr93UOV9PaN9ISf+HDie1Z
 iEVQ==
X-Gm-Message-State: AOAM531KC+OKzTdI7D05liPLULA+ajlrRs0JV8nc/lKhV/vmVsxHaM8j
 kUrSIXeaTV1GPRSQZUBo2icRItnTiZnNiGi67Us=
X-Google-Smtp-Source: ABdhPJwxnVnyzztt10Q86m+xS+QHTuioQsfAf05wWmuIlWJgsJUPA5s9c7IYyF029xW9KvhOQBt41hDKcpXIzZ1E8KM=
X-Received: by 2002:a17:90a:bd08:: with SMTP id y8mr7132190pjr.8.1622084423104; 
 Wed, 26 May 2021 20:00:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210521041633.GA1747@raspberrypi>
In-Reply-To: <20210521041633.GA1747@raspberrypi>
From: Austin Kim <austindh.kim@gmail.com>
Date: Thu, 27 May 2021 12:00:12 +0900
Message-ID: <CADLLry7xtt60wNqD4ZkcLByqEuyBpdO4VYjGjbrTMLsG1ACdcw@mail.gmail.com>
To: robdclark@gmail.com, sean@poorly.run, airlied@linux.ie, 
 Daniel Vetter <daniel@ffwll.ch>, angelogioacchino.delregno@somainline.org, 
 dmitry.baryshkov@linaro.org
Subject: Re: [Freedreno] [PATCH] drm/msm/dpu: remove unused variable cmd_enc
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 =?UTF-8?B?6rmA64+Z7ZiE?= <austindh.kim@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

MjAyMeuFhCA17JuUIDIx7J28ICjquIgpIOyYpO2bhCAxOjE2LCBBdXN0aW4gS2ltIDxhdXN0aW5k
aC5raW1AZ21haWwuY29tPuuLmOydtCDsnpHshLE6Cj4KPiBBZnRlciB0aGUgY2FsbCB0byB0b19k
cHVfZW5jb2Rlcl9waHlzX2NtZCgpIGlzIG1hZGUsCj4gJ2NtZF9lbmMnIGlzIG5vdCB1c2VkLiBX
aGVyZSB0b19kcHVfZW5jb2Rlcl9waHlzX2NtZCgpIGlzIHNpbXBseSByZXBsYWNlZCB3aXRoCj4g
Y29udGFpbmVyX29mKHgsIHN0cnVjdCBkcHVfZW5jb2Rlcl9waHlzX2NtZCwgYmFzZSkgYnkgY29t
cGlsZXIuCj4KPiBTbyBpdCBoYWQgYmV0dGVyIHJlbW92ZSBXPTEga2VybmVsIGJ1aWxkIHdhcm5p
bmcocyk6Cj4KPiAgIGRyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9kcHUxL2RwdV9lbmNvZGVyX3Bo
eXNfY21kLmM6IEluIGZ1bmN0aW9uCj4gIOKAmGRwdV9lbmNvZGVyX3BoeXNfY21kX3dhaXRfZm9y
X2NvbW1pdF9kb25l4oCZOgo+ICAgZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X2Vu
Y29kZXJfcGh5c19jbWQuYzo2ODg6MzE6IHdhcm5pbmc6Cj4gICB2YXJpYWJsZSDigJhjbWRfZW5j
4oCZIHNldCBidXQgbm90IHVzZWQKPgo+IFNpZ25lZC1vZmYtYnk6IEF1c3RpbiBLaW0gPGF1c3Rp
bmRoLmtpbUBnbWFpbC5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9kcHUx
L2RwdV9lbmNvZGVyX3BoeXNfY21kLmMgfCA0IC0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDQgZGVs
ZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL2RwdTEv
ZHB1X2VuY29kZXJfcGh5c19jbWQuYyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9kcHUxL2Rw
dV9lbmNvZGVyX3BoeXNfY21kLmMKPiBpbmRleCBiMmJlMzliOTE0NGUuLjA4ODkwMDg0MWJmOCAx
MDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvZHB1MS9kcHVfZW5jb2Rlcl9w
aHlzX2NtZC5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X2VuY29k
ZXJfcGh5c19jbWQuYwo+IEBAIC02ODUsMTAgKzY4NSw2IEBAIHN0YXRpYyBpbnQgZHB1X2VuY29k
ZXJfcGh5c19jbWRfd2FpdF9mb3JfdHhfY29tcGxldGUoCj4gIHN0YXRpYyBpbnQgZHB1X2VuY29k
ZXJfcGh5c19jbWRfd2FpdF9mb3JfY29tbWl0X2RvbmUoCj4gICAgICAgICAgICAgICAgIHN0cnVj
dCBkcHVfZW5jb2Rlcl9waHlzICpwaHlzX2VuYykKPiAgewo+IC0gICAgICAgc3RydWN0IGRwdV9l
bmNvZGVyX3BoeXNfY21kICpjbWRfZW5jOwo+IC0KPiAtICAgICAgIGNtZF9lbmMgPSB0b19kcHVf
ZW5jb2Rlcl9waHlzX2NtZChwaHlzX2VuYyk7Cj4gLQo+ICAgICAgICAgLyogb25seSByZXF1aXJl
ZCBmb3IgbWFzdGVyIGNvbnRyb2xsZXIgKi8KPiAgICAgICAgIGlmICghZHB1X2VuY29kZXJfcGh5
c19jbWRfaXNfbWFzdGVyKHBoeXNfZW5jKSkKPiAgICAgICAgICAgICAgICAgcmV0dXJuIDA7Cj4g
LS0KPiAyLjIwLjEKPgoKSWYgeW91IGFyZSBhdmFpbGFibGUsIHdvdWxkIHlvdSBwbGVhc2UgcmV2
aWV3IHRoaXMgcGF0Y2guCgpCUiwKQXVzdGluIEtpbQpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpGcmVlZHJlbm8gbWFpbGluZyBsaXN0CkZyZWVkcmVub0Bs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9mcmVlZHJlbm8K

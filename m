Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AAC63D26EC
	for <lists+freedreno@lfdr.de>; Thu, 22 Jul 2021 17:42:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A04BB6F412;
	Thu, 22 Jul 2021 15:42:35 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B9106F412;
 Thu, 22 Jul 2021 15:42:34 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id f9so6400473wrq.11;
 Thu, 22 Jul 2021 08:42:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=xwujliw37i4nL4NHiavWRXrnZYwru6cdneVGoRJHvdk=;
 b=vONwjOWAnqwZPgVHnWoc25b8Wj1QfXGXii/0g9L8XSGIqdlNvW1l2ps1Mhs+5TOrBU
 fCcyh9cgdUFo2ztUUsPeXaAv7Eu1z+04In4U9T8GxgjkXSxWKt/9eNACufrCSl3qRohZ
 uwHCxAAIjIr3IZHqh43Nm3MVxSR0+Q2DgRTuqORJDOjKA/AAdgew3wFgwLFF9gz00FAq
 8EQS4GNCSowzaFD5B0qzWSKSkeAd77OYjbitQW8GJtHPPmI4x/RutgtfQHcBYY1iLw1N
 WBE86hNGRIqqV5ttxbhLWidcQoSbBib/xY2Kr5IQR/G9r/ndov7S24VlRtHLWXarito7
 4Vnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=xwujliw37i4nL4NHiavWRXrnZYwru6cdneVGoRJHvdk=;
 b=t5cLZLhtyKtwwllARAQD0YL4PyHbwCxI0mwSWvZVG78+ZrhuWAwVgbKpqv9dk7Ha8E
 N80LfvYbb1Yx/wxbOlLZCCin5BTZgkFi/wvh9bo9tBycnOahL7j3P4xsD96KaazhabtN
 zAPH6jvH1+M1DTkJtrOJ9Vr9Q/ibVwkaMcC4TR7vcn2LfVt0GT2oolARo8Xd6j6Y936q
 Xb+CRnQczpNvX2OEim2hM2NVkx0yv6ksxfLihxSDklo9XEzGPI6YrFYMwiqduSsL8V/j
 XCj7MpaEJHW666gSVfvF+Wwhd6agQTXghG3gpzjVsrqEwhcaA5rfdperLDcTLNtoDfd9
 zMFg==
X-Gm-Message-State: AOAM531OqNNft/Y9OeOoT/Qpkdqf5p/HD1Tvd3gbDlXO2GwU5JSIRZXL
 kYBPHRAijXBgzugULn/XJ7ETrTlBaluEMIu5pVU=
X-Google-Smtp-Source: ABdhPJwDJ6g1ZzXe281PvcjiwofPNPXNvT1fjPlHUsBiLkV88ymkjK6u/j0w4wiQy9QGguzSTEKkEgrjIKZJ4Yo751E=
X-Received: by 2002:a5d:488a:: with SMTP id g10mr561619wrq.327.1626968552928; 
 Thu, 22 Jul 2021 08:42:32 -0700 (PDT)
MIME-Version: 1.0
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
 <9c1e797b-8860-d1f5-e6f2-e06380ec9012@gmail.com>
In-Reply-To: <9c1e797b-8860-d1f5-e6f2-e06380ec9012@gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 22 Jul 2021 08:46:41 -0700
Message-ID: <CAF6AEGuHLPtJ99VOSaJEFqbSum_yWHn3cMPrwcNfRn2RU3ZB5g@mail.gmail.com>
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Sean Paul <sean@poorly.run>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <freedreno@lists.freedesktop.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

T24gVGh1LCBKdWwgMjIsIDIwMjEgYXQgMjoyOCBBTSBDaHJpc3RpYW4gS8O2bmlnCjxja29lbmln
LmxlaWNodHp1bWVya2VuQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBBbSAyMi4wNy4yMSB1bSAxMTow
OCBzY2hyaWViIERhbmllbCBWZXR0ZXI6Cj4gPiBbU05JUF0KPiA+PiBBcyBmYXIgYXMgSSBrbm93
IHdha2VfdXBfc3RhdGUoKSB0cmllcyB0byBydW4gdGhlIHRocmVhZCBvbiB0aGUgQ1BVIGl0IHdh
cwo+ID4+IHNjaGVkdWxlZCBsYXN0LCB3aGlsZSB3YWl0X2V2ZW50XyogbWFrZXMgdGhlIHRocmVh
ZCBydW4gb24gdGhlIENQVSB3aG8KPiA+PiBpc3N1ZXMgdGhlIHdha2UgYnkgZGVmYXVsdC4KPiA+
Pgo+ID4+IEFuZCB5ZXMgSSd2ZSBhbHNvIG5vdGljZWQgdGhpcyBhbHJlYWR5IGFuZCBpdCB3YXMg
b25lIG9mIHRoZSByZWFzb24gd2h5IEkKPiA+PiBzdWdnZXN0ZWQgdG8gdXNlIGEgd2FpdF9xdWV1
ZSBpbnN0ZWFkIG9mIHRoZSBoYW5kIHdpcmVkIGRtYV9mZW5jZV93YWl0Cj4gPj4gaW1wbGVtZW50
YXRpb24uCj4gPiBUaGUgZmlyc3QgdmVyc2lvbnMgaGFkIHVzZWQgd2FpdF9xdWV1ZSwgYnV0IGlp
cmMgd2UgaGFkIHNvbWUgaXNzdWVzIHdpdGgKPiA+IHRoZSBjYWxsYmFja3MgYW5kIHN0dWZmIGFu
ZCB0aGF0IHdhcyB0aGUgcmVhc29ucyBmb3IgaGFuZC1yb2xsaW5nLiBPcgo+ID4gbWF5YmUgaXQg
d2FzIHRoZSBpbnRlZ3JhdGlvbiBvZiB0aGUgbG9ja2xlc3MgZmFzdHBhdGggZm9yCj4gPiBkbWFf
ZmVuY2VfaXNfc2lnbmFsbGVkKCkuCj4gPgo+ID4+IFtTTklQXQo+ID4+IFdlbGwgaXQgd291bGQg
aGF2ZSBiZWVuIG5pY2VyIGlmIHdlIHVzZWQgdGhlIGV4aXN0aW5nIGluZnJhc3RydWN0dXJlIGlu
c3RlYWQKPiA+PiBvZiByZS1pbnZlbnRpbmcgc3R1ZmYgZm9yIGRtYV9mZW5jZSwgYnV0IHRoYXQg
Y2hhbmNlIGlzIGxvbmcgZ29uZS4KPiA+Pgo+ID4+IEFuZCB5b3UgZG9uJ3QgbmVlZCBhIGRtYV9m
ZW5jZV9jb250ZXh0IGJhc2UgY2xhc3MsIGJ1dCByYXRoZXIganVzdCBhIGZsYWcgaW4KPiA+PiB0
aGUgZG1hX2ZlbmNlX29wcyBpZiB5b3Ugd2FudCB0byBjaGFuZ2UgdGhlIGJlaGF2aW9yLgo+ID4g
SWYgdGhlcmUncyBzb21ldGhpbmcgYnJva2VuIHdlIHNob3VsZCBqdXN0IGZpeCBpdCwgbm90IGZv
cmNlIGV2ZXJ5b25lIHRvCj4gPiBzZXQgYSByYW5kb20gZmxhZy4gZG1hX2ZlbmNlIHdvcmsgbGlr
ZSBzcGVjaWFsIHdhaXRfcXVldWVzLCBzbyBpZiB3ZQo+ID4gZGlmZmVyIHRoZW4gd2Ugc2hvdWxk
IGdvIGJhY2sgdG8gdGhhdC4KPgo+IFdhaXQgYSBzZWNvbmQgd2l0aCB0aGF0LCB0aGlzIGlzIG5v
dCBicm9rZW4uIEl0J3MganVzdCBkaWZmZXJlbnQKPiBiZWhhdmlvciBhbmQgdGhlcmUgYXJlIGdv
b2QgYXJndW1lbnRzIGZvciBib3RoIHNpZGVzLgo+Cj4gSWYgYSB3YWl0IGlzIHNob3J0IHlvdSBj
YW4gaGF2ZSBzaXR1YXRpb25zIHdoZXJlIHlvdSB3YW50IHRvIHN0YXJ0IHRoZQo+IHRocmVhZCBv
biB0aGUgb3JpZ2luYWwgQ1BVLgo+ICAgICAgVGhpcyBpcyBiZWNhdXNlIHlvdSBjYW4gYXNzdW1l
IHRoYXQgdGhlIGNhY2hlcyBvbiB0aGF0IENQVSBhcmUKPiBzdGlsbCBob3QgYW5kIGhlYXRpbmcg
dXAgdGhlIGNhY2hlcyBvbiB0aGUgbG9jYWwgQ1BVIHdvdWxkIHRha2UgbG9uZ2VyCj4gdGhhbiBh
biBpbnRlciBDUFUgaW50ZXJydXB0Lgo+Cj4gQnV0IGlmIHRoZSB3YWl0IGlzIGxvbmcgaXQgbWFr
ZXMgbW9yZSBzZW5zZSB0byBydW4gdGhlIHRocmVhZCBvbiB0aGUgQ1BVCj4gd2hlcmUgeW91IG5v
dGljZWQgdGhlIHdha2UgdXAgZXZlbnQuCj4gICAgICBUaGlzIGlzIGJlY2F1c2UgeW91IGNhbiBh
c3N1bWUgdGhhdCB0aGUgY2FjaGVzIGFyZSBjb2xkIGFueXdheSBhbmQKPiBzdGFydGluZyB0aGUg
dGhyZWFkIG9uIHRoZSBjdXJyZW50IENQVSAobW9zdCBsaWtlbHkgZnJvbSBhbiBpbnRlcnJ1cHQK
PiBoYW5kbGVyKSBnaXZlcyB5b3UgdGhlIGFic29sdXRlbHkgYmVzdCBsYXRlbmN5Lgo+ICAgICAg
SW4gb3RoZXIgd29yZHMgeW91IHVzdWFsbHkgcmV0dXJuIGZyb20gdGhlIGludGVycnVwdCBoYW5k
bGVyIGFuZAo+IGp1c3QgZGlyZWN0bHkgc3dpdGNoIHRvIHRoZSBub3cgcnVubmluZyB0aHJlYWQu
Cj4KPiBJJ20gbm90IHN1cmUgaWYgYWxsIGRyaXZlcnMgd2FudCB0aGUgc2FtZSBiZWhhdmlvci4g
Um9iIGhlcmUgc2VlbXMgdG8KPiBwcmVmZXIgbnVtYmVyIDIsIGJ1dCB3ZSBoYXZlIHVzZWQgMSBm
b3IgZG1hX2ZlbmNlIGZvciBhIHJhdGhlciBsb25nIHRpbWUKPiBub3cgYW5kIGl0IGNvdWxkIGJl
IHRoYXQgc29tZSBwZW9wbGUgc3RhcnQgdG8gY29tcGxhaW4gd2hlbiB3ZSBzd2l0Y2gKPiB1bmNv
bmRpdGlvbmFsbHkuCj4KCkhtbSwgSSB3b25kZXIgaWYgaXQgd291bGQgbWFrZSBzZW5zZSB0byBo
YXZlIGEgZG1hX3dhaXRfZmVuY2UoKSBmbGFnCnRvIGNvbnRyb2wgdGhlIGJlaGF2aW9yLCBzaW5j
ZSBpdCBpcyBtYXliZSBtb3JlIGFib3V0IHRoZSB3YWl0ZXIgKGFuZApwZXJoYXBzIGhvdyBsb25n
IHRoZSB3YWl0ZXIgZXhwZWN0cyB0byB3YWl0KSB0aGFuIHRoZSBzaWduYWxlci4uCgpCUiwKLVIK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KRnJlZWRyZW5v
IG1haWxpbmcgbGlzdApGcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZnJlZWRyZW5vCg==

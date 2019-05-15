Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BF4D1FA11
	for <lists+freedreno@lfdr.de>; Wed, 15 May 2019 20:37:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4829891DD;
	Wed, 15 May 2019 18:37:16 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3A4E89152
 for <freedreno@lists.freedesktop.org>; Wed, 15 May 2019 18:37:14 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id f24so831426qtk.11
 for <freedreno@lists.freedesktop.org>; Wed, 15 May 2019 11:37:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=SFNuIJemdTLO0xp4SS7eD7mTRt2jx19bhUfAq2FJGCg=;
 b=szcRxO/hITkCAalNnUAUaFaDdSl4IiTF/tRFFHq+jEpqDaMDu3XLs4V5sfwqprN8aq
 Qcb4bSmbRyShUYA5zdVSYYNEuPxMzVguMdq47h+aYjXOs2K9IOXweLRuoaJJ1jCUSbUI
 gCsKbBiTrhMWc9BKyp/GhBJi1h4aTE8P3ttF/hcIptY4gw0bjn4GCY9XgJpE0wnyFvOu
 rJgn3AZIR1pm88dNB3cTwjLLLIeuJbbKQc1UF9lXkHmcjl6rIH6Z68kFaI/EvP6fCXPS
 7QxrejxRMyStuqwCIuJOILK1p7YPEpKpTVL1CMQcOvLPGOy2uTAvBjzifJdzwZ3x4hjp
 B0rA==
X-Gm-Message-State: APjAAAX33VYAC7D1MdyW97f9Re7dhJ0Y9pciVxWVf+DHYuK30pQF9d5H
 IvodI7s/RkE/DjIL2Vy1vxO0Pg==
X-Google-Smtp-Source: APXvYqxMIfZBBwCvYBUULJBhCR4PNZQyPokNd7gubEnQIC9pIP9wcs/fACEqVBe4sfNi7KMbt+/qXg==
X-Received: by 2002:ac8:534d:: with SMTP id d13mr13916550qto.217.1557945433945; 
 Wed, 15 May 2019 11:37:13 -0700 (PDT)
Received: from localhost ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id b19sm1396281qkk.51.2019.05.15.11.37.13
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 15 May 2019 11:37:13 -0700 (PDT)
Date: Wed, 15 May 2019 14:37:12 -0400
From: Sean Paul <sean@poorly.run>
To: Sabyasachi Gupta <sabyasachi.linux@gmail.com>
Message-ID: <20190515183712.GZ17077@art_vandelay>
References: <5cda6de6.1c69fb81.a3ae5.836a@mx.google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5cda6de6.1c69fb81.a3ae5.836a@mx.google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=SFNuIJemdTLO0xp4SS7eD7mTRt2jx19bhUfAq2FJGCg=;
 b=eEBO9MSQNtsb6zqoHTndPS0B0pR8E0sMp9T7yHW6qouW7Epg5SAzibiwdCmR3ibNGl
 D/S1jOoC2CAkyYprOIQpXzrm0BT5s0wI2sn0Gix9ARpYci3hGGmbmMyqd9it3GwAEj7C
 CiPRdXhZFO7FQKxofCxcAcaW6/fdl4oUvWmlMZSqXpiRT0sTARPesrhuPgFwsZ/HWvIr
 Nkkx6vFla5YJskiuqMxOiGm+DTXTF5AslGYsE1aXObkoOPMRkJ81w7W9Ne791MKUj9aU
 +saNoD9teyzZjIyA/28tOSqexFL/GyVjCBQCAOer25Gs869VftGpTli5Am3dCRe1qaQh
 NE1g==
Subject: Re: [Freedreno] [PATCH] drm/msm/dpu: Remove duplicate header
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
Cc: airlied@linux.ie, linux-arm-msm@vger.kernel.org, jcrouse@codeaurora.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 robdclark@gmail.com, seanpaul@chromium.org, jrdr.linux@gmail.com,
 jsanka@codeaurora.org, freedreno@lists.freedesktop.org,
 chandanu@codeaurora.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

T24gVHVlLCBNYXkgMTQsIDIwMTkgYXQgMTI6NTc6MjhQTSArMDUzMCwgU2FieWFzYWNoaSBHdXB0
YSB3cm90ZToKPiBSZW1vdmUgZHB1X2ttcy5oIHdoaWNoIGlzIGluY2x1ZGVkIG1vcmUgdGhhbiBv
bmNlCj4gCj4gU2lnbmVkLW9mZi1ieTogU2FieWFzYWNoaSBHdXB0YSA8c2FieWFzYWNoaS5saW51
eEBnbWFpbC5jb20+CgpUaGFua3MgZm9yIHlvdXIgcGF0Y2gsIEkndmUgYXBwbGllZCBpdCB0byBk
cm0tbWlzYy1uZXh0LWZpeGVzLgoKTm90ZSBmb3IgbmV4dCB0aW1lOiBUaGUgcGF0Y2ggZGlkbid0
IGFwcGx5IGNsZWFubHkgc2luY2UgZHB1X2RiZy5oIGhhcyBiZWVuCnJlbW92ZWQgdXBzdHJlYW0u
IEluIGZ1dHVyZSBwbGVhc2UgbWFrZSBzdXJlIHlvdXIgcGF0Y2hlcyBhcHBseSBjbGVhbmx5IGFu
ZAphdCBsZWFzdCBidWlsZCBhZ2FpbnN0IHVwc3RyZWFtLgoKVGhhbmtzIGFnYWluIQoKU2VhbgoK
PiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X2h3X2xtLmMgfCAxIC0K
PiAgMSBmaWxlIGNoYW5nZWQsIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X2h3X2xtLmMgYi9kcml2ZXJzL2dwdS9kcm0vbXNt
L2Rpc3AvZHB1MS9kcHVfaHdfbG0uYwo+IGluZGV4IGRiZTQ4ZTAwLi5kNjkyZGVlIDEwMDY0NAo+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9kcHUxL2RwdV9od19sbS5jCj4gKysrIGIv
ZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X2h3X2xtLmMKPiBAQCAtMTYsNyArMTYs
NiBAQAo+ICAjaW5jbHVkZSAiZHB1X2h3X2xtLmgiCj4gICNpbmNsdWRlICJkcHVfaHdfbWRzcy5o
Igo+ICAjaW5jbHVkZSAiZHB1X2RiZy5oIgo+IC0jaW5jbHVkZSAiZHB1X2ttcy5oIgo+ICAKPiAg
I2RlZmluZSBMTV9PUF9NT0RFICAgICAgICAgICAgICAgICAgICAgICAgMHgwMAo+ICAjZGVmaW5l
IExNX09VVF9TSVpFICAgICAgICAgICAgICAgICAgICAgICAweDA0Cj4gLS0gCj4gMi43LjQKPiAK
Ci0tIApTZWFuIFBhdWwsIFNvZnR3YXJlIEVuZ2luZWVyLCBHb29nbGUgLyBDaHJvbWl1bSBPUwpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpGcmVlZHJlbm8g
bWFpbGluZyBsaXN0CkZyZWVkcmVub0BsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9mcmVlZHJlbm8=

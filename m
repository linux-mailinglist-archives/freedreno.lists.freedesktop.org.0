Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FE955D82B
	for <lists+freedreno@lfdr.de>; Wed,  3 Jul 2019 00:49:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABB756E09F;
	Tue,  2 Jul 2019 22:49:15 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3EF56E096
 for <freedreno@lists.freedesktop.org>; Tue,  2 Jul 2019 21:59:56 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id x17so382697wrl.9
 for <freedreno@lists.freedesktop.org>; Tue, 02 Jul 2019 14:59:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=7PbiqxZ6N1zfuiJYD7wJ93Pdo9aQh0IzeX8dcJ4X5FU=;
 b=S62NvFT6b9Cuee2wP684/kBM6z/E7i4pUAxBOO4qLAzCXjOFknaU3F6FanFLGGXmua
 gOG7C/3EHWRm2n3yqi9htx3mOiQ9g7gHdoxRsm29LSLb7dKoyVKxTYQJwKyAZwxl9UpY
 /aJHAToIYuPCpj+80oCVx9XGBkBDczbhb9WfQ804VDdQnsvA6RXf5JS3+eci7IOSWBmJ
 xB6Hvn3b1JbK+ZT0c8iDlistAi3Yk6mQsl1O56lueaVFm8o7HOrcV59+yyt44Xr2XWX8
 0P/L0FnHzCCtV+ipT1YXWy4WPywX9NMX7M0f/ElH+VXwgn+WEZffGhR6VS1xRJJSOlcp
 QexA==
X-Gm-Message-State: APjAAAVR4pTxVhRUp+5CSq72tSc8nTucBnTbYuyAlRWF8MLWCD6r4FhU
 PfulN62X95puVC+5oThqa8E8cg==
X-Google-Smtp-Source: APXvYqxy3HQDztVC6uezZn9eBQs5Zkluz0+aQTRZh5ueKntVlQ8XLFFH3aUcx4MBnkHOUdh7vxHexg==
X-Received: by 2002:a5d:6182:: with SMTP id j2mr14634480wru.275.1562104795656; 
 Tue, 02 Jul 2019 14:59:55 -0700 (PDT)
Received: from bivouac.eciton.net (bivouac.eciton.net.
 [2a00:1098:0:86:1000:23:0:2])
 by smtp.gmail.com with ESMTPSA id w25sm226281wmk.18.2019.07.02.14.59.54
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 02 Jul 2019 14:59:54 -0700 (PDT)
Date: Tue, 2 Jul 2019 22:59:53 +0100
From: Leif Lindholm <leif.lindholm@linaro.org>
To: Rob Clark <robdclark@gmail.com>
Message-ID: <20190702215953.wdqges66hx3ge4jr@bivouac.eciton.net>
References: <20190630203614.5290-1-robdclark@gmail.com>
 <20190630203614.5290-3-robdclark@gmail.com>
 <CAKv+Gu_8BOt+f8RTspHo+se-=igZba1zL0+jWLV2HuuUXCKYpA@mail.gmail.com>
 <CAKv+Gu-KhPJxxJA3+J813OPcnoAD4nHq6MhiRTJSd_5y1dPNnw@mail.gmail.com>
 <CAF6AEGv+uAXVV6Q78n=jP0YRDjYn9OS=Xec9MU0+_7EBirxF5w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAF6AEGv+uAXVV6Q78n=jP0YRDjYn9OS=Xec9MU0+_7EBirxF5w@mail.gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-Mailman-Approved-At: Tue, 02 Jul 2019 22:49:15 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=7PbiqxZ6N1zfuiJYD7wJ93Pdo9aQh0IzeX8dcJ4X5FU=;
 b=pSfYXKs/eqzCFbQjrWkC99dJ2GBbcgfGiqD4o3TT1CTRmGJKlgGUmxb64JYxtewy9i
 P4m7J1uixRsx52J41BThoDYqSjJKJBBVrDWCyj9I8Ea61Y92rPgjr1pLTBd0RQJPFzmU
 M7V32ufMqcgtq8htDIXCzupTlkp4UjI9gHxwKnnjp9I5KC8XIMpLESjEz2ky6JmdWBUZ
 fpUrAlbfT2IsMegG37jVJuagyqNW4pkpQtkIeE58VcZQYGISG+P5AuwWh7z/Nf5nXZpG
 e0YVm2O6FdZtWrWdqJ8y44qc1Kznwh6KOm+3xKsBu3WKOzbgEmB8k1YSrTXZcEvtEq40
 T4Ng==
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
 Julien Thierry <julien.thierry@arm.com>, linux-efi <linux-efi@vger.kernel.org>,
 Will Deacon <will@kernel.org>, Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Steve Capper <steve.capper@arm.com>, Alexander Graf <agraf@suse.de>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Lukas Wunner <lukas@wunner.de>, freedreno <freedreno@lists.freedesktop.org>,
 Ingo Molnar <mingo@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

T24gVHVlLCBKdWwgMDIsIDIwMTkgYXQgMDI6MDE6NDlQTSAtMDcwMCwgUm9iIENsYXJrIHdyb3Rl
Ogo+ID4gPiBTbyB3ZSBhcmUgZGVhbGluZyB3aXRoIGEgcGxhdGZvcm0gdGhhdCB2aW9sYXRlcyB0
aGUgVUVGSSBzcGVjLCBzaW5jZQo+ID4gPiBpdCBkb2VzIG5vdCBib3RoZXIgdG8gaW1wbGVtZW50
IHZhcmlhYmxlIHNlcnZpY2VzIGF0IHJ1bnRpbWUgKGJlY2F1c2UKPiA+ID4gTVMgbGV0IHRoZSB2
ZW5kb3IgZ2V0IGF3YXkgd2l0aCB0aGlzKS4KPiA+Cj4gPiBUbyBjbGFyaWZ5LCB0aGUgYWJvdmUg
cmVtYXJrIGFwcGxpZXMgdG8gcG9wdWxhdGluZyB0aGUgRFQgZnJvbSB0aGUgT1MKPiA+IHJhdGhl
ciB0aGFuIGZyb20gdGhlIGZpcm13YXJlLgo+IAo+IHllYWgsIGl0IGlzbid0IHByZXR0eSwgYnV0
IHRoZXJlICphcmUqIHNvbWUgb3RoZXIgc2ltaWxhciBjYXNlcyB3aGVyZQo+IGVmaS1zdHViIGlz
IHBvcHVsYXRpbmcgRFQuLiAobGlrZSB1cGRhdGVfZmR0X21lbW1hcCgpIGFuZAo+IGthc2xyLXNl
ZWQpLi4KClRoZSBwcm9ibGVtIGlzbid0IHdpdGggdGhlIHN0dWIgdXBkYXRpbmcgdGhlIERULCB0
aGUgcHJvYmxlbSBpcyB3aGF0Cml0IHVwZGF0ZXMgaXQgd2l0aC4KCnVwZGF0ZV9mZHRfbWVtbWFw
KCkgaXMgdGhlIHN0dWIgZmlsbGluZyBpbiB0aGUgaW5mb3JtYXRpb24gaXQKY29tbXVuaWNhdGVz
IHRvIHRoZSBtYWluIGtlcm5lbC4KCmthc2xyLXNlZWQgc2V0cyBhIHN0YW5kYXJkIHByb3BlcnR5
IHVzaW5nIGEgc3RhbmRhcmQgaW50ZXJmYWNlIGlmIHRoYXQKaW50ZXJmYWNlIGlzIGF2YWlsYWJs
ZSB0byBpdCBhdCB0aGUgcG9pbnQgb2YgZXhlY3V0aW9uLgoKU2luY2Ugd2hhdCB3ZSdyZSBkb2lu
ZyBoZXJlIGlzIGRyZXNzaW5nIHVwIGFuIEFDUEkgcGxhdGZvcm0gdG8gbWFrZSBpdApsb29rIGxp
a2UgaXQgd2FzIGEgRFQgcGxhdGZvcm0sIGFuZCBzaW5jZSB3ZSBoYXZlIHRoZSBhYmlsaXR5IHRv
IHR3ZWFrCnRoZSBEVCBiZWZvcmUgZXZlciBwYXNzaW5nIGl0IHRvIHRoZSBrZXJuZWwsIGxldCdz
IGp1c3QgZG8gdGhhdC4KClllcywgSSBrbm93IEkgc2FpZCBJJ2QgcmF0aGVyIG5vdCwgYnV0IGl0
J3Mgd2F5IG5pY2VyIHRoYW4gc3RpY2tpbmcKcGxhdGZvcm0tc3BlY2lmaWMgaGFja3MgaW50byB0
aGUgRUZJIHN0dWIuCgooSWYgYWRkaW5nIGl0IGFzIGEgRFQgcHJvcGVydHkgaXMgaW5kZWVkIHRo
ZSB0aGluZyB0byBkby4pCgo+ID4gLi4uIGJ1dCBzYXZpbmcgdmFyaWFibGVzIGF0IGJvb3QgdGlt
ZSBmb3IgY29uc3VtcHRpb24gYXQgcnVudGltZSBpcwo+ID4gc29tZXRoaW5nIHRoYXQgd2Ugd2ls
bCBsaWtlbHkgc2VlIG1vcmUgb2YgaW4gdGhlIGZ1dHVyZS4KPiAKPiBJIHRoaW5rIHRoaXMgd2ls
bCBiZSBuaWNlLCBidXQgaXQgYWxzbyBkb2Vzbid0IGFkZHJlc3MgdGhlIG5lZWQgZm9yIGEKPiBx
dWlyayB0byBnZXQgdGhpcyBpbnRvIC9jaG9zZW4uLiAgSSBndWVzcyB3ZSAqY291bGQqIHVzZSBh
IHNoaW0gb3IKPiBzb21ldGhpbmcgdGhhdCBydW5zIGJlZm9yZSB0aGUga2VybmVsIHRvIGRvIHRo
aXMuICBCdXQgdGhhdCBqdXN0IHNlZW1zCj4gbGlrZSBhIGxvZ2lzdGljYWwvc3VwcG9ydCBuaWdo
dG1hcmUuCj4KPiBUaGVyZSBpcyBvbmUga2VybmVsLCBhbmQgdGhlcmUKPiBhcmUgTiBkaXN0cm8n
cywgc28gZGVidWdnaW5nIGEgdXNlcnMgIkkgZG9uJ3QgZ2V0IGEgc2NyZWVuIGF0IGJvb3QiCj4g
cHJvYmxlbSBiZWNhdXNlIHRoZWlyIGRpc3RybyBtaXNzZWQgc29tZSBzaGltIHBhdGNoIHJlYWxs
eSBqdXN0Cj4gZG9lc24ndCBzZWVtIGxpa2UgYSBoZWFkYWNoZSBJIHdhbnQgdG8gaGF2ZS4KClRo
ZSBkaXN0cm9zIHNob3VsZCBub3QgbmVlZCB0byBiZSBhd2FyZSAqYXQgYWxsKiBvZiB0aGUgaGFj
a3MgcmVxdWlyZWQKdG8gZGlzZ3Vpc2UgdGhlc2UgcGxhdGZvcm1zIGFzIERUIHBsYXRmb3Jtcy4K
CklmIHRoZXkgZG8sIHRoZXkncmUgYWxyZWFkeSBkZXZpY2Utc3BlY2lmaWMgaW5zdGFsbGVycyBh
bmQgaGF2ZQphbHJlYWR5IGFjY2VwdGVkIHRoZSBsb2dpc3RpY2FsL3N1cHBvcnQgbmlnaHRtYXJl
LgoKLwogICAgTGVpZgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpGcmVlZHJlbm8gbWFpbGluZyBsaXN0CkZyZWVkcmVub0BsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9mcmVlZHJl
bm8=

Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 975978ED73
	for <lists+freedreno@lfdr.de>; Thu, 15 Aug 2019 15:54:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 488996E3EE;
	Thu, 15 Aug 2019 13:54:54 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com
 [IPv6:2607:f8b0:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8476B6E3EE
 for <freedreno@lists.freedesktop.org>; Thu, 15 Aug 2019 13:54:52 +0000 (UTC)
Received: by mail-oi1-x242.google.com with SMTP id c15so2039137oic.3
 for <freedreno@lists.freedesktop.org>; Thu, 15 Aug 2019 06:54:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=X5MHSVxjVbFw14gqG5FUXdzsIwvacO5ycoZ+KZncf0s=;
 b=pKd+wlY/ZKjiJ9tfFQG3YmkKtNmowSQJobMjClCyDsUwo4E9w8+Wn0125PKW6XzOtq
 LWkogh/IvaZD3J1Dtb7mbukcgvdjTlsgPuvGHQgdBgrCxYNXrOVrnoc3K344MuiZ40k5
 5gdX0ADkA/IiZt2oMtk+dBKFOAKCjD4WklkNdk9Z1vPfz2PhOdSmgFen8aOd6VXWm0hq
 OfdxO+AUwfC1sXqhVT5jku/etuLWvD9JNgqmpAidX9WjUlNVj1GXN1VfGgXgmsR1jYY+
 9aRK7fIVn9AbCx/ZhxIzp/WI3OfsorguToC8zjWRAJwZ91nLgU9h+SPMMDOf6ne8WzWz
 mPAQ==
X-Gm-Message-State: APjAAAUaZigsrS+9Gijm/9XPL6C7udW0Qle6SCiX54Mln1lULgTyNO52
 ddvltWvyt/GE34ecph1GNouZBftkKX3aZS/3HH/aZA==
X-Google-Smtp-Source: APXvYqzxa6k1RXxyRnJ7m1wF7wJgwzc+l90Oa2P6408VZnjT7yIceyBMmq0y0ocLrushHIzYfzfGRi1TZ2X58HUfSGc=
X-Received: by 2002:a02:770a:: with SMTP id g10mr4932288jac.15.1565877291690; 
 Thu, 15 Aug 2019 06:54:51 -0700 (PDT)
MIME-Version: 1.0
References: <20190814220011.26934-1-robdclark@gmail.com>
 <20190815065117.GA23761@lst.de>
In-Reply-To: <20190815065117.GA23761@lst.de>
From: Rob Clark <robdclark@chromium.org>
Date: Thu, 15 Aug 2019 06:54:39 -0700
Message-ID: <CAJs_Fx4bS64s7+xQqsead3N80ZQpofqegFQu+tT=b3wcGd_2pA@mail.gmail.com>
To: Christoph Hellwig <hch@lst.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=X5MHSVxjVbFw14gqG5FUXdzsIwvacO5ycoZ+KZncf0s=;
 b=LL9gmWZ1h+OhDYg38xhyOFgY6h1JTL7+BEI+M4/66SAuy+YS17/1GNt2LFCYlFwHgS
 I2ORea3QECg5t802K1/kXe+MYRWXHFLGsmZw9w0b0C4PQffYsKhMpRJ5RWFKi2c56Q5H
 lbZZv26jqw/MHeMc//ARtg43BTEsBpT31y1nQ=
Subject: Re: [Freedreno] [PATCH 0/6] drm+dma: cache support for arm, etc
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
Cc: Kate Stewart <kstewart@linuxfoundation.org>,
 Masayoshi Mizuma <m.mizuma@jp.fujitsu.com>,
 "Maciej W. Rozycki" <macro@linux-mips.org>, Eric Biggers <ebiggers@google.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Imre Deak <imre.deak@intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Will Deacon <will@kernel.org>, Emil Velikov <emil.velikov@collabora.com>,
 Deepak Sharma <deepak.sharma@amd.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Paul Burton <paul.burton@mips.com>, Mike Rapoport <rppt@linux.ibm.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 "moderated list:ARM64 PORT \(AARCH64 ARCHITECTURE\)"
 <linux-arm-kernel@lists.infradead.org>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 "open list:MIPS" <linux-mips@vger.kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Robin Murphy <robin.murphy@arm.com>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Joerg Roedel <jroedel@suse.de>, Arnd Bergmann <arnd@arndb.de>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Hauke Mehrtens <hauke@hauke-m.de>, Jesper Dangaard Brouer <brouer@redhat.com>,
 "Wolfram Sang \(Renesas\)" <wsa+renesas@sang-engineering.com>,
 "open list:LINUX FOR POWERPC \(32-BIT AND 64-BIT\)"
 <linuxppc-dev@lists.ozlabs.org>, Alexios Zavras <alexios.zavras@intel.com>,
 Russell King <rmk+kernel@armlinux.org.uk>,
 Doug Anderson <armlinux@m.disordat.com>, Thomas Gleixner <tglx@linutronix.de>,
 Sean Paul <sean@poorly.run>, Allison Randal <allison@lohutok.net>,
 Christophe Leroy <christophe.leroy@c-s.fr>, Enrico Weigelt <info@metux.net>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 open list <linux-kernel@vger.kernel.org>, Rob Clark <robdclark@gmail.com>,
 Souptick Joarder <jrdr.linux@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

T24gV2VkLCBBdWcgMTQsIDIwMTkgYXQgMTE6NTEgUE0gQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBs
c3QuZGU+IHdyb3RlOgo+Cj4gQXMgc2FpZCBiZWZvcmUgSSBkb24ndCB0aGluayB0aGVzZSBsb3ct
bGV2ZWwgaGVscGVycyBhcmUgdGhlCj4gcmlnaHQgQVBJIHRvIGV4cG9ydCwgYnV0IGV2ZW4gaWYg
dGhleSBkaWQgeW91J2QganVzdCBjb3ZlciBhIHRpbnkKPiBzdWJzZXQgb2YgdGhlIGFyY2hpdGVj
dHVyZXMuCgpBcmUgeW91IHRoaW5raW5nIGluc3RlYWQgc29tZXRoaW5nIGxpa2U6Cgp2b2lkIGRt
YV9zeW5jX3NnX2Zvcl97Y3B1LGRldmljZX0oc3RydWN0IGRldmljZSAqZGV2LCBzdHJ1Y3Qgc2Nh
dHRlcmxpc3QgKnNnbCwKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGludCBuZW50
cywgZW51bSBkbWFfZGF0YV9kaXJlY3Rpb24gZGlyKQp7CiAgICBmb3JfZWFjaF9zZyhzZ2wsIHNn
LCBuZW50cywgaSkgewogICAgICAgIGFyY2hfc3luY19kbWFfZm9yXy4uKGRldiwgc2dfcGh5cyhz
ZyksIHNnLT5sZW5ndGgsIGRpcik7CiAgICB9Cn0KRVhQT1JUX1NZTUJPTF9HUEwoZG1hX3N5bmNf
c2dfZm9yXy4uKQoKb3IgZGlkIHlvdSBoYXZlIHNvbWV0aGluZyBlbHNlIGluIG1pbmQ/CgpJIGd1
ZXNzIHNvbWV0aGluZyBsaWtlIHRoaXMgd291bGQgYXZvaWQgZmlndXJpbmcgb3V0ICp3aGljaCog
YXJjaHMKYWN0dWFsbHkgYnVpbGQgZHJtLi4KCgo+IEFsc28gdG8gZGlzdGlsIHRoZSBwcmV2aW91
cyB0aHJlYWQgLSBpZiB5b3UgcmVtYXAgbWVtb3J5IHRvIHVuY2FjaGVkCj4gdGhlIGhlbHBlciB0
byB1c2UgaXMgYXJjaF9kbWFfcHJlcF9jb2hlcmVudCwgd2hpY2ggZG9lcyBhIHdyaXRlYmFjaysK
PiBpbnZhbGlkYXRlIGV2ZXJ5d2hlcmUsIGFuZCB0aGVyZSBpcyBubyBuZWVkIHRvIGNsZWFuIHVw
IGFmdGVyIGEKPiBsb25nLXRlcm0gdW5jYWNoZWQgbWFwcGluZy4gIFdlIG1pZ2h0IHN0aWxsIGdl
dCBzcGVjdWxhdGlvbnMgaW50bwo+IHRoYXQgYXJlYSwgaWYgd2UgZG9uJ3QgcmVtYXAgdGhlIGRp
cmVjdCBtYXBwaW5nLCBidXQgaXQgaXNuJ3QgbGlrZQo+IGludmFsaWR0aW5nIHRoYXQganVzdCBi
ZWZvcmUgZnJlZWluZyB0aGUgbWVtb3J5IGlzIGdvaW5nIHRvIGhlbHAKPiBhbnlvbmUuCgpobW0s
IElJVUMgdGhlIGFhcmNoNjQgY2FjaGUgaW5zdHJ1Y3Rpb25zLCB3aGF0IEknbSBkb2luZyBub3cg
aXMgZXF1aXYKdG8gd2hhdCBJIHdvdWxkIGdldCB3aXRoIGRtYV9tYXBfc2coRE1BX0JJRElSRUNU
SU9OQUwpIGFuZAphcmNoX2RtYV9wcmVwX2NvaGVyZW50KCkgaXMgZXF1aXYgdG8gd2hhdCBJJ2Qg
Z2V0IHcvIERNQV9GUk9NX0RFVklDRQooYnV0IGEgc2luZ2xlIHBhc3MgaW5zdGVhZCBvZiBzZXBh
cmF0ZSBpbnYrY2xlYW4gcGFzc2VzKS4uCgpidXQgSSBjYW4gcmVzcGluIHRoaXMgd2l0aCBhIHNp
bmdsZSBkbWFfcHJlcF9jb2hlcmVudF9zZygpIHdoaWNoIHVzZXMKYXJjaF9kbWFfcHJlcF9jb2hl
cmVudCgpLi4KCj4gQWxzbyBpdCBzZWVtcyBsaWtlIHBhdGNoZXMgNSBhbmQgNiBhcmUgbWlzc2lu
ZyBpbiBteSBpbmJveC4KCkhtbSwgbm90IGVudGlyZWx5IHN1cmUgd2h5Li4geW91IHNob3VsZCBi
ZSBvbiB0aGUgY2MgbGlzdCBmb3IgZWFjaAppbmRpdmlkdWFsIHBhdGNoLgoKQnV0IGhlcmUgaXMg
dGhlIHBhdGNod29yayBsaW5rIGlmIHlvdSB3YW50IHRvIHNlZSB0aGVtOgoKaHR0cHM6Ly9wYXRj
aHdvcmsuZnJlZWRlc2t0b3Aub3JnL3Nlcmllcy82NTIxMS8KCkJSLAotUgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpGcmVlZHJlbm8gbWFpbGluZyBsaXN0
CkZyZWVkcmVub0BsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9mcmVlZHJlbm8=

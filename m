Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C65AB91C67
	for <lists+freedreno@lfdr.de>; Mon, 19 Aug 2019 07:23:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63D7C6E091;
	Mon, 19 Aug 2019 05:23:45 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8C316E091;
 Mon, 19 Aug 2019 05:23:44 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 736F768B02; Mon, 19 Aug 2019 07:23:37 +0200 (CEST)
Date: Mon, 19 Aug 2019 07:23:37 +0200
From: Christoph Hellwig <hch@lst.de>
To: Rob Clark <robdclark@chromium.org>
Message-ID: <20190819052337.GA16622@lst.de>
References: <20190814220011.26934-1-robdclark@gmail.com>
 <20190815065117.GA23761@lst.de>
 <CAJs_Fx4bS64s7+xQqsead3N80ZQpofqegFQu+tT=b3wcGd_2pA@mail.gmail.com>
 <20190815175346.GA19839@lst.de>
 <CAJs_Fx6am7TeDFSG=CcTT=4KwhqrZX_jnn56NaWcDkGVizuakg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJs_Fx6am7TeDFSG=CcTT=4KwhqrZX_jnn56NaWcDkGVizuakg@mail.gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
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
 Will Deacon <will@kernel.org>, Christoph Hellwig <hch@lst.de>,
 Emil Velikov <emil.velikov@collabora.com>,
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
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <freedreno@lists.freedesktop.org>,
 christian.koenig@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

T24gRnJpLCBBdWcgMTYsIDIwMTkgYXQgMDI6MDQ6MzVQTSAtMDcwMCwgUm9iIENsYXJrIHdyb3Rl
Ogo+IEkgZG9uJ3QgZGlzYWdyZWUgYWJvdXQgbmVlZGluZyBhbiBBUEkgdG8gZ2V0IHVuY2FjaGVk
IG1lbW9yeSAob3IKPiBpZGVhbGx5IGp1c3Qgc29tZXRoaW5nIG91dHNpZGUgb2YgdGhlIGxpbmVh
ciBtYXApLiAgQnV0IEkgdGhpbmsgdGhpcwo+IGlzIGEgc2VwYXJhdGUgcHJvYmxlbS4KPiAKPiBX
aGF0IEkgd2FzIGhvcGluZyBmb3IsIGZvciB2NS40LCBpcyBhIHdheSB0byBzdG9wIGFidXNpbmcg
ZG1hX21hcC9zeW5jCj4gZm9yIGNhY2hlIG9wcyB0byBnZXQgcmlkIG9mIHRoZSBoYWNrIEkgaGFk
IHRvIG1ha2UgZm9yIHY1LjMuICBBbmQgYWxzbwo+IHRvIGZpeCB2Z2VtIG9uIG5vbi14ODYuICAo
VW5mb3J0dW5hdGVseSBjaGFuZ2luZyB2Z2VtIHRvIHVzZWQgY2FjaGVkCj4gbWFwcGluZ3MgYnJl
YWtzIHg4NiBDSSwgYnV0IGZpeGVzIENJIG9uIGFybS9hcm02NC4uKSAgV2UgY2FuIGRvIHRoYXQK
PiB3aXRob3V0IGFueSBjaGFuZ2VzIGluIGFsbG9jYXRpb24uICBUaGVyZSBpcyBzdGlsbCB0aGUg
cG9zc2liaWxpdHkgZm9yCj4gcHJvYmxlbXMgZHVlIHRvIGNhY2hlZCBhbGlhcywgYnV0IHRoYXQg
aGFzIGJlZW4gYSBwcm9ibGVtIHRoaXMgd2hvbGUKPiB0aW1lLCBpdCBpc24ndCBzb21ldGhpbmcg
bmV3LgoKQnV0IHRoYXQganVzdCBtZWFucyB3ZSBzdGFydCBleHBvc2luZyByYW5kb20gbG93LWxl
dmVsIEFQSXMgdGhhdApwZW9wbGUgd2lsbCBxdWlja2x5IGFidXNlLi4gIEluIGZhY3QgZXZlbiB5
b3VyIHNpbXBsZSBwbGFuIHRvIHNvbWUKZXh0ZW50IGFscmVhZHkgaXMgYW4gYWJ1c2Ugb2YgdGhl
IGludGVudCBvZiB0aGVzZSBmdW5jdGlvbnMsIGFuZAppdCBhbHNvIHJlcXVpcmVzIGEgbG90IG9m
IGtub3dsZWRnZSBpbiB0aGUgZHJpdmVyIHRoYXQgaW4gdGhlIG5vcm1hbApjYXNlcyBkcml2ZXJz
IGNhbid0IGtub3cgKGUuZy4gaXMgdGhlIGRldmljZSBkbWEgY29oZXJlbnQgb3Igbm90KS4KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KRnJlZWRyZW5vIG1h
aWxpbmcgbGlzdApGcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZnJlZWRyZW5v

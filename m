Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8381A8F359
	for <lists+freedreno@lfdr.de>; Thu, 15 Aug 2019 20:27:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FC3E6EA2B;
	Thu, 15 Aug 2019 18:27:50 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A653A6EA2B;
 Thu, 15 Aug 2019 18:27:49 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id EBED568AFE; Thu, 15 Aug 2019 20:27:42 +0200 (CEST)
Date: Thu, 15 Aug 2019 20:27:42 +0200
From: Christoph Hellwig <hch@lst.de>
To: "Koenig, Christian" <Christian.Koenig@amd.com>
Message-ID: <20190815182742.GA20859@lst.de>
References: <20190814220011.26934-1-robdclark@gmail.com>
 <20190815065117.GA23761@lst.de>
 <CAJs_Fx4bS64s7+xQqsead3N80ZQpofqegFQu+tT=b3wcGd_2pA@mail.gmail.com>
 <20190815175346.GA19839@lst.de>
 <e3f73b3c-49d5-3c19-dfff-0a24b4617e50@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e3f73b3c-49d5-3c19-dfff-0a24b4617e50@amd.com>
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
 Emil Velikov <emil.velikov@collabora.com>, Rob Clark <robdclark@chromium.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Paul Burton <paul.burton@mips.com>,
 Mike Rapoport <rppt@linux.ibm.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 "moderated list:ARM64 PORT \(AARCH64 ARCHITECTURE\)"
 <linux-arm-kernel@lists.infradead.org>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 "open list:MIPS" <linux-mips@vger.kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Robin Murphy <robin.murphy@arm.com>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 "Sharma, Deepak" <Deepak.Sharma@amd.com>, Joerg Roedel <jroedel@suse.de>,
 Arnd Bergmann <arnd@arndb.de>, Anshuman Khandual <anshuman.khandual@arm.com>,
 Hauke Mehrtens <hauke@hauke-m.de>, Jesper Dangaard Brouer <brouer@redhat.com>,
 "Wolfram Sang \(Renesas\)" <wsa+renesas@sang-engineering.com>,
 "open list:LINUX FOR POWERPC \(32-BIT AND 64-BIT\)"
 <linuxppc-dev@lists.ozlabs.org>, Alexios Zavras <alexios.zavras@intel.com>,
 Russell King <rmk+kernel@armlinux.org.uk>,
 Doug Anderson <armlinux@m.disordat.com>, Thomas Gleixner <tglx@linutronix.de>,
 Sean Paul <sean@poorly.run>, Allison Randal <allison@lohutok.net>,
 Christophe Leroy <christophe.leroy@c-s.fr>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>, Enrico Weigelt <info@metux.net>,
 open list <linux-kernel@vger.kernel.org>, Rob Clark <robdclark@gmail.com>,
 Souptick Joarder <jrdr.linux@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

T24gVGh1LCBBdWcgMTUsIDIwMTkgYXQgMDY6MjE6MDBQTSArMDAwMCwgS29lbmlnLCBDaHJpc3Rp
YW4gd3JvdGU6Cj4gPiAgICgyKSBBZGQgc3VwcG9ydCBmb3IgRE1BX0FUVFJfTk9fS0VSTkVMX01B
UFBJTkcgdG8gdGhpcyBuZXcgQVBJIGluc3RlYWQKPiA+ICAgICAgIG9mIGRtYV9hbGxvY19hdHRy
cy4gIFRoZSBpbml0aWFsIGRpZmZlcmVuY2Ugd2l0aCB0aGF0IGZsYWcgaXMganVzdAo+ID4gICAg
ICAgdGhhdCB3ZSBhbGxvdyBoaWdobWVtLCBidXQgaW4gdGhlIGZ1dHVyZSB3ZSBjb3VsZCBhbHNv
IHVubWFwIHRoaXMKPiA+ICAgICAgIG1lbW9yeSBmcm9tIHRoZSBrZXJuZWwgbGluZWFyIG1hcHBp
bmcgZW50aXJlbHkgb24gYXJjaGl0ZWN0dXJlcwo+ID4gICAgICAgd2hlcmUgd2UgY2FuIGVhc2ls
eSBkbyB0aGF0Lgo+IAo+IE1obSwgd2h5IHdvdWxkIHdlIHdhbnQgdG8gZG8gdGhpcz8KClRvIGF2
b2lkIHRoZSBDUFUgbWlzc3BlY3VsYXRpbmcgaW50byB0aGlzIG1lbW9yeS4gIEZvciBleGFtcGxl
IE5WTWUgU1NEcwpoYXZlIGEgZmVhdHVyZSBjYWxsZWQgaG9zdCBtZW1vcnkgYnVmZmVyIHRoYXQg
aXMgYSBsb3QgbGlrZSB5b3VyIHN0b2xlbgptYWluIHJhbSBmb3IgdGhlIEdQVSBjYXNlLiAgV2Ug
Y3VycmVudGx5IGhhbmQgdGhlIFNTRCBhCkRNQV9BVFRSX05PX0tFUk5FTF9NQVBQSU5HIGFsbG9j
YXRpb24gaWYgaXQgcmVxdWVzdHMgc3VjaCBhIGJ1ZmZlci4gIElmCnBvc3NpYmxlIHdlJ2QgcmVh
bGx5IGxpa2UgdG8gbWFrZSBzdXJlIG5vIHNwZWN1bGF0aXZlIGV4ZWN1dGlvbiBidWcKKG9yIGlu
dGVudGlvbmFsIGF0dGFja2VyIHdpdGggYSBrZXJuZWwgZXhwbG9pdCBmb3IgdGhhdCBtYXR0ZXIp
IGNhbiBlYXNpbHkKYWNjZXNzIHRoYXQgbWVtb3J5LgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpGcmVlZHJlbm8gbWFpbGluZyBsaXN0CkZyZWVkcmVub0Bs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9mcmVlZHJlbm8=

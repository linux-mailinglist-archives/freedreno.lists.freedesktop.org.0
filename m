Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B2B48F3F5
	for <lists+freedreno@lfdr.de>; Thu, 15 Aug 2019 20:52:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C22746EA47;
	Thu, 15 Aug 2019 18:52:06 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4431D6EA47;
 Thu, 15 Aug 2019 18:52:06 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 5E18068AFE; Thu, 15 Aug 2019 20:52:00 +0200 (CEST)
Date: Thu, 15 Aug 2019 20:52:00 +0200
From: Christoph Hellwig <hch@lst.de>
To: "Koenig, Christian" <Christian.Koenig@amd.com>
Message-ID: <20190815185200.GA21407@lst.de>
References: <215e5cb7-0fcf-48db-a656-817054dde420@email.android.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <215e5cb7-0fcf-48db-a656-817054dde420@email.android.com>
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

T24gVGh1LCBBdWcgMTUsIDIwMTkgYXQgMDY6NDg6MzlQTSArMDAwMCwgS29lbmlnLCBDaHJpc3Rp
YW4gd3JvdGU6Cj4gV2VsbCwgZm9yIHRoZSBncmFwaGljcyBjYXNlIEkgYWJzb2x1dGVseSBuZWVk
IHRvIGtlZXAgdGhlIGxpbmVhciBrZXJuZWwgbWFwcGluZy4gQmVjYXVzZSBmb3IgY2VydGFpbiB1
c2UgY2FzZXMgdGhlIG1lbW9yeSBpcyBhY2Nlc3NlZCBieSB0aGUga2VybmVsIGFsbCB0aGUgdGlt
ZSBhcyB3ZWxsLgoKVGhlbiBkb24ndCBzZXQgRE1BX0FUVFJfTk9fS0VSTkVMX01BUFBJTkcuICBB
dCBsZWFzdCBmb3IgeDg2IGFuZCBhcm02NAp3ZSBzaG91bGQgYmUgYWJsZSB0byBzdXBwb3J0IHVu
Y2FjaGVkIGFsbG9jYXRpb25zIGVhc2lseSBldmVuIHdpdGhvdXQKdGhhdCwgYW5kIEkgcGxhbiB0
byBzdXBwb3J0IHRoYXQgZm9yIHlvdXIgdXNlIGNhc2UuICBCdXQgaWYgdGhlIGRyaXZlcgppcyBl
eHBsaWNpdGx5IHNheWluZyBpdCBkb2Vzbid0IHdhbnQgYSBwZXJtYW5lbnQga2VybmVsIG1hcHBp
bmcgaXQgbWFrZXMKc2Vuc2UgdG8gKG9wdGlvbmFsbHkgaWYgdGhlIGFyY2hpdGVjdHVyZSBjYW4g
ZWFzaWx5IGRvIGl0KSB1bm1hcCB0aGUKbWVtb3J5IGZyb20gdGhlIGtlcm5lbCBsaW5lYXIgbWFw
cGluZy4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KRnJl
ZWRyZW5vIG1haWxpbmcgbGlzdApGcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZnJlZWRyZW5v

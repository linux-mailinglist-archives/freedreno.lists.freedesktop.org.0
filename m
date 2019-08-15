Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BCD78E505
	for <lists+freedreno@lfdr.de>; Thu, 15 Aug 2019 08:51:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF08B6E8A6;
	Thu, 15 Aug 2019 06:51:25 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F5A16E8A6;
 Thu, 15 Aug 2019 06:51:24 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id CCA2068B02; Thu, 15 Aug 2019 08:51:17 +0200 (CEST)
Date: Thu, 15 Aug 2019 08:51:17 +0200
From: Christoph Hellwig <hch@lst.de>
To: Rob Clark <robdclark@gmail.com>
Message-ID: <20190815065117.GA23761@lst.de>
References: <20190814220011.26934-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190814220011.26934-1-robdclark@gmail.com>
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
 dri-devel@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Will Deacon <will@kernel.org>, Christoph Hellwig <hch@lst.de>,
 Emil Velikov <emil.velikov@collabora.com>, Rob Clark <robdclark@chromium.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Mike Rapoport <rppt@linux.ibm.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 "moderated list:ARM64 PORT \(AARCH64 ARCHITECTURE\)"
 <linux-arm-kernel@lists.infradead.org>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 "open list:MIPS" <linux-mips@vger.kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Robin Murphy <robin.murphy@arm.com>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Deepak Sharma <deepak.sharma@amd.com>, Joerg Roedel <jroedel@suse.de>,
 Arnd Bergmann <arnd@arndb.de>, Anshuman Khandual <anshuman.khandual@arm.com>,
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
 open list <linux-kernel@vger.kernel.org>, Paul Burton <paul.burton@mips.com>,
 Souptick Joarder <jrdr.linux@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

QXMgc2FpZCBiZWZvcmUgSSBkb24ndCB0aGluayB0aGVzZSBsb3ctbGV2ZWwgaGVscGVycyBhcmUg
dGhlCnJpZ2h0IEFQSSB0byBleHBvcnQsIGJ1dCBldmVuIGlmIHRoZXkgZGlkIHlvdSdkIGp1c3Qg
Y292ZXIgYSB0aW55CnN1YnNldCBvZiB0aGUgYXJjaGl0ZWN0dXJlcy4KCkFsc28gdG8gZGlzdGls
IHRoZSBwcmV2aW91cyB0aHJlYWQgLSBpZiB5b3UgcmVtYXAgbWVtb3J5IHRvIHVuY2FjaGVkCnRo
ZSBoZWxwZXIgdG8gdXNlIGlzIGFyY2hfZG1hX3ByZXBfY29oZXJlbnQsIHdoaWNoIGRvZXMgYSB3
cml0ZWJhY2srCmludmFsaWRhdGUgZXZlcnl3aGVyZSwgYW5kIHRoZXJlIGlzIG5vIG5lZWQgdG8g
Y2xlYW4gdXAgYWZ0ZXIgYQpsb25nLXRlcm0gdW5jYWNoZWQgbWFwcGluZy4gIFdlIG1pZ2h0IHN0
aWxsIGdldCBzcGVjdWxhdGlvbnMgaW50bwp0aGF0IGFyZWEsIGlmIHdlIGRvbid0IHJlbWFwIHRo
ZSBkaXJlY3QgbWFwcGluZywgYnV0IGl0IGlzbid0IGxpa2UKaW52YWxpZHRpbmcgdGhhdCBqdXN0
IGJlZm9yZSBmcmVlaW5nIHRoZSBtZW1vcnkgaXMgZ29pbmcgdG8gaGVscAphbnlvbmUuCgpBbHNv
IGl0IHNlZW1zIGxpa2UgcGF0Y2hlcyA1IGFuZCA2IGFyZSBtaXNzaW5nIGluIG15IGluYm94Lgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpGcmVlZHJlbm8g
bWFpbGluZyBsaXN0CkZyZWVkcmVub0BsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9mcmVlZHJlbm8=

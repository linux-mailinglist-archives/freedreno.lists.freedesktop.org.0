Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DF808F298
	for <lists+freedreno@lfdr.de>; Thu, 15 Aug 2019 19:53:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3DF86EA11;
	Thu, 15 Aug 2019 17:53:54 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C21DD6EA11;
 Thu, 15 Aug 2019 17:53:53 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id E3BED68AFE; Thu, 15 Aug 2019 19:53:46 +0200 (CEST)
Date: Thu, 15 Aug 2019 19:53:46 +0200
From: Christoph Hellwig <hch@lst.de>
To: Rob Clark <robdclark@chromium.org>
Message-ID: <20190815175346.GA19839@lst.de>
References: <20190814220011.26934-1-robdclark@gmail.com>
 <20190815065117.GA23761@lst.de>
 <CAJs_Fx4bS64s7+xQqsead3N80ZQpofqegFQu+tT=b3wcGd_2pA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJs_Fx4bS64s7+xQqsead3N80ZQpofqegFQu+tT=b3wcGd_2pA@mail.gmail.com>
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

T24gVGh1LCBBdWcgMTUsIDIwMTkgYXQgMDY6NTQ6MzlBTSAtMDcwMCwgUm9iIENsYXJrIHdyb3Rl
Ogo+IE9uIFdlZCwgQXVnIDE0LCAyMDE5IGF0IDExOjUxIFBNIENocmlzdG9waCBIZWxsd2lnIDxo
Y2hAbHN0LmRlPiB3cm90ZToKPiA+Cj4gPiBBcyBzYWlkIGJlZm9yZSBJIGRvbid0IHRoaW5rIHRo
ZXNlIGxvdy1sZXZlbCBoZWxwZXJzIGFyZSB0aGUKPiA+IHJpZ2h0IEFQSSB0byBleHBvcnQsIGJ1
dCBldmVuIGlmIHRoZXkgZGlkIHlvdSdkIGp1c3QgY292ZXIgYSB0aW55Cj4gPiBzdWJzZXQgb2Yg
dGhlIGFyY2hpdGVjdHVyZXMuCj4gCj4gQXJlIHlvdSB0aGlua2luZyBpbnN0ZWFkIHNvbWV0aGlu
ZyBsaWtlOgo+IAo+IHZvaWQgZG1hX3N5bmNfc2dfZm9yX3tjcHUsZGV2aWNlfShzdHJ1Y3QgZGV2
aWNlICpkZXYsIHN0cnVjdCBzY2F0dGVybGlzdCAqc2dsLAo+ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBpbnQgbmVudHMsIGVudW0gZG1hX2RhdGFfZGlyZWN0aW9uIGRpcikKPiB7
Cj4gICAgIGZvcl9lYWNoX3NnKHNnbCwgc2csIG5lbnRzLCBpKSB7Cj4gICAgICAgICBhcmNoX3N5
bmNfZG1hX2Zvcl8uLihkZXYsIHNnX3BoeXMoc2cpLCBzZy0+bGVuZ3RoLCBkaXIpOwo+ICAgICB9
Cj4gfQo+IEVYUE9SVF9TWU1CT0xfR1BMKGRtYV9zeW5jX3NnX2Zvcl8uLikKPiAKPiBvciBkaWQg
eW91IGhhdmUgc29tZXRoaW5nIGVsc2UgaW4gbWluZD8KCk5vLiAgV2UgcmVhbGx5IG5lZWQgYW4g
aW50ZXJmYWNlIHRoYXkgc2F5cyBwbGVhc2UgZ2l2ZSBtZSB1bmNhY2hlZAptZW1vcnkgKGZvciBz
b21lIGRlZmluaXRpb24gb2YgdW5jYWNoZWQgdGhhdCBpbmNsdWRlcyB0aGF0IGdyYXBpY3MKZHJp
dmVycyBjYWxsIHdyaXRlIGNvbWJpbmUpLCBhbmQgdGhlbiBsZXQgdGhlIGFyY2hpdGVjdHVyZSBk
byB0aGUgcmlnaHQKdGhpbmcuICBCYXNpY2FsbHkgZG1hX2FsbG9jX2NvaGVyZW50IHdpdGggRE1B
X0FUVFJfTk9fS0VSTkVMX01BUFBJTkcKaXMgc3VwZXJmaWNpYWxseSBjbG9zZSB0byB3aGF0IHlv
dSB3YW50LCBleGNlcHQgdGhhdCB0aGUgd2F5IHRoZSBkcm0KZHJpdmVycyB3b3JrIHlvdSBjYW4n
dCBhY3R1YWxseSB1c2UgaXQuCgpUaGUgcmVhc29uIGZvciB0aGF0IGlzIGlmIHdlIGNhbiB3ZSBy
ZWFsbHkgbmVlZCB0byBub3QgY3JlYXRlIGFub3RoZXIKdW5jYWNoYWJsZSBhbGlhcywgYnV0IGlu
c3RlYWQgY2hhbmdlIHRoZSBwYWdlIGF0dHJpYnV0ZXMgaW4gcGxhY2UuCk9uIHg4NiB3ZSBjYW4g
YW5kIG11c3QgZG8gdGhhdCBmb3IgZXhhbXBsZSwgYW5kIGJhc2VkIG9uIHRoZQpjb252ZXJzYXRp
b24gd2l0aCBXaWxsIGFybTY0IGNvdWxkIGRvIHRoYXQgZmFpcmx5IGVhc2lseS4gIGFybTMyIGNh
bgpyaWdodCBub3cgb25seSBkbyB0aGF0IGZvciBDTUEsIHRob3VnaC4KClRoZSBiaWcgcXVlc3Rp
b24gaXMgd2hhdCBBUEkgZG8gd2Ugd2FudC4gIEkgaGFkIGEgcHJldHR5IHNpbWlsYXIKZGlzY3Vz
c2lvbiB3aXRoIENocmlzdGlhbiBvbiBkb2luZyBzdWNoIGFuIGFsbG9jYXRpb24gZm9yIGFtZGdw
dSwKd2hlcmUgdGhlIGRldmljZSBub3JtYWxseSBpcyBjYWNoZSBjb2hlcmVudCwgYnV0IHRoZXkg
YWN0dWFsbHkgd2FudAp0byB0dXJuIGl0IGludG8gbm9uLWNvaGVyZW50IGJ5IHVzaW5nIFBDSWUg
dW5zbm9vcGVkIHRyYW5zYWN0aW9ucy4KCkhlcmUgaXMgbXkgaGlnaCBsZXZlbCBwbGFuLCB3aGlj
aCBzdGlsbCBoYXMgYSBmZXcgbG9zZSBlbmQ6CgogKDEpIHByb3ZpZGUgYSBuZXcgQVBJOgoKCXN0
cnVjdCBwYWdlICpkbWFfYWxsb2NfcGFnZXMoc3RydWN0IGRldmljZSAqZGV2LCB1bnNpZ25lZCBu
cl9wYWdlcywKCQkJZ2ZwX3QgZ2ZwLCB1bnNpZ25lZCBsb25nIGZsYWdzKTsKCXZvaWQgZG1hX2Zy
ZWVfcGFnZXMoc3RydWN0IGRldmljZSAqZGV2LCB1bnNpZ25lZCBucl9wYWdlcywKCQkJdW5zaWdu
ZWQgbG9uZyBmbGFncyk7CgogICAgIFRoZXNlIGdpdmUgeW91IGJhY2sgcGFnZSBiYWNrZWQgbWVt
b3J5IHRoYXQgaXMgZ3VhcmFudGVlZCB0byBiZQogICAgIGFkZHJlc3NhYmxlIGJ5IHRoZSBkZXZp
Y2UgKG5vIHN3aW90bGIgb3Igc2ltaWxhcikuICBUaGUgbWVtb3J5IGNhbgogICAgIHRoZW4gYmUg
bWFwcGVkIHVzaW5nIGRtYV9tYXAqLCBpbmNsdWRpbmcgdW5tYXAgYW5kIGRtYV9zeW5jIHRvCiAg
ICAgYm91bmNlIG93bmVyc2hpcCBhcm91bmQuICBUaGlzIGlzIHRoZSByZXBsYWNlbWVudCBmb3Ig
dGhlIGN1cnJlbnQKICAgICBkbWFfYWxsb2NfYXR0cnMgd2l0aCBETUFfQVRUUl9OT05fQ09OU0lT
VEVOVCBBUEksIHRoYXQgaXMgcmF0aGVyCiAgICAgYmFkbHkgZGVmaW5lZC4KCiAoMikgQWRkIHN1
cHBvcnQgZm9yIERNQV9BVFRSX05PX0tFUk5FTF9NQVBQSU5HIHRvIHRoaXMgbmV3IEFQSSBpbnN0
ZWFkCiAgICAgb2YgZG1hX2FsbG9jX2F0dHJzLiAgVGhlIGluaXRpYWwgZGlmZmVyZW5jZSB3aXRo
IHRoYXQgZmxhZyBpcyBqdXN0CiAgICAgdGhhdCB3ZSBhbGxvdyBoaWdobWVtLCBidXQgaW4gdGhl
IGZ1dHVyZSB3ZSBjb3VsZCBhbHNvIHVubWFwIHRoaXMKICAgICBtZW1vcnkgZnJvbSB0aGUga2Vy
bmVsIGxpbmVhciBtYXBwaW5nIGVudGlyZWx5IG9uIGFyY2hpdGVjdHVyZXMKICAgICB3aGVyZSB3
ZSBjYW4gZWFzaWx5IGRvIHRoYXQuCgogKDMpIEFkZCBhIGRtYV9wYWdlc19tYXAvZG1hX3BhZ2Vz
X3VubWFwIG9yIHNpbWlsYXIgQVBJIHRoYXQgYWxsb3dzIHlvdQogICAgIHRvIGdldCBhIGtlcm5l
bCBtYXBwaW5nIGZvciBwYXJ0cyBvciBhbGwgb2YgYQogICAgIERNQV9BVFRSX05PX0tFUk5FTF9N
QVBQSU5HIGFsbG9jYXRpb24uICBUaGlzIGlzIHRvIHJlcGxhY2UgdGhpbmdzCiAgICAgbGlrZSB5
b3VyIG9wZW4tY29kZWQgdm1hcCBpbiBtc20gKG9yIHNpbWlsYXJseSBlbHNld2hlcmUgaW4gZG1h
LWJ1ZgogICAgIHByb3ZpZGVycykuCgogKDQpIEFkZCBzdXBwb3J0IGZvciBhIERNQV9BVFRSX1VO
Q0FDSEFCTEUgZmxhZ3MgKG9yIHNpbWlsYXIpIHRvIHRoZSBuZXcKICAgICBBUEksIHRoYXQgbWFw
cyB0aGUgcGFnZXMgYXMgdW5jYWNoYWJsZSBpZmYgdGhleSBoYXZlIGEga2VybmVsCiAgICAgbWFw
cGluZywgaW5jbHVkaW5nIGludmFsaWRhdGluZyB0aGUgY2FjaGVzIGF0IHRpbWUgb2YgdGhpcyBw
YWdlCiAgICAgYXR0cmlidXRlIGNoYW5nZSAob3IgY3JlYXRpb24gb2YgYSBuZXcgbWFwcGluZyku
ICBUaGlzIEFQSSB3aWxsIGZhaWwKICAgICBpZiB0aGUgYXJjaGl0ZWN0dXJlIGRvZXMgbm90IGFs
bG93IGluLXBsYWNlIHJlbWFwcGluZy4gIE5vdGUgdGhhdCBmb3IKICAgICBhcm0zMiB3ZSBjb3Vs
ZCBhbHdheXMgZGlwIGludG8gdGhlIENNQSBwb29sIGlmIG9uZSBpcyBwcmVzZW50IHRvIG5vdAog
ICAgIGZhaWwuICBXZSdsbCBhbHNvIG5lZWQgc29tZSBoZWxwZXIgdG8gbWFwIGZyb20gdGhlIERN
QV9BVFRSXyogZmxhZ3MKICAgICB0byBhIHBncHJvdCBmb3IgbWFwcGluZyB0aGUgcGFnZSB0byB1
c2Vyc3BhY2UuICBUaGVyZSBpcyBhbHNvIGEgZmV3CiAgICAgb3RoZXIgd2VpcmQgYml0cyBoZXJl
LCBlLmcuIG9uIGFyY2hpdGVjdHVyZXMgbGlrZSBtaXBzIHRoYXQgdXNlIGFuCiAgICAgdW5jYWNo
ZWQgc2VnbWVudCB3ZSdsbCBoYXZlIHRvIGZhaWwgdXNlIHdpdGggdGhlIHBsYWluCiAgICAgRE1B
X0FUVFJfVU5DQUNIQUJMRSBmbGFnLCBidXQgaXQgY291bGQgYmUgc3VwcG9ydGVkIHdpdGgKICAg
ICBETUFfQVRUUl9VTkNBQ0hBQkxFIHwgRE1BX0FUVFJfTk9fS0VSTkVMX01BUFBJTkcuCgpJIHdh
cyBob3BpbmcgdG8gZ2V0IG1vc3Qgb2YgdGhpcyBkb25lIGZvciB0aGlzIG1lcmdlIHdpbmRvdywg
YnV0IEknbQpwcm9iYWJseSBsdWNreSBpZiBJIGdldCBhdCBsZWFzdCBwYXJ0cyBkb25lLiAgVG9v
IG11Y2ggZGlzdHJhY3Rpb24uCgo+IEhtbSwgbm90IGVudGlyZWx5IHN1cmUgd2h5Li4geW91IHNo
b3VsZCBiZSBvbiB0aGUgY2MgbGlzdCBmb3IgZWFjaAo+IGluZGl2aWR1YWwgcGF0Y2guCgpUaGV5
IGZpbmFsbHkgbWFkZSBpdCwgYWx0aG91Z2ggZXZlbiB3aXRoIHRoZSBkZWxheSB0aGV5IG9ubHkg
ZW5kZWQgdXAKaW4gdGhlIHNwYW0gbWFpbGJveC4gIEkgc3RpbGwgY2FuJ3Qgc2VlIHRoZW0gb24g
dGhlIHZhcmlvdXMgbWFpbGluZwpsaXN0cy4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KRnJlZWRyZW5vIG1haWxpbmcgbGlzdApGcmVlZHJlbm9AbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZnJlZWRyZW5v

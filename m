Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4560318C87
	for <lists+freedreno@lfdr.de>; Thu,  9 May 2019 16:59:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F23DD8929F;
	Thu,  9 May 2019 14:58:58 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C20428929F
 for <freedreno@lists.freedesktop.org>; Thu,  9 May 2019 14:58:57 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id z26so1464210pfg.6
 for <freedreno@lists.freedesktop.org>; Thu, 09 May 2019 07:58:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=O2GVNaaLG3l4A7SJYHvhzrnNiIlglRkSlpfGLRzuylM=;
 b=CZSbh2/wur8vKk11GpNBs79t33UjKJJ5eRbsqx1pwdh8igpdIHa7EL4eVQytclR06E
 fTkUFT5RZjdAsPm3qwvoiCqoYgwJ7dChjoH+rHIryTyB1f+mJW1HuD50tw9LAdoZiiXV
 wAdNYt6eYRJ9jaJ/jMdy62sxNt+tMuO0OH8uzoOYwAre8K2xJ7WK0f/TzNUiT5g+FkAp
 qPuW4hvak7T6xWG+UhnFRfsQ07IU+zKxfiz/vlMhO4ylZNCJgVl4agEhsdyq1YQJ1A22
 jsvDgHjGiOzr12OOEz/bHPD/ByMpXDFaL2XFsXqf5lNszUZReMbVaFXt1sMKnk8NmOl/
 rgSw==
X-Gm-Message-State: APjAAAXUBuRnHYy8kACfJEglDIVNU9jcoO0hjuQu/m8m5HYUOtOgIGM3
 xrDpezILCtwgypFqv4yJ6ueU3A==
X-Google-Smtp-Source: APXvYqzB08jbRTCZn/COGHwU59Jhcv8+bRZwlqaOwdUaHe25RZJvtDJY+ALgBmzW3A/k0UdMggom9w==
X-Received: by 2002:a62:1b8a:: with SMTP id b132mr5780183pfb.19.1557413936856; 
 Thu, 09 May 2019 07:58:56 -0700 (PDT)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net.
 [104.188.17.28])
 by smtp.gmail.com with ESMTPSA id g10sm6438908pfg.153.2019.05.09.07.58.55
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 09 May 2019 07:58:55 -0700 (PDT)
Date: Thu, 9 May 2019 07:59:12 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Brian Masney <masneyb@onstation.org>
Message-ID: <20190509145912.GG2085@tuxbook-pro>
References: <20190505130413.32253-1-masneyb@onstation.org>
 <20190505130413.32253-5-masneyb@onstation.org>
 <20190507063902.GA2085@tuxbook-pro>
 <20190509021616.GA26228@basecamp>
 <CAF6AEGsM382jB=h7oM3frhZ5fAp+qYUdgiiKSKo1RtR8+ffjrg@mail.gmail.com>
 <20190509030047.GE2085@tuxbook-pro>
 <20190509071243.GA27143@basecamp>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190509071243.GA27143@basecamp>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=O2GVNaaLG3l4A7SJYHvhzrnNiIlglRkSlpfGLRzuylM=;
 b=owM2FhNdQD3/AZ1QZczHAcumqaO62cKOzbcn0wo0srjYi0aJmUbBO5bCn3V5VdxSW0
 74bIGkNFPqUHT5SLQKJGibcflH3UxMzbGuy/ZLbtw3AWBpjuTmllygACfswKRryWDjEE
 7FcJwiuwkwdH1xJVyPDY4c7MOjCMsvjM4VqFrUofJd5m4BugNQLB0TGzkcZTS0NxFG5W
 gUx85r8q9Gaagdgm41Zl2bDJt0YcjeOL130nHdSgAww8zP5BX5jpgAA4uU9e3Gm3G3zz
 eozMavbAcKt3BHMsIdWIzk9olc+36VygZOIVr2T4PcDWEbeEIGlQGCM9CfctVEo1LPIp
 Y8Cw==
Subject: Re: [Freedreno] [PATCH RFC 4/6] ARM: dts: msm8974: add display
 support
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
Cc: Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Rob Clark <robdclark@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

T24gVGh1IDA5IE1heSAwMDoxMiBQRFQgMjAxOSwgQnJpYW4gTWFzbmV5IHdyb3RlOgoKPiBPbiBX
ZWQsIE1heSAwOCwgMjAxOSBhdCAwODowMDo0N1BNIC0wNzAwLCBCam9ybiBBbmRlcnNzb24gd3Jv
dGU6Cj4gPiBPbiBXZWQgMDggTWF5IDE5OjI1IFBEVCAyMDE5LCBSb2IgQ2xhcmsgd3JvdGU6Cj4g
PiAKPiA+ID4gT24gV2VkLCBNYXkgOCwgMjAxOSBhdCA3OjE2IFBNIEJyaWFuIE1hc25leSA8bWFz
bmV5YkBvbnN0YXRpb24ub3JnPiB3cm90ZToKPiA+ID4gPgo+ID4gPiA+IE9uIE1vbiwgTWF5IDA2
LCAyMDE5IGF0IDExOjM5OjAyUE0gLTA3MDAsIEJqb3JuIEFuZGVyc3NvbiB3cm90ZToKPiA+ID4g
PiA+IE9uIFN1biAwNSBNYXkgMDY6MDQgUERUIDIwMTksIEJyaWFuIE1hc25leSB3cm90ZToKPiA+
ID4gPiA+ID4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2Jvb3QvZHRzL3Fjb20tbXNtODk3NC5kdHNp
IGIvYXJjaC9hcm0vYm9vdC9kdHMvcWNvbS1tc204OTc0LmR0c2kKPiA+ID4gPiA+IFsuLl0KPiA+
ID4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgIGNsb2NrcyA9IDwmbW1jYyBNRFNT
X01EUF9DTEs+LAo+ID4gPiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgPCZtbWNjIE1EU1NfQUhCX0NMSz4sCj4gPiA+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICA8Jm1tY2MgTURTU19BWElfQ0xLPiwKPiA+ID4gPiA+ID4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDwmbW1jYyBNRFNTX0JZVEUwX0NMSz4sCj4g
PiA+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8Jm1tY2MgTURT
U19QQ0xLMF9DTEs+LAo+ID4gPiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgPCZtbWNjIE1EU1NfRVNDMF9DTEs+LAo+ID4gPiA+ID4gPiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgPCZtbWNjIE1NU1NfTUlTQ19BSEJfQ0xLPjsKPiA+ID4gPiA+
ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgIGNsb2NrLW5hbWVzID0gIm1kcF9jb3JlIiwK
PiA+ID4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgImlm
YWNlIiwKPiA+ID4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgImJ1cyIsCj4gPiA+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICJieXRlIiwKPiA+ID4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgInBpeGVsIiwKPiA+ID4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgImNvcmUiLAo+ID4gPiA+ID4gPiArICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAiY29yZV9tbXNzIjsKPiA+ID4gPiA+Cj4gPiA+ID4gPiBV
bmxlc3MgSSBlbmFibGUgTU1TU19NTVNTTk9DX0FYSV9DTEsgYW5kIE1NU1NfUzBfQVhJX0NMSyBJ
IGdldCBzb21lCj4gPiA+ID4gPiB1bmRlcnJ1biBlcnJvciBmcm9tIERTSS4gWW91IGRvbid0IHNl
ZSBhbnl0aGluZyBsaWtlIHRoaXM/Cj4gPiA+ID4gPgo+ID4gPiA+ID4gKFRoZXNlIGNsb2NrcyBh
cmUgY29udHJvbGxlZCBieSBtc21fYnVzIGRvd25zdHJlYW0gYW5kIHNob3VsZCBiZSBkcml2ZW4K
PiA+ID4gPiA+IGJ5IGludGVyY29ubmVjdCB1cHN0cmVhbSkKPiA+ID4gPiA+Cj4gPiA+ID4gPgo+
ID4gPiA+ID4gQXBhcnQgZnJvbSB0aGlzLCBJIHRoaW5rIHRoaXMgbG9va3MgbmljZS4gSGFwcHkg
dG8gc2VlIHRoZSBwcm9ncmVzcy4KPiA+ID4gPgo+ID4gPiA+IE5vLCBJJ20gbm90IHNlZWluZyBh
biB1bmRlcnJ1biBlcnJvcnMgZnJvbSB0aGUgRFNJLiBJIHRoaW5rIHRoZSBjbG9ja3MKPiA+ID4g
PiBhcmUgZmluZSBzaW5jZSBJJ20gYWJsZSB0byBnZXQgdGhpcyB3b3JraW5nIHdpdGggNC4xNyB1
c2luZyB0aGVzZSBzYW1lCj4gPiA+ID4gY2xvY2tzLiBJIGp1c3Qgc2VudCBvdXQgdjIgYW5kIHRo
ZSBjb3ZlciBsZXR0ZXIgaGFzIHNvbWUgZGV0YWlscywgYWxvbmcKPiA+ID4gPiB3aXRoIHRoZSBm
dWxsIGRtZXNnLgo+ID4gPiAKPiA+ID4gc2luY2Ugd2UgZG9uJ3QgaGF2ZSBpbnRlcmNvbm5lY3Qg
ZHJpdmVyIGZvciA4OTc0LCBJIGd1ZXNzIHRoZXJlIGlzCj4gPiA+IHNvbWUgY2hhbmNlIHRoYXQg
dGhpbmdzIHdvcmsgb3Igbm90IGJhc2VkIG9uIGhvdyBsayBsZWF2ZXMgdGhpbmdzPwo+ID4gPiAK
PiA+IAo+ID4gUmlnaHQsIEkgZ3Vlc3MgdGhlIGJvb3Rsb2FkZXIgb24gbXkgZGV2aWNlIGRvZXMg
bm90IGxlYXZlIHRoZSBidXNzZXMKPiA+IHRpY2tpbmcgLSBwZXJoYXBzIHRoZXJlJ3MgYSBib290
IHNwbGFzaCBpbnZvbHZlZCBvbiBCcmlhbidzIGRldmljZT8KPiA+IAo+ID4gUmVnYXJkbGVzcywg
dGhpcyB3b3JrcyBvbiBOZXh1cyA1IGFuZCBhbGxvd3MgQnJpYW4gdG8gbWFrZSBmdXJ0aGVyCj4g
PiBwcm9ncmVzcyBzbyBJJ20gYWxsIGZvciBtZXJnaW5nIGl0Lgo+IAo+IFRoZXJlIGlzIGEgYm9v
dCBzcGxhc2ggb24gdGhlIE5leHVzIDUgYW5kIHRoYXQgbWF5IGV4cGxhaW4gYSBiZWhhdmlvcgo+
IHRoYXQgSSBvYnNlcnZlZC4gSSBhdHRlbXB0ZWQgdG8gYWRkIHJlc2V0IEdQSU8gc3VwcG9ydCB0
byB0aGUgc2ltcGxlCj4gcGFuZWwgZHJpdmVyIGFuZCB0aGUgc2NyZWVuIHdpbGwgY2xlYXIgYnV0
IG5vdGhpbmcgd2lsbCBjb21lIG9uIHRoZQo+IHNjcmVlbiBhZnRlciBhIGhhcmQgcmVzZXQsIGV2
ZW4gb24gNC4xNy4gVG8gYmUgc3VyZSwgSSBnb3QgdGhlIHRpbWluZwo+IGluZm9ybWF0aW9uIGZv
ciBob3cgbG9uZyB0byBsZWF2ZSB0aGUgR1BJTyBoaWdoIGFuZCBsb3cgZnJvbSB0aGUKPiBkb3du
c3RyZWFtIE1TTSAzLjQgc291cmNlcy4gVGhhdCdzIHdoZW4gSSBoYWQgYSBzY3JpcHQgcG9ydCBh
bGwgb2YgdGhlCj4gfjQwMCBwYW5lbCBvbiBjb21tYW5kcyBpbiB0aGUgZG93bnN0cmVhbSBkZXZp
Y2UgdHJlZSB0byBhIG5ldyBwYW5lbAo+IGRyaXZlci4KPiAKPiBXaXRoIHRoZSBsYXRlc3Qga2Vy
bmVsIGtlcm5lbCBoYXZpbmcgYSBkZWxheSBzaG93aW5nIHRoZSBjb25zb2xlIHRleHQsCj4gSSBv
YnNlcnZlIGEgYnJpZWYgc2Vjb25kIHdoZXJlIHRoZSBib290IHNwbGFzaCBpcyBzaG93biBhbG9u
ZyB3aXRoIHRoZQo+IHN0YXJ0dXAgdGV4dCBmcm9tIExpbnV4LiBBIGZ1bGwgcmVmcmVzaCBpcyBw
ZXJmb3JtZWQgYW5kIHRoZSBib290Cj4gc3BsYXNoIGdvZXMgYXdheS4gSSBkb24ndCBzZWUgdGhp
cyB3aXRoIHRoZSA0LjE3IGtlcm5lbDsgcGVyaGFwcyBtYXliZQo+IHRoZSBmdWxsIHJlZnJlc2gg
b2NjdXJzIHF1aWNrIGVub3VnaCB0aGF0IGl0cyBub3Qgbm90aWNlYWJsZS4KPiAKPiBDYW4geW91
IHBvaW50IG1lIHRvIHdoZXJlIHRoZSBpbnRlcmNvbm5lY3QgQVBJIGlzIGluIHRoZSBkb3duc3Ry
ZWFtCj4gTVNNIDMuNCBzb3VyY2VzPyBodHRwczovL2dpdGh1Yi5jb20vQUlDUC9rZXJuZWxfbGdl
X2hhbW1lcmhlYWQKPiBJdCBsb29rcyBsaWtlIGl0cyBpbiBkcml2ZXJzL2ludGVyY29ubmVjdC8g
aW4gdGhlIHVwc3RyZWFtIHNvdXJjZXMuCj4gCgpUaGUgZGF0YSB3aWxsIGJlIDg5NzQgc3BlY2lm
aWMsIGJ1dCB0aGUgcGx1bWJpbmcgc2hvdWxkIGJlIHJldXNhYmxlIGZyb20KODkxNiBvciA0MDQu
IEhvcGVmdWxseSB3ZSBjYW4gZ2V0IHRob3NlIGxhbmRlZCBzaG9ydGx5LgoKWW91IGNhbiBmaW5k
IHRoZSBsYXRlc3QgaW5jYXJuYXRpb24gaGVyZToKaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGtt
bC8yMDE5MDQxNTEwNDM1Ny41MzA1LTEtZ2VvcmdpLmRqYWtvdkBsaW5hcm8ub3JnLwoKUmVnYXJk
cywKQmpvcm4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
RnJlZWRyZW5vIG1haWxpbmcgbGlzdApGcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZnJlZWRyZW5v

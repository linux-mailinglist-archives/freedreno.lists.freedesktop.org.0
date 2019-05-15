Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B297A1FCCE
	for <lists+freedreno@lfdr.de>; Thu, 16 May 2019 01:50:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54E18891B8;
	Wed, 15 May 2019 23:50:53 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49015891B9
 for <freedreno@lists.freedesktop.org>; Wed, 15 May 2019 23:50:52 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id z16so566274pgv.11
 for <freedreno@lists.freedesktop.org>; Wed, 15 May 2019 16:50:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=+Ov6B2ldvLlkcsttAAHJpxxV6SegJmYe7r9olqOW9uE=;
 b=gg1LrfGRm1AFpnNEtr5Xca4Va50MXFDNWt0nbIDLIdvrGuWl1hWwnDBur5aQS92dk7
 sTF0Ksg6fimCaKbxv4zzgXtZaUTBDhnBJIDo3A6Qr4BHkaJ8JqPYOxIEcbmVvdVvADbt
 EW2ubhDcCcsSABWmg0cnBgP+fBGSqTpThNhh/oYKOxJZ0Lfjteq/nQtzY6ocbLZFEjRS
 TEAwUYt7yUEcCtvJ3ktdwB6nVM/ylDvMGgVqN33rZodVTPh4GDELWdrfgZUWNHA8rO07
 NNAnCS9tUQQLURNzM5TPEPv05vmjMkADGssoYryd5rgtn587Is1gzszQ3LTqd0eC1+wN
 5kqA==
X-Gm-Message-State: APjAAAUsABR4sTdjVXskxMpNO7whQL0/3c1pFuimmEjX6mgI8kUSg2L1
 Gna04HDtDh+pxytsno/qA0sOJA==
X-Google-Smtp-Source: APXvYqydZnB9tStsLQJ4no73yXQFM3MTO1wqIbjphUc3nshRpLhRc0U4N88NNldcW7XdlEsyWlXPPw==
X-Received: by 2002:a63:6b41:: with SMTP id g62mr35474675pgc.240.1557964251817; 
 Wed, 15 May 2019 16:50:51 -0700 (PDT)
Received: from minitux (104-188-17-28.lightspeed.sndgca.sbcglobal.net.
 [104.188.17.28])
 by smtp.gmail.com with ESMTPSA id k192sm2720606pga.20.2019.05.15.16.50.50
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 15 May 2019 16:50:50 -0700 (PDT)
Date: Wed, 15 May 2019 16:50:48 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Sean Paul <sean@poorly.run>
Message-ID: <20190515235048.GQ31438@minitux>
References: <20190515170104.155525-1-sean@poorly.run>
 <20190515193904.GE24137@jcrouse1-lnx.qualcomm.com>
 <CAMavQKKxUDX-tOLULDfZxcizysWOr63VvBBT8fNa-VB=v8jvVQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMavQKKxUDX-tOLULDfZxcizysWOr63VvBBT8fNa-VB=v8jvVQ@mail.gmail.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=+Ov6B2ldvLlkcsttAAHJpxxV6SegJmYe7r9olqOW9uE=;
 b=QpKkk5YXMS7CBlSl1vIdfsyFyOOwYp6MUCnZuGZMKCqgD1gLjpqZoq709C+GrmfzXA
 ki8k2UucVYn4rEa/CG6plpGX1zTFi9ghB2mQbZj49JC2mmBpU8clIx3VN2aX/7xRX9Ev
 vJeX5vfZiZm5aPnSOihYJkhQZEXNXeSnx6t/OlmHE/A0zsOILHxe55lpBgdfj5BnburA
 TfBMmTibCYq7OVnk0dg3G/KFfnamTjJDeB3huHCLmrI3CwEiG+CHiLS8OTepWRF/lfAe
 YVzWllKrXSeBaipbAGWw+Vol7aeLai33yNgVFGdGyKgn1v41R2ZFZ3n1T7cEPV05Fti1
 v/2g==
Subject: Re: [Freedreno] [PATCH] drm/msm: Upgrade gxpd checks to
 IS_ERR_OR_NULL
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
Cc: Rob Clark <robdclark@chromium.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <seanpaul@chromium.org>, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

T24gV2VkIDE1IE1heSAxMzowNyBQRFQgMjAxOSwgU2VhbiBQYXVsIHdyb3RlOgoKPiBPbiBXZWQs
IE1heSAxNSwgMjAxOSBhdCAzOjM5IFBNIEpvcmRhbiBDcm91c2UgPGpjcm91c2VAY29kZWF1cm9y
YS5vcmc+IHdyb3RlOgo+ID4KPiA+IE9uIFdlZCwgTWF5IDE1LCAyMDE5IGF0IDAxOjAwOjUyUE0g
LTA0MDAsIFNlYW4gUGF1bCB3cm90ZToKPiA+ID4gRnJvbTogU2VhbiBQYXVsIDxzZWFucGF1bEBj
aHJvbWl1bS5vcmc+Cj4gPiA+Cj4gPiA+IGRldl9wbV9kb21haW5fYXR0YWNoX2J5X25hbWUoKSBj
YW4gcmV0dXJuIE5VTEwsIHNvIHdlIHNob3VsZCBjaGVjayBmb3IKPiA+ID4gdGhhdCBjYXNlIHdo
ZW4gd2UncmUgYWJvdXQgdG8gZGVyZWZlcmVuY2UgZ3hwZC4KPiA+ID4KPiA+ID4gRml4ZXM6IDkz
MjVkNDI2NmFmZCAoImRybS9tc20vZ3B1OiBBdHRhY2ggdG8gdGhlIEdQVSBHWCBwb3dlciBkb21h
aW4iKQo+ID4gPiBDYzogSm9yZGFuIENyb3VzZSA8amNyb3VzZUBjb2RlYXVyb3JhLm9yZz4KPiA+
ID4gQ2M6IFJvYiBDbGFyayA8cm9iZGNsYXJrQGNocm9taXVtLm9yZz4KPiA+ID4gU2lnbmVkLW9m
Zi1ieTogU2VhbiBQYXVsIDxzZWFucGF1bEBjaHJvbWl1bS5vcmc+Cj4gPgo+ID4gUmV2aWV3ZWQt
Ynk6IEpvcmRhbiBDcm91c2UgPGpjcm91c2VAY29kZWF1b3JvcmEub3JnPgo+ID4KPiAKPiBUaGFu
a3MgZm9yIHRoZSByZXZpZXcsIEkndmUgYXBwbGllZCBpdCB0byAtbWlzYy1uZXh0LWZpeGVzIHdp
dGggdGhlCj4gb3RoZXIgbXNtIGZpeGVzIGZvciA1LjIKPiAKClRoYW5rcyBmb3IgZml4aW5nIHRo
aXMuCgpJIGhhZG4ndCBwdWJsaXNoZWQgbXkgZm9yLW5leHQtbmV4dCBicmFuY2ggd2hlbiBJIHNw
b3R0ZWQgdGhpcywgc28gdGhlCmFkZGl0aW9uIG9mIHRoZSBHUFUgaW4gdGhlIGR0cyB3YXMgYW1l
bmRlZCB0byBpbmNsdWRlIHRoZSBneHBkIC0gYW5kCndpbGwgc2hvdyB1cCBvbiAtbmV4dCBhZnRl
ciAtcmMxLgoKUmVnYXJkcywKQmpvcm4KCj4gCj4gU2Vhbgo+IAo+ID4gPiAtLS0KPiA+ID4gIGRy
aXZlcnMvZ3B1L2RybS9tc20vYWRyZW5vL2E2eHhfZ211LmMgfCA2ICsrKy0tLQo+ID4gPiAgMSBm
aWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPiA+ID4KPiA+ID4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tc20vYWRyZW5vL2E2eHhfZ211LmMgYi9kcml2
ZXJzL2dwdS9kcm0vbXNtL2FkcmVuby9hNnh4X2dtdS5jCj4gPiA+IGluZGV4IDkxNTVkYWZhZTJh
OTAuLjM4ZTJjZmE5Y2VjNzkgMTAwNjQ0Cj4gPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tc20v
YWRyZW5vL2E2eHhfZ211LmMKPiA+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21zbS9hZHJlbm8v
YTZ4eF9nbXUuYwo+ID4gPiBAQCAtNzQ3LDcgKzc0Nyw3IEBAIGludCBhNnh4X2dtdV9yZXN1bWUo
c3RydWN0IGE2eHhfZ3B1ICphNnh4X2dwdSkKPiA+ID4gICAgICAgICogd2lsbCBtYWtlIHN1cmUg
dGhhdCB0aGUgcmVmY291bnRpbmcgaXMgY29ycmVjdCBpbiBjYXNlIHdlIG5lZWQgdG8KPiA+ID4g
ICAgICAgICogYnJpbmcgZG93biB0aGUgR1ggYWZ0ZXIgYSBHTVUgZmFpbHVyZQo+ID4gPiAgICAg
ICAgKi8KPiA+ID4gLSAgICAgaWYgKCFJU19FUlIoZ211LT5neHBkKSkKPiA+ID4gKyAgICAgaWYg
KCFJU19FUlJfT1JfTlVMTChnbXUtPmd4cGQpKQo+ID4gPiAgICAgICAgICAgICAgIHBtX3J1bnRp
bWVfZ2V0KGdtdS0+Z3hwZCk7Cj4gPiA+Cj4gPiA+ICBvdXQ6Cj4gPiA+IEBAIC04NjMsNyArODYz
LDcgQEAgaW50IGE2eHhfZ211X3N0b3Aoc3RydWN0IGE2eHhfZ3B1ICphNnh4X2dwdSkKPiA+ID4g
ICAgICAgICogZG9tYWluLiBVc3VhbGx5IHRoZSBHTVUgZG9lcyB0aGlzIGJ1dCBvbmx5IGlmIHRo
ZSBzaHV0ZG93biBzZXF1ZW5jZQo+ID4gPiAgICAgICAgKiB3YXMgc3VjY2Vzc2Z1bAo+ID4gPiAg
ICAgICAgKi8KPiA+ID4gLSAgICAgaWYgKCFJU19FUlIoZ211LT5neHBkKSkKPiA+ID4gKyAgICAg
aWYgKCFJU19FUlJfT1JfTlVMTChnbXUtPmd4cGQpKQo+ID4gPiAgICAgICAgICAgICAgIHBtX3J1
bnRpbWVfcHV0X3N5bmMoZ211LT5neHBkKTsKPiA+ID4KPiA+ID4gICAgICAgY2xrX2J1bGtfZGlz
YWJsZV91bnByZXBhcmUoZ211LT5ucl9jbG9ja3MsIGdtdS0+Y2xvY2tzKTsKPiA+ID4gQEAgLTEy
MzQsNyArMTIzNCw3IEBAIHZvaWQgYTZ4eF9nbXVfcmVtb3ZlKHN0cnVjdCBhNnh4X2dwdSAqYTZ4
eF9ncHUpCj4gPiA+Cj4gPiA+ICAgICAgIHBtX3J1bnRpbWVfZGlzYWJsZShnbXUtPmRldik7Cj4g
PiA+Cj4gPiA+IC0gICAgIGlmICghSVNfRVJSKGdtdS0+Z3hwZCkpIHsKPiA+ID4gKyAgICAgaWYg
KCFJU19FUlJfT1JfTlVMTChnbXUtPmd4cGQpKSB7Cj4gPiA+ICAgICAgICAgICAgICAgcG1fcnVu
dGltZV9kaXNhYmxlKGdtdS0+Z3hwZCk7Cj4gPiA+ICAgICAgICAgICAgICAgZGV2X3BtX2RvbWFp
bl9kZXRhY2goZ211LT5neHBkLCBmYWxzZSk7Cj4gPiA+ICAgICAgIH0KPiA+ID4gLS0KPiA+ID4g
U2VhbiBQYXVsLCBTb2Z0d2FyZSBFbmdpbmVlciwgR29vZ2xlIC8gQ2hyb21pdW0gT1MKPiA+ID4K
PiA+Cj4gPiAtLQo+ID4gVGhlIFF1YWxjb21tIElubm92YXRpb24gQ2VudGVyLCBJbmMuIGlzIGEg
bWVtYmVyIG9mIENvZGUgQXVyb3JhIEZvcnVtLAo+ID4gYSBMaW51eCBGb3VuZGF0aW9uIENvbGxh
Ym9yYXRpdmUgUHJvamVjdApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpGcmVlZHJlbm8gbWFpbGluZyBsaXN0CkZyZWVkcmVub0BsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9mcmVl
ZHJlbm8=

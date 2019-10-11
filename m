Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DD74D414C
	for <lists+freedreno@lfdr.de>; Fri, 11 Oct 2019 15:31:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32DD96EB3D;
	Fri, 11 Oct 2019 13:31:57 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C85CE6EB64
 for <freedreno@lists.freedesktop.org>; Fri, 11 Oct 2019 13:31:56 +0000 (UTC)
Received: by mail-ot1-x344.google.com with SMTP id e11so7949032otl.5
 for <freedreno@lists.freedesktop.org>; Fri, 11 Oct 2019 06:31:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=jOlMrLmiDpbJQN8gDxj5N5gUwCySt5JOBF27z06OLYc=;
 b=BOjBVZbPb1cs8nkrFq6cgyTZIBxuZdl1gGHw9rVMXZzBeSQ44x0h6/aI5yrAIqEPq9
 J44SkFNCLSoGJfFbUlqCz51bUmrHiwZLU42tdXOxr+OdrkmRiHxcRuHoMzsjDcXzVkgD
 2iMyWkHxMB7hN0MtlNCMynKeLLh9WleAjZbyqQ2UcMAtQPrKA2Ca6awfyX0GhcdcpG79
 NBp4LjybHLVnb99N81PTuuysAzmWruh/2f+RSlxbQI4Tt5BEDr9VwuFcMfexSPeTk53b
 pl0GCiH2oywlKg2gByg7mEruKPueVMbk/+3NogtUG0Lycf6HPT838dw6r1moyTw2U5MS
 LgWw==
X-Gm-Message-State: APjAAAV0HlC3lsBfwghpTtpHbtbkwrDCRQ9+bFHucdTTAEXPEIf71n7M
 p/0S9HVu6/Fef4SRzob224wL/QXVD8o=
X-Google-Smtp-Source: APXvYqy0QnS/jlV3V8aa6/4ScrN1IKjTBx41QX5VNHlcDL/NkgQckADIHAN9KSxbMsnEihlPNjrL1A==
X-Received: by 2002:a81:1ac4:: with SMTP id a187mr2453439ywa.482.1570800713019; 
 Fri, 11 Oct 2019 06:31:53 -0700 (PDT)
Received: from localhost ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id d4sm2180143ywf.69.2019.10.11.06.31.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Oct 2019 06:31:52 -0700 (PDT)
Date: Fri, 11 Oct 2019 09:31:51 -0400
From: Sean Paul <sean@poorly.run>
To: Ben Dooks <ben.dooks@codethink.co.uk>,
 linux-kernel@lists.codethink.co.uk, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Message-ID: <20191011133151.GP85762@art_vandelay>
References: <20191009114607.701-1-ben.dooks@codethink.co.uk>
 <20191009154406.GB13386@jcrouse1-lnx.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191009154406.GB13386@jcrouse1-lnx.qualcomm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=date:from:to:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=jOlMrLmiDpbJQN8gDxj5N5gUwCySt5JOBF27z06OLYc=;
 b=VjlIJKIYoq7/WRTQm4NQAt1mykqe9vwDAfvkkOm5uY9YvvNYf942Ym4E26GNAfHpeW
 1YWAakr9lHEFX0ml3HXVdZA2SmjnB65Fhm4w2Y+uGc1CC47CwKgdlZy0tLi0jrVYn/dy
 lLhUfE1b9oFV0uZgQJOpREWL6LJhyPWujRNLcvNLQrANKDgesawRB2vDuQB6RAMiBlGJ
 0gd30OVr6lpOFiKi5kcYE5QYRjGIGuRuJ3yGcpYT0L99BInGAsIW2j3pOwQpUsw3K4uY
 jCgZ0vdUEWa7gUox8AXllKl5lvA9ZYEA9t7o9sOfOIxWEZV6B/J0xdwghzgNCJAgHFel
 9Uew==
Subject: Re: [Freedreno] [PATCH] drm/msm: make a5xx_show and
 a5xx_gpu_state_put static
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

T24gV2VkLCBPY3QgMDksIDIwMTkgYXQgMDk6NDQ6MDZBTSAtMDYwMCwgSm9yZGFuIENyb3VzZSB3
cm90ZToKPiBPbiBXZWQsIE9jdCAwOSwgMjAxOSBhdCAxMjo0NjowN1BNICswMTAwLCBCZW4gRG9v
a3Mgd3JvdGU6Cj4gPiBUaGUgYTV4eF9zaG93IGFuZCBhNXh4X2dwdV9zdGF0ZV9wdXQgb2JqZWN0
cyBhcmUgbm90IGV4cG9ydGVkCj4gPiBvdXRzaWRlIG9mIHRoZSBmaWxlLCBzbyBtYWtlIHRoZW0g
c3RhdGljIHRvIGF2b2lkIHRoZSBmb2xsb3dpbmcKPiA+IHdhcm5pbmdzIGZyb20gc3BhcnNlOgo+
ID4gCj4gPiBkcml2ZXJzL2dwdS9kcm0vbXNtL2FkcmVuby9hNXh4X2dwdS5jOjEyOTI6NTogd2Fy
bmluZzogc3ltYm9sICdhNXh4X2dwdV9zdGF0ZV9wdXQnIHdhcyBub3QgZGVjbGFyZWQuIFNob3Vs
ZCBpdCBiZSBzdGF0aWM/Cj4gPiBkcml2ZXJzL2dwdS9kcm0vbXNtL2FkcmVuby9hNXh4X2dwdS5j
OjEzMDI6Njogd2FybmluZzogc3ltYm9sICdhNXh4X3Nob3cnIHdhcyBub3QgZGVjbGFyZWQuIFNo
b3VsZCBpdCBiZSBzdGF0aWM/Cj4gCj4gUmV2aWV3ZWQtYnk6IEpvcmRhbiBDcm91c2UgPGpjcm91
c2VAY29kZWF1cm9yYS5vcmc+Cj4gCgpBcHBsaWVkIHRvIG1zbS1uZXh0LCB0aGFua3MgZm9yIHRo
ZSByZXZpZXcgYW5kIHBhdGNoIQoKU2VhbgoKPiA+IFNpZ25lZC1vZmYtYnk6IEJlbiBEb29rcyA8
YmVuLmRvb2tzQGNvZGV0aGluay5jby51az4KPiA+IC0tLQo+ID4gQ2M6IFJvYiBDbGFyayA8cm9i
ZGNsYXJrQGdtYWlsLmNvbT4KPiA+IENjOiBTZWFuIFBhdWwgPHNlYW5AcG9vcmx5LnJ1bj4KPiA+
IENjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+Cj4gPiBDYzogRGFuaWVsIFZldHRl
ciA8ZGFuaWVsQGZmd2xsLmNoPgo+ID4gQ2M6IGxpbnV4LWFybS1tc21Admdlci5rZXJuZWwub3Jn
Cj4gPiBDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+ID4gQ2M6IGZyZWVkcmVu
b0BsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiA+IC0tLQo+ID4gIGRyaXZlcnMvZ3B1L2RybS9tc20v
YWRyZW5vL2E1eHhfZ3B1LmMgfCA2ICsrKy0tLQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2Vy
dGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4gPiAKPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vbXNtL2FkcmVuby9hNXh4X2dwdS5jIGIvZHJpdmVycy9ncHUvZHJtL21zbS9hZHJlbm8v
YTV4eF9ncHUuYwo+ID4gaW5kZXggZTljNTVkMWQ2YzA0Li43ZmRjOWUyYmNhYWMgMTAwNjQ0Cj4g
PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2FkcmVuby9hNXh4X2dwdS5jCj4gPiArKysgYi9k
cml2ZXJzL2dwdS9kcm0vbXNtL2FkcmVuby9hNXh4X2dwdS5jCj4gPiBAQCAtMTI4OSw3ICsxMjg5
LDcgQEAgc3RhdGljIHZvaWQgYTV4eF9ncHVfc3RhdGVfZGVzdHJveShzdHJ1Y3Qga3JlZiAqa3Jl
ZikKPiA+ICAJa2ZyZWUoYTV4eF9zdGF0ZSk7Cj4gPiAgfQo+ID4gIAo+ID4gLWludCBhNXh4X2dw
dV9zdGF0ZV9wdXQoc3RydWN0IG1zbV9ncHVfc3RhdGUgKnN0YXRlKQo+ID4gK3N0YXRpYyBpbnQg
YTV4eF9ncHVfc3RhdGVfcHV0KHN0cnVjdCBtc21fZ3B1X3N0YXRlICpzdGF0ZSkKPiA+ICB7Cj4g
PiAgCWlmIChJU19FUlJfT1JfTlVMTChzdGF0ZSkpCj4gPiAgCQlyZXR1cm4gMTsKPiA+IEBAIC0x
Mjk5LDggKzEyOTksOCBAQCBpbnQgYTV4eF9ncHVfc3RhdGVfcHV0KHN0cnVjdCBtc21fZ3B1X3N0
YXRlICpzdGF0ZSkKPiA+ICAKPiA+ICAKPiA+ICAjaWYgZGVmaW5lZChDT05GSUdfREVCVUdfRlMp
IHx8IGRlZmluZWQoQ09ORklHX0RFVl9DT1JFRFVNUCkKPiA+IC12b2lkIGE1eHhfc2hvdyhzdHJ1
Y3QgbXNtX2dwdSAqZ3B1LCBzdHJ1Y3QgbXNtX2dwdV9zdGF0ZSAqc3RhdGUsCj4gPiAtCQlzdHJ1
Y3QgZHJtX3ByaW50ZXIgKnApCj4gPiArc3RhdGljIHZvaWQgYTV4eF9zaG93KHN0cnVjdCBtc21f
Z3B1ICpncHUsIHN0cnVjdCBtc21fZ3B1X3N0YXRlICpzdGF0ZSwKPiA+ICsJCSAgICAgIHN0cnVj
dCBkcm1fcHJpbnRlciAqcCkKPiA+ICB7Cj4gPiAgCWludCBpLCBqOwo+ID4gIAl1MzIgcG9zID0g
MDsKPiA+IC0tIAo+ID4gMi4yMy4wCj4gPiAKPiAKPiAtLSAKPiBUaGUgUXVhbGNvbW0gSW5ub3Zh
dGlvbiBDZW50ZXIsIEluYy4gaXMgYSBtZW1iZXIgb2YgQ29kZSBBdXJvcmEgRm9ydW0sCj4gYSBM
aW51eCBGb3VuZGF0aW9uIENvbGxhYm9yYXRpdmUgUHJvamVjdAoKLS0gClNlYW4gUGF1bCwgU29m
dHdhcmUgRW5naW5lZXIsIEdvb2dsZSAvIENocm9taXVtIE9TCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkZyZWVkcmVubyBtYWlsaW5nIGxpc3QKRnJlZWRy
ZW5vQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2ZyZWVkcmVubw==

Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CCC22D573
	for <lists+freedreno@lfdr.de>; Wed, 29 May 2019 08:23:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E146D6E0EC;
	Wed, 29 May 2019 06:23:32 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 758B76E0EC
 for <freedreno@lists.freedesktop.org>; Wed, 29 May 2019 06:23:31 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id q16so1211062ljj.8
 for <freedreno@lists.freedesktop.org>; Tue, 28 May 2019 23:23:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Y1SBl/NhErMiMqrSROQABj44p6n5fylOaEGm2rxHFac=;
 b=lNul3TOR8XAdLdw2x7mzrfrhtzIBObTWtU1p61sCK+c7TI02MB4uRgiXA308efC298
 QjcoxTZgYR6e/T3lA4Z8mC28gVsIsnFIRwdVRbwCuucENuGhpwmXGLPN3SITFXo5bL7q
 hDgxQwwxWPMWg0dMyxkydkvViX3UvrjFop26jVRSMkzTc8YcvIhZQimpGnCi/hcJAt1S
 iYpvcEv7Uz05Ni4weDd7x0smRuLLw0k8uPplLbhlmU5MiPqniwOv1ZLceUqhTi0dXhGE
 DcOXzS4Ew+9nqXwtQkUR1GHgS8Ee6G6X63dxses+vplWJW/1+Z4O2AjDxR1BaLBgSgcr
 L+1w==
X-Gm-Message-State: APjAAAVnalCTowL+XWy4stSgFlBwkcUwPvWlHCZ4mWxnALvWkJIr9ovi
 sLQy+mIStvdlOIB12Qfdl7OMm6dMzQSPDyzIxnXwgQ==
X-Google-Smtp-Source: APXvYqwIsl1wSDxK9EPcOc6HNZDGzaYIXxohtHwHpz4z0RvbNyq1y2+YZmevdVoB7By354baiJgjeTvrt9wKyS/5rzA=
X-Received: by 2002:a2e:8997:: with SMTP id c23mr1321995lji.94.1559111009909; 
 Tue, 28 May 2019 23:23:29 -0700 (PDT)
MIME-Version: 1.0
References: <20190509020352.14282-1-masneyb@onstation.org>
 <CACRpkda-7+ggoeMD9=erPX09OWteX0bt+qP60_Yv6=4XLqNDZQ@mail.gmail.com>
 <20190529011705.GA12977@basecamp>
In-Reply-To: <20190529011705.GA12977@basecamp>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 29 May 2019 08:23:17 +0200
Message-ID: <CACRpkdZu5KxKTMqAM5rueWbrXbfPNorOOerezCAA3vgAR6cD5g@mail.gmail.com>
To: Brian Masney <masneyb@onstation.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=Y1SBl/NhErMiMqrSROQABj44p6n5fylOaEGm2rxHFac=;
 b=oqk/J0AF4QeADPOdicRdeDUwsHkDSXWjWx8dSgJe6kYqicSzaWT6We5F12PmUwMZ65
 LMtry+PPgl9aZ+ehVfQ3aYUPdsUA+0G/0MxVYzVP3GQ7nbyVaWAFtqS14q9Cz/sXTVWw
 WStWmxJlYuL0EZHA9ZLPC+k+8DEk47jsreW/64yj3ouY/mC8ANmDOehvx6T5ccr5eMGf
 1WHWfK+w0dKIuRVlMUYtK5EJTnE70DhNt1doisAzvDA3kA4nYYZdqKIMaavmi3/4P3dM
 OFEXNXqpmonqPRobjHOdNVf7Lw0XFzgEPkX3HUfI1XRrIa4g+PCInqe2zu8U3pN8pT/h
 jBAg==
Subject: Re: [Freedreno] [PATCH RFC v2 0/6] ARM: qcom: initial Nexus 5
 display support
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
Cc: Sean Paul <sean@poorly.run>, Rob Herring <robh@kernel.org>,
 Jonathan Marek <jonathan@marek.ca>, Dave Airlie <airlied@linux.ie>,
 MSM <linux-arm-msm@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

T24gV2VkLCBNYXkgMjksIDIwMTkgYXQgMzoxNyBBTSBCcmlhbiBNYXNuZXkgPG1hc25leWJAb25z
dGF0aW9uLm9yZz4gd3JvdGU6Cgo+IEl0J3MgaW4gbG93IHNwZWVkIG1vZGUgYnV0IGl0cyB1c2Fi
bGUuCgpIb3cgbG93IHNwZWVkIGlzIHRoYXQ/Cgo+IEkgYXNzdW1lIHRoYXQgaXQncyByZWxhdGVk
IHRvIHRoZQo+IHZibGFuayBldmVudHMgbm90IHdvcmtpbmcgcHJvcGVybHk/CgpUaGV5IGFyZSBv
bmx5IHdhaXRpbmcgZm9yIDUwIG1zIGJlZm9yZSB0aW1pbmcgb3V0LCBJIHJhaXNlZCBpdAp0byAx
MDBtcyBpbiB0aGUgLW5leHQga2VybmVsLiBJJ20gc3RpbGwgc3VzcGljaW91cyBhYm91dCB0aGlz
CmV2ZW4gdGhvdWdoIEkgdGhpbmsgeW91IHNhaWQgdGhpcyB3YXMgbm90IHRoZSBwcm9ibGVtLgoK
Rm9yIGEgY29tbWFuZCBtb2RlIHBhbmVsIGluIExQIG1vZGUgaXQgd2lsbCBuZXZlcnRoZWxlc3MK
YmUgbW9yZSB0aGFuIDEwMG1zIGZvciBzdXJlLCB0aGUgdXBkYXRlIGlzIHZpc2libGUgdG8gdGhl
Cm5ha2VkIGV5ZS4KClJhaXNlIGl0IHRvIDEwMDAwIG1zIG9yIHNvbWV0aGluZyBhbmQgc2VlIHdo
YXQgaGFwcGVucy4KZHJpdmVycy9ncHUvZHJtL2RybV9hdG9taWNfaGVscGVyLmM6CiBtc2Vjc190
b19qaWZmaWVzKDUwKQoKWW91cnMsCkxpbnVzIFdhbGxlaWoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KRnJlZWRyZW5vIG1haWxpbmcgbGlzdApGcmVlZHJl
bm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZnJlZWRyZW5v

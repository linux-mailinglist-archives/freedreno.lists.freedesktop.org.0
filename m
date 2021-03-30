Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 061E634EBF7
	for <lists+freedreno@lfdr.de>; Tue, 30 Mar 2021 17:19:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94C646E91E;
	Tue, 30 Mar 2021 15:19:16 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AC5B6E91E
 for <freedreno@lists.freedesktop.org>; Tue, 30 Mar 2021 15:19:15 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id d191so8590155wmd.2
 for <freedreno@lists.freedesktop.org>; Tue, 30 Mar 2021 08:19:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=hCfGCExGZ032atZREFMuWQJ4hKJ6Pjl2rDpU87CxNjI=;
 b=d0tnXFEBbBdt3KAHMvZjgIVuPuUhTN5DpIRb16zr9Wk5NxGjXgpPfg14g44/A2DAeX
 0xH1xn8QdIWzGlu8Ghy6X5ovM6ayJD5ysiyMKXYOPHyLblqh1+i75rYM6w9+edrv+0ei
 jWP8gNuHMEB6Atp2OLtz6mkl0vofFczh8/mP/H5WPiMNg728lZoiDJKH8usabY4Sth8u
 7kgCg0JF0ybA0kgZvQ7ww95DwgsEXt+/XMHHgB2ANxE1zNrC8sssFlvNJvmCt6BS5+ed
 70/r6Eyxo7jcpJglZI/KMfaaLFBQyepOVVmKurGUAFmC82jpSGDcy9EbVcRinorFzDET
 0Apw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=hCfGCExGZ032atZREFMuWQJ4hKJ6Pjl2rDpU87CxNjI=;
 b=rOHcSU2Rz5q9bDMXywfElx8TVQbqVHqlf1BY/TPCXIHT9XwBTxRmNMg1KbUi7VFSUH
 eBfvTOjqjrl9GZqa2ku/M2w+D4OJm3JhaKoyAO8Mr2nnwrK57gU7bZQbSkqCNw4Cb5jE
 FvvUuVD7Eed1wL8YJ06SelyUaV2JbbCR+5maioiVbp0kUCLQKn2tuACj0HGFWbmQLZ02
 xFivRDg2C/MZbexpTJ/jR9TFtQkYByXa0+ZsceAqAEWpkpqz2hTX503UBzVqK8C1kCQM
 8BOCJ2iDa5RbQZwyS5aorAdTRP82fXVu1WignM7Mzs3nkq3o+PpOmNPCLt2nPLcOxuEu
 CxaQ==
X-Gm-Message-State: AOAM531YdGXEXjgA40qHjcbxd5jSP1gTgarSn6ToO1//2Y8sACp4J6dO
 mova7FXEOFblQX0tcmRL+jLzFA==
X-Google-Smtp-Source: ABdhPJyYgKkqcDOow6JJ62djXw3iIsO/j+KvsfseIB+9/rwYszatw8KxsjLaOFanM+fL7Q88Q/+L0w==
X-Received: by 2002:a1c:5f54:: with SMTP id t81mr4641496wmb.84.1617117553836; 
 Tue, 30 Mar 2021 08:19:13 -0700 (PDT)
Received: from dell ([91.110.221.217])
 by smtp.gmail.com with ESMTPSA id n1sm41945988wro.36.2021.03.30.08.19.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Mar 2021 08:19:13 -0700 (PDT)
Date: Tue, 30 Mar 2021 16:19:11 +0100
From: Lee Jones <lee.jones@linaro.org>
To: linux-kernel@vger.kernel.org, Alex Deucher <alexander.deucher@amd.com>,
 amd-gfx@lists.freedesktop.org, Anthony Koo <Anthony.Koo@amd.com>,
 Ben Skeggs <bskeggs@redhat.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Colin Ian King <colin.king@canonical.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 Harry Wentland <harry.wentland@amd.com>, Jeremy Kolb <jkolb@brandeis.edu>,
 Kuogee Hsieh <khsieh@codeaurora.org>, Leo Li <sunpeng.li@amd.com>,
 linaro-mm-sig@lists.linaro.org, linux-arm-msm@vger.kernel.org,
 linux-media@vger.kernel.org, Lyude Paul <lyude@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, nouveau@lists.freedesktop.org,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <20210330151911.GL2916463@dell>
References: <20210319082428.3294591-1-lee.jones@linaro.org>
 <20210324103611.GJ2916463@dell>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210324103611.GJ2916463@dell>
Subject: Re: [Freedreno] [RESEND 00/19] Rid GPU from W=1 warnings
X-BeenThere: freedreno@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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

T24gV2VkLCAyNCBNYXIgMjAyMSwgTGVlIEpvbmVzIHdyb3RlOgoKPiBEYW5pZWwsCj4gCj4gPiBN
SU1FLVZlcnNpb246IDEuMAo+ID4gQ29udGVudC1UeXBlOiB0ZXh0L3BsYWluOyBjaGFyc2V0PVVU
Ri04Cj4gPiBDb250ZW50LVRyYW5zZmVyLUVuY29kaW5nOiA4Yml0Cj4gPiAKPiA+IFRoaXMgaXMg
YSByZXNlbmQgb2YgdGhlIHJlbWFpbmluZyBwYXRjaGVzLgo+ID4gCj4gPiBBbGwgb2YgdGhlc2Ug
cGF0Y2hlcyBoYXZlIGJlZW4gc2VudCBiZWZvcmUuCj4gCj4gQXJlIHlvdSBzdGlsbCBrZWVuIHRv
ICdob292ZXIgdGhlc2UgdXAnPwo+IAo+IEp1c3QgbGVhdmUgdGhlIG9uZSB0aGF0IHJlcXVpcmVz
IHdvcmsgYW5kIHRha2UgdGhlIHJlc3QgcGVyaGFwcz8KCkhvdyB3b3VsZCB5b3UgbGlrZSBtZSB0
byBwcm9jZWVkIHdpdGggdGhpcz8KCi0tIApMZWUgSm9uZXMgW+adjueQvOaWr10KU2VuaW9yIFRl
Y2huaWNhbCBMZWFkIC0gRGV2ZWxvcGVyIFNlcnZpY2VzCkxpbmFyby5vcmcg4pSCIE9wZW4gc291
cmNlIHNvZnR3YXJlIGZvciBBcm0gU29DcwpGb2xsb3cgTGluYXJvOiBGYWNlYm9vayB8IFR3aXR0
ZXIgfCBCbG9nCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkZyZWVkcmVubyBtYWlsaW5nIGxpc3QKRnJlZWRyZW5vQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ZyZWVkcmVubwo=

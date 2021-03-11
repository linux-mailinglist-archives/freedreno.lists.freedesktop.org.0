Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 451523374A7
	for <lists+freedreno@lfdr.de>; Thu, 11 Mar 2021 14:52:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C58E6ECF0;
	Thu, 11 Mar 2021 13:52:03 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E5E06ECEE
 for <freedreno@lists.freedesktop.org>; Thu, 11 Mar 2021 13:52:01 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id g25so1352053wmh.0
 for <freedreno@lists.freedesktop.org>; Thu, 11 Mar 2021 05:52:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=GdXN3z4xkG8mhrjjLyuf+xPSPLFfHaqc7TyE3s6lR5o=;
 b=mzyHuGYkxuGBqtX56UH+ZqkeHQrY7cxjlNcTXAnF2iB0rcPRz1a0NOXIcbCaQA03iz
 EDY3iXzg3ylmx6DshXuHd/xYeDBmICAzMcMb1ziWGbtGMp88T3If/JFMeDUTgYLA5FaR
 lZzyUcqQNlTgrbOWxIiCNNkGXcN+YcAkRa7XtcndRuHIISjtS1bqOozbZsz1nC5hcsDD
 u26KEay0y9NGORuXLNCFAGzVfuTbflhbbVeY0FwDzd47mAegDitFXQlidZ+r3vc4qp62
 2wq4Ap9JOFRY2OG3rj7JvheiELYyUdtdiEu9Q/yHgDadrXZxY7kRNmrLS7Phdb9dJhjR
 /WTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=GdXN3z4xkG8mhrjjLyuf+xPSPLFfHaqc7TyE3s6lR5o=;
 b=TdWDp0zxNFw9X0PG0cliOve4ljrULGv+kJuBz4Nj0MHdV4udVZ5XZM/XcdhD8z7Yxg
 9AP5j3hSzCgGQkwKE3bDO/gsUDQkJrWkd5FyYbKYH3idCXhlWpObSoRyIVqGGln9glQI
 CiKCce1sFYkHrknwwaRD7McFe3UeOsHue6RoP5D977ok82qXF89nAsV8gGmjEWbdEuzm
 8TggVx/zpzg8VAfB5qEmDwDAZCnkSiYcqBF1o6/Zgb7ACQFu8+eWrnApvJaoil/JM/1f
 My4CiApnswlJEP+aMeUa0tpAsjqkkQ3Xk6Rz7oh4APlaOcRihHSA5QsMICuYRYY8T2QU
 PKkQ==
X-Gm-Message-State: AOAM532H5vL9oovJwbv5Fjs1iycCVMqEmF8UFie1pYsrSo1ja5nc+dBp
 yQfvTw9QLmnhdn4ntnKniPrFgA==
X-Google-Smtp-Source: ABdhPJwtZ3Lak0tbe7621fR5C5wI2ILNInbUcMVPIDqge9Cl2Uqimu1nbUPn2VLmqrVsQ9qrcxz2sA==
X-Received: by 2002:a7b:cd81:: with SMTP id y1mr8400832wmj.51.1615470715019;
 Thu, 11 Mar 2021 05:51:55 -0800 (PST)
Received: from dell ([91.110.221.204])
 by smtp.gmail.com with ESMTPSA id h10sm4119795wrp.22.2021.03.11.05.51.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Mar 2021 05:51:54 -0800 (PST)
Date: Thu, 11 Mar 2021 13:51:52 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Roland Scheidegger <sroland@vmware.com>, linux-kernel@vger.kernel.org,
 Alex Deucher <alexander.deucher@amd.com>,
 amd-gfx@lists.freedesktop.org, Anthony Koo <Anthony.Koo@amd.com>,
 Ben Skeggs <bskeggs@redhat.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Colin Ian King <colin.king@canonical.com>,
 Dave Airlie <airlied@redhat.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 Harry Wentland <harry.wentland@amd.com>, Jeremy Kolb <jkolb@brandeis.edu>,
 Kuogee Hsieh <khsieh@codeaurora.org>, Leo Li <sunpeng.li@amd.com>,
 linaro-mm-sig@lists.linaro.org, linux-arm-msm@vger.kernel.org,
 linux-media@vger.kernel.org, Lyude Paul <lyude@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, nouveau@lists.freedesktop.org,
 Qinglang Miao <miaoqinglang@huawei.com>,
 Rob Clark <rob.clark@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Sumit Semwal <sumit.semwal@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Zack Rusin <zackr@vmware.com>
Message-ID: <20210311135152.GT701493@dell>
References: <20210303134319.3160762-1-lee.jones@linaro.org>
 <16d4300e-bf29-1e85-317b-53d257890cb9@vmware.com>
 <20210308091932.GB4931@dell> <YEobySvG0zPs9xhc@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YEobySvG0zPs9xhc@phenom.ffwll.local>
Subject: Re: [Freedreno] [RESEND 00/53] Rid GPU from W=1 warnings
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

T24gVGh1LCAxMSBNYXIgMjAyMSwgRGFuaWVsIFZldHRlciB3cm90ZToKCj4gT24gTW9uLCBNYXIg
MDgsIDIwMjEgYXQgMDk6MTk6MzJBTSArMDAwMCwgTGVlIEpvbmVzIHdyb3RlOgo+ID4gT24gRnJp
LCAwNSBNYXIgMjAyMSwgUm9sYW5kIFNjaGVpZGVnZ2VyIHdyb3RlOgo+ID4gCj4gPiA+IFRoZSB2
bXdnZnggb25lcyBsb29rIGFsbCBnb29kIHRvIG1lLCBzbyBmb3IKPiA+ID4gMjMtNTM6IFJldmll
d2VkLWJ5OiBSb2xhbmQgU2NoZWlkZWdnZXIgPHNyb2xhbmRAdm13YXJlLmNvbT4KPiA+ID4gVGhh
dCBzYWlkLCB0aGV5IHdlcmUgYWxyZWFkeSBzaWduZWQgb2ZmIGJ5IFphY2ssIHNvIG5vdCBzdXJl
IHdoYXQKPiA+ID4gaGFwcGVuZWQgaGVyZS4KPiA+IAo+ID4gWWVzLCB0aGV5IHdlcmUgYWNjZXB0
ZWQgYXQgb25lIHBvaW50LCB0aGVuIGRyb3BwZWQgd2l0aG91dCBhIHJlYXNvbi4KPiA+IAo+ID4g
U2luY2UgSSByZWJhc2VkIG9udG8gdGhlIGxhdGVzdCAtbmV4dCwgSSBoYWQgdG8gcGx1Y2sgdGhl
bSBiYWNrIG91dCBvZgo+ID4gYSBwcmV2aW91cyBvbmUuCj4gCj4gVGhleSBzaG91bGQgc2hvdyB1
cCBpbiBsaW51eC1uZXh0IGFnYWluLiBXZSBtZXJnZSBwYXRjaGVzIGZvciBuZXh0IG1lcmdlCj4g
d2luZG93IGV2ZW4gZHVyaW5nIHRoZSBjdXJyZW50IG1lcmdlIHdpbmRvdywgYnV0IG5lZWQgdG8g
bWFrZSBzdXJlIHRoZXkKPiBkb24ndCBwb2xsdXRlIGxpbnV4LW5leHQuIE9jY2FzaW9uYWxseSB0
aGUgY3V0IG9mZiBpcyB3cm9uZyBzbyBwYXRjaGVzCj4gc2hvdyB1cCwgYW5kIHRoZW4gZ2V0IHB1
bGxlZCBhZ2Fpbi4KPiAKPiBVbmZvcnR1bmF0ZWx5IGVzcGVjaWFsbHkgdGhlIDUuMTIgbWVyZ2Ug
Y3ljbGUgd2FzIHZlcnkgd29iYmx5IGR1ZSB0byBzb21lCj4gY29uZnVzaW9uIGhlcmUuIEJ1dCB5
b3VyIHBhdGNoZXMgc2hvdWxkIGFsbCBiZSBpbiBsaW51eC1uZXh0IGFnYWluICh0aGV5Cj4gYXJl
IHF1ZXVlZCB1cCBmb3IgNS4xMyBpbiBkcm0tbWlzYy1uZXh0LCBJIGNoZWNrZWQgdGhhdCkuCj4g
Cj4gU29ycnkgZm9yIHRoZSBjb25mdXNpb24gaGVyZS4KCk9oLCBJIHNlZS4gIFdlbGwgc28gbG9u
ZyBhcyB0aGV5IGRvbid0IGdldCBkcm9wcGVkLCBJJ2xsIGJlIGhhcHB5LgoKVGhhbmtzIGZvciB0
aGUgZXhwbGFuYXRpb24gRGFuaWVsCgotLSAKTGVlIEpvbmVzIFvmnY7nkLzmlq9dClNlbmlvciBU
ZWNobmljYWwgTGVhZCAtIERldmVsb3BlciBTZXJ2aWNlcwpMaW5hcm8ub3JnIOKUgiBPcGVuIHNv
dXJjZSBzb2Z0d2FyZSBmb3IgQXJtIFNvQ3MKRm9sbG93IExpbmFybzogRmFjZWJvb2sgfCBUd2l0
dGVyIHwgQmxvZwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpGcmVlZHJlbm8gbWFpbGluZyBsaXN0CkZyZWVkcmVub0BsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9mcmVlZHJlbm8K

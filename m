Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3B5539A03B
	for <lists+freedreno@lfdr.de>; Thu,  3 Jun 2021 13:52:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D35336EB09;
	Thu,  3 Jun 2021 11:52:40 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FC306EB09
 for <freedreno@lists.freedesktop.org>; Thu,  3 Jun 2021 11:52:38 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id m18so3244271wmq.0
 for <freedreno@lists.freedesktop.org>; Thu, 03 Jun 2021 04:52:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=Nxij94IMFMsp61zYWJS5XKMycKfWOvntSLUdgR9Luec=;
 b=PP1Vx2P7z4p7uzC7frRq63E4x3I08msTGMShcvAdEGFQwbgoSQLam6TY7qFtZnfrip
 sZ2vdZz58OMVJtBV+LV7UtfH3hRj1TGjasngZ2KltASWY+0UFk1GkCFvbmMy1zh8VBMP
 dPoAp8/Papp6e6Y9syxE5WTIn3EkF63IUFXhjOyvBnTk1EZXXSJ1zWN+ZFpLmyfRRgmV
 zaZeW5clEklapwp4mQNAksAoChe6wCnp4zD6/sK7bIoELjiqOV1BWj7Fd7qq0A12wR59
 YBj4xTZnnoKIwJpwtS8WL69eLi0TYKCyPQcOnDWAOzYthTaMGxq+z6P1knTVhENqAX1n
 l+Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=Nxij94IMFMsp61zYWJS5XKMycKfWOvntSLUdgR9Luec=;
 b=BdSqCrtM0FoH2Na4v+Xgplhybw2o7+vyfCXRLQoDziwFA7ZxnXceXjCmm46pAFHysK
 U631EwAdaAaQFzsUclTFfYBCkAI1v8YIkzK1BU1tVHZU7nLaIqk2WhWxvQ4fAFQyuNnf
 MGL2COIgpCczyitD1k/xIX+tEkfL2VFGziiNXwd3KuJ52qWTg9O+fci1+I8osAZog+KD
 kx+DmQFFNVxbuHPax64kAuFOKAxhq3v6O6VSoRzLGAsOU1SilV6pLoUEWZ7OT6oJxWyR
 W2mfxWM5XmIbfc1chbnTwOqOgzaK6HfoIt+2ArDRDpjJOfgsn6c7xxsYSO19Irt76/eN
 i0tQ==
X-Gm-Message-State: AOAM532O8mahHwLIQGp0YOvyZ1K9LFK72QiMy/a//KSvUEBTAXJm527Z
 yc2O4j1k3G3qHq2rXokjCWfvlA==
X-Google-Smtp-Source: ABdhPJy5Njm66nMjE/L6HCMm1K6dzFQlD8FyCcfSndwd7kIwe0+i4mO9AXShjFboYjDIKB2XcsUlUA==
X-Received: by 2002:a05:600c:4e8b:: with SMTP id
 f11mr4461550wmq.40.1622721157306; 
 Thu, 03 Jun 2021 04:52:37 -0700 (PDT)
Received: from dell ([91.110.221.214])
 by smtp.gmail.com with ESMTPSA id h9sm2479488wmb.35.2021.06.03.04.52.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jun 2021 04:52:36 -0700 (PDT)
Date: Thu, 3 Jun 2021 12:52:34 +0100
From: Lee Jones <lee.jones@linaro.org>
To: linux-kernel@vger.kernel.org, Adam Jackson <ajax@redhat.com>,
 Ajay Kumar <ajaykumar.rs@samsung.com>, Akshu Agarwal <akshua@gmail.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Alistair Popple <apopple@nvidia.com>, amd-gfx@lists.freedesktop.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Ben Skeggs <bskeggs@redhat.com>, Ben Widawsky <ben@bwidawsk.net>,
 Chandan Uddaraju <chandanu@codeaurora.org>,
 Christian Koenig <christian.koenig@amd.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Eric Anholt <eric@anholt.net>, Fabien Dessenne <fabien.dessenne@st.com>,
 freedreno@lists.freedesktop.org, Hans de Goede <hdegoede@redhat.com>,
 Harry Wentland <harry.wentland@amd.com>,
 Huang Rui <ray.huang@amd.com>, Hyun Kwon <hyun.kwon@xilinx.com>,
 Inki Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Krishna Manikandan <mkrishn@codeaurora.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Kuogee Hsieh <khsieh@codeaurora.org>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Leo Li <sunpeng.li@amd.com>, linaro-mm-sig@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Rossi <issor.oruam@gmail.com>,
 Michal Simek <michal.simek@xilinx.com>, nouveau@lists.freedesktop.org,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Rob Clark <robdclark@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Sean Paul <sean@poorly.run>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Stephen Boyd <swboyd@chromium.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Vincent Abriou <vincent.abriou@st.com>
Message-ID: <20210603115234.GA2435141@dell>
References: <20210602143300.2330146-1-lee.jones@linaro.org>
 <YLi+KJrLjKbdXLxH@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YLi+KJrLjKbdXLxH@phenom.ffwll.local>
Subject: Re: [Freedreno] [RESEND 00/26] Rid W=1 warnings from GPU
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

T24gVGh1LCAwMyBKdW4gMjAyMSwgRGFuaWVsIFZldHRlciB3cm90ZToKCj4gT24gV2VkLCBKdW4g
MDIsIDIwMjEgYXQgMDM6MzI6MzRQTSArMDEwMCwgTGVlIEpvbmVzIHdyb3RlOgo+ID4gU29tZSBv
ZmYgdGhlc2UgcGF0Y2hlcyBoYXZlIGJlZW4ga25vY2tpbmcgYXJvdW5kIGZvciBhIHdoaWxlLgo+
ID4gCj4gPiBXaG8gd2lsbCBob292ZXIgdGhlbSB1cCBwbGVhc2U/Cj4gPiAKPiA+IFRoaXMgc2V0
IGlzIHBhcnQgb2YgYSBsYXJnZXIgZWZmb3J0IGF0dGVtcHRpbmcgdG8gY2xlYW4tdXAgVz0xCj4g
PiBrZXJuZWwgYnVpbGRzLCB3aGljaCBhcmUgY3VycmVudGx5IG92ZXJ3aGVsbWluZ2x5IHJpZGRs
ZWQgd2l0aAo+ID4gbmlnZ2x5IGxpdHRsZSB3YXJuaW5ncy4KPiA+IAo+ID4gTGVlIEpvbmVzICgy
Nik6Cj4gPiAgIGRybS9tZWRpYXRlay9tdGtfZGlzcF9jb2xvcjogU3RyaXAgaW5jb3JyZWN0IGRv
YyBhbmQgZGVtb3RlIGhlYWRlcgo+ID4gICBkcm0vbWVkaWF0ZWsvbXRrX2Rpc3BfZ2FtbWE6IFN0
cmlwIGFuZCBkZW1vdGUgbm9uLWNvbmZvcm1hbnQKPiA+ICAgICBrZXJuZWwtZG9jIGhlYWRlcgo+
ID4gICBkcm0vbWVkaWF0ZWsvbXRrX2Rpc3Bfb3ZsOiBTdHJpcCBhbmQgZGVtb3RlIG5vbi1jb25m
b3JtYW50IGhlYWRlcgo+ID4gICBkcm0vbWVkaWF0ZWsvbXRrX2Rpc3BfcmRtYTogU3RyaXAgYW5k
IGRlbW90ZSBub24tY29uZm9ybWFudCBrZXJuZWwtZG9jCj4gPiAgICAgaGVhZGVyCj4gPiAgIGRy
bS9zdGkvc3RpX2hkbWlfdHgzZzRjMjhwaHk6IFByb3ZpZGUgZnVuY3Rpb24gbmFtZXMgZm9yIGtl
cm5lbC1kb2MKPiA+ICAgICBoZWFkZXJzCj4gPiAgIGRybS9zdGkvc3RpX2hkYTogUHJvdmlkZSBt
aXNzaW5nIGZ1bmN0aW9uIG5hbWVzCj4gPiAgIGRybS9zdGkvc3RpX3R2b3V0OiBQcm92aWRlIGEg
YnVuY2ggb2YgbWlzc2luZyBmdW5jdGlvbiBuYW1lcwo+ID4gICBkcm0vc3RpL3N0aV9ocXZkcDog
Rml4IGluY29ycmVjdGx5IG5hbWVkIGZ1bmN0aW9uICdzdGlfaHF2ZHBfdnRnX2NiKCknCj4gPiAg
IGRybS9tc20vZGlzcC9kcHUxL2RwdV9lbmNvZGVyX3BoeXNfY21kOiBSZW1vdmUgdW51c2VkIHZh
cmlhYmxlCj4gPiAgICAgJ2NtZF9lbmMnCj4gPiAgIGRybS9tc20vZGlzcC9kcHUxL2RwdV9od19p
bnRlcnJ1cHRzOiBEZW1vdGUgYSBidW5jaCBvZiBrZXJuZWwtZG9jCj4gPiAgICAgYWJ1c2VzCj4g
PiAgIGRybS9tc20vZGlzcC9kcHUxL2RwdV9wbGFuZTogRml4IGEgY291cGxlIG9mIG5hbWluZyBp
c3N1ZXMKPiA+ICAgZHJtL21zbS9tc21fZ2VtOiBEZW1vdGUga2VybmVsLWRvYyBhYnVzZXMKPiA+
ICAgZHJtL21zbS9kcC9kcF9jYXRhbG9nOiBDb3JyZWN0bHkgZG9jdW1lbnQgcGFyYW0gJ2RwX2Nh
dGFsb2cnCj4gPiAgIGRybS9tc20vZHAvZHBfbGluazogRml4IHNvbWUgcG90ZW50aWFsIGRvYy1y
b3QKPiA+ICAgZHJtL25vdXZlYXUvbnZrbS9zdWJkZXYvbWMvdHUxMDI6IE1ha2UgZnVuY3Rpb25z
IGNhbGxlZCBieSByZWZlcmVuY2UKPiA+ICAgICBzdGF0aWMKPiA+ICAgZHJtL2FtZC9kaXNwbGF5
L2RjL2RjZS9kY2VfdHJhbnNmb3JtOiBSZW1vdmUgc3VwZXJmbHVvdXMKPiA+ICAgICByZS1pbml0
aWFsaXNhdGlvbiBvZiBEQ0ZFX01FTV9MSUdIVF9TTEVFUF9DTlRMLAo+ID4gICBkcm0veGxueC96
eW5xbXBfZGlzcDogRml4IGluY29ycmVjdGx5IG5hbWVkIGVudW0KPiA+ICAgICAnenlucW1wX2Rp
c3BfbGF5ZXJfaWQnCj4gPiAgIGRybS94bG54L3p5bnFtcF9kcDogRml4IGluY29ycmVjdGx5IG5h
bWUgZnVuY3Rpb24gJ3p5bnFtcF9kcF90cmFpbigpJwo+ID4gICBkcm0vdHRtL3R0bV90dDogRGVt
b3RlIG5vbi1jb25mb3JtYW50IGtlcm5lbC1kb2MgaGVhZGVyCj4gPiAgIGRybS9wYW5lbC9wYW5l
bC1yYXNwYmVycnlwaS10b3VjaHNjcmVlbjogRGVtb3RlIGtlcm5lbC1kb2MgYWJ1c2UKPiA+ICAg
ZHJtL3BhbmVsL3BhbmVsLXNpdHJvbml4LXN0NzcwMTogRGVtb3RlIGtlcm5lbC1kb2MgYWJ1c2UK
PiA+ICAgZHJtL3ZnZW0vdmdlbV9kcnY6IFN0YW5kYXJkIGNvbW1lbnQgYmxvY2tzIHNob3VsZCBu
b3QgdXNlIGtlcm5lbC1kb2MKPiA+ICAgICBmb3JtYXQKPiA+ICAgZHJtL2V4eW5vcy9leHlub3M3
X2RybV9kZWNvbjogRml4IGluY29ycmVjdCBuYW1pbmcgb2YKPiA+ICAgICAnZGVjb25fc2hhZG93
X3Byb3RlY3Rfd2luKCknCj4gPiAgIGRybS9leHlub3MvZXh5bm9zX2RybV9pcHA6IEZpeCBkb2N1
bWVudGF0aW9uIGZvcgo+ID4gICAgICdleHlub3NfZHJtX2lwcF9nZXRfe2NhcHMscmVzfV9pb2N0
bCgpJwo+ID4gICBkcm0vdmJveHZpZGVvL2hnc21pX2Jhc2U6IFBsYWNlIGZ1bmN0aW9uIG5hbWVz
IGludG8gaGVhZGVycwo+ID4gICBkcm0vdmJveHZpZGVvL21vZGVzZXR0aW5nOiBQcm92aWRlIGZ1
bmN0aW9uIG5hbWVzIGZvciBwcm90b3R5cGUKPiA+ICAgICBoZWFkZXJzCj4gCj4gRXhjZXB0IGZv
ciBtc20gKFJvYiBDbGFyayBwcm9taXNlZCBvbiBpcmMgaGUnbGwgcGljayB0aGVtIHVwIGZvciA1
LjE0Cj4gc29vbikgYW5kIGFtZCAoQWxleCBpcyBvbiB0b3Agb2YgdGhpbmdzIEkgdGhpbmspIEkg
cGlja2VkIHRoZW0gYWxsIHVwIGFuZAo+IG1lcmdlZCBpbnRvIGRybS1taXNjLW5leHQuCgpTdXBl
cnN0YXIhICBUaGFua3MgRGFuaWVsLgoKLS0gCkxlZSBKb25lcyBb5p2O55C85pavXQpTZW5pb3Ig
VGVjaG5pY2FsIExlYWQgLSBEZXZlbG9wZXIgU2VydmljZXMKTGluYXJvLm9yZyDilIIgT3BlbiBz
b3VyY2Ugc29mdHdhcmUgZm9yIEFybSBTb0NzCkZvbGxvdyBMaW5hcm86IEZhY2Vib29rIHwgVHdp
dHRlciB8IEJsb2cKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KRnJlZWRyZW5vIG1haWxpbmcgbGlzdApGcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZnJlZWRyZW5v
Cg==

Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C1F5D57A4B7
	for <lists+freedreno@lfdr.de>; Tue, 19 Jul 2022 19:12:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A1DD8E9AD;
	Tue, 19 Jul 2022 17:12:23 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C83398E8BF
 for <freedreno@lists.freedesktop.org>; Tue, 19 Jul 2022 17:12:21 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id oy13so28355392ejb.1
 for <freedreno@lists.freedesktop.org>; Tue, 19 Jul 2022 10:12:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IH9J1HkJUDinkHiBrN0EE6fhsRqqhDII0J61LnPPg94=;
 b=ZQAX4R3A2RP5ePI8X1wnZBz/yY9Fp4N+5ElluUKxbZOSaqGLZi45cpgYwxewdTyBjy
 AtH3jrlwrayMjKxZMhtnAc4zgKV0KMlAX86PQ6qAz0sCIUIfKuP0ghevIzpbzJB2z2+g
 MeKjSieefdGX983+e3xeaMqLcqpDFdtvWZJvc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IH9J1HkJUDinkHiBrN0EE6fhsRqqhDII0J61LnPPg94=;
 b=mc4sp+SAYzpDM9ehtOLbGeSbZ+9OY/M5U/R3E0eUvteinjrl8h4O83sIglzzBKSkPn
 VOMxSB/yxE5YVMyyqpRlj+1QCY8GQYv1CycEdf5xskCjIcCM72NsWybcs7uBj1akS/JT
 +R9SdBV2pVgQsSi11nL0DrlE/pI0oUdNT4zJ6FYeYFKSzHiYc1hDKXCTh0yaOii5C0vn
 HL70RcAvNjYfsKnVxBUYUiGtlCVv+7yT6cx98d4p+oRTp4xTNJJx0mzHxKVQ7p00QXag
 xbEEGaBIrvw19FEBzqrRjBa72LZFXR4D/ScWqYNzYO58wCGxxYOZWQzJqyWpdow9BU21
 zrPA==
X-Gm-Message-State: AJIora+L5RNg38DedkYQtXUST2RbH0/9YZeU/mika+eby1DfstKJljJ1
 1+9ADbjYz8vI0PrM23CHCG1XrXLJqxvB2+jw
X-Google-Smtp-Source: AGRyM1t2xO9bDS/qQdPULi9B1MMnKGOdJ4oMhknhyh3w4kqUqkiO0p/eIOEEtJp3LA8m1uciXZtaJg==
X-Received: by 2002:a17:907:971c:b0:72b:83d2:aa7a with SMTP id
 jg28-20020a170907971c00b0072b83d2aa7amr31999492ejc.633.1658250740240; 
 Tue, 19 Jul 2022 10:12:20 -0700 (PDT)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com.
 [209.85.128.52]) by smtp.gmail.com with ESMTPSA id
 h3-20020a056402094300b0043aba618bf6sm11019794edz.80.2022.07.19.10.12.15
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Jul 2022 10:12:16 -0700 (PDT)
Received: by mail-wm1-f52.google.com with SMTP id
 f24-20020a1cc918000000b003a30178c022so10383877wmb.3
 for <freedreno@lists.freedesktop.org>; Tue, 19 Jul 2022 10:12:15 -0700 (PDT)
X-Received: by 2002:a05:600c:3ace:b0:3a0:4ea4:5f77 with SMTP id
 d14-20020a05600c3ace00b003a04ea45f77mr277678wms.57.1658250734635; Tue, 19 Jul
 2022 10:12:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220711092117.360797-1-dmitry.baryshkov@linaro.org>
 <20220711092117.360797-2-dmitry.baryshkov@linaro.org>
In-Reply-To: <20220711092117.360797-2-dmitry.baryshkov@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 19 Jul 2022 10:12:01 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WmGDS8sBq-3snuukFOUY+HKq_veoL2tgWf1-TbdUHzLg@mail.gmail.com>
Message-ID: <CAD=FV=WmGDS8sBq-3snuukFOUY+HKq_veoL2tgWf1-TbdUHzLg@mail.gmail.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [RFC PATCH v3 1/2] drm/bridge: ti-sn65dsi86: fetch
 bpc using drm_atomic_state
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
Cc: freedreno <freedreno@lists.freedesktop.org>,
 Daniel Vetter <daniel@ffwll.ch>, Sam Ravnborg <sam@ravnborg.org>,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 Robert Foss <robert.foss@linaro.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Stephen Boyd <swboyd@chromium.org>,
 Rob Clark <robdclark@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi,

On Mon, Jul 11, 2022 at 2:21 AM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> Rather than reading the pdata->connector directly, fetch the connector
> using drm_atomic_state. This allows us to make pdata->connector optional
> (and thus supporting DRM_BRIDGE_ATTACH_NO_CONNECTOR).
>
> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 22 ++++++++++++++++------
>  1 file changed, 16 insertions(+), 6 deletions(-)

Landed on drm-misc-next:

2dbeef82d14f drm/bridge: ti-sn65dsi86: fetch bpc using drm_atomic_state

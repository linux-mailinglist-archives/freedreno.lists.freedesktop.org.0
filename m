Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C0495708D0
	for <lists+freedreno@lfdr.de>; Mon, 11 Jul 2022 19:24:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C088F8EC54;
	Mon, 11 Jul 2022 17:24:01 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 536818BDD7
 for <freedreno@lists.freedesktop.org>; Mon, 11 Jul 2022 17:24:00 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id a9so9976462ejf.6
 for <freedreno@lists.freedesktop.org>; Mon, 11 Jul 2022 10:24:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Sw8gkUx8zCiOOcTJXnmfRDnj5fxg2VeQXfJ+u4gc5/4=;
 b=acvDDtc3nLB2RKkk9baYJ+3X9Tc/uc6EQ3Z+eK9dFjTK30Jzc4d572TluawWOu0Uvl
 xX7BvT1dhlxTq2DjFuBLbjO5niFHLbcy/ylswUeMuNHcUTJnry2cRSA7CiFhOoqbxT8R
 xDuNfuBAWBbEyWgwPaipg25EuKfxvBm4hVFSg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Sw8gkUx8zCiOOcTJXnmfRDnj5fxg2VeQXfJ+u4gc5/4=;
 b=JMS0q6VS7mr+vipwPSQsMyMso6fTySQFJ3Ez0m+QAKtZZOPkW42gyaVHzm2R3Sv9se
 pM8XGSM8c1IEXNZwWsjerNxKI+i9q0BKQi2Jjx4PJOUKe8G+1F5yT2zxKPVPPUI/vu9x
 3/e+//B9uqFg+uLTrUorPCMDPfr+zdqsmtTtyb2tdwI32Yo36BLjOTSDv/3CV1z5rzI5
 5u2wt9Ofa83tXXpbQ7j11A7o+FQaLLNf/KW1YXaTaOs7Tp2BroVhteF0KUSh+hZtOpfi
 JYSr30Z8PE+NNhaaQw3ZDC7EUGRcSFaQj/j2O079N2/EKTdChBvON54KhqcuqaWw4m77
 UtRA==
X-Gm-Message-State: AJIora+/rBTlEpvhqKM286p9KsE76WzyEDtat1EKkt0XOaBOZKUCHzpl
 rODxZOH3ecbewbNsvQ7QPWW7hpAW2wtGbx+NRMI=
X-Google-Smtp-Source: AGRyM1tqkotbot1bHlrZiRY0QqoPGlIR9g8qWtZFOkk94javHQyLxGqQniaQyGmssrjWptvyGcgnJQ==
X-Received: by 2002:a17:907:2848:b0:72b:5ba5:1db5 with SMTP id
 el8-20020a170907284800b0072b5ba51db5mr4834079ejc.703.1657560238860; 
 Mon, 11 Jul 2022 10:23:58 -0700 (PDT)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com.
 [209.85.128.52]) by smtp.gmail.com with ESMTPSA id
 f8-20020a50fc88000000b0043a8286a18csm4658429edq.30.2022.07.11.10.23.58
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Jul 2022 10:23:58 -0700 (PDT)
Received: by mail-wm1-f52.google.com with SMTP id ay25so3421919wmb.1
 for <freedreno@lists.freedesktop.org>; Mon, 11 Jul 2022 10:23:58 -0700 (PDT)
X-Received: by 2002:a05:600c:3d95:b0:3a2:e97b:f3ae with SMTP id
 bi21-20020a05600c3d9500b003a2e97bf3aemr4140499wmb.188.1657560237962; Mon, 11
 Jul 2022 10:23:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220711092117.360797-1-dmitry.baryshkov@linaro.org>
 <20220711092117.360797-3-dmitry.baryshkov@linaro.org>
In-Reply-To: <20220711092117.360797-3-dmitry.baryshkov@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 11 Jul 2022 10:23:46 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XQbP2OSf6vtPOQtuXajUOuQ9Vz7t7pmcSraSzcBJD2ig@mail.gmail.com>
Message-ID: <CAD=FV=XQbP2OSf6vtPOQtuXajUOuQ9Vz7t7pmcSraSzcBJD2ig@mail.gmail.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [RFC PATCH v3 2/2] drm/bridge: ti-sn65dsi86:
 support DRM_BRIDGE_ATTACH_NO_CONNECTOR
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
> Now as the driver does not depend on pdata->connector, add support for
> attaching the bridge with DRM_BRIDGE_ATTACH_NO_CONNECTOR.
>
> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 18 ++++++++----------
>  1 file changed, 8 insertions(+), 10 deletions(-)

 This has been on my list of annoyances for quite some time now. Most
excellent to have it fixed, thanks!

Reviewed-by: Douglas Anderson <dianders@chromium.org>

Tested together with patch #1.

Tested-by: Douglas Anderson <dianders@chromium.org>


Unless someone yells that there's a problem or someone beats me to it,
I'll plan to land in drm-misc-next sometime next week.

-Doug

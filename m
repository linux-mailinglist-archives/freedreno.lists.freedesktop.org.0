Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0293D686974
	for <lists+freedreno@lfdr.de>; Wed,  1 Feb 2023 16:02:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B209589D39;
	Wed,  1 Feb 2023 15:02:18 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-vs1-xe2f.google.com (mail-vs1-xe2f.google.com
 [IPv6:2607:f8b0:4864:20::e2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40AC910E3E1
 for <freedreno@lists.freedesktop.org>; Wed,  1 Feb 2023 09:51:24 +0000 (UTC)
Received: by mail-vs1-xe2f.google.com with SMTP id e9so11196573vsj.3
 for <freedreno@lists.freedesktop.org>; Wed, 01 Feb 2023 01:51:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=J/VlM7cprC4lMoay4b4iDq0wmzylPk+HkhDJk/zhG2Y=;
 b=H3SQNrssQf8a9mTT6XChvo0/W1NYkCLCBXshDml7DWgkvDYxMHwm3SC1Spd2lhiXKz
 uqQse5Gqzkvx46gI2HD/aq6q60VRJ1LYYGzlhCIW/bsZ8DqRa32+jqSw1NSfiXJZMPku
 FTTzBF0TKGM6zy3JEmmFBiESFxzq9OuUtyPPZEE4oynJCKrWauGmBcn23ItXCkhqRcJ6
 f0JUMeeVAzoFk5xR5dqiDz7wzkc3F+25pY+GVDVxJF2vz3hWnvytxNQ/XaxCVx9gTTnU
 bulEHDn9yZzFvHsawWaSIa/q66TkSaCCPty63/w5PoFd6gfWMVKsv128YlaS6NIp1lCv
 gyrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=J/VlM7cprC4lMoay4b4iDq0wmzylPk+HkhDJk/zhG2Y=;
 b=XE0NSdg2g3/xswE7oy6n0qLf28Rq66ITSj+vp7edYCSxXCN0THt6tDus9By/LqyF2w
 cwoRU33IG8gIHrumS38M/tYRpe28gME3pCxRhezBSo1yGG+/2uEdr3CSmDr4pKtg30dZ
 gqenyp3O6EM0hMWkOW0Y3Yv3n8LRbmQG8iy6wfMtigMBLZxxRAwc3tAAOVCoeRMnkYAk
 6U7xhW6wjc4/JagKxJywesT/JQ9ZPcK9JaqssSeWaPwhKviJ5b0D1OA+igMKs5HuX1fZ
 ucw4+C8hizx8djTINYa1Fy95VWUd106+wOY6gniU7FUKJD42PThzGkYNpXlzEk7WWpcg
 dINQ==
X-Gm-Message-State: AO0yUKUgny0zkdvkKeBr47mW8ukWsHn0rXaBtIFjhLS7sCU1AHeTMj+x
 HDv7LakBkJhLBttr+GBD3ed2TN1gHB3FuE7F0g4egw==
X-Google-Smtp-Source: AK7set86IzPhUo1uZ+cu7Tw/u3cqoDAPwj0LQna9LX1UbPlTaCnreZPgZXNal+QPDxwu/wJrvnP7JMh4zKK+BBpDqY8=
X-Received: by 2002:a05:6102:1609:b0:3ed:2cb7:5695 with SMTP id
 cu9-20020a056102160900b003ed2cb75695mr375015vsb.84.1675245083209; Wed, 01 Feb
 2023 01:51:23 -0800 (PST)
MIME-Version: 1.0
References: <20230131141756.RFT.v2.1.I723a3761d57ea60c5dd754c144aed6c3b2ea6f5a@changeid>
In-Reply-To: <20230131141756.RFT.v2.1.I723a3761d57ea60c5dd754c144aed6c3b2ea6f5a@changeid>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 1 Feb 2023 09:51:06 +0000
Message-ID: <CAPY8ntAUhVB6UtQTeHAcxNW950Ou+NcEoGwk3JnVWLay89_0Nw@mail.gmail.com>
To: Douglas Anderson <dianders@chromium.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Wed, 01 Feb 2023 15:02:17 +0000
Subject: Re: [Freedreno] [RFT PATCH v2 1/3] drm/bridge: tc358762: Set
 pre_enable_prev_first
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
Cc: Sean Paul <sean@poorly.run>, Neil Armstrong <neil.armstrong@linaro.org>,
 linux-kernel@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Stephen Boyd <swboyd@chromium.org>,
 Rob Clark <robdclark@gmail.com>, Vinod Koul <vkoul@kernel.org>,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org, Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Tue, 31 Jan 2023 at 22:22, Douglas Anderson <dianders@chromium.org> wrote:
>
> Set the "pre_enable_prev_first" as provided by commit 4fb912e5e190
> ("drm/bridge: Introduce pre_enable_prev_first to alter bridge init
> order"). This should allow us to revert commit ec7981e6c614
> ("drm/msm/dsi: don't powerup at modeset time for parade-ps8640") and
> commit 7d8e9a90509f ("drm/msm/dsi: move DSI host powerup to modeset
> time").

I see no reference in the TC358762 datasheet to requiring the DSI
interface to be in any particular state.
However, setting this flag does mean that the DSI host doesn't need to
power up and down for each host_transfer request from
tc358762_pre_enable/tc358762_init, so on that basis I'm good with it.

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
>
> (no changes since v1)
>
>  drivers/gpu/drm/bridge/tc358762.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/bridge/tc358762.c b/drivers/gpu/drm/bridge/tc358762.c
> index 0b6a28436885..77f7f7f54757 100644
> --- a/drivers/gpu/drm/bridge/tc358762.c
> +++ b/drivers/gpu/drm/bridge/tc358762.c
> @@ -229,6 +229,7 @@ static int tc358762_probe(struct mipi_dsi_device *dsi)
>         ctx->bridge.funcs = &tc358762_bridge_funcs;
>         ctx->bridge.type = DRM_MODE_CONNECTOR_DPI;
>         ctx->bridge.of_node = dev->of_node;
> +       ctx->bridge.pre_enable_prev_first = true;
>
>         drm_bridge_add(&ctx->bridge);
>
> --
> 2.39.1.456.gfc5497dd1b-goog
>

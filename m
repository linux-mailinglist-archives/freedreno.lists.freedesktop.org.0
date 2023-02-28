Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C02D66A50A7
	for <lists+freedreno@lfdr.de>; Tue, 28 Feb 2023 02:25:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95D6A10E5A3;
	Tue, 28 Feb 2023 01:25:29 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1408410E58A
 for <freedreno@lists.freedesktop.org>; Tue, 28 Feb 2023 01:25:28 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id z5so8520291ljc.8
 for <freedreno@lists.freedesktop.org>; Mon, 27 Feb 2023 17:25:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=KYhTvYPZzEGeLer7Re++n35w5MO/ZTMPUdgfAcWFn1w=;
 b=v42k3Bh9dpaRO9B1/X2b+EafrIJH25nyylYb9uEeTMHwUmeDxzFb2v1wOjsFhQZu2L
 +/lrdJ8bmA008gaVIAql6wsluwF4SQDvXmkILCEWCi4iyxCa5/NMzBJClkHhpAibUT/v
 c3ReZEazhCOQ+93Zy70u2uaWYIrmXbbF6M89ho0LVixs3Z7+moMkvSz3X1x/yuvTqPQa
 QVaJnLuOcvErKkgakWleHuoNCBE1HXjQOEv7JKQ23p8+QuVIaAdKqiwxF0RPO25i/fju
 /Ouvlha2GNxmRQDjrG2t7DI+PY/BqEy+3Q0h93dGKOM8Tz+dlmpsrsmpuo0pY/kEXpAU
 Cs1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KYhTvYPZzEGeLer7Re++n35w5MO/ZTMPUdgfAcWFn1w=;
 b=vSqdT93xQAp30O9k8WA2wk/S0GJ8YGk++gojSyF9m8MgBfhCbahV4a8K5IpUMld0jE
 I74cqZyCAiQSnmZ0fQD4064vrfNtbuG43Ek8Phg9qWMpz1q9Z+GVpXpDZ3JN7R1pPRJs
 /75TC/9GRGv5R+2DsRdGOBrc2Vm93u+jP6Fz+rLoyiPDJmXoyUAaShhL2mn6Z2xz3uDx
 Aq64ViSsw5peWEIzvrVcT/jC3hLcA34ubTUjBtk4HcytI0YZXKp9copDzE6T0Giph/cw
 sYcXlqtQy96La8/3R0w7lVefrfBhxf9zoSJ3PYNYp+PIQv2SqRqIUgAg7r5BZFWNqwJO
 Xa0Q==
X-Gm-Message-State: AO0yUKURFMDE6w5aLbIb4vR01cMfiXcOGCQXL7XbySi/Y+7l3+rVDCW0
 qgIgueLDmjrLcp9GeHYwcdqKFg==
X-Google-Smtp-Source: AK7set8HWt0poqpEBnvKA789YwYaRsFJySTc6+Gq7FqVYPdnZoSOcIZFSf8cJ9a6tUbKysL80soD+w==
X-Received: by 2002:a2e:8687:0:b0:295:9f20:bcdf with SMTP id
 l7-20020a2e8687000000b002959f20bcdfmr317412lji.9.1677547526235; 
 Mon, 27 Feb 2023 17:25:26 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 3-20020a2e0503000000b002959aecb63bsm977824ljf.53.2023.02.27.17.25.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Feb 2023 17:25:25 -0800 (PST)
Message-ID: <6d2a2647-9df7-5f32-20be-d54450e058b3@linaro.org>
Date: Tue, 28 Feb 2023 03:25:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Content-Language: en-GB
To: Douglas Anderson <dianders@chromium.org>,
 dri-devel@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20230131141756.RFT.v2.1.I723a3761d57ea60c5dd754c144aed6c3b2ea6f5a@changeid>
 <20230131141756.RFT.v2.2.I4cfeab9d0e07e98ead23dd0736ab4461e6c69002@changeid>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230131141756.RFT.v2.2.I4cfeab9d0e07e98ead23dd0736ab4461e6c69002@changeid>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [RFT PATCH v2 2/3] drm/msm/dsi: Stop
 unconditionally powering up DSI hosts at modeset
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
Cc: freedreno@lists.freedesktop.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Jonas Karlman <jonas@kwiboo.se>,
 linux-arm-msm@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>,
 linux-kernel@vger.kernel.org, Robert Foss <robert.foss@linaro.org>,
 Stephen Boyd <swboyd@chromium.org>, Vinod Koul <vkoul@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@gmail.com>, Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 01/02/2023 00:18, Douglas Anderson wrote:
> In commit 7d8e9a90509f ("drm/msm/dsi: move DSI host powerup to modeset
> time"), we moved powering up DSI hosts to modeset time. This wasn't
> because it was an elegant design, but there were no better options.
> 
> That commit actually ended up breaking ps8640, and thus was born
> commit ec7981e6c614 ("drm/msm/dsi: don't powerup at modeset time for
> parade-ps8640") as a temporary hack to un-break ps8640 by moving it to
> the old way of doing things. It turns out that ps8640 _really_ doesn't
> like its pre_enable() function to be called after
> dsi_mgr_bridge_power_on(). Specifically (from experimentation, not
> because I have any inside knowledge), it looks like the assertion of
> "RST#" in the ps8640 runtime resume handler seems like it's not
> allowed to happen after dsi_mgr_bridge_power_on()
> 
> Recently, Dave Stevenson's series landed allowing bridges some control
> over pre_enable ordering. The meaty commit for our purposes is commit
> 4fb912e5e190 ("drm/bridge: Introduce pre_enable_prev_first to alter
> bridge init order"). As documented by that series, if a bridge doesn't
> set "pre_enable_prev_first" then we should use the old ordering.
> 
> Now that we have the commit ("drm/bridge: tc358762: Set
> pre_enable_prev_first") we can go back to the old ordering, which also
> allows us to remove the ps8640 special case.
> 
> One last note is that even without reverting commit 7d8e9a90509f
> ("drm/msm/dsi: move DSI host powerup to modeset time"), if you _just_
> revert the ps8640 special case and try it out then it doesn't seem to
> fail anymore. I spent time bisecting / debugging this and it turns out
> to be mostly luck, so we still want this patch to make sure it's
> solid. Specifically the reason it sorta works these days is because
> we implemented wait_hpd_asserted() in ps8640 now, plus the magic of
> "pm_runtime" autosuspend. The fact that we have wait_hpd_asserted()
> implemented means that we actually power the bridge chip up just a wee
> bit earlier and then the bridge happens to stay on because of
> autosuspend and thus ends up powered before dsi_mgr_bridge_power_on().
> 
> Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry


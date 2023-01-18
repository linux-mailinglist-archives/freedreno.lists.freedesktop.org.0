Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18E28671F92
	for <lists+freedreno@lfdr.de>; Wed, 18 Jan 2023 15:29:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD7D410E75A;
	Wed, 18 Jan 2023 14:29:09 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9240310E759
 for <freedreno@lists.freedesktop.org>; Wed, 18 Jan 2023 14:29:08 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id n7so8053761wrx.5
 for <freedreno@lists.freedesktop.org>; Wed, 18 Jan 2023 06:29:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=09LIyEAsfHyV6itdPviPw1c0EfObZTYwVl/MwHc+r6E=;
 b=k77B8Dq/0i3dNdFxDgCz7T4Wvo6gSQE6HDNuur2soCGLRYCGcjW/trR85JsU7H+bnq
 XjIEPLgX8sf/xTvgxrjMgEcODCeDTXkf4vOBL4i+ew3FHL3e8683Aca+XDy1ppSaOf6v
 GtxJSyZWNrFnrAv4Y665fuTpPJylwE4cOHqKemAgity9QzyT9rHvjDiwAkOxgt57t1gE
 tNwV1paZV7IrSqqgUCzvXuLWxFbZ1EH1XDfD9NKENcMoTFD4jcfVCzu4XStRrIxfgSQ1
 msui37L9A+qZf/ZhRig/mReO2uWa/eGRanu9yv828s2ZbyAjl54z2oNqpmrjMgAyfQR0
 vc4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=09LIyEAsfHyV6itdPviPw1c0EfObZTYwVl/MwHc+r6E=;
 b=PnniGROSwiqBa/AlN8ZZAGhnB2ayBPTLkuZViaO4wT8/hvnV0b7reBWhARP7GG0ShD
 JD2FHU48qLTbuIkK65nJqisw/ZZuPTRAT7V2NkV83r0w6gtM8f66cwnO9p/1mr29l6mo
 1swe+2nfkR3vvlkWN0sAuK91KXYSGJqY1eBFOZUckb8YyG6OxRGWyx6HRcTvdg+7GyEo
 FWSiBhW3KilXjhzG/px2mApgXrizadAGIq8Fmj+FGK9P1uMM21v9Fy9ja/m6MpCCldwp
 7YeNVRVEg/oJaa+DHdbpnvivAGgfB/lclCTmbB9VvDkX8LY0SURPQSo78/1Pmj9L7sIV
 uehQ==
X-Gm-Message-State: AFqh2kqczeJR5le2SMXZTLHFHttq6P6gZD5XUcBim4IsH4GwfXizMe3J
 2efIGDknUKLrJE/lYhYoB4sg6Q==
X-Google-Smtp-Source: AMrXdXvEBACT5l6DQOfaEAh6nlZUakGz1hY8jze4RSkucPdQC3k1HthSlfOVYt12wGzg8tcckD+jmA==
X-Received: by 2002:a5d:68c9:0:b0:24f:11eb:2988 with SMTP id
 p9-20020a5d68c9000000b0024f11eb2988mr6721226wrw.71.1674052147066; 
 Wed, 18 Jan 2023 06:29:07 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 k18-20020adfb352000000b00241fab5a296sm32113556wrd.40.2023.01.18.06.29.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Jan 2023 06:29:06 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Vinod Koul <vkoul@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230118081658.2198520-1-dmitry.baryshkov@linaro.org>
References: <20230118081658.2198520-1-dmitry.baryshkov@linaro.org>
Message-Id: <167405214621.3985372.6039919953364691654.b4-ty@linaro.org>
Date: Wed, 18 Jan 2023 15:29:06 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.11.1
Subject: Re: [Freedreno] [PATCH 00/13] drm/bridge: lt9611: several fixes and
 improvements
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@gmail.com>,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi,

On Wed, 18 Jan 2023 10:16:45 +0200, Dmitry Baryshkov wrote:
> A series of patches to fix mode programming for the Lontium lt9611
> DSI-to-HDMI bridge (found e.g. on the Thundercomm RB3/Dragonboard845c
> platform).
> 
> Changes since v2:
>  - Rewrote mode_valid callback to be more explicit.
> 
> [...]

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next)

[01/13] drm/bridge: lt9611: fix sleep mode setup
        https://cgit.freedesktop.org/drm/drm-misc/commit/?id=ae2d329f104b75a0a78dcaded29fe6283289cdf9
[02/13] drm/bridge: lt9611: fix HPD reenablement
        https://cgit.freedesktop.org/drm/drm-misc/commit/?id=a7790f6bd38f3642b60ae3504a2c749135b89451
[03/13] drm/bridge: lt9611: fix polarity programming
        https://cgit.freedesktop.org/drm/drm-misc/commit/?id=0b157efa384ea417304b1da284ee2f603c607fc3
[04/13] drm/bridge: lt9611: fix programming of video modes
        https://cgit.freedesktop.org/drm/drm-misc/commit/?id=ad188aa47edaa033a270e1a3efae43836ff47569
[05/13] drm/bridge: lt9611: fix clock calculation
        https://cgit.freedesktop.org/drm/drm-misc/commit/?id=2576eb26494eb0509dd9ceb0cd27771a7a5e3674
[06/13] drm/bridge: lt9611: pass a pointer to the of node
        https://cgit.freedesktop.org/drm/drm-misc/commit/?id=b0a7f8736789935f62d6df32d441cdf05a5c05d2
[07/13] drm/bridge: lt9611: rework the mode_set function
        https://cgit.freedesktop.org/drm/drm-misc/commit/?id=fad97f2811933085adb3dc3b13b2e1cf985295b1
[08/13] drm/bridge: lt9611: attach to the next bridge
        https://cgit.freedesktop.org/drm/drm-misc/commit/?id=0c3997b0fec74a828ef258851e2fb260e3e7620c
[09/13] drm/bridge: lt9611: fix sync polarity for DVI output
        https://cgit.freedesktop.org/drm/drm-misc/commit/?id=0c7474694849b44cfdf4e22b41e8f3eb85d78709
[10/13] drm/bridge: lt9611: simplify video timings programming
        https://cgit.freedesktop.org/drm/drm-misc/commit/?id=6b089d5e35d6daf3d348a3fbd8974d4ed896a231
[11/13] drm/bridge: lt9611: rework infoframes handling
        https://cgit.freedesktop.org/drm/drm-misc/commit/?id=84cf74d99f88bc476678254310baffddfba68bb6
[12/13] drm/bridge: lt9611: stop filtering modes via the table
        https://cgit.freedesktop.org/drm/drm-misc/commit/?id=4914cbc4fbadf0a3bcad9b0b09b3d8005a3dcd9e
[13/13] drm/bridge: lt9611: properly program the dual host mode
        https://cgit.freedesktop.org/drm/drm-misc/commit/?id=5e83f359d9805b3561f160afafddfa7572155d1c

-- 
Neil

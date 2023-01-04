Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AD5AE65CF07
	for <lists+freedreno@lfdr.de>; Wed,  4 Jan 2023 10:05:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7867E10E4FF;
	Wed,  4 Jan 2023 09:05:17 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC74810E4FB
 for <freedreno@lists.freedesktop.org>; Wed,  4 Jan 2023 09:05:15 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id d4so24294806wrw.6
 for <freedreno@lists.freedesktop.org>; Wed, 04 Jan 2023 01:05:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:reply-to:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=Oh/3WXFSFZ0hbQjzT0wY1WPbHkqQz09XIIWq4ZAep2w=;
 b=au3qYRdxkd+Pnw8vRdyDDJWOWYDlno9bvShahUpf+1j8klY8orgnoiGxhME67dacVz
 Sth6yGYcr9PesvvYg6Z+BUXIlk+4Km/fPd0o/5b6TcYPx/7PXZCeU2uVCpDscDKnPVw4
 SYigY/Za0fQhgB1WVBXmEuYao8sXk7RoLZpF+bQ1FHMb4ZBg734TWTvbtmsmxVULge/k
 MzTu7qNGb2L/1oyfkl68j/HPHkO20A3ByV9J9WeFw5vlvx6s6WoIvGRPOVgZsYaiSjmW
 sc5muaYaolbQdN7qWIyD9YqMVDho3tbtOougF859U5CyENahMEIqrrS+sZbOlDL65iGz
 FzRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:reply-to:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Oh/3WXFSFZ0hbQjzT0wY1WPbHkqQz09XIIWq4ZAep2w=;
 b=dTG/QjcRXw1AIz1zc+qpd9eyCuwAcsIPYMIJfnAlY6S+Lm3W54FUNdRKXKMfREdbuH
 Xq7YO7fyiRDEUEXuWpxxUTM5gxYW5YJ6Nx12M30ugq3QFMUT/eHH8vs9/5i+x1LBNVsz
 SFU5Jf2k7/IM3FDP8PiI8WxZJyZk0NQfojTFmqO2pSfkgKTbxlmlBNr0yhsoxLF0jHa2
 hjMFNHzf7ajrRu6hJKYhBTquodD71UzHPRC3fgLyCzotVPDnW5YFZmGGO7yf5mjpyo5O
 TMBocmcMWQi8lM8hanPUySVd67vS4nGFG7jgKQbHVo0IaKSQ+Ds8B64JrXuQcO2Z+ORS
 YRGw==
X-Gm-Message-State: AFqh2kogXB5ovZednB1mXzsHoAwKgTF5ny8yfUd6AGlKGyIXTao7/X0L
 wsb8TKvH3dKZxi6k644NMxvS5A==
X-Google-Smtp-Source: AMrXdXvIewCX4EeMSX02Wkw8XHn6ezPRQLSYsFE2SwOY4i2xW5xgsMpir8LTo17gufD0ao4bY4b8gg==
X-Received: by 2002:a5d:4081:0:b0:27a:cc74:977c with SMTP id
 o1-20020a5d4081000000b0027acc74977cmr22472180wrp.70.1672823114213; 
 Wed, 04 Jan 2023 01:05:14 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:102f:89e:4a9f:68c?
 ([2a01:e0a:982:cbb0:102f:89e:4a9f:68c])
 by smtp.gmail.com with ESMTPSA id
 q8-20020adff788000000b0024258722a7fsm33852259wrp.37.2023.01.04.01.05.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Jan 2023 01:05:13 -0800 (PST)
Message-ID: <37e48125-072d-e55d-d997-67fd3796a779@linaro.org>
Date: Wed, 4 Jan 2023 10:05:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Content-Language: en-US
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
 Lucas Stach <l.stach@pengutronix.de>, Philipp Zabel
 <p.zabel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20221102180705.459294-1-dmitry.baryshkov@linaro.org>
 <362452c5-8858-9ac5-e0ca-8ff993e966b7@linaro.org>
 <baa8df6b-ecd4-6df8-9fb5-6a3a39e1a04f@ideasonboard.com>
From: Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <baa8df6b-ecd4-6df8-9fb5-6a3a39e1a04f@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] [PATCH v3 0/7] drm/bridge_connector: perform HPD
 enablement automatically
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
Reply-To: neil.armstrong@linaro.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 04/01/2023 08:29, Tomi Valkeinen wrote:
> On 28/12/2022 23:58, Dmitry Baryshkov wrote:
>> On 02/11/2022 20:06, Dmitry Baryshkov wrote:
>>>  From all the drivers using drm_bridge_connector only iMX/dcss and OMAP
>>> DRM driver do a proper work of calling
>>> drm_bridge_connector_en/disable_hpd() in right places. Rather than
>>> teaching each and every driver how to properly handle
>>> drm_bridge_connector's HPD, make that automatic.
>>>
>>> Add two additional drm_connector helper funcs: enable_hpd() and
>>> disable_hpd(). Make drm_kms_helper_poll_* functions call them (as this
>>> is the time where the drm_bridge_connector's functions are called by the
>>> drivers too).
>>
>> Since we are at the beginning of the development window, gracious ping for this patchset.
>>
>> It would be nice to finally handle the bridge_connector's hpd properly. Calling drm_bridge_connector_enable_hpd() from drm_bridge_connector_init() is not a proper way to do this. It results in calling bridge->funcs->hpd_enable() before the rest of the pipeline was set up properly.
> 
> For the series:
> 
> Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> 
> I've been using this series in my local branch for quite a while to fix the HPD issues. Works for me.
> 
> I still think the "fix" aspect should be highlighted more here, as the current upstream triggers a WARN for "Hot plug detection already enabled" (at least) on OMAP.

LGTM then !

Tomi, Dmitry, I can push the whole serie via drm-misc-next or -fixes then, as you wish.

Neil

> 
>   Tomi
> 


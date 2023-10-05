Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B19597BAEEE
	for <lists+freedreno@lfdr.de>; Fri,  6 Oct 2023 00:42:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33C3810E4A0;
	Thu,  5 Oct 2023 22:42:48 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73E1610E4A0
 for <freedreno@lists.freedesktop.org>; Thu,  5 Oct 2023 22:42:46 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-503f39d3236so1886992e87.0
 for <freedreno@lists.freedesktop.org>; Thu, 05 Oct 2023 15:42:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696545764; x=1697150564; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=J55C2DECva8x20ZCPV5VaEapm9sYZn6cEu2d8qLrjfw=;
 b=Wb7E7geWyPj96DHf/5J8N2F/YQSi1EEQC4ehEfThU8gwjHxlSLGW4NZdrqEY1UYdBh
 MFbnhJ2a+q91M4+mlOZ6Ppw0UnaDE4xKIJqaILIRLqSOdpknOF1AQDe05qxXOQj3V8N8
 Uyw+mbhFtR1+n7T3dZZNh25m/Y2djImjVDpl/Rpm8yEt1pebGnnkQqdzAmkblZcjEK3l
 FpYBDx+BHUgpsAjxcnyleefBz26PlRizNTlp7wRqMcV4GDm4tX1cwgPFFX3ClLbDX6Ec
 IeQ5l1PqAN6DtpVo0bIY7ZBPCT0mc3U8uDghGUNXZCTXEXiA6FqnAY310b54jwLwGkWq
 oV2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696545764; x=1697150564;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=J55C2DECva8x20ZCPV5VaEapm9sYZn6cEu2d8qLrjfw=;
 b=eOZr+mqd5Do3WJUTw1Y2o56CGsaEfWZ3QyKTUC09Dffkx0cyJeFahk4ASUOW+aJB3d
 JLU+sjhrIUdSG8zwIxeh8H2YHAtWX1J04bD7gvGAa/DfM4i2C632e3LV7ed+hZg/RKf7
 /jRu91KklH0/VQV+AMRjrj0t4OKoL2KszfOabUIOoG1xqBnkWS3OSIlyp6E0htndQVnO
 gzf2ZMI2i0DmO6mhxpcxMwudEWtnWZSGZztptQtvEGCrRkx0093tpoArVw7bGzFct7cE
 xLMI6IX0+u+N67ZsDqXdRTdVwVXYgrsdsvVOOGcm2yj4Wc61FaCTh58lJtw+sDRAEhJw
 aSIA==
X-Gm-Message-State: AOJu0YxyASddvKhk4uXcvRCO/5wdlnEYaqUM5QpmpNn44DpnzwTJA/Bv
 qORWURt4rDUo4xd1QTjUkADaFQ==
X-Google-Smtp-Source: AGHT+IGEkk1/dB0O8kz/B/IOyEVgYrzdTBNr3I5VSfV7uBhvhWf6AWTlOwegLw3Kr7Ps7P1/Hd7iEA==
X-Received: by 2002:a05:6512:2512:b0:4fb:740a:81ae with SMTP id
 be18-20020a056512251200b004fb740a81aemr6924452lfb.16.1696545764617; 
 Thu, 05 Oct 2023 15:42:44 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 d24-20020ac25458000000b005009b979e3dsm31121lfn.303.2023.10.05.15.42.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Oct 2023 15:42:44 -0700 (PDT)
Message-ID: <77b410f5-93a2-48be-a0d4-2053f280bc8b@linaro.org>
Date: Fri, 6 Oct 2023 01:42:43 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Stephen Boyd <swboyd@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20230906181226.2198441-1-swboyd@chromium.org>
 <20230906181226.2198441-3-swboyd@chromium.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230906181226.2198441-3-swboyd@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH 2/2] drm/msm/dp: Remove error message when
 downstream port not connected
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
Cc: Sean Paul <sean@poorly.run>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Vinod Polimera <quic_vpolimer@quicinc.com>,
 patches@lists.linux.dev, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 06/09/2023 21:12, Stephen Boyd wrote:
> Plugging in an Apple dongle without the HDMI cable attached prints out
> an error message in the kernel logs when nothing is actually wrong.
> 
>     no downstream ports connected
> 
> This is because the downstream port for the HDMI connector is not
> connected, so the Apple dongle reports that as a zero sink count device.
> 
> Cc: Vinod Polimera <quic_vpolimer@quicinc.com>
> Cc: Kuogee Hsieh <quic_khsieh@quicinc.com>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
>   drivers/gpu/drm/msm/dp/dp_panel.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
> index 97ba41593820..ae778e1a6fd0 100644
> --- a/drivers/gpu/drm/msm/dp/dp_panel.c
> +++ b/drivers/gpu/drm/msm/dp/dp_panel.c
> @@ -156,7 +156,6 @@ int dp_panel_read_sink_caps(struct dp_panel *dp_panel,
>   	if (drm_dp_is_branch(dp_panel->dpcd)) {
>   		count = drm_dp_read_sink_count(panel->aux);
>   		if (!count) {
> -			DRM_ERROR("no downstream ports connected\n");

Maybe this can be converted to drm_dbg_dp?

>   			panel->link->sink_count = 0;
>   			return -ENOTCONN;
>   		}

-- 
With best wishes
Dmitry


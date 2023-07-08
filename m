Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 35F7174BA97
	for <lists+freedreno@lfdr.de>; Sat,  8 Jul 2023 02:34:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9CDC10E63A;
	Sat,  8 Jul 2023 00:34:19 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D42010E637
 for <freedreno@lists.freedesktop.org>; Sat,  8 Jul 2023 00:34:18 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-4f954d7309fso3129736e87.1
 for <freedreno@lists.freedesktop.org>; Fri, 07 Jul 2023 17:34:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688776456; x=1691368456;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mFeoEp95ns5po24iiOVjiBNQNFUg9MGx4urbNtotoYk=;
 b=lcKcuhFKfOWAx1X+tnOMJ+K1D/sCCoVbGIOhFMwhknnb/8pqXuF2YhWbV/pys9Rp09
 Lv7x0nKnmuvmEuHjh0YoncUHPPFHpScRIu0vyR1sKETI6Cqz8Q5IQWpr7BW8kp58YPAe
 IISv3vsmHut08KnAs0LqucTYg3fSyt73QMEGLiEnGLextm0RU5KgGI5FaaCZxrSp5H1H
 UtD94PJBIW8PVN8tPVm8fp4GYR2LJSmcEfuSkUh3/Cwt6BXZ63l+6eiyPv8PCvJ2g0EU
 lBtAk14Iabxhtv+4nJxJYna2sxUjkAFRu2L5wI5FnfLk2HdMG741BJLfQ5HKwXeMlQdq
 SVpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688776456; x=1691368456;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mFeoEp95ns5po24iiOVjiBNQNFUg9MGx4urbNtotoYk=;
 b=fbgEAZXw2s1Lgkq3ELQnmuKHwaNdaAdfy61qqmGV5xezaQHScAsU4q3umTVxgQnLGQ
 8Ssfkht+ntAn2+JXjLaYZyknZIX2crFAx10Dbo3Cbcy46jh0vXNBmynPCQzMdHK2z8Ay
 uk5QZyEDvbEObUyjsdiW7zOjlh7gkVR5hFhssy8jM/dDFypKsh45RmaCt/NEEd+dnRKB
 mYAUUchxkHJ427/zZuuSUfIqYG8INS143g5jiMSGc7kA+ysQe8BkilRa0H7bgJUvnLRE
 5GLNv1t+R2Yd6ov9cm8dxu4hpBXqLHPDL3WPQbjhxSP4OmgMvu46UkXuBFAnrigovp9h
 6ICA==
X-Gm-Message-State: ABy/qLYVe8qnvO+tcXdxPh6aNE7E9q/EQYNsYx+hla5i05MNsfeDLIOv
 ne8oev2DsdaQk+BdawHsDsusvA==
X-Google-Smtp-Source: APBJJlFbdvCfGi2vZqiZbjD944cuLiAoEpBvFyZSDs0zlNPAC2fiTrifdrhglBDLo1qz4kPYAT7OgQ==
X-Received: by 2002:a19:4f48:0:b0:4f8:5ede:d453 with SMTP id
 a8-20020a194f48000000b004f85eded453mr2142516lfk.23.1688776456101; 
 Fri, 07 Jul 2023 17:34:16 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 j16-20020ac25510000000b004fbb20791f3sm861038lfk.31.2023.07.07.17.34.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Jul 2023 17:34:15 -0700 (PDT)
Message-ID: <b70e6e98-e5a8-71d7-891a-889c268a7e06@linaro.org>
Date: Sat, 8 Jul 2023 03:34:15 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-GB
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, dri-devel@lists.freedesktop.org,
 robdclark@gmail.com, sean@poorly.run, swboyd@chromium.org,
 dianders@chromium.org, vkoul@kernel.org, daniel@ffwll.ch, airlied@gmail.com,
 agross@kernel.org, andersson@kernel.org
References: <1688773943-3887-1-git-send-email-quic_khsieh@quicinc.com>
 <1688773943-3887-4-git-send-email-quic_khsieh@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1688773943-3887-4-git-send-email-quic_khsieh@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v1 3/5] drm/msm/dp: delete EV_HPD_INIT_SETUP
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
Cc: quic_sbillaka@quicinc.com, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, linux-kernel@vger.kernel.org,
 marijn.suijten@somainline.org, quic_jesszhan@quicinc.com,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 08/07/2023 02:52, Kuogee Hsieh wrote:
> EV_HPD_INIT_SETUP flag is used to trigger the initialization of external
> DP host controller. Since external DP host controller initialization had
> been incorporated into pm_runtime_resume(), this flag become obsolete.
> Lets get rid of it.

And another question. Between patches #2 and #3 we have both INIT_SETUP 
event and the PM doing dp_display_host_init(). Will it work correctly?

> 
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>   drivers/gpu/drm/msm/dp/dp_display.c | 12 ------------
>   1 file changed, 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 2c5706a..44580c2 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -55,7 +55,6 @@ enum {
>   enum {
>   	EV_NO_EVENT,
>   	/* hpd events */
> -	EV_HPD_INIT_SETUP,
>   	EV_HPD_PLUG_INT,
>   	EV_IRQ_HPD_INT,
>   	EV_HPD_UNPLUG_INT,
> @@ -1119,9 +1118,6 @@ static int hpd_event_thread(void *data)
>   		spin_unlock_irqrestore(&dp_priv->event_lock, flag);
>   
>   		switch (todo->event_id) {
> -		case EV_HPD_INIT_SETUP:
> -			dp_display_host_init(dp_priv);
> -			break;
>   		case EV_HPD_PLUG_INT:
>   			dp_hpd_plug_handle(dp_priv, todo->data);
>   			break;
> @@ -1483,15 +1479,7 @@ void __exit msm_dp_unregister(void)
>   
>   void msm_dp_irq_postinstall(struct msm_dp *dp_display)
>   {
> -	struct dp_display_private *dp;
> -
> -	if (!dp_display)
> -		return;
> -
> -	dp = container_of(dp_display, struct dp_display_private, dp_display);
>   
> -	if (!dp_display->is_edp)
> -		dp_add_event(dp, EV_HPD_INIT_SETUP, 0, 0);
>   }
>   
>   bool msm_dp_wide_bus_available(const struct msm_dp *dp_display)

-- 
With best wishes
Dmitry


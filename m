Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D24B51AD0F
	for <lists+freedreno@lfdr.de>; Wed,  4 May 2022 20:38:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D981D10EA5E;
	Wed,  4 May 2022 18:38:09 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C693710EA40
 for <freedreno@lists.freedesktop.org>; Wed,  4 May 2022 18:38:08 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id p10so3806441lfa.12
 for <freedreno@lists.freedesktop.org>; Wed, 04 May 2022 11:38:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=VDj+h4V23SXKlruYDD3RGIbbcHLL5wjAWDq/F5foLqE=;
 b=fxjXjRbPxX0+juWMAepDKZlUcCaSCPxxuzNTXL/t1cwBxfS5s2tjysAoHlG3Z67/7R
 XL2oup6dBfxm30lTRgo8OIwVvvc3Wey04GuG7Vb/BzbHV9UwXBemXCx5r2q6SqEAqeEU
 D9vmaG0dBfIjkmy51e5WuulFFGzZ6A/ZTJDV1vQbEiBil8Up9kTCSI2yPBj/jPtV4ZT3
 OeV0t8JKfTeTvqiCBUVYCb6xBarrjSwc+726v+pjx1/wKJS2WyK3HVpGymESkVavXbMg
 BM1/r/DDv2pCN+hcuanvYGk/YgHOCr5bcy6DFbmISlx+GYBjpT5NZ6l1mlj4J8qDjXus
 1KmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=VDj+h4V23SXKlruYDD3RGIbbcHLL5wjAWDq/F5foLqE=;
 b=lnBVUnbrrDVLJAGyadewME2mWvZFZ2GWscifeeVewSbg1vf6fXVVHxs8ayDT2nUiUw
 0YoHc5mVXiv6E8UeJb/Cmy5nThR1PuDdZuqZp67byVpnNjpYfpzSYkLJTJQDraAZ8GUe
 ZQenDTBBWdr2lG3ekaWuIeji1VVnE2a6MKuiuphNjKPv4wt5m8IUsZKTpVyjzZiZ5YsF
 pTS3r3xPiuZgVPxg+kuAo+Ln20k99cl3HXEAiaQhK0R9nXAhLX5wgeptvBDR4aqURz9B
 TYiUOvTokI/Z71/HdMT+W/g6qZ5fQbJG5b8UQgmrGN7wwDn9xXx+4qanC2VokzZtbsPu
 pkxQ==
X-Gm-Message-State: AOAM533d8sVndk7z39imksXtHpNAUhUGUeEYUocdAEud28CIW0qeJC6R
 chzBJdsKWR3+vdrLPV2wMJvSIA==
X-Google-Smtp-Source: ABdhPJyI5erUXW0RKxsHAT4wZDIOhnHXaMT1ZI70tUjd1MU7r4fGr09Jg5RPwZvekympeq5jP9071g==
X-Received: by 2002:a05:6512:22cf:b0:473:a41f:155f with SMTP id
 g15-20020a05651222cf00b00473a41f155fmr7171873lfu.227.1651689487107; 
 Wed, 04 May 2022 11:38:07 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 y20-20020ac24214000000b0047255d21168sm1270671lfh.151.2022.05.04.11.38.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 May 2022 11:38:06 -0700 (PDT)
Message-ID: <834eeda0-12b0-3f16-8ca2-89175c1de186@linaro.org>
Date: Wed, 4 May 2022 21:38:05 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-GB
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, robdclark@gmail.com,
 sean@poorly.run, swboyd@chromium.org, dianders@chromium.org,
 vkoul@kernel.org, daniel@ffwll.ch, airlied@linux.ie, agross@kernel.org,
 bjorn.andersson@linaro.org
References: <1651595136-24312-1-git-send-email-quic_khsieh@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1651595136-24312-1-git-send-email-quic_khsieh@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v3] drm/msm/dp: fix event thread stuck in
 wait_event after kthread_stop()
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
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, quic_aravindh@quicinc.com,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 03/05/2022 19:25, Kuogee Hsieh wrote:
> Event thread supposed to exit from its while loop after kthread_stop().
> However there may has possibility that event thread is pending in the
> middle of wait_event due to condition checking never become true.
> To make sure event thread exit its loop after kthread_stop(), this
> patch OR kthread_should_stop() into wait_event's condition checking
> so that event thread will exit its loop after kernal_stop().
> 
> Changes in v2:
> --  correct spelling error at commit title
> 
> Changes in v3:
> -- remove unnecessary parenthesis
> -- while(1) to replace while (!kthread_should_stop())
> 
> Reported-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Fixes: 570d3e5d28db ("drm/msm/dp: stop event kernel thread when DP unbind")
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>

Let's do it properly:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   drivers/gpu/drm/msm/dp/dp_display.c | 13 +++++++++----
>   1 file changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index c388323..da5c03a 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -1103,15 +1103,20 @@ static int hpd_event_thread(void *data)
>   
>   	dp_priv = (struct dp_display_private *)data;
>   
> -	while (!kthread_should_stop()) {
> +	while (1) {
>   		if (timeout_mode) {
>   			wait_event_timeout(dp_priv->event_q,
> -				(dp_priv->event_pndx == dp_priv->event_gndx),
> -						EVENT_TIMEOUT);
> +				(dp_priv->event_pndx == dp_priv->event_gndx) ||
> +					kthread_should_stop(), EVENT_TIMEOUT);
>   		} else {
>   			wait_event_interruptible(dp_priv->event_q,
> -				(dp_priv->event_pndx != dp_priv->event_gndx));
> +				(dp_priv->event_pndx != dp_priv->event_gndx) ||
> +					kthread_should_stop());
>   		}
> +
> +		if (kthread_should_stop())
> +			break;
> +
>   		spin_lock_irqsave(&dp_priv->event_lock, flag);
>   		todo = &dp_priv->event_list[dp_priv->event_gndx];
>   		if (todo->delay) {


-- 
With best wishes
Dmitry

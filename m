Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 94C2452C32F
	for <lists+freedreno@lfdr.de>; Wed, 18 May 2022 21:20:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1142810EC31;
	Wed, 18 May 2022 19:20:22 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7632710EB97
 for <freedreno@lists.freedesktop.org>; Wed, 18 May 2022 19:20:20 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id d15so5326960lfk.5
 for <freedreno@lists.freedesktop.org>; Wed, 18 May 2022 12:20:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=0L/FNTLYazFc9GR438CvVRajnH///iO8Ms9EgsVnn/8=;
 b=Ko40aNSPAlKJB7VuMUGtV+fRHGF55+Tx67dBvUvqIv9eO7XTGL/Np8DRblcp2iCB4L
 z/yQGIx8nbDOGwvIN4sXt0aqtPZtljeabhHi4aVURUCKMG6ogyvMVone3oEEpuGcRf7D
 sAf6Lg7Yhc/t55gD6BXGm8FlQtAvDyN4l7tIpQG03N2hplpMaZ6o/CnKV4SRxLvpQ7iO
 TyzusJYkpXX38EwDRdUqDubA/9MK6NEGxRyshxTXioGHxb5GOgoi+RGa/9H6kc1X0K67
 3R53G3dvRERS2n/2YaBpZbpA6QqDzXCZDyPb5Wi1J35dwgPcw1ohMf+3gPDTbkfFOB0q
 +61Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=0L/FNTLYazFc9GR438CvVRajnH///iO8Ms9EgsVnn/8=;
 b=uKdMbZsaBoAGTW5tIhuLEVhJvFWLVuHLavUM6bbuHYVcjj937y6UkMu6vUi7dnGA5B
 n99fW2BNp8PXbCLKuiD/5LVjFWp2vJ6RGkqu4nbUmoMOJjQwkOIx+N29DZo2SdJ9o5/C
 Q+G0MDYGISgKnhPaXJSTblbn2KFCm9FXJ3tr0anKugts3C9befOBOOzHrwgVwP+aFsQE
 DTnjkpRHnm2t/IBOnKpExcX4q/Arh/H1JlUzpW1SDlERM4e3/9SKEfL2xYswoJ8paF25
 6TmrOyHAqGpQ8Qg3DK9zw9qaaRsmlV7ozP3HAp507YGI9Qp47TkOoR9M1NgK5ELZvQp4
 esHA==
X-Gm-Message-State: AOAM531O23VvC/L9T3wDqzZxSDBuP4LAgWk9RXxWZTaIE41drU3ZUYvk
 QedVzkQCla4xNnTUuePJqAM8Zg==
X-Google-Smtp-Source: ABdhPJx2TQQftncTAAwU+1FFE41NG8tqtmCVZDhL0EBWiEeb9IHiOOtytuFkHTOX+4gDIqviyVKSjg==
X-Received: by 2002:ac2:5229:0:b0:476:7a25:374c with SMTP id
 i9-20020ac25229000000b004767a25374cmr667370lfl.97.1652901618816; 
 Wed, 18 May 2022 12:20:18 -0700 (PDT)
Received: from ?IPV6:2001:470:dd84:abc0::8a5? ([2001:470:dd84:abc0::8a5])
 by smtp.gmail.com with ESMTPSA id
 189-20020a2e09c6000000b00251fcb946d2sm296691ljj.119.2022.05.18.12.20.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 May 2022 12:20:18 -0700 (PDT)
Message-ID: <7020a5e1-0579-abba-5e43-7d12f42d62b5@linaro.org>
Date: Wed, 18 May 2022 22:20:17 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-GB
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, freedreno@lists.freedesktop.org
References: <20220513225959.19004-1-quic_abhinavk@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220513225959.19004-1-quic_abhinavk@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH] drm/msm/dpu: limit writeback modes
 according to max_linewidth
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
Cc: dri-devel@lists.freedesktop.org, swboyd@chromium.org, robdclark@gmail.com,
 seanpaul@chromium.org, daniel@ffwll.ch, quic_jesszhan@quicinc.com,
 quic_aravindh@quicinc.com, quic_khsieh@quicinc.com
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 14/05/2022 01:59, Abhinav Kumar wrote:
> Writeback modes were being added according to mode_config.max_width
> but this is assigned to double of max_mixer_width.
> 
> For compositors/clients using a single SSPP, this will fail
> the dpu_plane's atomic check as it checks for max_linewidth.
> 
> Limit writeback modes according to max_linewidth to allow
> even compositors/clients which use only a single SSPP to
> use writeback.
> 
> Fixes: 77b001acdcfeb ("drm/msm/dpu: add the writeback connector layer")
> Reported-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
> index 7620ffe55779..399115e4e217 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
> @@ -8,8 +8,10 @@
>   static int dpu_wb_conn_get_modes(struct drm_connector *connector)
>   {
>   	struct drm_device *dev = connector->dev;
> +	struct msm_drm_private *priv = dev->dev_private;
> +	struct dpu_kms *dpu_kms = to_dpu_kms(priv->kms);
>   
> -	return drm_add_modes_noedid(connector, dev->mode_config.max_width,
> +	return drm_add_modes_noedid(connector, dpu_kms->catalog->caps->max_linewidth,
>   			dev->mode_config.max_height);
>   }
>   


-- 
With best wishes
Dmitry

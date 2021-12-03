Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6839C467E88
	for <lists+freedreno@lfdr.de>; Fri,  3 Dec 2021 20:56:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A2A57BF2E;
	Fri,  3 Dec 2021 19:56:07 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 224577BF44
 for <freedreno@lists.freedesktop.org>; Fri,  3 Dec 2021 19:56:06 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id z7so8981312lfi.11
 for <freedreno@lists.freedesktop.org>; Fri, 03 Dec 2021 11:56:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=4H1eLBe9s1nmrKvhDjTG1XwavkNeAlMoDJHIJMpv0no=;
 b=RbgtGg0doc7ir1YCobj16fQLUkabnCClY11jyx/+4tLpMP6pKWDYot2dM4TuVXxZ2K
 rEfbcpD9qpgM3ANOhJ7TvPCYpIy6KYfQ2VtUrPDd6Wf+2h+RJiprwZlh8IYuAAklbnhC
 OH3e8MXAXahyh+C1iJRhimxhBvEi+YdAQnTB2FzZjdj4FJd18rXVY7tUTfRwCcYI9y0r
 haLAzIwAfWsgqh2vS3tFwEvEmHL7VMqLj5U76YL4Zo5eft9u0MV21WHWHMlvZt++KnlS
 pcCxsCLf6PBddzhht1uhQ9F6nb4bUqfjeds/gFHEdD9vb1q0WKLha+Z1QLlCx/9m8/8e
 +oTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=4H1eLBe9s1nmrKvhDjTG1XwavkNeAlMoDJHIJMpv0no=;
 b=LfSRkyfxkDmo0FU8ZEoDft1WCePPG+4k+bGUtygYDc28nxSM73TzaGEiE5Ni4qfEHj
 HReO7A2BKgU0/TG+XDP+MME1mejojsUwwFrwY3a2TAthtxaOB1GKtyWI9rNReu+I6QSj
 AHmamI4lMNXhMm176Mp4YbEFmFSABTHq6RxdNBRw2sA8RX9yRrHbEoG2rkrn44gxXdnl
 4+uY3iVAyuBsRaWJ+/w326OfXFULfWPDtEvr8FJEzK8erxFYVcwY0cokV3SNpgGly3j/
 JoVyR0J5u9DZPzP+xzn1Ma83BoDyDj8l5dSchH0LYdQuelAgkh5XEIUEOPAKHJfCDUlP
 WH+g==
X-Gm-Message-State: AOAM531V/KlPqM4WiughNL38QZO1PujnMopCcpMLHQfiVzj0iN3nnpDU
 ecNBeRIyh/WFIC6RqlrWW3BAZA==
X-Google-Smtp-Source: ABdhPJz93t7RN7l+dTqaVu2whsjRuX7bGg6LHYB05B+CsJzLMSvM4jypLNKNMW36naHc+f0JvzNARA==
X-Received: by 2002:a05:6512:2350:: with SMTP id
 p16mr20243657lfu.482.1638561364332; 
 Fri, 03 Dec 2021 11:56:04 -0800 (PST)
Received: from [192.168.1.8] ([185.24.52.156])
 by smtp.gmail.com with ESMTPSA id j2sm482692lfr.109.2021.12.03.11.56.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Dec 2021 11:56:03 -0800 (PST)
Message-ID: <234f41de-f34e-53ba-cf7e-e27f2bb21b6c@linaro.org>
Date: Fri, 3 Dec 2021 22:56:02 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Content-Language: en-GB
To: Ameer Hamza <amhamza.mgc@gmail.com>, robdclark@gmail.com,
 sean@poorly.run, quic_abhinavk@quicinc.com, airlied@linux.ie, daniel@ffwll.ch
References: <ffdf9007-d2cc-2437-684c-66c00bb0ceda@linaro.org>
 <20211203193253.108813-1-amhamza.mgc@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20211203193253.108813-1-amhamza.mgc@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v2] drm/msm/dpu: removed logically dead code
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 03/12/2021 22:32, Ameer Hamza wrote:
> Fixed coverity warning by removing the dead code
> 
> Addresses-Coverity: 1494147 ("Logically dead code")
> 
> Signed-off-by: Ameer Hamza <amhamza.mgc@gmail.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> 
> ---
> Changes in v2:
> removed the 'fail' part completely by moving DPU_ERROR and return statement in place of corresponding goto statements.
> ---
>   .../drm/msm/disp/dpu1/dpu_encoder_phys_vid.c    | 17 +++++------------
>   1 file changed, 5 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> index 185379b18572..ddd9d89cd456 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> @@ -698,17 +698,17 @@ struct dpu_encoder_phys *dpu_encoder_phys_vid_init(
>   {
>   	struct dpu_encoder_phys *phys_enc = NULL;
>   	struct dpu_encoder_irq *irq;
> -	int i, ret = 0;
> +	int i;
>   
>   	if (!p) {
> -		ret = -EINVAL;
> -		goto fail;
> +		DPU_ERROR("failed to create encoder due to invalid parameter\n");
> +		return ERR_PTR(-EINVAL);
>   	}
>   
>   	phys_enc = kzalloc(sizeof(*phys_enc), GFP_KERNEL);
>   	if (!phys_enc) {
> -		ret = -ENOMEM;
> -		goto fail;
> +		DPU_ERROR("failed to create encoder due to memory allocation error\n");
> +		return ERR_PTR(-ENOMEM);
>   	}
>   
>   	phys_enc->hw_mdptop = p->dpu_kms->hw_mdp;
> @@ -748,11 +748,4 @@ struct dpu_encoder_phys *dpu_encoder_phys_vid_init(
>   	DPU_DEBUG_VIDENC(phys_enc, "created intf idx:%d\n", p->intf_idx);
>   
>   	return phys_enc;
> -
> -fail:
> -	DPU_ERROR("failed to create encoder\n");
> -	if (phys_enc)
> -		dpu_encoder_phys_vid_destroy(phys_enc);
> -
> -	return ERR_PTR(ret);
>   }
> 


-- 
With best wishes
Dmitry

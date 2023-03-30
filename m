Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C5CDA6D1244
	for <lists+freedreno@lfdr.de>; Fri, 31 Mar 2023 00:40:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48EF110F08D;
	Thu, 30 Mar 2023 22:40:13 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C37810F08C
 for <freedreno@lists.freedesktop.org>; Thu, 30 Mar 2023 22:40:09 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id br6so26488040lfb.11
 for <freedreno@lists.freedesktop.org>; Thu, 30 Mar 2023 15:40:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680216009;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=AMJs/U5UnLd5bFOKJPEHLahakMqQOuZt33+aoqfKk80=;
 b=xOmcjUBOYyImBSg5vKMA59tGHFPK4SA+o+kKqbW/FfXGSBu3NmH5xggpqPqzS8ioKK
 4U0XJDWj7FB+LAkCOUoB/1hhntrXQ0H1xMxUxNhU14cGNs2lxA/HjKQd8gmfo17PDixg
 scz27ljzFQfwEUK5UoMQWIIpd1rdMkZRjxTpyI3ictIlUk2N/2+SdvU+Ig0DKKrbeDLC
 Gb+VjwI6j2MyN7EtzKDdaVbZLobm4ReMBzUzTpRfwfQMXbH9OoUBZRPRsHihk8H8ykVC
 cXpawfR8WaWSrmWeXVKCLXDxJ3NvCjLZr1vZfeQ26F0exKat3cluKWwZMdYNeQH4+rCm
 kUww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680216009;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AMJs/U5UnLd5bFOKJPEHLahakMqQOuZt33+aoqfKk80=;
 b=MdORkr6TvPb/AeVtM4ngqtHV4xz5v5TCfRixCy7u85brUjsKs4wueO6CoAuoYxJM+N
 lHIpXsnk8fDTnvrrBuTlXhRTagZndDknGvOQ3s4u7HbDLzdbjl60emScdn1BFWtBsD/y
 T5iUjrF8lKyAekURxTGKASgv/jHVm5J2GTQeGWOQT8UdOGKLWzkakROt26D/QSKK6i3t
 fD/iFvWgLLj4zAlJ2O5uTYnDiBg9x4+kWlLJrc8kNxH6BVVbCiqWvstzX/iXeKC58tsO
 Kb82MSje9obBD3SVkWfQVt8trQWv/IwbmU3Dn7mvTt3tV23bCqV6llwmRF8zVOIrj7zI
 vnsA==
X-Gm-Message-State: AAQBX9cLOxXPERYckuwyTK71ONQID/g/60aowV0P9fS9Nh/ZI2Ez3EXg
 VJzLco0G4Y4r0SEH54bsYJC47A==
X-Google-Smtp-Source: AKy350b6RwWIx6C6yOTO1IoA5dTMxrnYjKOYDyWWfUj6x9XXLL+PnhmZIbdz8iII1zzPdVmZaJqCCA==
X-Received: by 2002:ac2:5337:0:b0:4db:d97:224d with SMTP id
 f23-20020ac25337000000b004db0d97224dmr8066707lfh.19.1680216009129; 
 Thu, 30 Mar 2023 15:40:09 -0700 (PDT)
Received: from [192.168.1.101] (abxj225.neoplus.adsl.tpnet.pl. [83.9.3.225])
 by smtp.gmail.com with ESMTPSA id
 c26-20020ac2531a000000b004e8497a5604sm116680lfh.108.2023.03.30.15.40.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Mar 2023 15:40:08 -0700 (PDT)
Message-ID: <842fdf1f-5cd9-44ad-ad7c-b28e26b40601@linaro.org>
Date: Fri, 31 Mar 2023 00:40:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20230330215324.1853304-26-dmitry.baryshkov@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230330215324.1853304-26-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [v3,
 25/38] drm/msm/dpu: enable DPU_CTL_SPLIT_DISPLAY for sc8280xp
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
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>



On 30.03.2023 23:53, Dmitry Baryshkov wrote:
> Theoretically since sm8150 we should be using a single CTL for the
> source split case, but since we do not support it for now, fallback to
> DPU_CTL_SPLIT_DISPLAY.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
> index 01ef4115ee4d..33f2d53df13b 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
> @@ -42,17 +42,18 @@ static const struct dpu_mdp_cfg sc8280xp_mdp[] = {
>  	},
>  };
>  
> +/* FIXME: get rid of DPU_CTL_SPLIT_DISPLAY in favour of proper ACTIVE_CTL support */
>  static const struct dpu_ctl_cfg sc8280xp_ctl[] = {
>  	{
>  	.name = "ctl_0", .id = CTL_0,
>  	.base = 0x15000, .len = 0x204,
> -	.features = CTL_SC7280_MASK,
> +	.features = BIT(DPU_CTL_SPLIT_DISPLAY) | CTL_SC7280_MASK,
>  	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
>  	},
>  	{
>  	.name = "ctl_1", .id = CTL_1,
>  	.base = 0x16000, .len = 0x204,
> -	.features = CTL_SC7280_MASK,
> +	.features = BIT(DPU_CTL_SPLIT_DISPLAY) | CTL_SC7280_MASK,
>  	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
>  	},
>  	{

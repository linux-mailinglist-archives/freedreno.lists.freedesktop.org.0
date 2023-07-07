Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D2C5674A92B
	for <lists+freedreno@lfdr.de>; Fri,  7 Jul 2023 04:54:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A813710E503;
	Fri,  7 Jul 2023 02:54:30 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49D4C10E500
 for <freedreno@lists.freedesktop.org>; Fri,  7 Jul 2023 02:54:28 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2b6afc1ceffso21767081fa.0
 for <freedreno@lists.freedesktop.org>; Thu, 06 Jul 2023 19:54:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688698466; x=1691290466;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BshhhQJqIsAHeX3pfDZU1Y6/saVTrDYYJ1jx8K4CJvk=;
 b=VAKZeceR51k6lGUnID51VBm2wNPfhEUnayBwD3mDy2P9J5Bn1dQbsTcavEtaCobfpz
 w5jxdsnOiYUV+fhWkOVOrfXoDdPb/kGJB8fNK//h7lpIs1sQ+Gm3KH+8bB6CMfuE0FFq
 yF71y/l5cUIyipnmETIMEB5i/hLLaQ7nK4scVsGqNrMPf4ToG5++d2jBB8ZSDfxOM3ob
 52idXcuxxmhXwjQbfwKOJe4+ZdlKYup6O03GFh/7rq6S/dGyfKk6x4Hw9LqAt1NstvMr
 dyLRVVtyDIKSP/Kv2DcBIUJaizUJ67Fzxtdgy6NPPGfuO1As0lVXZL/bsLPGDYIvUDms
 7eQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688698466; x=1691290466;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BshhhQJqIsAHeX3pfDZU1Y6/saVTrDYYJ1jx8K4CJvk=;
 b=RnkmQu32UW7JPAChVBJx8B1MrOJO7wz5PYAM+SH1NhBsW0rRzG7Ouz6Ee2yFIG3JGh
 RcQ2D5XopaHgm+h+4gaXI+OJvydrGmTa+q/9XorKYLi3M8cL0rggZb4gu2FpbmI0udLY
 l5nwV+x95p2ydFB6W1lhXfirJA+63M0CAhKlqXP05mo+x7gvhdULQIJtMKJ6cm2Ldhue
 +1sQMQL3NPZY2eh4j2waGZFc/je2F8REL4d3dMxulAHAerdpetEr+jaxb263o58Jdpd+
 Ms5g9lkCnOzET0WYrubJwxJgkH7KYjoCU9tONAmGz3C47MLgg+l3GmZNzSswvNUNjR6/
 GhEg==
X-Gm-Message-State: ABy/qLZpzg1y0kFSVx9AE75OAvh1UFAHrLJ3aBrpBG5TWOpKWIdFrUw1
 rpTMOQ9c87fVhTqnm7oO295NQg==
X-Google-Smtp-Source: APBJJlHE9dYDz/MGiLwUpu1uwr7H2NMzt9Ce9ojtDAH7oIff0b4Syt5fwSS723G9EAV9/Yd+4/Rcug==
X-Received: by 2002:a2e:3c0a:0:b0:2b6:d77b:92b8 with SMTP id
 j10-20020a2e3c0a000000b002b6d77b92b8mr2603943lja.16.1688698466471; 
 Thu, 06 Jul 2023 19:54:26 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 h19-20020a2eb0f3000000b002b6a85a7292sm575076ljl.19.2023.07.06.19.54.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Jul 2023 19:54:26 -0700 (PDT)
Message-ID: <fa8f72dd-8d74-e941-1b4e-2464a9034424@linaro.org>
Date: Fri, 7 Jul 2023 05:54:25 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-GB
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
References: <20230706211045.204925-1-robdclark@gmail.com>
 <20230706211045.204925-8-robdclark@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230706211045.204925-8-robdclark@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH 07/12] drm/msm/adreno: Move speedbin mapping
 to device table
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
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org,
 Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 07/07/2023 00:10, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> This simplifies the code.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c      | 171 ++-------------------
>   drivers/gpu/drm/msm/adreno/adreno_device.c |  51 ++++++
>   drivers/gpu/drm/msm/adreno/adreno_gpu.h    |  25 +++
>   3 files changed, 92 insertions(+), 155 deletions(-)


Interesting hack, I'd say.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Minor nit below.

> 

> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> index d5335b99c64c..994ac26ce731 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> @@ -72,8 +72,33 @@ struct adreno_info {
>   	u32 inactive_period;
>   	const struct adreno_reglist *hwcg;
>   	u64 address_space_size;
> +	/**
> +	 * @speedbins: Optional table of fuse to speedbin mappings
> +	 *
> +	 * Consists of pairs of fuse, index mappings, terminated with
> +	 * UINT_MAX sentinal.
> +	 */
> +	uint32_t *speedbins;

Would it be better to explicitly list this as pairs of uint32_t? And 
then use braces in ADRENO_SPEEDBIN initialisation.

>   };
>   
> +/*
> + * Helper to build a speedbin table, ie. the table:
> + *      fuse | speedbin
> + *      -----+---------
> + *        0  |   0
> + *       169 |   1
> + *       174 |   2
> + *
> + * would be declared as:
> + *
> + *     .speedbins = ADRENO_SPEEDBINS(
> + *                      0,   0,
> + *                      169, 1,
> + *                      174, 2
> + *                  ),
> + */
> +#define ADRENO_SPEEDBINS(tbl...) (uint32_t[]) { tbl, UINT_MAX }
> +
>   const struct adreno_info *adreno_info(struct adreno_rev rev);
>   
>   struct adreno_gpu {

-- 
With best wishes
Dmitry


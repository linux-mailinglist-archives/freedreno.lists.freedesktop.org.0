Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7165350181
	for <lists+freedreno@lfdr.de>; Wed, 31 Mar 2021 15:40:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 404296E1EC;
	Wed, 31 Mar 2021 13:40:11 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A06AE6EA9F
 for <freedreno@lists.freedesktop.org>; Wed, 31 Mar 2021 13:40:10 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id r20so23912890ljk.4
 for <freedreno@lists.freedesktop.org>; Wed, 31 Mar 2021 06:40:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=7F1deS5QWVK4KYnOzaLbhNHQC6aug03ApEK2A2NzYGA=;
 b=H43yUMdSWba5CkZEw+Cqmmn7i4lFJ/UW3UcmfVjvwhoJFqyAJ+/8/4cTEcyYPG8bbH
 dsTQmmErgLzmewm2gjllG3X4poLoKENQVXhYC4IyArHGJbZpa5KVIi2kMNxU082JQeSI
 D4kkZIqNxUHr/QdWRiy4yDOAMcXaab27tJQUUiWIVd2moAeylcLBuQNRxChBNa4cgLLd
 Z3irhXRGAyIj8/DI9abbrA8pigSviyJ8mbrrE03WZYYkig7Lktj/RUNA1v7vu/FX3vpd
 123lof+XmUeB8yk0Hxa64AM94RRyzUdnSJoADFmc4FJUa/TvU6eUSI42BZ524KUD/6yx
 t2AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7F1deS5QWVK4KYnOzaLbhNHQC6aug03ApEK2A2NzYGA=;
 b=Mit33/X1+Gd1pTBJ9bNunJWR6d1NMjZOp/djGsvXCQ7l3Jw02ToNAjWIydRw+aSalu
 YDCtRBCK3kMRhwWozHPSA7oyNrrWYP1bVQOrMLhL6CoXqXN6H+w3DdQNxAYnSojPVyAC
 5vBjd3yovfiALS2ZdOTOQiuWwnG3tY1PeTT8D4DFRcYe+gnYTV956wdghfJna2O6Y7In
 9YPWggHY/aa2sBbO70teTDcwIkVY4xmhrzPCIsX5thEN7zDxDfoXwLQ8qH2rAiguFqeL
 mDLtlMZr6n++VCyG/2bNrxUpCo4jgjf1lFR4PCqboZ4txNJ6Aa7cB1bznAVYlb5k6cgY
 fyTA==
X-Gm-Message-State: AOAM532jAwYHcd3NTb95DnjgP+vMaRr3XPJO46psJeg3WWhS6nHvj0I6
 l6s1EnPaAEFWOP8u2NNOPwXDPw==
X-Google-Smtp-Source: ABdhPJxwrrlNr1BbyXtUcHSomrDs3y/v2bqflV4EZT9tDuK09E34s8j9WdMzKx42fAwlSEWQPvNvog==
X-Received: by 2002:a2e:9857:: with SMTP id e23mr2182526ljj.78.1617198008818; 
 Wed, 31 Mar 2021 06:40:08 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id b25sm237748lff.268.2021.03.31.06.40.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 31 Mar 2021 06:40:08 -0700 (PDT)
To: Jordan Crouse <jcrouse@codeaurora.org>, linux-arm-msm@vger.kernel.org
References: <20210210005205.783377-1-jcrouse@codeaurora.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <af099fda-a7be-8fe5-ed9e-cfcd6f13c09c@linaro.org>
Date: Wed, 31 Mar 2021 16:40:07 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210210005205.783377-1-jcrouse@codeaurora.org>
Content-Language: en-GB
Subject: Re: [Freedreno] [PATCH v2] drm/msm: a6xx: Make sure the SQE
 microcode is safe
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
Cc: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Jonathan Marek <jonathan@marek.ca>, David Airlie <airlied@linux.ie>,
 freedreno@lists.freedesktop.org, Sharat Masetty <smasetty@codeaurora.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Eric Anholt <eric@anholt.net>,
 Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Sean Paul <sean@poorly.run>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hello,

On 10/02/2021 03:52, Jordan Crouse wrote:
> Most a6xx targets have security issues that were fixed with new versions
> of the microcode(s). Make sure that we are booting with a safe version of
> the microcode for the target and print a message and error if not.
> 
> v2: Add more informative error messages and fix typos
> 
> Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>

[skipped]

> +	}  else {
> +		/*
> +		 * a650 tier targets don't need whereami but still need to be
> +		 * equal to or newer than 1.95 for other security fixes
> +		 */
> +		if (adreno_is_a650(adreno_gpu)) {
> +			if ((buf[0] & 0xfff) >= 0x195) {
> +				ret = true;
> +				goto out;
> +			}

I think this is incorrect. The latest firmware i have here also fails 
this check, with the buf[0] = 0x016dd099, so buf[0] & 0xfff = 0x099.

Could you please confirm the versioning?

> +
> +			DRM_DEV_ERROR(&gpu->pdev->dev,
> +				"a650 SQE ucode is too old. Have version %x need at least %x\n",
> +				buf[0] & 0xfff, 0x195);
> +		}
> +
> +		/*
> +		 * When a660 is added those targets should return true here
> +		 * since those have all the critical security fixes built in
> +		 * from the start
> +		 */
> +	}
> +out:
>   	msm_gem_put_vaddr(obj);
> +	return ret;
>   }
>   
>   static int a6xx_ucode_init(struct msm_gpu *gpu)
> @@ -566,7 +611,13 @@ static int a6xx_ucode_init(struct msm_gpu *gpu)
>   		}
>   
>   		msm_gem_object_set_name(a6xx_gpu->sqe_bo, "sqefw");
> -		a6xx_ucode_check_version(a6xx_gpu, a6xx_gpu->sqe_bo);
> +		if (!a6xx_ucode_check_version(a6xx_gpu, a6xx_gpu->sqe_bo)) {
> +			msm_gem_unpin_iova(a6xx_gpu->sqe_bo, gpu->aspace);
> +			drm_gem_object_put(a6xx_gpu->sqe_bo);
> +
> +			a6xx_gpu->sqe_bo = NULL;
> +			return -EPERM;
> +		}
>   	}
>   
>   	gpu_write64(gpu, REG_A6XX_CP_SQE_INSTR_BASE_LO,


-- 
With best wishes
Dmitry
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno

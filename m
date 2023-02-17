Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C1BB369B4EE
	for <lists+freedreno@lfdr.de>; Fri, 17 Feb 2023 22:42:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B08910E1F2;
	Fri, 17 Feb 2023 21:42:40 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5139210E047
 for <freedreno@lists.freedesktop.org>; Fri, 17 Feb 2023 21:42:38 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id bx13so2405008ljb.3
 for <freedreno@lists.freedesktop.org>; Fri, 17 Feb 2023 13:42:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=KjxlPILW+0/6H9IXfEpLQzo0t7G/Kz/lDCqzCuLgYtc=;
 b=oTGeEh5nwz/3827thw5bHlweH7GI08JlB/gk3s6RcP6ZWUP/Hisl4e0zfJPbHOy5GC
 DtCskRZckn1MCCrNfzVQ8ibdNuoaPbVBnKYqerYjuVrrDYFmf6Kt9mq5D9SWRbO94Ex3
 0J66vt1BdH6uOctHdMQcgk3nK1CLSK1BVUGv4YVpbDxYiLVGdl87VEkdpQoe5iU9UiHw
 phTOddRrR1T7vtNOlhVCq+ynuPGZpnLpoepUfb81Kfq+BEHxecP7ZYk0I+z3PWlC3Pyu
 m/6N7TWGxIVxZJ3YJIb85hzQO+Ce9olpLBXl5XI/8EUprX7+tmOugAAXpjuoN2KHQM5z
 WLlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KjxlPILW+0/6H9IXfEpLQzo0t7G/Kz/lDCqzCuLgYtc=;
 b=UkBfQo/84C/MjmnDEgVNZzCm99/TWSe+tpl9eqHQpMmf2cWILL/WSLgEpOfXYenDtY
 TMPiv+kfk8JzGkPU9L2pI9t+atc0vAtUsJreHj1CQdLTUOJpLFezJVDUNzCHGdoBvVmH
 Al5TjS7p005r6kwY2TYz9hJveZzyxOdyO9DuXLz86MpeJ62Cj5gAer87zcRFe488C0fU
 uJW+eJ/dCjTYJST6XMp4VE/lfsiMXfvEZRsh7QU3JmvyDMfUli/zoBYzBIRV1U0Rlmxg
 6q50oEVXg1mtTYRUSbSRwVIyEt/XcKe9mkYVRvifrvBH7f0OzuK5BZvLD4p63n6npIGF
 NxHw==
X-Gm-Message-State: AO0yUKWIHijX0IiAkxPpegTlMuE0/1fi453g5A1o5eRrY6ZPeB0rBwwV
 C/SI0KlZ3fzx26vzT3BhY0o95A==
X-Google-Smtp-Source: AK7set8xtA5L2u2KWFo4vepe8XvXRW7CJq42v22s/nzdcJUJJ2/qf0DsuvZpSqqrEOCu5iU/UTKA8g==
X-Received: by 2002:a05:651c:502:b0:28d:9dbe:227a with SMTP id
 o2-20020a05651c050200b0028d9dbe227amr607579ljp.42.1676670156541; 
 Fri, 17 Feb 2023 13:42:36 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 l5-20020a2ea305000000b002934a7c04efsm717822lje.98.2023.02.17.13.42.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Feb 2023 13:42:36 -0800 (PST)
Message-ID: <a8c37ab9-3d53-d056-5fe2-7a8c9a7dd6ea@linaro.org>
Date: Fri, 17 Feb 2023 23:42:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Content-Language: en-GB
To: Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org,
 andersson@kernel.org, agross@kernel.org
References: <20230214173145.2482651-1-konrad.dybcio@linaro.org>
 <20230214173145.2482651-9-konrad.dybcio@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230214173145.2482651-9-konrad.dybcio@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v2 08/14] drm/msm/a6xx: Add A610 support
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
Cc: freedreno@lists.freedesktop.org, Akhil P Oommen <quic_akhilpo@quicinc.com>,
 David Airlie <airlied@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, Douglas Anderson <dianders@chromium.org>,
 Nathan Chancellor <nathan@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 "Joel Fernandes \(Google\)" <joel@joelfernandes.org>,
 marijn.suijten@somainline.org, Sean Paul <sean@poorly.run>,
 Chia-I Wu <olvaffe@gmail.com>, linux-kernel@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 14/02/2023 19:31, Konrad Dybcio wrote:
> A610 is one of (if not the) lowest-tier SKUs in the A6XX family. It
> features no GMU, as it's implemented solely on SoCs with SMD_RPM.
> What's more interesting is that it does not feature a VDDGX line
> either, being powered solely by VDDCX and has an unfortunate hardware
> quirk that makes its reset line broken - after a couple of assert/
> deassert cycles, it will hang for good and will not wake up again.
> 
> This GPU requires mesa changes for proper rendering, and lots of them
> at that. The command streams are quite far away from any other A6XX
> GPU and hence it needs special care. This patch was validated both
> by running an (incomplete) downstream mesa with some hacks (frames
> rendered correctly, though some instructions made the GPU hangcheck
> which is expected - garbage in, garbage out) and by replaying RD
> traces captured with the downstream KGSL driver - no crashes there,
> ever.
> 
> Add support for this GPU on the kernel side, which comes down to
> pretty simply adding A612 HWCG tables, altering a few values and
> adding a special case for handling the reset line.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Minor nit below.

> ---
>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c      | 95 ++++++++++++++++++++--
>   drivers/gpu/drm/msm/adreno/adreno_device.c | 13 +++
>   drivers/gpu/drm/msm/adreno/adreno_gpu.h    |  8 +-
>   3 files changed, 106 insertions(+), 10 deletions(-)
> 

[skipped]

> @@ -1087,18 +1144,26 @@ static int hw_init(struct msm_gpu *gpu)
>   	gpu_write(gpu, REG_A6XX_UCHE_FILTER_CNTL, 0x804);
>   	gpu_write(gpu, REG_A6XX_UCHE_CACHE_WAYS, 0x4);
>   
> -	if (adreno_is_a640_family(adreno_gpu) ||
> -	    adreno_is_a650_family(adreno_gpu))
> +	if (adreno_is_a640_family(adreno_gpu) || adreno_is_a650_family(adreno_gpu)) {

Keep this on two lines please.

>   		gpu_write(gpu, REG_A6XX_CP_ROQ_THRESHOLDS_2, 0x02000140);
> -	else
> +		gpu_write(gpu, REG_A6XX_CP_ROQ_THRESHOLDS_1, 0x8040362c);
> +	} else if (adreno_is_a610(adreno_gpu)) {
> +		gpu_write(gpu, REG_A6XX_CP_ROQ_THRESHOLDS_2, 0x00800060);
> +		gpu_write(gpu, REG_A6XX_CP_ROQ_THRESHOLDS_1, 0x40201b16);
> +	} else {
>   		gpu_write(gpu, REG_A6XX_CP_ROQ_THRESHOLDS_2, 0x010000c0);
> -	gpu_write(gpu, REG_A6XX_CP_ROQ_THRESHOLDS_1, 0x8040362c);
> +		gpu_write(gpu, REG_A6XX_CP_ROQ_THRESHOLDS_1, 0x8040362c);
> +	}
>   

[skipped the rest]

-- 
With best wishes
Dmitry


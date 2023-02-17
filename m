Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D25C769B416
	for <lists+freedreno@lfdr.de>; Fri, 17 Feb 2023 21:41:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99D6010E460;
	Fri, 17 Feb 2023 20:41:49 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08B5410E463
 for <freedreno@lists.freedesktop.org>; Fri, 17 Feb 2023 20:41:48 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id z10so2159263ljq.2
 for <freedreno@lists.freedesktop.org>; Fri, 17 Feb 2023 12:41:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5NWLQ8GhGWTeecUq7rQpF0zTEqtX/Q2r4EBkdCAJ/NY=;
 b=NE9m1H/AGgL//qsJkO+ByH6tqTtVR42pjXc9IVl8lqPcRh3RJ+ZAP2lFaq8hbk6IyQ
 iMmsok4R+sC3mkPBhkKXJZbUWGwraNbmQm0xk0IJt6SpBn1eBk4shpuFc5eUMcn+sCbb
 zKSS0fe368bl11dU7IP8EbOT9Pp9Wh0Vt+4k73hupwPeUjRLOkJ+6fWtf9lS+wMM9VF6
 qOTLIGpYIGkvghnQbPqyDus6/0EO2RKjIWw4TK4vxqjug8lwPlEWtCy6Ou7QRn4wA8su
 yfhtgLDRnWXipoLExBaMyjp3ruD7Vz3rX1uQfyHNntdEHrzRZuI7a5n8FZ0h0JBLLeuw
 FMPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5NWLQ8GhGWTeecUq7rQpF0zTEqtX/Q2r4EBkdCAJ/NY=;
 b=yRM67Hj2sKlbJrr0KxuQ/SrHbJ1fSeVg0es4+6we9Pq9QskSwjVcDjYk50WkexyqZW
 B5UssQrAhz2uhiyDWtDk9lBjQqZrD/ns0jfDjH96h+eJkLW1JZJ8qrWXqLSo4d+p3Xp+
 6hZ+B7P+1k9DR5xwdo9B9remlbppCApO458F9IwJm1j4XbYuaXxQVluOUjroC8tVj6Wo
 9JsjjMzPc6ijEVSlvl8Lm61cmCl7fM2yMSZT0FWSaaNU/hK0mtr/zXQN/WYuHZyHpIKV
 espWwGYL9eKuw7s6M/DosoFwZ9PazWUqSeJ0ZIrwnrk3TRfkg/4KKdMvUtqyBZ6lBqjJ
 pOJw==
X-Gm-Message-State: AO0yUKWnGoWyNzwbmQNW4zTNACgvbrq2mTdVhoGP4sEiKvdybz0IEhII
 aItQ/pMP4Q6CKUtsYxYOFyYxQQ==
X-Google-Smtp-Source: AK7set+knfCs4nq/e+nlnXVCaOsj4lwGcn0SZczvY3CyVumuwNyrXb6I3mKnGCs8f46nYntdx7yAXw==
X-Received: by 2002:a2e:b803:0:b0:293:51d2:1a70 with SMTP id
 u3-20020a2eb803000000b0029351d21a70mr641034ljo.0.1676666506034; 
 Fri, 17 Feb 2023 12:41:46 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 w2-20020a19c502000000b004cc99cd94basm769138lfe.113.2023.02.17.12.41.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Feb 2023 12:41:45 -0800 (PST)
Message-ID: <aaf19c87-0761-a108-af4c-c6ec6f75691c@linaro.org>
Date: Fri, 17 Feb 2023 22:41:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Content-Language: en-GB
To: Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org,
 andersson@kernel.org, agross@kernel.org
References: <20230214173145.2482651-1-konrad.dybcio@linaro.org>
 <20230214173145.2482651-2-konrad.dybcio@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230214173145.2482651-2-konrad.dybcio@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v2 01/14] drm/msm/a6xx: De-staticize sptprac
 en/disable functions
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
Cc: freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, David Airlie <airlied@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Daniel Vetter <daniel@ffwll.ch>,
 marijn.suijten@somainline.org, Sean Paul <sean@poorly.run>,
 Guenter Roeck <linux@roeck-us.net>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 14/02/2023 19:31, Konrad Dybcio wrote:
> These two will be reused by at least A619_holi in the non-gmu
> paths. De-staticize them to make it possible.

Nit: 'remove static annotation' or something like that.

Other than that:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>   drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 4 ++--
>   drivers/gpu/drm/msm/adreno/a6xx_gmu.h | 2 ++
>   2 files changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> index f3c9600221d4..90e636dcdd5b 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> @@ -354,7 +354,7 @@ void a6xx_gmu_clear_oob(struct a6xx_gmu *gmu, enum a6xx_gmu_oob_state state)
>   }
>   
>   /* Enable CPU control of SPTP power power collapse */
> -static int a6xx_sptprac_enable(struct a6xx_gmu *gmu)
> +int a6xx_sptprac_enable(struct a6xx_gmu *gmu)
>   {
>   	int ret;
>   	u32 val;
> @@ -376,7 +376,7 @@ static int a6xx_sptprac_enable(struct a6xx_gmu *gmu)
>   }
>   
>   /* Disable CPU control of SPTP power power collapse */
> -static void a6xx_sptprac_disable(struct a6xx_gmu *gmu)
> +void a6xx_sptprac_disable(struct a6xx_gmu *gmu)
>   {
>   	u32 val;
>   	int ret;
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
> index e034935b3986..ec28abdd327b 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
> @@ -186,5 +186,7 @@ int a6xx_hfi_set_freq(struct a6xx_gmu *gmu, int index);
>   
>   bool a6xx_gmu_gx_is_on(struct a6xx_gmu *gmu);
>   bool a6xx_gmu_sptprac_is_on(struct a6xx_gmu *gmu);
> +void a6xx_sptprac_disable(struct a6xx_gmu *gmu);
> +int a6xx_sptprac_enable(struct a6xx_gmu *gmu);
>   
>   #endif

-- 
With best wishes
Dmitry


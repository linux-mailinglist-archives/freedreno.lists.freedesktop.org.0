Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D74A7670DD8
	for <lists+freedreno@lfdr.de>; Wed, 18 Jan 2023 00:46:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7060A10E605;
	Tue, 17 Jan 2023 23:46:11 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA89110E605
 for <freedreno@lists.freedesktop.org>; Tue, 17 Jan 2023 23:46:08 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id x36so12729870ede.13
 for <freedreno@lists.freedesktop.org>; Tue, 17 Jan 2023 15:46:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Ivxc3QWlvi/34NDoiDipvk7WlR095YUmLRSgpjmtuM8=;
 b=NCq8Uvo1feByLFtkheaQ4X66U1Cy1r8DReGTkf/ZbxL4bBXXZeRUBlUBFMN1HMPWOC
 ff/47e8FXesF6I7xllyFYJSv+xwvoN8GOGWP4ojENO/vXKsfAf89mcz9GIcMiBidAYVE
 pwkPgTgIZ0QLlDGymP0WcxrOvUyHYLHzCktZyfaZgoVryqFraoUhZceXtm+Bmdby1/Io
 hloKTrRqt1ohuPK+kQzRFKu5WerPj+0WVsDUyoxKJPNn3blyPkCaTb+mTCzZXtaZX616
 K4vT6At73yqqfo/eMV1YMIHC3c3crhNc2t1/OVc+Ao2eBNHb/xLwh22zTcSa6WbFuX4G
 jzpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Ivxc3QWlvi/34NDoiDipvk7WlR095YUmLRSgpjmtuM8=;
 b=Y0DGWCszALv8RVGPGoMYr/ODTDL3bQpoCH7DpC2YgnYoElmojcz3u+1HcwsyDzQYTG
 aiBq9iNUiDqJsLbBtTpKmcXmi+QesvyW+FhseZipKdlgmgkW0BKzIHkYD/k5DosX5QPe
 lH4m8i0xBSbAFQ75Mt7eJb6LfHwfleYoWuUBcdtS11JrKVdEQJd8HV3b7OkwXLi5CY6r
 93tB02TUTO8Y49wbkWGpGORCI6SPiKZM1eKYNkjJRhHEnRMAVQ64D2nbCE79axqBZY0h
 qdTSTOqxrQN6ehd84DEEbI8Hg5naLMz2Nx6kK/QNlKqEP+SEfPDoae7CIoEo1KaRWDm9
 ynvg==
X-Gm-Message-State: AFqh2kpaLvIwOyjzLSLPsozdfXS7QgRHZhjYGWxU3e3PXK+vtJsDoe40
 Iypwufw2aXvoE6mHrnMkGsI2mg==
X-Google-Smtp-Source: AMrXdXuObqZU0bK3Vnix8EIj/qDEwnB5l3rVT1F3Gd73CslZceRiVTz5x8/mQEjPSPrI8hpUYUSsAg==
X-Received: by 2002:a05:6402:f20:b0:499:b672:ee3a with SMTP id
 i32-20020a0564020f2000b00499b672ee3amr5665776eda.12.1673999167255; 
 Tue, 17 Jan 2023 15:46:07 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 r14-20020aa7cb8e000000b00499b6b50419sm10380954edt.11.2023.01.17.15.46.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Jan 2023 15:46:06 -0800 (PST)
Message-ID: <06291416-fb69-2f1d-2d46-9f30d2151ae5@linaro.org>
Date: Wed, 18 Jan 2023 01:46:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Content-Language: en-GB
To: Gaosheng Cui <cuigaosheng1@huawei.com>, james.qian.wang@arm.com,
 liviu.dudau@arm.com, mihail.atanassov@arm.com, brian.starkey@arm.com,
 airlied@gmail.com, daniel@ffwll.ch, robdclark@gmail.com,
 quic_abhinavk@quicinc.com, sean@poorly.run, thierry.reding@gmail.com,
 sam@ravnborg.org, emma@anholt.net, mripard@kernel.org,
 vladimir.lypak@gmail.com, quic_akhilpo@quicinc.com, dianders@chromium.org,
 olvaffe@gmail.com, angelogioacchino.delregno@somainline.org,
 marijn.suijten@somainline.org
References: <20221110094445.2930509-1-cuigaosheng1@huawei.com>
 <20221110094445.2930509-3-cuigaosheng1@huawei.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221110094445.2930509-3-cuigaosheng1@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH 2/5] drm/msm: Fix IS_ERR() vs NULL check in
 a5xx_submit_in_rb()
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
 dri-devel@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 10/11/2022 11:44, Gaosheng Cui wrote:
> The msm_gem_get_vaddr() returns an ERR_PTR() on failure, we should
> use IS_ERR() to check the return value.
> 
> Fixes: 6a8bd08d0465 ("drm/msm: add sudo flag to submit ioctl")
> Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>
> ---
>   drivers/gpu/drm/msm/adreno/a5xx_gpu.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> index 3c537c0016fa..0abc802e8d5f 100644
> --- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> @@ -89,7 +89,7 @@ static void a5xx_submit_in_rb(struct msm_gpu *gpu, struct msm_gem_submit *submit
>   			 * since we've already mapped it once in
>   			 * submit_reloc()
>   			 */
> -			if (WARN_ON(!ptr))
> +			if (WARN_ON(IS_ERR(ptr)))
>   				return;
>   
>   			for (i = 0; i < dwords; i++) {

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry


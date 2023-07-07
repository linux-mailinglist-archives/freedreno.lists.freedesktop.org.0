Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFDCA74A925
	for <lists+freedreno@lfdr.de>; Fri,  7 Jul 2023 04:50:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48D7610E4FE;
	Fri,  7 Jul 2023 02:50:30 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC82310E4FE
 for <freedreno@lists.freedesktop.org>; Fri,  7 Jul 2023 02:50:27 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-4fb960b7c9dso2085946e87.0
 for <freedreno@lists.freedesktop.org>; Thu, 06 Jul 2023 19:50:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688698226; x=1691290226;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=00kNjJBOwj/f6fk8hpRTnmkUyuTEHOQtaN5OiuXlYH0=;
 b=S+A/rblWHFXCOq25xF/GvZAInClqSzYxTB1MRS2/CBoydnYtyuZEfXpKPBOL1md91I
 WEwLBlCi5TjkAgbp+75JEkD2bm4VE1GosRsFwVlX54nHZE5ctMxYC5eR2j+eFUblTsuF
 DzzWQ99bZpW6fbotRQpHBtkIbK3ETBLQRAYtX+GX5BmV1zrT5EtGWoeujmd3Fi11+NWH
 CvOsM+D0U7Z9g14QJPkr1sF+2NvE1o3hVzFJJBqXxyJFZz27knoQWrAaoCuxgBJYmFod
 XUFPHtdXc+6SYEL/PT6a3bpkZpddb4865BLb7KcT+KwsMvTjTbWQY8I5DsJcwd7DvqI8
 HUXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688698226; x=1691290226;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=00kNjJBOwj/f6fk8hpRTnmkUyuTEHOQtaN5OiuXlYH0=;
 b=fVKSPqEeoNEereIptKAUu6BTRq+vKXKAjzr0KnGAgUF7+toGljgq28QHFYf3QDsNmZ
 fVcgW77FdBTEbjK8bM5TEKjyuU96nstDrkLRcVBZacmwClq5WUVsvD33eE2aSflEikWw
 A2nx7jQ3cpUprPBMh/QEzFzc4MTbfJoPrlEGc13XNGDhGsXQEG6jStAQjHSonzunjo0o
 X6ISOqzVk9xuBFd/7KmSkbMlnz3U9m9M814WqI2GIKYbUEn8tKPq8Z8pCak9zNEa3YhO
 cAVL8aqY7lts4VZgV8DpN7HW3DFhowakOazUTpaCJUgvjfAj7ppxW52Vncfkr4iI9zPz
 GjWA==
X-Gm-Message-State: ABy/qLaLuHrAPS1jFVuQsdas/PF8LI0Vgb96dimx80ZnK8JckOqR6H0m
 xIwv1J1ofw3Nx7Wi8qr4TOXRNw==
X-Google-Smtp-Source: APBJJlGG3OOx3uOszRFHCsgz1WFUvb99qSo5mig/O4sfB+eCBGIOt6A1Bi7Vt0J7P6G5fyFh/56rBw==
X-Received: by 2002:a05:6512:4023:b0:4f9:5316:d5b with SMTP id
 br35-20020a056512402300b004f953160d5bmr3339332lfb.64.1688698225938; 
 Thu, 06 Jul 2023 19:50:25 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 w10-20020ac2598a000000b004fb74cb9664sm492786lfn.94.2023.07.06.19.50.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Jul 2023 19:50:25 -0700 (PDT)
Message-ID: <6386e91d-0307-942e-bad5-7ddc877f1c73@linaro.org>
Date: Fri, 7 Jul 2023 05:50:25 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-GB
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
References: <20230706211045.204925-1-robdclark@gmail.com>
 <20230706211045.204925-11-robdclark@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230706211045.204925-11-robdclark@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH 10/12] drm/msm/adreno: Add helper for
 formating chip-id
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
> This is used in a few places, including one that is parsed by userspace
> tools.  So let's standardize it a bit better.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>   drivers/gpu/drm/msm/adreno/adreno_device.c |  8 +++-----
>   drivers/gpu/drm/msm/adreno/adreno_gpu.c    | 19 ++++++++-----------
>   drivers/gpu/drm/msm/adreno/adreno_gpu.h    |  6 ++++++
>   3 files changed, 17 insertions(+), 16 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry


Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A35F69B49C
	for <lists+freedreno@lfdr.de>; Fri, 17 Feb 2023 22:22:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54D8310E494;
	Fri, 17 Feb 2023 21:22:08 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B09F10E494
 for <freedreno@lists.freedesktop.org>; Fri, 17 Feb 2023 21:22:07 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id d24so3164217lfs.8
 for <freedreno@lists.freedesktop.org>; Fri, 17 Feb 2023 13:22:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5R/JMUHvPSazNvX2Y/cVe1EYEqkP1fximqOzEtAx+ss=;
 b=RxaNYkBHuzH5zfxozYK0G8C3W3dtCu+dojqTATTgOxFb37t5b/2fKYUnPwtl7KrHvG
 a5WCc9VM/k6iO3XjLWklDTQs0rHPJEK+tUOsorGgUS3z2USjK/Fte7Xb0cqJwjbbDLR/
 9XTdHIm0tvLOU2621UDxCwsttL61V6TvF5mNQppqDPqPWffXWjYo0nPM7onoOGtXpZ97
 xRATCNnytP1/jDvVYDDf6nfNYkK8xpco8Zsu8YNEhU1en4OEs1wevtpOkAuxeust3r0e
 JukJySB6JcG9VO+lesCUVXv0D93izS1ulGQ93uhj7WI+GGsxwWyQa5IP2vVK9PO+gwYD
 SV7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5R/JMUHvPSazNvX2Y/cVe1EYEqkP1fximqOzEtAx+ss=;
 b=hz4r6R8sU/W2J1EFC+vqiWqW+qM/9iZmZIR6iSL2CVitfKNLRBzVyiPzrgu/vC+Bru
 L2DTxMV3D+9Prv77JoLLO42QskoD5k273IKEhyjXXVSHVL5p8E1Xyy4zPbFWwKQJONK+
 Z87Lad8yWv+Y/GKSAgIOKCiLYXTc1YiMQAzpxqRbSxJxUfp55SYzQefdbDNm+WyfIZ9L
 nuyskcgUWPd4HxwOWNlru8NikffriyqjtHCHyeiarS5WhyTT3rW6FYRp/S3rF0dlecuk
 eivvVSFM3I7aqV63VNWCTwcbKL4qL7AGB+3kNhX2USl9GwZ/rXdnCj9+sgqSOI2sQNio
 E0ew==
X-Gm-Message-State: AO0yUKWwEnh4dscz4SVDPxLAjEQ9aHUasv9HVWEAqj+dmeA1wp4kzytC
 //v2nUFfchd9z17xAGalt7vXkw==
X-Google-Smtp-Source: AK7set9poy5qlGBhuSKgj+o7QREEXCJTb8D12job9OEO+QySjlOQ3zLPK923+3800d/HtFq/n5o94w==
X-Received: by 2002:ac2:42c7:0:b0:4cb:3a60:65c3 with SMTP id
 n7-20020ac242c7000000b004cb3a6065c3mr132948lfl.1.1676668925529; 
 Fri, 17 Feb 2023 13:22:05 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 b6-20020ac25626000000b004db25f2c103sm783153lff.86.2023.02.17.13.20.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Feb 2023 13:21:19 -0800 (PST)
Message-ID: <4cbe3a8c-5c6e-407c-c616-c2b08c5a9af2@linaro.org>
Date: Fri, 17 Feb 2023 23:20:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Content-Language: en-GB
To: Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org,
 andersson@kernel.org, agross@kernel.org
References: <20230214173145.2482651-1-konrad.dybcio@linaro.org>
 <20230214173145.2482651-13-konrad.dybcio@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230214173145.2482651-13-konrad.dybcio@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v2 12/14] drm/msm/a6xx: Use "else if" in GPU
 speedbin rev matching
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
 Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 marijn.suijten@somainline.org, Sean Paul <sean@poorly.run>,
 Chia-I Wu <olvaffe@gmail.com>, linux-kernel@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 14/02/2023 19:31, Konrad Dybcio wrote:
> The GPU can only be one at a time. Turn a series of ifs into if +
> elseifs to save some CPU cycles.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)

-- 
With best wishes
Dmitry


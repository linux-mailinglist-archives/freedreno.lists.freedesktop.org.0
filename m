Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0218F780AB7
	for <lists+freedreno@lfdr.de>; Fri, 18 Aug 2023 13:04:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB22410E4EE;
	Fri, 18 Aug 2023 11:04:20 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4152010E4EE
 for <freedreno@lists.freedesktop.org>; Fri, 18 Aug 2023 11:04:19 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2b9b9f0387dso10980711fa.0
 for <freedreno@lists.freedesktop.org>; Fri, 18 Aug 2023 04:04:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1692356657; x=1692961457;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=KmFWOPe1M/M0skePNYAwqrAwIEY42PVhQlE891nG6o8=;
 b=dwO+bth3b1+Nk8+6IivmbRPVP+KaMT1vBw0O3sLeIv7oR1pX0WJcOdPdj1dSu7wdXM
 ito/Mu50T2ls1VMQ2qlTuEWDdRDwxKECxeBHFEpzCo3Gt1ixycbD6DkEGXvn2BRjNflU
 o+m0tIp5/bVK+nA8vQofigeJ4ucMCEpPAibF1m3ptFKWj9pxmA59hYkUiwQ4+qA2X7FC
 i8VgvRCcwzwp+LI/bQ1RXZfrMPooMSQdQDnkGY/TY0cFCffSuVh7Gc1Ps4WizpGS0Eo0
 J/MaL/+Q7GnnQM39Z1g7xRRtm6YAo8MFXFBRvQ+1UukcRI/xD0Ks9SiremxNaiw8MAAr
 H6Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692356657; x=1692961457;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KmFWOPe1M/M0skePNYAwqrAwIEY42PVhQlE891nG6o8=;
 b=dcfc7LYFeec2ZWa5597R7Z6GkP373zrcTyBRpoD7hC0JweR7T+WVmg145xUbloPGGo
 t3g82oxJ7nWs4F7sy6bil/N2OCVUvc4xEhqWckrF+rE5ByWxmT7pisRRTdScajJiHzol
 1qTe09CaXHKDMGoUn1b8TsX0cXKgcxIzXn+tR8xgXEADEddvlVtvdUzINw77eGe6zmIw
 sdyAieq/KfmaBv81p6nRuuFofXLWDazDF+Cxp9w0K91EsBwRgXAQXSjkskoENJYohHsI
 UDpmqYJFDaL82qKuuE6FATLwG4kHLXiOUcxXsfI98CzfkxQlzMEs29+GD4cNBbwepJVv
 2CNA==
X-Gm-Message-State: AOJu0Yx7dd30ghO9lXmub8jDx6eyDXC4RwGD5O4DcwObBG/FG7V5bQqz
 ZSHp/QRJSnBEbsKbqK7zazvDxA==
X-Google-Smtp-Source: AGHT+IEwp06ZxicpGI+vVruEAtpln6CTuqu8D1mDmasY+MnhAF9dVfEJTUjv9IOpM7Vu0vEXSAFF5Q==
X-Received: by 2002:a2e:b791:0:b0:2b7:3b6c:a5e4 with SMTP id
 n17-20020a2eb791000000b002b73b6ca5e4mr1525911ljo.38.1692356657511; 
 Fri, 18 Aug 2023 04:04:17 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 y7-20020a2e9d47000000b002b9899d0f0bsm363898ljj.83.2023.08.18.04.04.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Aug 2023 04:04:17 -0700 (PDT)
Message-ID: <c667d98d-c8fc-4c28-982d-67dec00570e4@linaro.org>
Date: Fri, 18 Aug 2023 14:04:16 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Ruan Jinjie <ruanjinjie@huawei.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20230810120424.2108348-1-ruanjinjie@huawei.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230810120424.2108348-1-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH -next] drm/msm/adreno: adreno_gpu: Switch to
 memdup_user_nul() helper
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
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 10/08/2023 15:04, Ruan Jinjie wrote:
> Use memdup_user_nul() helper instead of open-coding to simplify the code.
> 
> Signed-off-by: Ruan Jinjie <ruanjinjie@huawei.com>
> ---
>   drivers/gpu/drm/msm/adreno/adreno_gpu.c | 14 +++-----------
>   1 file changed, 3 insertions(+), 11 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry


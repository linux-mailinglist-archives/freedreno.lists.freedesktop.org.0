Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 403BE6E8747
	for <lists+freedreno@lfdr.de>; Thu, 20 Apr 2023 03:14:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 816FB10E768;
	Thu, 20 Apr 2023 01:14:39 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6A3510E768
 for <freedreno@lists.freedesktop.org>; Thu, 20 Apr 2023 01:14:37 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id x34so1072460ljq.1
 for <freedreno@lists.freedesktop.org>; Wed, 19 Apr 2023 18:14:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681953275; x=1684545275;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Bs3T4CoT9dcZGpM4NSaYLbZwM4ao6CkSlWOs854SEP0=;
 b=jvziNZEKWKFcemyK4qjPHfbBwlZp5vj2rQqNeL6rkXzcvr/wW3qsNVZ1+jrMtDGv6G
 TNmcpWu6v2MR4aHHiakWDo9fVyJSR5zKuaDOjmhhB6M9D8JklnYoO1MU1XazxKlA8Uz/
 cZi32nzJJX2EUMQu2gMjkYr0T2NVG2t7gsJbVUl9G6jnxpPPS6iMkewVcYjr5tlgdl7N
 9rorAKtaszGsOV4s0X7hvZI7sGkrGZGfQ1Sj+65gmY6stvxpuMaUxd2K8ZYxJv3KBFVU
 NCQDtX8tKtH3kUCwp5/b6o4LxcvigSyuDPLBtm4hszdEu/LXkivSs6Fj7kt5QdPNQoYK
 DnIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681953275; x=1684545275;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Bs3T4CoT9dcZGpM4NSaYLbZwM4ao6CkSlWOs854SEP0=;
 b=bDKTfjq3FxWcQTO/FRIixViH2alPgnZjDOU6/jJahFVhaZphOH4sf3PsuqBAbIX6pV
 32lva+mmcIcS4dt/Zh5Tw0bruzMMwEJA2/cjiYI95xP/mrSrX/xomDtfsdG7NyvleF53
 6kX1urO/Cja0XviKgNxm+tfy6F0KPNp/KRj7kbxzruWG4qpdfZPi73Wh/MKgZebUZufv
 9b4UnGEDWwZFf3c5BUVYdfG4BVfyzPq2weepMKiFKlMVFZWAYVktjigecFeT6T70Lqag
 wbH5Z2jmW73CIRvQ9Ljv3OhiCPb6aMglgov6N9Rs4IDmnSJdaxgZuIox7lPcx6KkxqTU
 dVLw==
X-Gm-Message-State: AAQBX9dy2/ZAbIeQqT8j1mEgrYd3VmrB1MeZ2lcvkZ72ZDIYat5XZs2+
 azmuNXUNip29LrXg8Ga/l1UcDA==
X-Google-Smtp-Source: AKy350bBIAueDX7yZiBWXI0I+IiG4Q+5dFV0CHAv3I6r6BoS3JFZzMzJcF2idvVkrCZSsQdYBq6yWA==
X-Received: by 2002:a2e:9159:0:b0:2a8:d146:12cd with SMTP id
 q25-20020a2e9159000000b002a8d14612cdmr2726556ljg.17.1681953275668; 
 Wed, 19 Apr 2023 18:14:35 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 g24-20020a2e9cd8000000b002a8bce7ce0dsm27182ljj.107.2023.04.19.18.14.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Apr 2023 18:14:35 -0700 (PDT)
Message-ID: <c31bc489-6f5d-d5c7-2b8d-328a20a17b81@linaro.org>
Date: Thu, 20 Apr 2023 04:14:34 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-GB
To: Marijn Suijten <marijn.suijten@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Adam Skladowski <a39.skl@gmail.com>,
 Loic Poulain <loic.poulain@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Robert Foss <rfoss@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Rajesh Yadav <ryadav@codeaurora.org>,
 Jeykumar Sankaran <jsanka@codeaurora.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Chandan Uddaraju <chandanu@codeaurora.org>
References: <20230411-dpu-intf-te-v2-0-ef76c877eb97@somainline.org>
 <20230411-dpu-intf-te-v2-16-ef76c877eb97@somainline.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230411-dpu-intf-te-v2-16-ef76c877eb97@somainline.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v2 16/17] drm/msm/dpu: Implement tearcheck
 support on INTF block
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
Cc: Archit Taneja <architt@codeaurora.org>,
 Jami Kettunen <jami.kettunen@somainline.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 freedreno@lists.freedesktop.org,
 Sravanthi Kollukuduru <skolluku@codeaurora.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 17/04/2023 23:21, Marijn Suijten wrote:
> Since DPU 5.0.0 the TEARCHECK registers and interrupts moved out of the
> PINGPONG block and into the INTF.  Implement the necessary callbacks in
> the INTF block, and use these callbacks together with the INTF_TEAR
> interrupts.
> 
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        |  11 ++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h   |  10 +-
>   .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c   | 160 +++++++++------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c        | 214 +++++++++++++++++++++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h        |  25 +++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h        |   2 +
>   drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h          |  14 ++
>   7 files changed, 378 insertions(+), 58 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry


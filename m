Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 505F2661B17
	for <lists+freedreno@lfdr.de>; Mon,  9 Jan 2023 00:29:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD29B10E226;
	Sun,  8 Jan 2023 23:29:19 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C99F10E21F
 for <freedreno@lists.freedesktop.org>; Sun,  8 Jan 2023 23:29:18 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id b3so10509881lfv.2
 for <freedreno@lists.freedesktop.org>; Sun, 08 Jan 2023 15:29:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=LuTC2ch7lBeZqWq+4sA1VXQap+WvF8VB8BdbUaWqcHE=;
 b=CiuDQBy/qJQ87Xz9VOezGSflqPnj3lXtvtt7iDr+c8eky0iXrkd/ssxJDRvHuhLpXv
 9YLK0p+b1zqAlvG+/kIHdXFdW65Tznz3XJTqmiPB20M8CwSh8GV2RLbwOtplHGn/WImv
 HsJ+dtiXAJP9IwxDjcYDCCIeDpvSwBxsh5fI2fWET8Y9bUyr30bp6uc/TEBSUfttvTd/
 Stg4mG7kChcSNPn51POGjV5/jEl/q2I/q3rgWByVEg6tp8bcv8CmbBVIRTaaK20Oz8gV
 VzNINsauGqt2hsJKATn9KmVqsnGxyai84XgZ7vQiX4ddCrhxjawWojXMYxTz+HARzYyh
 5AXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LuTC2ch7lBeZqWq+4sA1VXQap+WvF8VB8BdbUaWqcHE=;
 b=n9GBYzWO/YWMzRCHyzhKsf7W2k4ftLQmZjuoQGReUpnyUYJQJrVgxPp0KrjWHto0wt
 6eWq7lNTSyqf+UrxQVqjBOJwu1lKU3V4jjdMv0x5st4x79MZf1sP+QEiA6Cj/8/q1F8S
 KIIMvnR7hmxsmE7VOeoZTCnd/dW5NEjlRaLu/IWt29LQalVLnTsAjO9GFRtKg98Oz608
 hO4LUSSf2iFT1GI/+mJ4FTygwZrrZsWBm7aHWwPo5YxSzYelww9DoEq2thxb4oLjhPD5
 WSPWuedRAEzTbpfhxFqfw0VTj7WTBUpexebZFKUnGQKNfcfSDW2V+moR3GB7Cuf013+g
 l15w==
X-Gm-Message-State: AFqh2krSZ/eMiL1ESzjjkX3K2/lOmm75O/AG0GqbYf40fKGgcCZryOL4
 q9Wo4ROpC3HquByLA6czmLV0wg==
X-Google-Smtp-Source: AMrXdXu8t5pfKS4rJQB9w2fmYZWbGOdVt9Co/jrV0noSh0NCRbIwq1U+45wR8Qydaxpx9ytF9YSmoQ==
X-Received: by 2002:a05:6512:22d0:b0:4c0:5798:38df with SMTP id
 g16-20020a05651222d000b004c0579838dfmr21545854lfu.27.1673220556738; 
 Sun, 08 Jan 2023 15:29:16 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 u18-20020a05651220d200b00494a603953dsm1283513lfr.89.2023.01.08.15.29.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 08 Jan 2023 15:29:16 -0800 (PST)
Message-ID: <06eab036-7c0f-55d5-2ad1-cfaf5dc0cc8d@linaro.org>
Date: Mon, 9 Jan 2023 01:29:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Content-Language: en-GB
To: Marijn Suijten <marijn.suijten@somainline.org>,
 phone-devel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Vinod Koul <vkoul@kernel.org>
References: <20221221231943.1961117-1-marijn.suijten@somainline.org>
 <20221221231943.1961117-6-marijn.suijten@somainline.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221221231943.1961117-6-marijn.suijten@somainline.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v2 5/8] drm/msm/dpu: Reject topologies for
 which no DSC blocks are available
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
Cc: Konrad Dybcio <konrad.dybcio@somainline.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Vinod Polimera <quic_vpolimer@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 Haowen Bai <baihaowen@meizu.com>, David Airlie <airlied@gmail.com>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Jani Nikula <jani.nikula@intel.com>,
 linux-arm-msm@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht, Sean Paul <sean@poorly.run>,
 Loic Poulain <loic.poulain@linaro.org>,
 Jami Kettunen <jami.kettunen@somainline.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Vladimir Lypak <vladimir.lypak@gmail.com>,
 Douglas Anderson <dianders@chromium.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, sunliming <sunliming@kylinos.cn>,
 Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 22/12/2022 01:19, Marijn Suijten wrote:
> Resource allocation of DSC blocks should behave more like LMs and CTLs
> where NULL resources (based on initial hw_blk creation via definitions
> in the catalog) are skipped ^1.  The current hardcoded mapping of DSC
> blocks however means that resource allocation shouldn't succeed at all
> when the DSC block on the corresponding index doesn't exist, rather than
> searching for the next free block.
> 
> This hardcoded mapping should be loosened separately as DPU 5.0.0
> introduced a crossbar where DSC blocks can be "somewhat" freely bound to
> any PP and CTL (in proper pairs).
> 
> ^1: which, on hardware that supports DSC, can happen after a git rebase
> ended up moving additions to _dpu_cfg to a different struct which has
> the same patch context.
> 
> Fixes: f2803ee91a41 ("drm/msm/disp/dpu1: Add DSC support in RM")
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 5 +++++
>   1 file changed, 5 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry


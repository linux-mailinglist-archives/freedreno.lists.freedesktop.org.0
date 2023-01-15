Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8318566B160
	for <lists+freedreno@lfdr.de>; Sun, 15 Jan 2023 15:07:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FE0D10E108;
	Sun, 15 Jan 2023 14:07:03 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B679010E114
 for <freedreno@lists.freedesktop.org>; Sun, 15 Jan 2023 14:07:01 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id d30so34502638lfv.8
 for <freedreno@lists.freedesktop.org>; Sun, 15 Jan 2023 06:07:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Vbj3GLgt2Eau/H2g6sLMJ/RsUpAnT1WTIdvedMs2Q3k=;
 b=c50CO4vlGc+jJwwRFGpqZX2QF2RwD/6f5cLmM7EBRgg1jL2ffIOrNUCX+DOpwd78oa
 sv0ChXhegh+zJF1rc98yPY3MzNfzuWixMtamwhv9/JA4G18o9g0gPuKc+QWFws9czhBv
 NQzeBYcQtYZAGYrWrjUC7ZYLOhlJAOmfYLrq/6csDSSTHwLMsLSu1mjEfSMShaP1k4/5
 /eT6cWYYovOiqJsWxNzt298K3ZjYHu9X6m5YMrs229ILA3AlOmQ3HnSGxLp4zrbLr/aO
 ll7FEHMJO7XlMsyDvkuO33Cg//768j6KXx/Ys9Tt0db7CeKFJhTGfZXwWPLsrhMwhn2/
 a79w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Vbj3GLgt2Eau/H2g6sLMJ/RsUpAnT1WTIdvedMs2Q3k=;
 b=1eB6bH2XAbzASxixnV87kl6z0gaiT2E1OqEEUkvX4ZlZElc4yEhAWw55KRChtp0s8v
 7zF9gCLasZs7Pj4ZHq9IuMeDW4hvWP9Pp6mu5ByEmHtrTNAavGakrvrxahbIluiJzMxX
 PBgd5wgyissvD2cHsSh7E6No0ywcSaNWxBu9EjhZx3RiAFEP7QNFUHNQKKfBtUDZEiqV
 Jiiaz/fHXEi4u/umT7cQpzJw6u3w4H2SDwNPsk2I44I3yf0ckkrRjX9Ip8kRf7MzYYlx
 f/rCcYWA4GvJ4ApXo7qai2P+AhRXwMfdCVxvXRiEFdemPr9nC9fG/hdseXZtTlQ1BLYS
 gHjw==
X-Gm-Message-State: AFqh2koNmbLGwrnAsYOcPWTQu9syFuiMHbm6/NPJODLUBXE0OILjY0U7
 q1eRlkFJAp7snBtX65VNnq/czQ==
X-Google-Smtp-Source: AMrXdXs2NS+83UDo1o1DPe0ALx+qxTh0ckGNxS9ouhCBcRnwVCNRtvnz0JPN4rwKbDzZUf0VZCq/bg==
X-Received: by 2002:a05:6512:3901:b0:4a4:68b7:e71c with SMTP id
 a1-20020a056512390100b004a468b7e71cmr23433544lfu.6.1673791619620; 
 Sun, 15 Jan 2023 06:06:59 -0800 (PST)
Received: from [192.168.2.31] ([188.170.85.102])
 by smtp.gmail.com with ESMTPSA id
 k42-20020a0565123daa00b004b55da01d3csm4651042lfv.191.2023.01.15.06.06.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 15 Jan 2023 06:06:59 -0800 (PST)
Message-ID: <d2a61ab4-49c2-1e8c-7913-98d8fb5b008b@linaro.org>
Date: Sun, 15 Jan 2023 16:06:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
References: <20221207142833.204193-1-dmitry.baryshkov@linaro.org>
 <cb3e7dfd-1844-65f9-aafd-32187047b535@quicinc.com>
Content-Language: en-GB
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <cb3e7dfd-1844-65f9-aafd-32187047b535@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] [PATCH 0/3] drm/msm/dpu: several fixes for UBWC
 setup
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 13/01/2023 23:43, Abhinav Kumar wrote:
> 
> 
> On 12/7/2022 6:28 AM, Dmitry Baryshkov wrote:
>> Several small corrections for the UBWC setup and related data.
>>
> 
> I am assuming this series will be dropped in favor of the RFC:
> 
> https://patchwork.freedesktop.org/series/111751/
> 
> Right?

No, they cover different topics. One covers the way the DPU handles UBWC 
setup, another one reworks MDSS.

> 
>> Dmitry Baryshkov (3):
>>    drm/msm/dpu: handle UBWC 1.0 in dpu_hw_sspp_setup_format
>>    drm/msm/dpu: correct the UBWC version on sm6115
>>    drm/msm/dpu: add missing ubwc_swizzle setting to catalog
>>
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 5 ++++-
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c    | 6 +++++-
>>   2 files changed, 9 insertions(+), 2 deletions(-)
>>

-- 
With best wishes
Dmitry


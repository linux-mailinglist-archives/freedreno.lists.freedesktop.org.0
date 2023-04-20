Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E7E886E876B
	for <lists+freedreno@lfdr.de>; Thu, 20 Apr 2023 03:25:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B609110E768;
	Thu, 20 Apr 2023 01:25:28 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCA8510E7E8
 for <freedreno@lists.freedesktop.org>; Thu, 20 Apr 2023 01:25:26 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2a8b1b51dbdso1878711fa.0
 for <freedreno@lists.freedesktop.org>; Wed, 19 Apr 2023 18:25:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681953925; x=1684545925;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=d0XK+8y4MT/KOSDossDvg1Vpqf+2iIPQlXjAG3Jypjs=;
 b=mSJpbVeHR/84SpjDjisOGfIxxcI9J6oNYELewt0FuEOLMhiAswG5eC/OaH3JJeiI1/
 4b679PyxTw8kcjYAMMdXsX6qya5qfL+hrYW5FaadKqOS/2W+cU7ngFrSXgZ4BNK7TkvL
 JUIVT/4zKH8sDjxZz3UC3FWLjHGbvTnLuJG2EF9nhb9WKLj/Ez+SS3c5jeFNnsnx+lr2
 +9q0Nu3eq5KOCN4QB4U7ZkryH0MK4iureG0PFD4hyZySqvPYrf6a28Xn+oPm8g7xGEZj
 dOKDGykeyejvrAM5u1V7p4WnHQlLII2KLNS1lwYL4YLj8itblVuhvBUGZj7TJkxfMn7o
 d1Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681953925; x=1684545925;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=d0XK+8y4MT/KOSDossDvg1Vpqf+2iIPQlXjAG3Jypjs=;
 b=Y/NEH+4JmEMdfVONCtmX/a+Z7EO+jxHGldaqU9OQh6Y3y4t9mhtJYjGYulxtepJjEn
 MCNClWS8precLsHV72SteoxyEgjy8eGgFShuaT2anxpii4/NBvaWkWkXtBUDAS8MMdVh
 5H7JRRkxY5dyeWUPgsiZmcrb15bhwHtq8xgFZtnXZltekX8urmuzoHzAD3M7XUPsjbq1
 zrlgjOPNamKzX0Eizf6rn6EKMv6kT5InKhPs0tbPPs7HFDavTM2XVb45T95smfLIzWFv
 M/z4V9ThetKCol3vBAEmC9TuRLVtVCuS3oGQvE/KFdSiTk9dnedOiiIr4ISfMB8sCPYi
 13Vg==
X-Gm-Message-State: AAQBX9feUTrxoStoESEzD30ahnQiq5jhT/FZA0YjtzWbwSD85Zsm3kk5
 6BM80vb7QaJ4y+UEw1bFZJlSFg==
X-Google-Smtp-Source: AKy350bmVhmmcvW69w5Z3K3vr624D7y0rkGwhbhc2WHBtOZSqtvMB4D1dCl6R5wcO4AvupQHYqAjBg==
X-Received: by 2002:a19:7606:0:b0:4d5:831a:1af8 with SMTP id
 c6-20020a197606000000b004d5831a1af8mr4553658lff.40.1681953925014; 
 Wed, 19 Apr 2023 18:25:25 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 h25-20020ac25979000000b004e9c8290512sm60805lfp.82.2023.04.19.18.25.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Apr 2023 18:25:24 -0700 (PDT)
Message-ID: <5b133c55-e4f5-bfd2-b542-a7d44313c038@linaro.org>
Date: Thu, 20 Apr 2023 04:25:23 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-GB
To: Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20230420-topic-dpu_gc-v1-0-d9d1a5e40917@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230420-topic-dpu_gc-v1-0-d9d1a5e40917@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH 0/2] DPU1 GC1.8 wiring-up
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
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 20/04/2023 04:14, Konrad Dybcio wrote:
> Almost all SoCs from SDM845 to SM8550 inclusive feature a GC1.8
> dspp sub-block in addition to PCCv4. The other block differ a bit
> more, but none of them are supported upstream.
> 
> This series adds configures the GCv1.8 on all the relevant SoCs.

Does this mean that we will see gamma_lut support soon?

> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
> Konrad Dybcio (2):
>        drm/msm/dpu1: Rename sm8150_dspp_blk to sdm845_dspp_blk
>        drm/msm/dpu1: Enable GCv1.8 on many SoCs
> 
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h   | 16 ++++++++--------
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h   | 16 ++++++++--------
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h   |  4 ++--
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h  |  4 ++--
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h   | 16 ++++++++--------
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h | 16 ++++++++--------
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h   | 16 ++++++++--------
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h   | 16 ++++++++--------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c           |  4 +++-
>   9 files changed, 55 insertions(+), 53 deletions(-)
> ---
> base-commit: 3cdbc01c40e34c57697f8934f2727a88551696be
> change-id: 20230420-topic-dpu_gc-6901f75768db
> 
> Best regards,

-- 
With best wishes
Dmitry


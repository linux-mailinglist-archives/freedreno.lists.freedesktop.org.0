Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6162D6D86D0
	for <lists+freedreno@lfdr.de>; Wed,  5 Apr 2023 21:26:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EBA310E34D;
	Wed,  5 Apr 2023 19:26:47 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCB0210E194
 for <freedreno@lists.freedesktop.org>; Wed,  5 Apr 2023 19:26:44 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id q16so48029091lfe.10
 for <freedreno@lists.freedesktop.org>; Wed, 05 Apr 2023 12:26:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680722803;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=sLzcG4MlgKosPfKnQ7gBaLqnAXjlpOcz2IP39djzqQA=;
 b=iVI1ivOySHvEATGbtZys7Llh1hRYym3+IE3pqF7OQVh131FPTSQ08dU1P5Bl7PbQjE
 8tRBb6XjM6jnmmqWZ+iYBhwhMYUzlKFo2+1CvPQbea3T/zs8nrN4NeEY4HabUAcHcRtl
 qrl6fv/8ltGvyBPvJcNGcT9293MRLwhYZSsWVKFs8Asr5qEPU9Wdo5Ij1QeLpJcsXAvj
 7doocd6fk99r3DP8gaMpV5hnmVA2mWCP7QVS9WuXCtq6EMeEvEonBcQ3C2PQFYY9+6MM
 RZrdqQOrMkl+vAogCPARUWxcZw5VsqUJ3cWfeUi/OuiRU5FfTYQKAZMHRKj4Iyy8H/f7
 ephw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680722803;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sLzcG4MlgKosPfKnQ7gBaLqnAXjlpOcz2IP39djzqQA=;
 b=vWfmIyq8UZE6SgrcMT6ljBqCZS5XmU0OlHgM3u+pgSYp7j2NUvPcOeon4JHrEBftXw
 h3hed0v3BIgFIst8ZWPnCTvLG4Ms0j4BInbHBCyJnGBIx8IC8Kth3VVPw9kxMWvKaXJr
 dBueQx9KGVEXBzUMlHt+Cco0kpRtRiz93oFZ1BP2vEO9rZrmvj6CUGaJfQDV4phFNFsD
 6EcxVbG8oIZ5vJE5lohQugH+/PIwO7ec2IOPR8nh6+Ejmvz8l1pG5y2ifxSvVNbjgT4n
 AiQ6ZmqR/lAWzNirMIQxDZMLg8qhCEc1t5EVIIYGu2cTXQewGU3Ry8ESrzVuSHIt3G/Y
 7+mA==
X-Gm-Message-State: AAQBX9fiXDOYPSi4mDSkvWSjs6dsgFp5gpM5QS/gIoE8+SC+p1tDvnr9
 OinlVmOU2M6ZHS/IucXv3URSUg==
X-Google-Smtp-Source: AKy350ZPNae/60EMSzL3SX+s6Rjo7g3DhUIiFceN+lJi5idmfimC0ZyqIWujsjc1inS04npdZA0/dg==
X-Received: by 2002:a05:6512:991:b0:4eb:7fa:38b9 with SMTP id
 w17-20020a056512099100b004eb07fa38b9mr1476205lft.8.1680722802996; 
 Wed, 05 Apr 2023 12:26:42 -0700 (PDT)
Received: from [10.10.15.130] ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 l3-20020ac24a83000000b004eb42f5367bsm1487186lfp.19.2023.04.05.12.26.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Apr 2023 12:26:42 -0700 (PDT)
Message-ID: <f10ea7e8-fc59-a843-85f0-9aa59bd9d66c@linaro.org>
Date: Wed, 5 Apr 2023 22:26:42 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-GB
To: Jessica Zhang <quic_jesszhan@quicinc.com>, freedreno@lists.freedesktop.org
References: <20230329-rfc-msm-dsc-helper-v4-0-1b79c78b30d7@quicinc.com>
 <20230329-rfc-msm-dsc-helper-v4-3-1b79c78b30d7@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230329-rfc-msm-dsc-helper-v4-3-1b79c78b30d7@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v4 3/6] drm/msm/dpu: Fix
 slice_last_group_size calculation
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
Cc: linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 05/04/2023 03:41, Jessica Zhang wrote:
> Correct the math for slice_last_group_size so that it matches the
> calculations downstream.
> 
> Changes in v3:
> - Reworded slice_last_group_size calculation to
>    `(dsc->slice_width + 2) % 3`
> 
> Fixes: c110cfd1753e ("drm/msm/disp/dpu1: Add support for DSC")
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry


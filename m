Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D205F70A44D
	for <lists+freedreno@lfdr.de>; Sat, 20 May 2023 03:33:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09E9B10E480;
	Sat, 20 May 2023 01:33:11 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A596B10E62A
 for <freedreno@lists.freedesktop.org>; Sat, 20 May 2023 01:33:09 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2af16426065so31470991fa.0
 for <freedreno@lists.freedesktop.org>; Fri, 19 May 2023 18:33:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684546388; x=1687138388;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9m6FYEdyuS34WJpEKNGhiGJw26BbhauPjEFJhVqIy84=;
 b=J2WAtndni5pg8zI01jaEewzpdR8rCPsAoHbZekp+7M7wC2x3R9lV418//z863DW65n
 2lUc3KDyHqYLd/BYBzCb+uiqjLN/9CLt1T1xBY4W326Xz1VlLg27DhrsdUr4KSEGc4e7
 rwLGneMzBtX9uDKXQ2tiw+kMkyTrE3mKeqUvyAOECJqTiUVwCraa9sePU3K9gItlfFUz
 1fccnmpHkpoYH6BPpwxCn/QluiL5NGN+jeyHtyD9ahQjzJaKQvimoTnyv59pD0rWMtt5
 FbuBOuOjbn7d8xA3FKXll6cU3ijggLoMHkMRp8NIQ9Qd7KxbWm3ySAdYBfXjJ8Duwq71
 h4Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684546388; x=1687138388;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9m6FYEdyuS34WJpEKNGhiGJw26BbhauPjEFJhVqIy84=;
 b=cA1uGDJ08Kc7zMDHE9DNG4UfSh5fGyQJjbkPbdemxlvu34cg7W6SaPjnb1agg54Gzx
 Pf4GtP//TlWEDcjfeFLjjjoTbbMNRFSs5E0P+Fi4O1UBnIVatiVkbPA4wcEC9L8ZIZ3p
 C8Wj4IpwIKfzy/PykNyt+gQGAwpLh69fxtGSS2yTXEM5inoV7TrzWvCiExwvojZgZLPw
 tI7TxBDibzwn/OwxK7yn7HV2XH2Eh/Xuk1DfIIduQO9q+YOQ+i01KBAnKP38aSRrfiQS
 11mxF1FXRSATWw1hQEhRdi9+f1kjpFo5eC4cRWDuP1pD1nH/IuaGC+B/Ebfjj1AtceCc
 2SIA==
X-Gm-Message-State: AC+VfDw7A1Cgjs8BMzWYLhPAUkF6is44OGikr1b06nVHGEgxZQTO+nFn
 SMWbrE2s2hP2MXPmHkDxfAPuxA==
X-Google-Smtp-Source: ACHHUZ7hSJky8D3B+kEQc4AR9VaHMZsAgYX95I/Fi+l7dRlfuSrwNICffM982tuTFljAsF+j/ezRAA==
X-Received: by 2002:a2e:880a:0:b0:2af:20c9:3f8a with SMTP id
 x10-20020a2e880a000000b002af20c93f8amr1515995ljh.7.1684546387794; 
 Fri, 19 May 2023 18:33:07 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 k7-20020ac24567000000b004efe9a169d2sm92819lfm.64.2023.05.19.18.33.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 May 2023 18:33:07 -0700 (PDT)
Message-ID: <02e1886f-801e-6100-f977-be407697df29@linaro.org>
Date: Sat, 20 May 2023 04:33:06 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-GB
To: Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>, Will Deacon
 <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Conor Dooley <conor+dt@kernel.org>
References: <20230411-topic-straitlagoon_mdss-v4-0-68e7e25d70e1@linaro.org>
 <20230411-topic-straitlagoon_mdss-v4-8-68e7e25d70e1@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230411-topic-straitlagoon_mdss-v4-8-68e7e25d70e1@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v4 08/12] drm/msm/dpu: Add SM6375 support
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 iommu@lists.linux.dev, Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 19/05/2023 20:04, Konrad Dybcio wrote:
> Add basic SM6375 support to the DPU1 driver to enable display output.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h | 153 +++++++++++++++++++++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |   1 +
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   1 +
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   1 +
>   4 files changed, 156 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry


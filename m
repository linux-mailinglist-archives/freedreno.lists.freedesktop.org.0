Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C46A262F52E
	for <lists+freedreno@lfdr.de>; Fri, 18 Nov 2022 13:41:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6003E10E727;
	Fri, 18 Nov 2022 12:41:33 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F54010E727
 for <freedreno@lists.freedesktop.org>; Fri, 18 Nov 2022 12:41:28 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id s24so6591225ljs.11
 for <freedreno@lists.freedesktop.org>; Fri, 18 Nov 2022 04:41:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=a0FTR6z372a+SVrLNdiUVE4A/1f4Z98NLhqS2FM1hNo=;
 b=QnzB1ZH6VzQ0SLGmOAUmv3pmPocgdO13g3DtWTWwEn8nRE3cPWSWXQOxY8k83pafaf
 N31xZiPAIoZkn9fGTakPcTAn53BQjMyQ6HpL+7GvJkxiKI2g/aH4CCHwlQv/6VoK86EF
 FJ5IGH1EFa4kOtzYAAY+P5lAFl0PUoPXDPBRpU2qcdXXE8m0JWJQddbzBvdAfM9A8yYn
 OjADxR7h4ROKMVswYG3IiTU2vLOHB85tKDb51F10/h+8vxGYhi+lkUXIQFWcwOC6zv2M
 uribWNj+76MEqHaPJAcoz7KbimeKaxv8n/fdoPG64qvt22qd1kEhNBP8cl74+kY4/aaQ
 syXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=a0FTR6z372a+SVrLNdiUVE4A/1f4Z98NLhqS2FM1hNo=;
 b=ydZzTcF9GZX74+HVdWnT5PP1Pt3ttfsibuREQ7cft4ZujQs2zb9ZmLKUe4m699SsRE
 8T7VjvznQM9dh+K6+RCAkjBJCUlfEzFOHxwNWHslMa2jqaU7SmcOybAOOVPrWRmq3uXG
 6+2+ocKx3GcB+TB7Q5ZILsg5JpmtIo9K70nxAyOoE22AQWgRyV3NjKlBM7/2El7fotOm
 2efmrIRE2Kr7CsP+bwM9sjKqTLpe06fgo0txLjcgctqxvdfi9zE35P0zmKAFpj/HOo+7
 Uh+mjS0uPrSSMW8/53G/tX6ze6g92mh+eVa0WlNtQbTnIke08ujRyyodHTreQcOW4LqJ
 siNg==
X-Gm-Message-State: ANoB5plls87Uw/bh4CnAaxjWe6E2HzJwu+UYxtwavDMrRDa4Wt2h4QFp
 bhEV8bY5rbPcb0KDRbfPaznDDg==
X-Google-Smtp-Source: AA0mqf7lErewth5EE2F868DAY6P5GOZSlqtM+eYuoc5OY1KVNj+hLDTJG51LiKE+OKuZfsP2eJgs5g==
X-Received: by 2002:a2e:8e6e:0:b0:277:92e:e088 with SMTP id
 t14-20020a2e8e6e000000b00277092ee088mr2309263ljk.140.1668775286907; 
 Fri, 18 Nov 2022 04:41:26 -0800 (PST)
Received: from [192.168.0.20]
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 y21-20020ac24215000000b004947984b385sm644590lfh.87.2022.11.18.04.41.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Nov 2022 04:41:26 -0800 (PST)
Message-ID: <e3c8121a-5234-1051-40c7-3989189badfa@linaro.org>
Date: Fri, 18 Nov 2022 13:41:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, Rob Clark <robdclark@gmail.com>
References: <20221114170635.1406534-1-dmitry.baryshkov@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221114170635.1406534-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v1 00/10] iommu/arm-smmu-qcom: Rework
 Qualcomm SMMU bindings and implementation
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
Cc: devicetree@vger.kernel.org, Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
 linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
 Vinod Koul <vkoul@kernel.org>, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 14/11/2022 18:06, Dmitry Baryshkov wrote:
> The main goal of this patchset is to define a generic qcom,smmu-500
> binding to be used by newer Qualcomm platforms instead of defining each
> and every SoC line with no actual differences between the compats.
> 
> While preparing this change it was required to cleanup the existing
> bindings and to rework the way the arm-smmu-qcom implementation handles
> binding to IOMMU devices.
> 
> Changes since RFC v2:
>  - Dropped the dts patch, picked up by Bjorn
>  - Fixed minor nits in commit messages and in-file comments (noted by
>    Krzysztof and Richard Acayan)
> 
> Changes since RFC v1:
>  - Added the dts patch fixing order of clocks in msm8996.dtsi
>  - Fixed the DT bot errors
>  - Added separate clause for Google Cheza devices

Please continue the version numbering. RFC is also a patch and also a
version. This is v3. Your next will be v4.

Best regards,
Krzysztof


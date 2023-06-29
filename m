Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 98B2B742459
	for <lists+freedreno@lfdr.de>; Thu, 29 Jun 2023 12:52:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2067810E11F;
	Thu, 29 Jun 2023 10:52:25 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A23310E0E8
 for <freedreno@lists.freedesktop.org>; Thu, 29 Jun 2023 10:52:22 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2b6c5ede714so6142801fa.1
 for <freedreno@lists.freedesktop.org>; Thu, 29 Jun 2023 03:52:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688035940; x=1690627940;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/ww5r6ehcjTwcaBETj8atUTtDfztCZTd5T+zbk2x5b0=;
 b=RK8XEAUhfo/4CKAgSU5yoeJ25LM/lt/RQHajNtFocyf9lgSBGTpUTD+9/2CUBq9N9M
 ZwU7wumFrZgvoX5Xel4e1Z/ObJ0wakytMCATqJ2sekp7ZYGUx54aI++Owoh21ot2Xy++
 IyRlGvMiwrlvuKNY3bqjpcyhTB2n2gGKhxyDYUwOpQohM3+0xcLsDkRRmrZbydDMDZYE
 qWWZCBVP+vMrGhbin0ZQ1+3C7hxx1t9uuyNN90nIpl9R1u4MaqtqjknuVNOk7E+Olpia
 ZKeDNXT/UExnmuxQd67OCp3ihnRy+MG1RXOZaG2ZtIitd5mDrcnMK7xX0/2H5DiMS7T9
 ch6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688035940; x=1690627940;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/ww5r6ehcjTwcaBETj8atUTtDfztCZTd5T+zbk2x5b0=;
 b=ALENqfR3dRGojgc164ICkEcxOKPoBg3nXBLsOoY27ouoG74pamhtcIBaMS2U4jRSff
 MyUNMI1gqiT2xptks5Jjpn3z9Oje9hGaCtk3mzbcOGA4vVFQrRNR8v31KxuD54GE9stj
 o1sdOFipACPxsyqjUEV3mEoKzgT9yom0zw4T3DfE23clmZ71YtO3y/9V7IBo2DwXr5T8
 tiKkVaAtV9C4XWiflPjOGS0bhMqfWci8QBBI7oMSGove589Ooh9LCf/RSrpEgqywB7nh
 goE6PDEFjOG3QM56Gt7x7PHBMKhNYVgmq0Nko45DBgzZNXlEPfMqNkw4CsWyVXLKaXwH
 5EhQ==
X-Gm-Message-State: AC+VfDzRFHAj9bSHy4x9TtrpoSX0EUyNKgic3Wa6J9kkwzQc+TdD+O4w
 MO2+7kPWOPE96v+9WuMexnYO3Q==
X-Google-Smtp-Source: ACHHUZ5/uLH0p626QLEMqtTMX6NRz6Qh5Jj3UWxEK1I0C3SvsxOzlED7EitXGpxRj73sD4YnV05uJg==
X-Received: by 2002:a19:e05a:0:b0:4f9:56b8:45e5 with SMTP id
 g26-20020a19e05a000000b004f956b845e5mr1386133lfj.25.1688035940348; 
 Thu, 29 Jun 2023 03:52:20 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 x28-20020ac259dc000000b004fb9d7b9914sm136870lfn.185.2023.06.29.03.52.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Jun 2023 03:52:19 -0700 (PDT)
Message-ID: <8b3d708d-58d2-60ff-7acf-8c1eac7d8dc5@linaro.org>
Date: Thu, 29 Jun 2023 13:52:18 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-GB
To: Marijn Suijten <marijn.suijten@somainline.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Loic Poulain <loic.poulain@linaro.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>
References: <20230627-sm6125-dpu-v2-0-03e430a2078c@somainline.org>
 <20230627-sm6125-dpu-v2-8-03e430a2078c@somainline.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230627-sm6125-dpu-v2-8-03e430a2078c@somainline.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v2 08/15] drm/msm/dpu: Add SM6125 support
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
Cc: devicetree@vger.kernel.org, Jami Kettunen <jami.kettunen@somainline.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Lux Aliaga <they@mint.lgbt>,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht, freedreno@lists.freedesktop.org,
 linux-clk@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 27/06/2023 23:14, Marijn Suijten wrote:
> Add definitions for the display hardware used on the Qualcomm SM6125
> platform.
> 
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h | 230 +++++++++++++++++++++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |   6 +
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   1 +
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   1 +
>   4 files changed, 238 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry


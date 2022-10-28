Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C09461115B
	for <lists+freedreno@lfdr.de>; Fri, 28 Oct 2022 14:29:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0268F10E81D;
	Fri, 28 Oct 2022 12:29:32 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53F7910E825
 for <freedreno@lists.freedesktop.org>; Fri, 28 Oct 2022 12:29:29 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id j14so8124641ljh.12
 for <freedreno@lists.freedesktop.org>; Fri, 28 Oct 2022 05:29:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:references:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xhh2GfNPqccqHt9z7S0/T4lVRI1pm6I0GIyqBlDEE6Q=;
 b=Gv3mhdHv4vTqTawNHz1Bsh6DyvFILad7+MCdXJ/Kg9Hu8zE08m6fZ8RGYRwg76Qt7h
 xiVKcxSf9tQQxNOF007MpB2BTQUVbn3dCwuaS2V+PFtS2nPi0x0fe7DPKouC0o8+IPtF
 aKKWJX/UxIDkAf7/FTMYLYItVomf7DtW17XMYNjmxuMmB6cerpTlO1ofsONDt2eJoXSR
 peDoWokbyIryddPi1EUHNAj8obcrkfrzSmbmaEYDSy8nNcGWxisgLP0d77xdEaUIfyjX
 AC5eXEc1PmLjCOg7c3rOVB0LocXqV6ephnuD692n+5j0VW3Kfs6fluKoG3wpY47ezLvl
 cluA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xhh2GfNPqccqHt9z7S0/T4lVRI1pm6I0GIyqBlDEE6Q=;
 b=3oriebzkLdO80djquqgBsqrGjuQPvJIY8gdRO+RO0glI1Nh0uOKhMO/CjuTWRUgijh
 6XTF+aCwzqRcf5GJTlp6/T6PM54VLSdPEFy0e3pGaVCpDzE/RUuvoh0mcJSZ1fimWZPN
 BNKY7+Xx/94DKSk3GMPvLhntaIaKKTqaaWFpVSfKrf/DsLygOxwtqVoot3OESIK3sFsU
 koBPH74Nq7MsgDhYv3jH1IwFQsd1flO4JTETlrx2TNhh8OyyS3cZvhVPcWAxNzC1WzNf
 InAZnwpAGgwjoH4reCCidJ82BYrGioJnK4M1mUgJDFGpP5rUIYAc2JFbhgnGsz0l17Tx
 vZDQ==
X-Gm-Message-State: ACrzQf2M7A+mqq1VSWN0PdcEs6MV8NxnqaFe5J0Ohc7b6jY6QtpZnoOU
 AA7vSpbp1gTP1OCQ/34Fe90G8A==
X-Google-Smtp-Source: AMsMyM4cqflCH7VKbXl6GhfGyt9BzQJBZMw3rl9thrFiCIpESo5T+Xin/zo7hOdtAxup19xhLpLF2w==
X-Received: by 2002:a05:651c:111:b0:277:2451:816c with SMTP id
 a17-20020a05651c011100b002772451816cmr4467514ljb.17.1666960167619; 
 Fri, 28 Oct 2022 05:29:27 -0700 (PDT)
Received: from [10.10.15.130] ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 z10-20020a05651c11ca00b00277074c12ddsm621018ljo.125.2022.10.28.05.29.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Oct 2022 05:29:27 -0700 (PDT)
Message-ID: <09a049cc-0514-2db3-0e8b-ff3dfa61d585@linaro.org>
Date: Fri, 28 Oct 2022 15:29:26 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Content-Language: en-GB
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Robert Foss <robert.foss@linaro.org>, agross@kernel.org,
 bjorn.andersson@linaro.org, konrad.dybcio@somainline.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, robdclark@gmail.com,
 quic_abhinavk@quicinc.com, sean@poorly.run, airlied@linux.ie,
 daniel@ffwll.ch, quic_kalyant@quicinc.com, swboyd@chromium.org,
 angelogioacchino.delregno@somainline.org, loic.poulain@linaro.org,
 quic_vpolimer@quicinc.com, vkoul@kernel.org, dianders@chromium.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, Jonathan Marek <jonathan@marek.ca>,
 vinod.koul@linaro.org, quic_jesszhan@quicinc.com
References: <20221028120812.339100-1-robert.foss@linaro.org>
 <20221028120812.339100-2-robert.foss@linaro.org>
 <0f8e73f6-d005-7e0b-ba38-c4d0161c1acd@linaro.org>
In-Reply-To: <0f8e73f6-d005-7e0b-ba38-c4d0161c1acd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] [PATCH v1 1/9] drm/msm: Add compatibles for SM8350
 display
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

On 28/10/2022 15:19, Dmitry Baryshkov wrote:
> On 28/10/2022 15:08, Robert Foss wrote:
>> Add compatible string for "qcom,sm8350-dpu" and
>> "qcom,sm8350-mdss".
>>
>> Signed-off-by: Robert Foss <robert.foss@linaro.org>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 1 +
>>   drivers/gpu/drm/msm/msm_mdss.c          | 1 +
>>   2 files changed, 2 insertions(+)
> 
> [skipped]
> 
>> diff --git a/drivers/gpu/drm/msm/msm_mdss.c 
>> b/drivers/gpu/drm/msm/msm_mdss.c
>> index e13c5c12b775..fd5a95cace16 100644
>> --- a/drivers/gpu/drm/msm/msm_mdss.c
>> +++ b/drivers/gpu/drm/msm/msm_mdss.c
>> @@ -447,6 +447,7 @@ static const struct of_device_id mdss_dt_match[] = {
>>       { .compatible = "qcom,sc8180x-mdss" },
>>       { .compatible = "qcom,sm8150-mdss" },
>>       { .compatible = "qcom,sm8250-mdss" },
>> +    { .compatible = "qcom,sm8350-mdss" },
>>       {}
>>   };
>>   MODULE_DEVICE_TABLE(of, mdss_dt_match);
> 
> 
> BTW: you probably also have to update the msm_mdss_enable() function 
> with the 8350-specific code.
> 

For mdss changes you can depend on [1], I plan to merge this patch in 
this window.

[1] https://patchwork.freedesktop.org/patch/489578/?series=105162&rev=1

Also with the mdss changes, it would be good to split this patch into 
dpu and mdss parts.

-- 
With best wishes
Dmitry


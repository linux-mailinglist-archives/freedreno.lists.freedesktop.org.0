Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E75F47FBB43
	for <lists+freedreno@lfdr.de>; Tue, 28 Nov 2023 14:18:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3BD310E519;
	Tue, 28 Nov 2023 13:18:35 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAE8A10E07D
 for <freedreno@lists.freedesktop.org>; Tue, 28 Nov 2023 13:18:32 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2c9b8363683so4811951fa.3
 for <freedreno@lists.freedesktop.org>; Tue, 28 Nov 2023 05:18:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701177511; x=1701782311; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=tTf2yUtECbY/OYuChMFvXRgzzGsfDdzdXOehMmGhewk=;
 b=XkuSWrY1Qph4pfTqw3fsAq1c1exwf9OahJy6gyEDVK56klgkRDquxSv1bzGAHYCID2
 tvgnzJjuWBaNm/RW/z+QzAtDokDb3Rvh5QGI/HJsa5ok6w1aBsjBlrEsuN2rBbWq5Cae
 0JqCl6EPtC5h0JqJqP5+ysvtQQROR8o1/t60uGyjuCrC6uUStnsjAofqhGy1+2xXUiO2
 NPIuasPzNkEMTmTjWFdOGemXouzveo7QCgrLq9G8L/kAJBh1BxtrFXJyfxHlY+Y5bCew
 ptubUyzUP2To1CX8MrYawGfUOswuXu92uupySd6Z9mRFQjYtg2H4B4HuX2pJCO7lhVXG
 LJYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701177511; x=1701782311;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tTf2yUtECbY/OYuChMFvXRgzzGsfDdzdXOehMmGhewk=;
 b=iF2JDm1KY93VWa0s6VptUjN/6x2jHmNUwPuUOG4dvE/cKv1EpPtinPc6pPQCIKahNT
 JjHKv81pc83t9Y/lEiOzLF0FYyNuXz4NcrIJ3KI8XAs9uPZLDQ6Kuc2iCTfJqGxFMrip
 vi89lWpXlVFLz6+CKo6JvMhdtoHMuImAoCEiutY2nhURz/7Rkj1VDAHOvvHQGo0m1C9M
 yIeRD4qRGjqbPILwYarRNP9is5AJ43CJ9lYBp7KRaFSDa2azYAoD21tLTvjB7GC89MJB
 tm0RaJGI3a7wwfTisq6YiErBuqcVpRCbRLehxnqL/EAU5h4I3JZdh+wUozA87NGDlI5j
 r62Q==
X-Gm-Message-State: AOJu0Yy1iKUAfo8N1jGSVpKh5hvtTpcKc6h17+Tmw9blRe4dOpVnuyT/
 ayHpHprL9sDmXhyOtewqjPHaSA==
X-Google-Smtp-Source: AGHT+IGqrSCmGnNKknw600PvCwdJ4nyNLsm/yU9AqIvf2jLutSas7DdHhjfbocjXyLUEEP7CqlRP5A==
X-Received: by 2002:a05:651c:39d:b0:2c9:9983:6fba with SMTP id
 e29-20020a05651c039d00b002c999836fbamr5636031ljp.52.1701177511295; 
 Tue, 28 Nov 2023 05:18:31 -0800 (PST)
Received: from ?IPV6:2001:14ba:a0db:1f00::227?
 (dzdqv0yyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::227])
 by smtp.gmail.com with ESMTPSA id
 t7-20020a2e9547000000b002b657f10b78sm1707226ljh.58.2023.11.28.05.18.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Nov 2023 05:18:30 -0800 (PST)
Message-ID: <83e4f84f-63bd-4f53-886e-5cff215fd802@linaro.org>
Date: Tue, 28 Nov 2023 15:18:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Loic Poulain <loic.poulain@linaro.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Andy Gross
 <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Georgi Djakov <djakov@kernel.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Robert Marko <robimarko@gmail.com>, Das Srinagesh <quic_gurus@quicinc.com>,
 cros-qcom-dts-watchers@chromium.org
References: <20231125-topic-rb1_feat-v2-0-979b28f35e4a@linaro.org>
 <20231125-topic-rb1_feat-v2-5-979b28f35e4a@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20231125-topic-rb1_feat-v2-5-979b28f35e4a@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v2 05/12] iommu/arm-smmu-qcom: Add QCM2290
 DPU compatible
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
Cc: devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>,
 linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 iommu@lists.linux.dev, Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 27/11/2023 17:28, Konrad Dybcio wrote:
> Add the QCM2290 DPU compatible to clients compatible list, as it also
> needs the workarounds.

Nit: MDSS, not DPU compatible

With that fixed:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>   drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> index 549ae4dba3a6..aea5e85b20ff 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> @@ -245,6 +245,7 @@ static const struct of_device_id qcom_smmu_client_of_match[] __maybe_unused = {
>   	{ .compatible = "qcom,adreno" },
>   	{ .compatible = "qcom,mdp4" },
>   	{ .compatible = "qcom,mdss" },
> +	{ .compatible = "qcom,qcm2290-mdss" },
>   	{ .compatible = "qcom,sc7180-mdss" },
>   	{ .compatible = "qcom,sc7180-mss-pil" },
>   	{ .compatible = "qcom,sc7280-mdss" },
> 

-- 
With best wishes
Dmitry


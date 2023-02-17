Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94EB869B4B2
	for <lists+freedreno@lfdr.de>; Fri, 17 Feb 2023 22:25:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A64A10F0DC;
	Fri, 17 Feb 2023 21:25:16 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1B6B10F0E6
 for <freedreno@lists.freedesktop.org>; Fri, 17 Feb 2023 21:25:13 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id i13so3391229lfe.1
 for <freedreno@lists.freedesktop.org>; Fri, 17 Feb 2023 13:25:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=sUPH9uNj9RqxPqJIqqWj0KB91ZhxHRmW1pLTfov3kco=;
 b=lSupLjkici3HybLblbRtU3qCo4YOOwypd8SBq9COhRVq4/KgZiIwHtFvlA553pxNk0
 VBCmFNuaLOQNNh8iVlgrJt0Uilqd46QZ6Uke+SRbWpShFvf3M6J7//Rsxznp1nu0yurK
 5IPZDQwGpRRXbOIpSOn6Zpxikn994N7vUc/C7jHCAY6Vo9bS1S4vYYwpmSoqXvh2Zj2w
 cthwNKFWYYI80FJLipwP+AYUZpmHt7zXPED0yM4oPJiTgtDoeEfxCb2a/yPusl3CTo/w
 lXE6JRYurHtjHIPoOaYIvqVGj8NgNhdcvzSOjJi9ZPWTqRQLKmg2SbGufsrfPlfr74tD
 WMjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sUPH9uNj9RqxPqJIqqWj0KB91ZhxHRmW1pLTfov3kco=;
 b=bxQW1+oMSZn318Jl+zQKEgq2fLgnFDlvTNd9X9FIRWbpcMSSnx1bODPxrCMRJZNHGb
 dZWm5Ux/y8DQSH3kFMHpFi5Y8iBP8zM98v7EOxB3vP6qPEg4VU+53/9h7SVf4n/mRm3H
 SAEKfRmW5XofSGSuOAgEMZV69/ZR/Zi+CZtPcYT7jdbfyjZ6bfjkRyOcBHu9Gdc4wVnc
 Cwc+4GhmDe0oed2kLejfoisUGSSYiGEkMT8picLzndJlwotMgTEXpea8NgNGAV3rUYVe
 2Ide6PTnO+X0G+TXIx2fSQQVgBPtWuK+R2SWEw1JY3dY0f+WlD9xtr56TkJkJXooVokt
 bDzQ==
X-Gm-Message-State: AO0yUKU6zndLkUG21e44Fi+t0d/x4o7KgS7cQzSdKrxUJ+iJjq0PA6B2
 oLkwvgZsikaJiWCPwqSlL8L2hw==
X-Google-Smtp-Source: AK7set+2WH3f6NpOexHTvZe/aiTMUQ2QqreldPbI1NZb0VtRO9YNs6e28nAhj+xUIdxsjsoBF0J8VQ==
X-Received: by 2002:a19:7402:0:b0:4dc:4fe2:2aad with SMTP id
 v2-20020a197402000000b004dc4fe22aadmr2001005lfe.41.1676669111892; 
 Fri, 17 Feb 2023 13:25:11 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 e14-20020ac2546e000000b004dc721ea6a1sm576284lfn.273.2023.02.17.13.25.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Feb 2023 13:25:11 -0800 (PST)
Message-ID: <5fdb7416-4764-1bae-08b4-31fc2cdd7860@linaro.org>
Date: Fri, 17 Feb 2023 23:25:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Content-Language: en-GB
To: Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org,
 andersson@kernel.org, agross@kernel.org
References: <20230214173145.2482651-1-konrad.dybcio@linaro.org>
 <20230214173145.2482651-14-konrad.dybcio@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230214173145.2482651-14-konrad.dybcio@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v2 13/14] drm/msm/a6xx: Add A619_holi
 speedbin support
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
Cc: freedreno@lists.freedesktop.org, Akhil P Oommen <quic_akhilpo@quicinc.com>,
 David Airlie <airlied@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, Douglas Anderson <dianders@chromium.org>,
 Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 marijn.suijten@somainline.org, Sean Paul <sean@poorly.run>,
 Chia-I Wu <olvaffe@gmail.com>, linux-kernel@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 14/02/2023 19:31, Konrad Dybcio wrote:
> A619_holi is implemented on at least two SoCs: SM4350 (holi) and SM6375
> (blair). This is what seems to be a first occurrence of this happening,
> but it's easy to overcome by guarding the SoC-specific fuse values with
> of_machine_is_compatible(). Do just that to enable frequency limiting
> on these SoCs.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 31 +++++++++++++++++++++++++++
>   1 file changed, 31 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index ffe0fd431a76..94b4d93619ed 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -2094,6 +2094,34 @@ static u32 a618_get_speed_bin(u32 fuse)
>   	return UINT_MAX;
>   }
>   
> +static u32 a619_holi_get_speed_bin(u32 fuse)
> +{
> +	/*
> +	 * There are (at least) two SoCs implementing A619_holi: SM4350 (holi)
> +	 * and SM6375 (blair). Limit the fuse matching to the corresponding
> +	 * SoC to prevent bogus frequency setting (as improbable as it may be,
> +	 * given unexpected fuse values are.. unexpected! But still possible.)
> +	 */
> +
> +	if (fuse == 0)
> +		return 0;
> +
> +	if (of_machine_is_compatible("qcom,sm4350")) {
> +		if (fuse == 138)
> +			return 1;
> +		else if (fuse == 92)
> +			return 2;
> +	} else if (of_machine_is_compatible("qcom,sm6375")) {
> +		if (fuse == 190)
> +			return 1;
> +		else if (fuse == 177)
> +			return 2;

Ugh.

> +	} else
> +		pr_warn("Unknown SoC implementing A619_holi!\n");
> +
> +	return UINT_MAX;
> +}
> +
>   static u32 a619_get_speed_bin(u32 fuse)
>   {
>   	if (fuse == 0)
> @@ -2153,6 +2181,9 @@ static u32 fuse_to_supp_hw(struct device *dev, struct adreno_rev rev, u32 fuse)
>   	if (adreno_cmp_rev(ADRENO_REV(6, 1, 8, ANY_ID), rev))
>   		val = a618_get_speed_bin(fuse);
>   
> +	else if (adreno_cmp_rev(ADRENO_REV(6, 1, 9, 1), rev))

I really think it begs to have && !of_find_property(dev->of_node, 
"qcom,gmu") here.

> +		val = a619_holi_get_speed_bin(fuse);
> +
>   	else if (adreno_cmp_rev(ADRENO_REV(6, 1, 9, ANY_ID), rev))
>   		val = a619_get_speed_bin(fuse);
>   

-- 
With best wishes
Dmitry


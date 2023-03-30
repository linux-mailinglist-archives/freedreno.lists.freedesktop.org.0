Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 14AF66D1240
	for <lists+freedreno@lfdr.de>; Fri, 31 Mar 2023 00:40:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0DA610F08B;
	Thu, 30 Mar 2023 22:40:00 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D44C510F08B
 for <freedreno@lists.freedesktop.org>; Thu, 30 Mar 2023 22:39:58 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id br6so26487399lfb.11
 for <freedreno@lists.freedesktop.org>; Thu, 30 Mar 2023 15:39:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680215997;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=OurrUfulgDLG1acYGUK2PeBost/v1bN601i045HTPhk=;
 b=qmwdk07Z+xXFSEYoKyC+rywMRGMEXnPEzbqcmAfmOV1zUlDj49u+n5XPQhs9mVJt7y
 LKNp21BFM0+xFTdoWNws2WLO7bhO18LH8wihXkDHQDqGVWvaZEHxLVUtWSy+a22WgMVw
 jly5fLPH6fZauDuL8n+Rgd4eZpbuK+TB35xM/DoJJNh441bHfSOfBFPGG8EtbSS8QD9S
 IN1Nt053GsX354C4uaGpdyxrwhofPdb6+5QsX4vHWnDLp+33lSEk+s2s+MKocijFY/3q
 zCrelbBygD1Oxm2tIlQ9WteH7nxXuj3Dfq3+bzzyka5/TxoOgQJUpR1VgAa73hFSmjpA
 DsAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680215997;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OurrUfulgDLG1acYGUK2PeBost/v1bN601i045HTPhk=;
 b=c5xnQxddoCzeD+GYvcGrD7KL2N1Q1NKOIpMwPT957X58TNhP8OWJU72ewic2/ZJ6J+
 kyUiGIrBw34ccSkf59mAe5oRK8PeiX8cxdTrUwfbh+hFj5K5leNV4ViAkm+L44J8ZUa+
 ucW0+4laYTryShKjb5eduDeVQ/SEp1Z0E5Mk+pkZH9YP42iv9VxyJZrrXJI0oUPuSi04
 KnCU5dUJWH8r9L07U5L1jBLsh8VNQZOiAXqawho74AaKI8/1WqYqYFAotfNLIE7kpH5m
 6CG2HwOgWV1yusoJlrKBrEXRn6B0aayxWzmiUAXj33B8rujIziDT5b6k8l3DcfTPa2gE
 SEpw==
X-Gm-Message-State: AAQBX9c7xGDWv+Rd5Bt30PrQgdGyVimmzu1XifpL3M1yGwGon5VQlUXC
 6elD0xYyOAhrj9mSv4WjAEqmyA==
X-Google-Smtp-Source: AKy350Z7nKasA21i3nRGHseFKu8567qcSr/P8vJhq+AIt0QGXwZ9bG3NVjkH74OAuWvhGacWNHnIIw==
X-Received: by 2002:ac2:4830:0:b0:4e8:6261:58bd with SMTP id
 16-20020ac24830000000b004e8626158bdmr7154846lft.37.1680215997048; 
 Thu, 30 Mar 2023 15:39:57 -0700 (PDT)
Received: from [192.168.1.101] (abxj225.neoplus.adsl.tpnet.pl. [83.9.3.225])
 by smtp.gmail.com with ESMTPSA id
 m4-20020a195204000000b004db0d97b053sm114976lfb.137.2023.03.30.15.39.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Mar 2023 15:39:56 -0700 (PDT)
Message-ID: <2c8cab8c-c70d-8f59-e3d8-23b79c3cdb22@linaro.org>
Date: Fri, 31 Mar 2023 00:39:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20230330215324.1853304-25-dmitry.baryshkov@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230330215324.1853304-25-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [v3,
 24/38] drm/msm/dpu: catalog: add comments regarding
 DPU_CTL_SPLIT_DISPLAY
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
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>



On 30.03.2023 23:53, Dmitry Baryshkov wrote:
> For sm8150+ the DPU_CTL_SPLIT_DISPLAY should be replaced with
> DPU_CTL_ACTIVE_CFG support (which supports having a single CTL for both
> interfaces in a split). Add comments where this conversion is required.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h | 1 +
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h | 1 +
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h | 1 +
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h | 1 +
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h | 1 +
>  5 files changed, 5 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
> index e6280b0cb207..6c6f8b4a4be8 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
> @@ -42,6 +42,7 @@ static const struct dpu_mdp_cfg sm8150_mdp[] = {
>  	},
>  };
>  
> +/* FIXME: get rid of DPU_CTL_SPLIT_DISPLAY in favour of proper ACTIVE_CTL support */
>  static const struct dpu_ctl_cfg sm8150_ctl[] = {
>  	{
>  	.name = "ctl_0", .id = CTL_0,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
> index f19d1c2ba845..cfaa68a25427 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
> @@ -43,6 +43,7 @@ static const struct dpu_mdp_cfg sm8250_mdp[] = {
>  	},
>  };
>  
> +/* FIXME: get rid of DPU_CTL_SPLIT_DISPLAY in favour of proper ACTIVE_CTL support */
>  static const struct dpu_ctl_cfg sm8250_ctl[] = {
>  	{
>  	.name = "ctl_0", .id = CTL_0,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
> index 9afcb6cc50a5..84396240f0d1 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
> @@ -41,6 +41,7 @@ static const struct dpu_mdp_cfg sm8350_mdp[] = {
>  	},
>  };
>  
> +/* FIXME: get rid of DPU_CTL_SPLIT_DISPLAY in favour of proper ACTIVE_CTL support */
>  static const struct dpu_ctl_cfg sm8350_ctl[] = {
>  	{
>  	.name = "ctl_0", .id = CTL_0,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
> index af80e1ced3ce..49dd4a908413 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
> @@ -42,6 +42,7 @@ static const struct dpu_mdp_cfg sm8450_mdp[] = {
>  	},
>  };
>  
> +/* FIXME: get rid of DPU_CTL_SPLIT_DISPLAY in favour of proper ACTIVE_CTL support */
>  static const struct dpu_ctl_cfg sm8450_ctl[] = {
>  	{
>  	.name = "ctl_0", .id = CTL_0,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
> index 5c437c7682ea..c9d1892ec8f5 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
> @@ -43,6 +43,7 @@ static const struct dpu_mdp_cfg sm8550_mdp[] = {
>  	},
>  };
>  
> +/* FIXME: get rid of DPU_CTL_SPLIT_DISPLAY in favour of proper ACTIVE_CTL support */
>  static const struct dpu_ctl_cfg sm8550_ctl[] = {
>  	{
>  	.name = "ctl_0", .id = CTL_0,

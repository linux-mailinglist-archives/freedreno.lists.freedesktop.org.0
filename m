Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E3AC06D1247
	for <lists+freedreno@lfdr.de>; Fri, 31 Mar 2023 00:40:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B385010F08B;
	Thu, 30 Mar 2023 22:40:40 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE43B10F08B
 for <freedreno@lists.freedesktop.org>; Thu, 30 Mar 2023 22:40:38 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id q16so26506687lfe.10
 for <freedreno@lists.freedesktop.org>; Thu, 30 Mar 2023 15:40:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680216037;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2/ja3fIGJRWDcuO7yeZRURjc4pI/MTQBKxIMYeWLRVY=;
 b=qxp4eqg4dlFQ3Fki7aQ/XWlce3pMJmYyAdcynlUAxSx7WvVnpgOrYyfvCRnHC+OFeo
 ofKlGEJlLVys+eQBfjt7OWLKx3GkjNs3xqhHF1e947OPe/y6cY77vUevXASfVaA23PuY
 olHGfPgJ9IvScdxwkbNCQC417JLxcSK5h5xY/iTszrORiMXybJLVbTKlPIctEzrwt0G3
 U8rluHKnKvh2PMfnSS6EB4ESFzWgxKcIpQxenIIHxk8q9zsBU+jmvJYMNvGgDvEZ1c2a
 5tphqwaDvbB+Q1b1Ol7VPiGxczco5ievV7XdX1b44e1afsN9caTxAdsJUq1XvOkeY2K3
 mbUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680216037;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2/ja3fIGJRWDcuO7yeZRURjc4pI/MTQBKxIMYeWLRVY=;
 b=7My3dy4IsR2AiLNbcXA7AgJ+1IXVfNloisp3ux8pIz9GlMx4mCx+EQHDNlumYB4L4l
 t6auUo08Yu8XBj3Lgm0JXYnFOmab33P4sv6g8kSWxY3M1MdHX56MIPEkajSLzgynC/w3
 eZtGiKgLxNBI4f8QhlNfbZx3CX9QiEMoz1uyA09FZDJVuOAgySiqHPNMtLgKPm23unpB
 Oa2ZzViT0tDiLiJ+18Yb2eYNB1OHff1MmN3PtnSqPTlbg+fqLrRwd/3WsOxynRwWyQQA
 SsEssbrWM081j4bfghIQdDIk2L3Z7+Jt4VkeLfmtSuheSDdGvntnHKCK0l/OP89fTW3d
 yGiw==
X-Gm-Message-State: AAQBX9eexMRvKqiBYcz+4ko2I7TcVRBuh0c3ZNNMFEPLeWlDbj61BJay
 W6Ywf9k3CBIRWx4qONdme3fxNg==
X-Google-Smtp-Source: AKy350aJj/YVs57oOua+pPg52YOhSmhHcSSpoKDYtxIqVi7a9hZWSol2a27ncUM0XvE2g54LV2AHSg==
X-Received: by 2002:a19:e05c:0:b0:4d8:86c1:4786 with SMTP id
 g28-20020a19e05c000000b004d886c14786mr2401377lfj.27.1680216037367; 
 Thu, 30 Mar 2023 15:40:37 -0700 (PDT)
Received: from [192.168.1.101] (abxj225.neoplus.adsl.tpnet.pl. [83.9.3.225])
 by smtp.gmail.com with ESMTPSA id
 v26-20020ac2561a000000b004cb8de497ffsm114763lfd.154.2023.03.30.15.40.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Mar 2023 15:40:37 -0700 (PDT)
Message-ID: <f32f9f21-aef2-cf58-bfcc-2f946e532fcb@linaro.org>
Date: Fri, 31 Mar 2023 00:40:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20230330215324.1853304-29-dmitry.baryshkov@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230330215324.1853304-29-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [v3,28/38] drm/msm/dpu: enable DSPP on sc8180x
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
> Enable DSPP blocks on sc8180x platform, basing on the vendor dtsi.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
> index 92a8e474e380..bbdfec415185 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
> @@ -90,6 +90,8 @@ static const struct dpu_mdss_cfg sc8180x_dpu_cfg = {
>  	.sspp = sm8150_sspp,
>  	.mixer_count = ARRAY_SIZE(sm8150_lm),
>  	.mixer = sm8150_lm,
> +	.dspp_count = ARRAY_SIZE(sm8150_dspp),
> +	.dspp = sm8150_dspp,
>  	.pingpong_count = ARRAY_SIZE(sm8150_pp),
>  	.pingpong = sm8150_pp,
>  	.merge_3d_count = ARRAY_SIZE(sm8150_merge_3d),

Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 21CE1724C21
	for <lists+freedreno@lfdr.de>; Tue,  6 Jun 2023 21:05:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEC8810E244;
	Tue,  6 Jun 2023 19:04:56 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25DD810E063
 for <freedreno@lists.freedesktop.org>; Tue,  6 Jun 2023 19:04:55 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-4f6255ad8aeso3715511e87.2
 for <freedreno@lists.freedesktop.org>; Tue, 06 Jun 2023 12:04:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686078292; x=1688670292;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gtFgxYwjpUt68r3YPqakTIdPhlEwVeuW3nCboOazwYw=;
 b=hC5RWVnOExAfo1+RCwZD04IMwg7WZ8kKQK6HVJCvLuu5xXsnFGnn1bPKZA6UCn90Cs
 /kGaLoAvXe6lD6gqi9YHIsWSvBfuQIavrLXsBRFUdb0GRsQfduxItmUIqFnIYNRZOLMb
 3JNaaugZQCcdU7NIQ02HLzjOxmv/PMCH+vCzuvZv4/qwDorzdSNTxEqSKjcfIYIWxxDT
 uevZ3i2n1xw1iaKTIZqs0AXnw9+fBltRRAH7Ucjte3sCiuFAkRWmbfX1r08SNhRn+8xW
 +XZQxOUhxIjF554m09kK08wbe/xUqHgX7YQcBLxz2XmD7VV9L6pwkXdncvy6pUZDbAjh
 z6Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686078292; x=1688670292;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gtFgxYwjpUt68r3YPqakTIdPhlEwVeuW3nCboOazwYw=;
 b=hxMHJwPgOUqxGh1Wp5vDKLibR6QjjFMI5uMqpe2aTt5IsIahSLaUtSxZbzmmiLS0ho
 Ohx2zKCVWIik9wiOzVY8KmxWC/cUWVe4zK5XrBWvOx0bnPQfVBZV4dDtTwh6x+MNcn3U
 MZ/LjEY/AAYTrzAb2Aj0wx+tTWRRQ2ueRikJnP6cJVZIVOfhKuZXXggycHANk72h74bL
 97X3g5071Q0LRMJOw2O839CTyfSE7YWC+ZHVcZNg/sK1Z/0CJmhbycmAWyxKjUX9SCer
 qBwcu7cm9qo0BiTuXmSu59g06Ar/9C+eACZnfS6djUeba00y69o40aW71/wZ+ITXMGK1
 znpw==
X-Gm-Message-State: AC+VfDwa5ePqfAnEkKmBmsNTLFgW/anq4gXFksoWKK4K+O1QHRuDVv69
 s4zsTE+lwISvTncowT6W+7GaWw==
X-Google-Smtp-Source: ACHHUZ6bgt/R2v8mJhbothbqAYtjCEQJuoHpVxJyzRnUW3hd73sKHWap/htT50fIsZIcT2Nm54StGw==
X-Received: by 2002:ac2:43b3:0:b0:4f3:b32d:f744 with SMTP id
 t19-20020ac243b3000000b004f3b32df744mr1289528lfl.11.1686078292036; 
 Tue, 06 Jun 2023 12:04:52 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 f2-20020ac25322000000b004cb14fa604csm1537514lfh.262.2023.06.06.12.04.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jun 2023 12:04:51 -0700 (PDT)
Message-ID: <0ab30652-4ee5-e4e8-9802-d8211dfb8d67@linaro.org>
Date: Tue, 6 Jun 2023 22:04:50 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-GB
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, robdclark@gmail.com,
 sean@poorly.run, swboyd@chromium.org, dianders@chromium.org,
 vkoul@kernel.org, daniel@ffwll.ch, airlied@gmail.com, agross@kernel.org,
 andersson@kernel.org, marijn.suijten@somainline.org
References: <1686076299-11504-1-git-send-email-quic_khsieh@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1686076299-11504-1-git-send-email-quic_khsieh@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v16] drm/msm/dpu: add DSC blocks to the
 catalog of MSM8998 and SC8180X
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
Cc: quic_sbillaka@quicinc.com, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, quic_jesszhan@quicinc.com,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 06/06/2023 21:31, Kuogee Hsieh wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> Some platforms have DSC blocks which have not been declared in the catalog.
> Complete DSC 1.1 support for all platforms by adding the missing blocks to
> MSM8998 and SC8180X.
> 
> Changes in v9:
> -- add MSM8998 and SC8180x to commit title
> 
> Changes in v10:
> -- fix grammar at commit text
> 
> Changes in v12:
> -- fix "titil" with "title" at changes in v9
> 
> Changes in v14:
> -- "dsc" tp "DSC" at commit title
> 
> Changes in v15:
> -- fix merge conflicts at dpu_5_1_sc8180x.h
> 
> Changes in v16
> -- fix cherry-pick error by deleting both redundant .dsc and .dsc_count
>     assignment from dpu_5_1_sc8180x.h
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>

The patch was changed significantly. Thus the review-by's do not apply 
anymore. Please take care to drop reviewed-by and acked-by tags when you 
change the patch was changed in a sensible manner. Otherwise it would be 
impossible to understand if the patch was really reviewed or not.

> ---
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
> index 3c732a0..7d0d0e7 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
> @@ -126,6 +126,11 @@ static const struct dpu_pingpong_cfg msm8998_pp[] = {
>   			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 15)),
>   };
>   
> +static const struct dpu_dsc_cfg msm8998_dsc[] = {
> +	DSC_BLK("dsc_0", DSC_0, 0x80000, 0),
> +	DSC_BLK("dsc_1", DSC_1, 0x80400, 0),
> +};
> +
>   static const struct dpu_dspp_cfg msm8998_dspp[] = {
>   	DSPP_BLK("dspp_0", DSPP_0, 0x54000, DSPP_SC7180_MASK,
>   		 &msm8998_dspp_sblk),
> @@ -199,6 +204,8 @@ const struct dpu_mdss_cfg dpu_msm8998_cfg = {
>   	.dspp = msm8998_dspp,
>   	.pingpong_count = ARRAY_SIZE(msm8998_pp),
>   	.pingpong = msm8998_pp,
> +	.dsc_count = ARRAY_SIZE(msm8998_dsc),
> +	.dsc = msm8998_dsc,
>   	.intf_count = ARRAY_SIZE(msm8998_intf),
>   	.intf = msm8998_intf,
>   	.vbif_count = ARRAY_SIZE(msm8998_vbif),

-- 
With best wishes
Dmitry


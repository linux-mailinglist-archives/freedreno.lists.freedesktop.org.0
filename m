Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 273406D0497
	for <lists+freedreno@lfdr.de>; Thu, 30 Mar 2023 14:23:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2C4210E32B;
	Thu, 30 Mar 2023 12:23:02 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 620AD10E32B
 for <freedreno@lists.freedesktop.org>; Thu, 30 Mar 2023 12:23:01 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id bi9so24239462lfb.12
 for <freedreno@lists.freedesktop.org>; Thu, 30 Mar 2023 05:23:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680178979;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=glZTTXa5a7ZHyxvnvI6hzXt9JLLInfunJqkiquyqXT8=;
 b=gChhLOjymoB27eWcS5/h90+2USxKm3mmok3RlhOKaiKEtJ0lmPk7fxD+7uH/j6wEbG
 ZUmOsqJdfcYiP+EcPhokOHmIWrIuavcdAoSEg9rKtDodWsfy2MZL+tP47TaVL3Gh0dmF
 epwMUtIBfqYxtHu84y4wTzwyoQeV9fowoNaMAad+MqEvzCRCpFTCqL57GRcX0DjD1UWa
 ITwawIjG7sCEX/ckB/VtHU8ex6fTHpioz/9p5/ohjue51UAI2GgqB8JSxamq3NAzo2yQ
 B7vx9WoiFWkeEvB+l9eSsN0wjRhNTkK1bdiHYDtiWag0Her63/tYDR1uT9Z3Rsat8APv
 k2OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680178979;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=glZTTXa5a7ZHyxvnvI6hzXt9JLLInfunJqkiquyqXT8=;
 b=biWuIvEl3kFDb3km3DjgO3T20COR0ed7dKKC6sPPqdRn1bsfwE3s6TN2U7iVhhtLF0
 IHR0FBbWSyoIyza7AAccau9m2FViDN9Hh0UDEFOKlqxi9WV+oB7X2LC4mS6kClFxVKss
 aJZllLInxaWVMhRhq5OEOAY2la3SzvfMDlB+WnQEPOz3NzDGt/SiQsdbPVrZreMOCnJN
 G66K1Vmb/93PU1Kx87ZsS3P71rKZ0FFD8LAAKO0qGtqmXSxqybYkrHIS0xKkUDNFuwoy
 ZZzHZE5y5AOpEpAX3UyLkWEull7tTrhGag7/6ITvbJ5deQHr9wNjTMKvzqWZr6cD9iHQ
 iBxA==
X-Gm-Message-State: AAQBX9ehxRVkWtgpuuoxe7GeJ0npt/65rIA3hskI3CcDecV97+Fnz272
 srx1/se5eoxoQHsyVRMsMyTtPA==
X-Google-Smtp-Source: AKy350YQNaSVlwnDMEE+lALdvIJ76GXj0hEGsLrPFA7MLJQ15GOBgU82/Pqrw1CCNTQ+BOyQG10bJg==
X-Received: by 2002:a19:f51a:0:b0:4bb:9415:38a2 with SMTP id
 j26-20020a19f51a000000b004bb941538a2mr6675098lfb.51.1680178979500; 
 Thu, 30 Mar 2023 05:22:59 -0700 (PDT)
Received: from [192.168.1.101] (abxj225.neoplus.adsl.tpnet.pl. [83.9.3.225])
 by smtp.gmail.com with ESMTPSA id
 q5-20020ac25145000000b004d3d43c7569sm5855445lfd.3.2023.03.30.05.22.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Mar 2023 05:22:59 -0700 (PDT)
Message-ID: <8b3ce350-3cd0-2712-3de5-a29a2592e440@linaro.org>
Date: Thu, 30 Mar 2023 14:22:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20230211231259.1308718-33-dmitry.baryshkov@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230211231259.1308718-33-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [v2,
 32/50] drm/msm/dpu: duplicate sc7180 catalog entries
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



On 12.02.2023 00:12, Dmitry Baryshkov wrote:
> Duplicate some of sc7180 catalog entries to remove dependencies between
> DPU major generations.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
> index 8977878890f1..3117bb358117 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
> @@ -82,6 +82,11 @@ static const struct dpu_lm_cfg sc7280_lm[] = {
>  		&sc7180_lm_sblk, PINGPONG_3, LM_2, 0),
>  };
>  
> +static const struct dpu_dspp_cfg sc7280_dspp[] = {
> +	DSPP_BLK("dspp_0", DSPP_0, 0x54000, DSPP_SC7180_MASK,
> +		 &sc7180_dspp_sblk),
If I'm following correctly, the sc7180_dspp_sblk is still defined
in the common hw_catalog.c and things won't explode.

In that case:

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
> +};
> +
>  static const struct dpu_pingpong_cfg sc7280_pp[] = {
>  	PP_BLK("pingpong_0", PINGPONG_0, 0x59000, 0, sc7280_pp_sblk, -1, -1),
>  	PP_BLK("pingpong_1", PINGPONG_1, 0x6a000, 0, sc7280_pp_sblk, -1, -1),
> @@ -132,8 +137,8 @@ static const struct dpu_mdss_cfg sc7280_dpu_cfg = {
>  	.ctl = sc7280_ctl,
>  	.sspp_count = ARRAY_SIZE(sc7280_sspp),
>  	.sspp = sc7280_sspp,
> -	.dspp_count = ARRAY_SIZE(sc7180_dspp),
> -	.dspp = sc7180_dspp,
> +	.dspp_count = ARRAY_SIZE(sc7280_dspp),
> +	.dspp = sc7280_dspp,
>  	.mixer_count = ARRAY_SIZE(sc7280_lm),
>  	.mixer = sc7280_lm,
>  	.pingpong_count = ARRAY_SIZE(sc7280_pp),

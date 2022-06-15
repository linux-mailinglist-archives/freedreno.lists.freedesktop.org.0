Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AFC7E54C8B2
	for <lists+freedreno@lfdr.de>; Wed, 15 Jun 2022 14:38:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4032910E554;
	Wed, 15 Jun 2022 12:38:15 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D83CE10E554
 for <freedreno@lists.freedesktop.org>; Wed, 15 Jun 2022 12:38:13 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id s10so13067758ljh.12
 for <freedreno@lists.freedesktop.org>; Wed, 15 Jun 2022 05:38:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=PG7iY0+TDj/chiZdR2cC4heZlo/M9u/ieIAV8vY6Das=;
 b=Xl5eFZCFDCGHw0FdFRNiqoRQonBG4+PXwS7mt/Nx3HTd4Rqk6p368Yz3N1WW3UpJRE
 EYi0KbftvU+NiW2Pw7lhXmfSC8vLoT4PUA8M9rYN3duzV2AfDRWjm0tf2xSPdKOdSwUB
 L+wr6PkiM0iB8r+r1kcHR9W7/in8t1BJcVvF/SE9uCMddHCw5gTKkd6Aw4a4801jlyDT
 RaKKEthFD9hT9c6KWrdAOwYrhGkj+91noCUrWQCFVKShQUaQ93tP9LDnqhI7k1AY9tKa
 6NgNpIK8oDkdop3Z93SLCOlD9Q1+YYK+saeuyTkaHA72RfPI9vMl6IgcRvvGwDr50AJL
 Zphg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=PG7iY0+TDj/chiZdR2cC4heZlo/M9u/ieIAV8vY6Das=;
 b=cXwO/xBahM3M1sz8HjS4lNFnxmjIXGhBMYL0lEZAQ5AuLB2nJchWTT7KPU3uSQDdo6
 PR9Iy5jYylFcMGKBRBlMFrdbr7hxAxvJLdqUnWIgoEXcdlAqSgDygpi2Km6UZAgT//dG
 CM10mqj1uNOTNtwjRilk4GkmB5I/FD+jhmwYn80ul0YSvPOP/thKMImdthUDbdbVYHsf
 BJ90S7v4QgUIZcBAi3we9o77kcZGdzRfrcvSa+JKyD0peOJflRegag7TRh0W0Epbqd2j
 AsaKWzX+1DoT3OZpeyPt/BypVTN+zWyrjTb1P+y6028YxTNyFDuSYcon7JJOYziokb6x
 EY8A==
X-Gm-Message-State: AJIora+Vy6RUmX0T9AYoO7K/a3Vf8D1ZCEgt/F1t2135JAKQntbYhS4r
 VkB//Q7SCByV6tQpP6VWFLobxw==
X-Google-Smtp-Source: AGRyM1sUs1f5G4JMsBLXngfR3Jru33Odao/UMNaP9hCjTrSPQKkIGqQiFTk6Y/E8eqMspJfzGwGR/A==
X-Received: by 2002:a2e:9143:0:b0:255:6913:2d37 with SMTP id
 q3-20020a2e9143000000b0025569132d37mr5185731ljg.290.1655296692202; 
 Wed, 15 Jun 2022 05:38:12 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 t6-20020a19ad06000000b004785b0dfba4sm1789476lfc.195.2022.06.15.05.38.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Jun 2022 05:38:11 -0700 (PDT)
Message-ID: <dd9b388c-9121-0cdb-e2d1-a8026ce475b3@linaro.org>
Date: Wed, 15 Jun 2022 15:38:11 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-GB
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, freedreno@lists.freedesktop.org
References: <1655235140-16424-1-git-send-email-quic_abhinavk@quicinc.com>
 <1655235140-16424-2-git-send-email-quic_abhinavk@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1655235140-16424-2-git-send-email-quic_abhinavk@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH 2/3] drm/msm/dpu: fix maxlinewidth for
 writeback block
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
Cc: dri-devel@lists.freedesktop.org, swboyd@chromium.org, robdclark@gmail.com,
 seanpaul@chromium.org, daniel@ffwll.ch, quic_jesszhan@quicinc.com,
 quic_aravindh@quicinc.com
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 14/06/2022 22:32, Abhinav Kumar wrote:
> Writeback block for sm8250 was using the default maxlinewidth
> of 2048. But this is not right as it supports upto 4096.
> 
> This should have no effect on most resolutions as we are
> still limiting upto maxlinewidth of SSPP for adding the modes.
> 
> Fix the maxlinewidth for writeback block on sm8250.
> 
> Fixes: 53324b99bd7b ("add writeback blocks to the sm8250 DPU catalog")
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index 400ebceb56bb..dd7537e32f88 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -1285,7 +1285,7 @@ static const struct dpu_intf_cfg qcm2290_intf[] = {
>    * Writeback blocks config
>    *************************************************************/
>   #define WB_BLK(_name, _id, _base, _features, _clk_ctrl, \
> -		__xin_id, vbif_id, _reg, _wb_done_bit) \
> +		__xin_id, vbif_id, _reg, _max_linewidth, _wb_done_bit) \
>   	{ \
>   	.name = _name, .id = _id, \
>   	.base = _base, .len = 0x2c8, \
> @@ -1295,13 +1295,13 @@ static const struct dpu_intf_cfg qcm2290_intf[] = {
>   	.clk_ctrl = _clk_ctrl, \
>   	.xin_id = __xin_id, \
>   	.vbif_idx = vbif_id, \
> -	.maxlinewidth = DEFAULT_DPU_LINE_WIDTH, \
> +	.maxlinewidth = _max_linewidth, \
>   	.intr_wb_done = DPU_IRQ_IDX(_reg, _wb_done_bit) \
>   	}
>   
>   static const struct dpu_wb_cfg sm8250_wb[] = {
>   	WB_BLK("wb_2", WB_2, 0x65000, WB_SM8250_MASK, DPU_CLK_CTRL_WB2, 6,
> -			VBIF_RT, MDP_SSPP_TOP0_INTR, 4),
> +			VBIF_RT, MDP_SSPP_TOP0_INTR, 4096, 4),
>   };
>   
>   /*************************************************************


-- 
With best wishes
Dmitry

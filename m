Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC6D66F4DE2
	for <lists+freedreno@lfdr.de>; Wed,  3 May 2023 01:54:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A65010E12B;
	Tue,  2 May 2023 23:54:21 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CBC710E12E
 for <freedreno@lists.freedesktop.org>; Tue,  2 May 2023 23:54:20 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2a8baeac4d1so45761271fa.1
 for <freedreno@lists.freedesktop.org>; Tue, 02 May 2023 16:54:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683071658; x=1685663658;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5t+YkOkDpznQp4uoL/9fUc9/dIQJ4G85gG1Hxhyav9w=;
 b=SvTiJQiosQNAY+ZQ5IN7hz3fY9aqBpU45Ypaqkjir6dxUUkIX2UG1mBA0v/k08gUP1
 bO/aMHDlYOF+mRHdW1sUTedthcNUYx/Ixu561JmcK10jWT5A/aQmKylhFahDcWoh32m1
 JhS82V6fFxwSi7ZxX01hgXEHIYZLh7SXoe0XAXKdJuH0ta6J2bA5XJo7+h3DdFHij5d5
 e9S007yipuJkERcSBBmg6QCKMED0uoo1aOkEY1W6i4G80PNUfkIz/+3zMFUPpbxzRdyO
 hZFiYbYRT9GWqeJRt+8o9xyNS/QiESIW+SSp59bG8dnafGgtS6k7mcxur0jaeEwKAs1O
 6sDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683071658; x=1685663658;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5t+YkOkDpznQp4uoL/9fUc9/dIQJ4G85gG1Hxhyav9w=;
 b=SRipqrnNQxS+UxrT4RP6i4i2G+bDh+ftuGHBl3RS+PpXJFYDdviLOUhe8se4WZlEzj
 oqg7ihhbmYeYIKpsR9Bnm12M6hqBTPsTZ4n/rj43JyrW4jTzcR+/6vV8rHzsp+dF54T6
 aiq4wZYjTWk30EXUQsaHPcGYuspPVS9cSLqN45ZRtdv2VsDfizxTe5ZXZ+0cpcCKd03T
 GTGDDaDRBOXo36TMlD0IyE/0ipC6UZpjRfa+7U8QyxWuEVTqd33I10rWvA61oj//T8UW
 2LudDDUc291r/mCDRNx3NY6yiJk5tnfNNhZSURrQ2XUPtcB9BJYrQG7CBPCK+vq1Vtc4
 X/jA==
X-Gm-Message-State: AC+VfDzE0EziCVJ3m6acj3O1kL+H5xnlKFEk+j3LKJ1ezOvaCtn5P9Ht
 fdys4T2ZWOxx2qmBRaT4oneT9w==
X-Google-Smtp-Source: ACHHUZ4Z1bIwEw+ukb4OHOqUK7VaV86neoYxUThsJpmsKb8C2t2M0hvpYeH+i9DgiRo+HuorOWtZ1g==
X-Received: by 2002:a19:c216:0:b0:4f0:f3d:b8c6 with SMTP id
 l22-20020a19c216000000b004f00f3db8c6mr367714lfc.30.1683071658000; 
 Tue, 02 May 2023 16:54:18 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 a23-20020a19f817000000b004ee85d1444esm5636334lff.208.2023.05.02.16.54.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 May 2023 16:54:17 -0700 (PDT)
Message-ID: <9f977692-d74d-9f49-e626-399aeeef7f18@linaro.org>
Date: Wed, 3 May 2023 02:54:16 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-GB
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>
References: <20230430235732.3341119-1-dmitry.baryshkov@linaro.org>
 <20230430235732.3341119-6-dmitry.baryshkov@linaro.org>
 <6ad0c581-1955-3013-0ef3-6340240d0c1b@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <6ad0c581-1955-3013-0ef3-6340240d0c1b@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] [PATCH 5/7] drm/msm/dpu: inline dpu_encoder_get_wb()
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 03/05/2023 02:51, Abhinav Kumar wrote:
> 
> 
> On 4/30/2023 4:57 PM, Dmitry Baryshkov wrote:
>> The function dpu_encoder_get_wb() returns controller_id if the
>> corresponding WB is present in the catalog. We can inline this function
>> and rely on dpu_rm_get_wb() returning NULL for indices for which the
>> WB is not present on the device.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 24 ++-------------------
>>   1 file changed, 2 insertions(+), 22 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>> index 4c85cbb030e4..507ff3f88c67 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>> @@ -1277,22 +1277,6 @@ static enum dpu_intf dpu_encoder_get_intf(const 
>> struct dpu_mdss_cfg *catalog,
>>       return INTF_MAX;
>>   }
>> -static enum dpu_wb dpu_encoder_get_wb(const struct dpu_mdss_cfg 
>> *catalog,
>> -        enum dpu_intf_type type, u32 controller_id)
>> -{
>> -    int i = 0;
>> -
>> -    if (type != INTF_WB)
>> -        return WB_MAX;
>> -
>> -    for (i = 0; i < catalog->wb_count; i++) {
>> -        if (catalog->wb[i].id == controller_id)
>> -            return catalog->wb[i].id;
>> -    }
>> -
>> -    return WB_MAX;
>> -}
>> -
>>   void dpu_encoder_vblank_callback(struct drm_encoder *drm_enc,
>>           struct dpu_encoder_phys *phy_enc)
>>   {
>> @@ -2261,7 +2245,6 @@ static int dpu_encoder_setup_display(struct 
>> dpu_encoder_virt *dpu_enc,
>>            */
>>           u32 controller_id = disp_info->h_tile_instance[i];
>>           enum dpu_intf intf_idx;
>> -        enum dpu_wb wb_idx;
>>           if (disp_info->num_of_h_tiles > 1) {
>>               if (i == 0)
>> @@ -2279,14 +2262,11 @@ static int dpu_encoder_setup_display(struct 
>> dpu_encoder_virt *dpu_enc,
>>                                   disp_info->intf_type,
>>                                   controller_id);
>> -        wb_idx = dpu_encoder_get_wb(dpu_kms->catalog,
>> -                disp_info->intf_type, controller_id);
>> -
>>           if (intf_idx >= INTF_0 && intf_idx < INTF_MAX)
>>               phys_params.hw_intf = dpu_rm_get_intf(&dpu_kms->rm, 
>> intf_idx);
>> -        if (wb_idx >= WB_0 && wb_idx < WB_MAX)
>> -            phys_params.hw_wb = dpu_rm_get_wb(&dpu_kms->rm, wb_idx);
>> +        if (disp_info->intf_type == INTF_WB && controller_id < WB_MAX)
>> +            phys_params.hw_wb = dpu_rm_get_wb(&dpu_kms->rm, 
>> controller_id);
> 
> 
>  From what I see, with 
> https://patchwork.freedesktop.org/patch/534776/?series=117146&rev=1 we 
> are dropping those checks from the RM too, so we are going to rely 
> totally on entering the values correctly in catalog from now on?

Yes. I see no reason to mistrust the kernel data itself.

> 
>>           if (!phys_params.hw_intf && !phys_params.hw_wb) {
>>               DPU_ERROR_ENC(dpu_enc, "no intf or wb block assigned at 
>> idx: %d\n", i);

-- 
With best wishes
Dmitry


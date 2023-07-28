Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F138767938
	for <lists+freedreno@lfdr.de>; Sat, 29 Jul 2023 01:59:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C447F10E79F;
	Fri, 28 Jul 2023 23:59:37 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 383B910E79F
 for <freedreno@lists.freedesktop.org>; Fri, 28 Jul 2023 23:59:36 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-5221b90f763so3403684a12.0
 for <freedreno@lists.freedesktop.org>; Fri, 28 Jul 2023 16:59:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690588774; x=1691193574;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9kqDR+gYxI0WrHXLyeEIAHFRT0r1ybmEtGMOrfNZ584=;
 b=Tc0wphbbxfm9O2B0ehlGXg4Xw4QqX4IOSagQYjNoN38Dowjt5CGj6XENdjXc2NBYM0
 pCo6O1I0+web9tC3/vquiqUAKICYZLIhz+18P9jGVd4/tSp3v2LMjilFSpo8M5e2Db59
 LZTCjgh4lPbuOsl/nTWwSn7PpnI2TFCZD9GtFYm/GzOIXhFoebTPCJ03y1vcKM7/ATBV
 1O+FTo2G0Pbl0aFe+juAjfN+IUrnTnYS609cF4ouzkDJYw974ZOXMhYaArKKETZAF6NB
 guQiELXSLn71F4DOGdwEEyZ581FzYQAznkVDeojK3D9lPl9n8Mr/TcmKciUGKoTeAiDy
 a2HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690588774; x=1691193574;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9kqDR+gYxI0WrHXLyeEIAHFRT0r1ybmEtGMOrfNZ584=;
 b=I4X2DusPoLkyneOAmyqbtx81UnNMrL+BDHZx0AqetS/dL2zuwhBbrf7CTlQ55b2Ecl
 T2qZPSX8KbFn4VplQcKmyGdr2PMT7MW+ebyW95iZgLyjF1zMuN/8zt/jaIvBeJJEVDlD
 O+izgCVAL29GuyTrUNUbOXtag6npv0DAkhwPS/nhg1vds4cKeyKV04jh5lWsAkHm5GGA
 nv6udlCnCTMbYTlRmNwyHi6ohiTQV3OcKfYSZSzHBjAiWaL/Ki1bYV4cTmLEujl7cKPV
 L4Vhz6bFBO8AtYzKQy+Ta7uLisPhsZu4kx99mrCPpEZlFK+RLOFqkLWJGhv0cLnssW6J
 i+2g==
X-Gm-Message-State: ABy/qLYwuWNwRjSsLI1tup03d+0in4eOPqglRvBPOg948HQIQujWfMEW
 VsOAAryyfhYFxT+N8Yd26z1uaw==
X-Google-Smtp-Source: APBJJlEIy2d3ZrA7+NcNoTs2/vz7hH8S6b+sy/peh9Yw91p+0JyXTHFn6ajEj8qf14VFxR+vX13AzQ==
X-Received: by 2002:a17:906:18:b0:99b:504d:d9c7 with SMTP id
 24-20020a170906001800b0099b504dd9c7mr669088eja.67.1690588774689; 
 Fri, 28 Jul 2023 16:59:34 -0700 (PDT)
Received: from [10.10.15.130] ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 u7-20020a170906408700b0098de7d28c34sm2585366ejj.193.2023.07.28.16.59.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Jul 2023 16:59:34 -0700 (PDT)
Message-ID: <c9d7994d-5781-41b0-6af0-cc45d4ebf6fb@linaro.org>
Date: Sat, 29 Jul 2023 02:59:32 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-GB
To: Marijn Suijten <marijn.suijten@somainline.org>
References: <20230727162104.1497483-1-dmitry.baryshkov@linaro.org>
 <20230727162104.1497483-2-dmitry.baryshkov@linaro.org>
 <byxscievxgqwcdu56mebkoy4jpgogzy3euddz73u2qryh3itwb@to3pyltcqqxg>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <byxscievxgqwcdu56mebkoy4jpgogzy3euddz73u2qryh3itwb@to3pyltcqqxg>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH 1/7] drm/msm/dpu: enable PINGPONG TE
 operations only when supported by HW
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
Cc: freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 27/07/2023 23:03, Marijn Suijten wrote:
> On 2023-07-27 19:20:58, Dmitry Baryshkov wrote:
>> The DPU_PINGPONG_TE bit is set for all PINGPONG blocks on DPU < 5.0.
>> Rather than checking for the flag, check for the presense of the
>> corresponding interrupt line.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> That's a smart use of the interrupt field.  I both like it, and I do
> not.  While we didn't do any validation for consistency previously, this
> means we now have multiple ways of controlling available "features":
> 
> - Feature flags on hardware blocks;
> - Presence of certain IRQs;
> - DPU core revision.

I hesitated here too. For INTF it is clear that there is no other good 
way to check for the TE feature. For PP we can just check for the DPU 
revision.

> 
> Maybe that is more confusing to follow?  Regardless of that I'm
> convinced that this patch does what it's supposed to and gets rid of
> some ambiguity.  Maybe a comment above the IF explaining the "PP TE"
> feature could alleviate the above concerns thoo.  Hence:
> 
> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
> 
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
>> index 9298c166b213..912a3bdf8ad4 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
>> @@ -296,7 +296,7 @@ struct dpu_hw_pingpong *dpu_hw_pingpong_init(const struct dpu_pingpong_cfg *cfg,
>>   	c->idx = cfg->id;
>>   	c->caps = cfg;
>>   
>> -	if (test_bit(DPU_PINGPONG_TE, &cfg->features)) {
>> +	if (cfg->intr_rdptr) {
>>   		c->ops.enable_tearcheck = dpu_hw_pp_enable_te;
>>   		c->ops.disable_tearcheck = dpu_hw_pp_disable_te;
>>   		c->ops.connect_external_te = dpu_hw_pp_connect_external_te;
>> -- 
>> 2.39.2
>>

-- 
With best wishes
Dmitry


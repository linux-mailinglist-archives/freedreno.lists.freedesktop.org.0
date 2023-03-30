Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 899CC6D1100
	for <lists+freedreno@lfdr.de>; Thu, 30 Mar 2023 23:46:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5067710F03D;
	Thu, 30 Mar 2023 21:46:34 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A1AD10F03D
 for <freedreno@lists.freedesktop.org>; Thu, 30 Mar 2023 21:46:32 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id h9so21105706ljq.2
 for <freedreno@lists.freedesktop.org>; Thu, 30 Mar 2023 14:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680212790;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MADZ+T3+xEjmaqwAK3HZYhv40BH/3kPLIH0NLpDWWKI=;
 b=WmHvFUjiDiAFrxZFfl+bZeBK0iAf6Tj5THXzn01fH+JxsoUeSOFGQlKsfh1VpKEe3f
 xTIQXo+y64LBXTWMgBzmiS0dEjljfvbVz7itexOdegJSt6RhHp3uUqbcsEXvlcrGojX8
 ZgokuuEsVMw/rbNeyDqHCOcNJXby2FfRzIOIwcxn1KcI1cVuS8cHtLijorcLrs5Pnl78
 qFXdem3lXnXMS8mYOjC2FTfsDNkfgRUxHLgL+Hr91UeZWe6Xpm2qWOujYGssujGv/ECK
 24LLdaDEEfkEk0gqPNpA/murHiZ20zc49BY7ht6oiSO/lWQOswcaS/FdDwplPk8kDO90
 q18w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680212790;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MADZ+T3+xEjmaqwAK3HZYhv40BH/3kPLIH0NLpDWWKI=;
 b=xKVboPD89iSEgBmjKs4f3hD0kcUfAnLb9busLQfuOry7xE19k0DpGOUj159vkboGZb
 nrnOCYYSgqzgTwZNo6dxdxwpb9it4IgP2izQ5fufF0A0JpxIP2e93Fj9mpiRHDeYrQlW
 Gss5Viq59yyrPKLH4ixuqVxKwA2ERgoGlXLbkJTQFkh5UOwunJKBtGVDIk3EKzDKIUEO
 DHKVm6evksClqx+yNk2WJFfPmH/4rSso6DLWsQ1kyGaDYZUnbgDIkGb72kkzASQSra7G
 ssX7RVdlOlkVhICt4T5bvy6DnFmLHsgoxl7PTV9ozEXKlFt3YWbTrYkmKZCiRxOIJgUA
 7PRA==
X-Gm-Message-State: AAQBX9dsF9RD5OqluQ9UTWGRXM8TdaOgXWX3OKcKiVMpIYKKVX+JDZdD
 UQBH7w8AxCAwB285mXLXUb6bYA==
X-Google-Smtp-Source: AKy350ZAVBee1zE0gHQ5G0G/YmpxsOLpK53mmAjtYNsKM4JztgEI1u8WQOEpLhH2tb8GE83WwxkNEQ==
X-Received: by 2002:a2e:98c4:0:b0:299:a8e2:2176 with SMTP id
 s4-20020a2e98c4000000b00299a8e22176mr7520920ljj.24.1680212790415; 
 Thu, 30 Mar 2023 14:46:30 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 21-20020a05651c00d500b0029462e98c07sm79875ljr.35.2023.03.30.14.46.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Mar 2023 14:46:29 -0700 (PDT)
Message-ID: <8d12f4fc-8a7b-c44b-071c-014399fcfa54@linaro.org>
Date: Fri, 31 Mar 2023 00:46:29 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-GB
To: Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20230211231259.1308718-41-dmitry.baryshkov@linaro.org>
 <e60607e3-8786-e4fe-f0fa-0851dbb53a3a@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <e60607e3-8786-e4fe-f0fa-0851dbb53a3a@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [v2,40/50] drm/msm/dpu: enable DSPP on sc8180x
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

On 30/03/2023 15:39, Konrad Dybcio wrote:
> 
> 
> On 12.02.2023 00:12, Dmitry Baryshkov wrote:
>> Enable DSPP blocks on sc8180x platform, basing on the vendor dtsi.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
> There's only a single difference between 8150 and 8180:
> 
> qcom,sde-dspp-dither = <0x82c 0x00010007>;
> 
> is only present on the former. Not sure if it makes any difference.

I'm not sure too. Currently we support only PP-based dither, so DSPP 
dither doesn't make any difference. Let's ignore it for now.

> 
> Konrad
>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
>> index c51e1bba1533..457733a6986e 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
>> @@ -91,6 +91,8 @@ static const struct dpu_mdss_cfg sc8180x_dpu_cfg = {
>>   	.sspp = sm8150_sspp,
>>   	.mixer_count = ARRAY_SIZE(sm8150_lm),
>>   	.mixer = sm8150_lm,
>> +	.dspp_count = ARRAY_SIZE(sm8150_dspp),
>> +	.dspp = sm8150_dspp,
>>   	.pingpong_count = ARRAY_SIZE(sm8150_pp),
>>   	.pingpong = sm8150_pp,
>>   	.merge_3d_count = ARRAY_SIZE(sm8150_merge_3d),

-- 
With best wishes
Dmitry


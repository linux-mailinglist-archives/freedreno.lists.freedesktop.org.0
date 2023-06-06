Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9170D724ECB
	for <lists+freedreno@lfdr.de>; Tue,  6 Jun 2023 23:29:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 522AD10E3D7;
	Tue,  6 Jun 2023 21:29:10 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9620710E3D6
 for <freedreno@lists.freedesktop.org>; Tue,  6 Jun 2023 21:29:08 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-4f3ba703b67so8113818e87.1
 for <freedreno@lists.freedesktop.org>; Tue, 06 Jun 2023 14:29:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686086947; x=1688678947;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4HAYIAJQWxDQv1/68GE+vbWBISHl5bYTYt4+lfGwShI=;
 b=rz7SPfj4/VXG4ApGm8ZgyY6Lun1+NsD+cnSzisd5Y7VzY3nL5GZZzL4P7cbLe5xlrw
 y1YpPaI702uzGaixoa0SjZVh10FIH1NfGsf84WNSDVyngsfdMEp5kXP353AjcIZLWl9l
 9eVz7YYnAiGrB9+qOX1hjUtM17GPK94cJz/UrG5OA2rCrqWlvzPRBm5zuXsY0aFbv5s2
 R2wxywMTWlg4lriSvvIZwqhJfxz5u1aviWZVnuHqcinkUSbdcY3Y6+6+ZpArQE1xygc3
 khcsf62AwYCD2TIiO9pRnhJpmp5/Bqi6Y8g6hhL7jv5TwphpxQkK8GXBqNOPuL5pIPX8
 aMcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686086947; x=1688678947;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4HAYIAJQWxDQv1/68GE+vbWBISHl5bYTYt4+lfGwShI=;
 b=Kd+Ru5iE56xmQaCJrX39ywfVHDNZTmVHPEbcCr1ZHYDUzs+3JpLMsG9wrfkwcumY45
 xT58cd67eQLq+AB0zwUZ6/df1qegIehqBG2ZrlXlKYbeGj7d+WdwsONEP4uMPtEtcuuh
 /97TF8nBUuLurQ9Oioz6oqV+qJ2TrUr/FcO9ztdhyrh+G7G+DQk2khL+AzmnC5kact72
 UmEXSHhVOaky2lX2SAJ7JXUObQESHtckoa+ke5dUTHTFQPSckv9/UyFly/FsfISTcPVM
 LBZB7g8J8I9uBaw+BsuOauzJoKmiBm4KdkEeMArawDJ6l2evA4QTVjzRpkyjjxa+SMzt
 ixsQ==
X-Gm-Message-State: AC+VfDwFlJ9R6aNUxKoC/emDrsb1jiKsDvmdFa7gW7PCNt8Kjs8Z4Fth
 fNG4J4KsY+7AQccbujH75jURZA==
X-Google-Smtp-Source: ACHHUZ6dd+WlOAscSRe7kXO5ATaQFFS2i+vAabPdXNEQ9lvRq2zGzk0CCiUP2AGi5aZ6lEf82sMvnQ==
X-Received: by 2002:a19:c512:0:b0:4ec:9ef9:e3d with SMTP id
 w18-20020a19c512000000b004ec9ef90e3dmr1313226lfe.26.1686086946618; 
 Tue, 06 Jun 2023 14:29:06 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 u26-20020ac2519a000000b004f2391fe9a6sm1578549lfi.266.2023.06.06.14.29.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jun 2023 14:29:05 -0700 (PDT)
Message-ID: <cfad7817-2d7e-843d-033d-cf2f3aba440d@linaro.org>
Date: Wed, 7 Jun 2023 00:29:05 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-GB
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20230321011821.635977-1-dmitry.baryshkov@linaro.org>
 <20230321011821.635977-11-dmitry.baryshkov@linaro.org>
 <2a003674-29ef-f6c6-9a23-3eb93d2e479f@quicinc.com>
 <CAA8EJpr0DcVfG86SYKRb-4Ph82dfXafed9CFgY1qFSECFbAcTw@mail.gmail.com>
 <6c61a8f1-f77e-3a18-15f8-7c004a99f78d@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <6c61a8f1-f77e-3a18-15f8-7c004a99f78d@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] [RFC PATCH v2 10/13] drm/msm/dpu: add list of
 supported formats to the DPU caps
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
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 07/06/2023 00:14, Abhinav Kumar wrote:
> 
> 
> On 5/24/2023 6:47 PM, Dmitry Baryshkov wrote:
>> On Thu, 25 May 2023 at 02:16, Abhinav Kumar 
>> <quic_abhinavk@quicinc.com> wrote:
>>>
>>>
>>>
>>> On 3/20/2023 6:18 PM, Dmitry Baryshkov wrote:
>>>> As we are going to add virtual planes, add the list of supported 
>>>> formats
>>>> to the hw catalog entry. It will be used to setup universal planes, 
>>>> with
>>>> later selecting a pipe depending on whether the YUV format is used for
>>>> the framebuffer.
>>>>
>>>
>>> If your usage of format_list is going to be internal to dpu_plane.c, I
>>> can think of another idea for this change.
>>>
>>> This essentially translates to if (num_vig >= 1)
>>>
>>> If we can just have a small helper to detect that from the catalog can
>>> we use that instead of adding formats to the dpu caps?
>>
>> I'd prefer to be explicit here. The list of supported formats might
>> vary between generations, might it not? Also we don't have a case of
>> the devices not having VIG planes. Even the qcm2290 (which doesn't
>> have CSC) lists YUV as supported.
>>
> 
> the list of formats is tied to the sspps the dpu generation has and the 
> capabilities of those sspps.
> 
> qcm2290 is really an interesting case. It has one vig sspp but no csc 
> block for that vig sspp, hence it cannot support non-RGB formats.
> 
> I have confirmed that downstream is incorrect to populate yuv formats 
> for qcm2290.
> 
> I still think that having atleast one vig sspp with csc sub-blk is the 
> right condition to check if we want to decide if the dpu for that 
> chipset supports yuv formats. Extra csc-blk check to handle qcm2290.
> 
> Having a small helper in dpu_plane.c is good enough for that because 
> with virtual planes, you only need to know "if such a plane exists and 
> not which plane" and a full catalog change isnt needed IMO

This goes down to the question: is the list of YUV and non-YUV formats 
static or not? Do all DPU devices support the same set of YUV and 
non-YUV formats? If it is static, we might as well drop 
dpu_sspp_sub_blks::format_list.

Note to myself: consider 
dpu_mdss_cfg::{dma_formats,cursor_formats,vig_formats}. Either migrate 
dpu_sspp_sub_blks::format_list users to these fields or drop them.

> 
> 
>> Note: I think at some point we should have a closer look at the list
>> of supported formats and crosscheck that we do not have either
>> unsupported formats being listed, or missing formats which are not
>> listed as supported.
>>
>>>
>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>> ---
>>>>    .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 26 
>>>> +++++++++++++++++++
>>>>    .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |  4 +++
>>>>    2 files changed, 30 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c 
>>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>>>> index 212d546b6c5d..2d6944a9679a 100644
>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>>>> @@ -315,6 +315,8 @@ static const struct dpu_caps msm8998_dpu_caps = {
>>>>        .pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
>>>>        .max_hdeci_exp = MAX_HORZ_DECIMATION,
>>>>        .max_vdeci_exp = MAX_VERT_DECIMATION,
>>>> +     .format_list = plane_formats_yuv,
>>>> +     .num_formats = ARRAY_SIZE(plane_formats_yuv),
>>>>    };
>>>>
>>>>    static const struct dpu_caps qcm2290_dpu_caps = {
>>>> @@ -324,6 +326,8 @@ static const struct dpu_caps qcm2290_dpu_caps = {
>>>>        .has_idle_pc = true,
>>>>        .max_linewidth = 2160,
>>>>        .pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
>>>> +     .format_list = plane_formats_yuv,
>>>> +     .num_formats = ARRAY_SIZE(plane_formats_yuv),
>>>>    };
>>>>
>>>>    static const struct dpu_caps sdm845_dpu_caps = {
>>>> @@ -339,6 +343,8 @@ static const struct dpu_caps sdm845_dpu_caps = {
>>>>        .pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
>>>>        .max_hdeci_exp = MAX_HORZ_DECIMATION,
>>>>        .max_vdeci_exp = MAX_VERT_DECIMATION,
>>>> +     .format_list = plane_formats_yuv,
>>>> +     .num_formats = ARRAY_SIZE(plane_formats_yuv),
>>>>    };
>>>>
>>>>    static const struct dpu_caps sc7180_dpu_caps = {
>>>> @@ -350,6 +356,8 @@ static const struct dpu_caps sc7180_dpu_caps = {
>>>>        .has_idle_pc = true,
>>>>        .max_linewidth = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
>>>>        .pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
>>>> +     .format_list = plane_formats_yuv,
>>>> +     .num_formats = ARRAY_SIZE(plane_formats_yuv),
>>>>    };
>>>>
>>>>    static const struct dpu_caps sm6115_dpu_caps = {
>>>> @@ -361,6 +369,8 @@ static const struct dpu_caps sm6115_dpu_caps = {
>>>>        .has_idle_pc = true,
>>>>        .max_linewidth = 2160,
>>>>        .pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
>>>> +     .format_list = plane_formats_yuv,
>>>> +     .num_formats = ARRAY_SIZE(plane_formats_yuv),
>>>>    };
>>>>
>>>>    static const struct dpu_caps sm8150_dpu_caps = {
>>>> @@ -376,6 +386,8 @@ static const struct dpu_caps sm8150_dpu_caps = {
>>>>        .pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
>>>>        .max_hdeci_exp = MAX_HORZ_DECIMATION,
>>>>        .max_vdeci_exp = MAX_VERT_DECIMATION,
>>>> +     .format_list = plane_formats_yuv,
>>>> +     .num_formats = ARRAY_SIZE(plane_formats_yuv),
>>>>    };
>>>>
>>>>    static const struct dpu_caps sc8180x_dpu_caps = {
>>>> @@ -391,6 +403,8 @@ static const struct dpu_caps sc8180x_dpu_caps = {
>>>>        .pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
>>>>        .max_hdeci_exp = MAX_HORZ_DECIMATION,
>>>>        .max_vdeci_exp = MAX_VERT_DECIMATION,
>>>> +     .format_list = plane_formats_yuv,
>>>> +     .num_formats = ARRAY_SIZE(plane_formats_yuv),
>>>>    };
>>>>
>>>>    static const struct dpu_caps sc8280xp_dpu_caps = {
>>>> @@ -404,6 +418,8 @@ static const struct dpu_caps sc8280xp_dpu_caps = {
>>>>        .has_3d_merge = true,
>>>>        .max_linewidth = 5120,
>>>>        .pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
>>>> +     .format_list = plane_formats_yuv,
>>>> +     .num_formats = ARRAY_SIZE(plane_formats_yuv),
>>>>    };
>>>>
>>>>    static const struct dpu_caps sm8250_dpu_caps = {
>>>> @@ -417,6 +433,8 @@ static const struct dpu_caps sm8250_dpu_caps = {
>>>>        .has_3d_merge = true,
>>>>        .max_linewidth = 900,
>>>>        .pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
>>>> +     .format_list = plane_formats_yuv,
>>>> +     .num_formats = ARRAY_SIZE(plane_formats_yuv),
>>>>    };
>>>>
>>>>    static const struct dpu_caps sm8350_dpu_caps = {
>>>> @@ -430,6 +448,8 @@ static const struct dpu_caps sm8350_dpu_caps = {
>>>>        .has_3d_merge = true,
>>>>        .max_linewidth = 4096,
>>>>        .pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
>>>> +     .format_list = plane_formats_yuv,
>>>> +     .num_formats = ARRAY_SIZE(plane_formats_yuv),
>>>>    };
>>>>
>>>>    static const struct dpu_caps sm8450_dpu_caps = {
>>>> @@ -443,6 +463,8 @@ static const struct dpu_caps sm8450_dpu_caps = {
>>>>        .has_3d_merge = true,
>>>>        .max_linewidth = 5120,
>>>>        .pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
>>>> +     .format_list = plane_formats_yuv,
>>>> +     .num_formats = ARRAY_SIZE(plane_formats_yuv),
>>>>    };
>>>>
>>>>    static const struct dpu_caps sm8550_dpu_caps = {
>>>> @@ -456,6 +478,8 @@ static const struct dpu_caps sm8550_dpu_caps = {
>>>>        .has_3d_merge = true,
>>>>        .max_linewidth = 5120,
>>>>        .pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
>>>> +     .format_list = plane_formats_yuv,
>>>> +     .num_formats = ARRAY_SIZE(plane_formats_yuv),
>>>>    };
>>>>
>>>>    static const struct dpu_caps sc7280_dpu_caps = {
>>>> @@ -467,6 +491,8 @@ static const struct dpu_caps sc7280_dpu_caps = {
>>>>        .has_idle_pc = true,
>>>>        .max_linewidth = 2400,
>>>>        .pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
>>>> +     .format_list = plane_formats_yuv,
>>>> +     .num_formats = ARRAY_SIZE(plane_formats_yuv),
>>>>    };
>>>>
>>>>    static const struct dpu_mdp_cfg msm8998_mdp[] = {
>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h 
>>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>>>> index 89b372cdca92..4847aae78db2 100644
>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>>>> @@ -404,6 +404,8 @@ struct dpu_rotation_cfg {
>>>>     * @pixel_ram_size     size of latency hiding and de-tiling 
>>>> buffer in bytes
>>>>     * @max_hdeci_exp      max horizontal decimation supported (max 
>>>> is 2^value)
>>>>     * @max_vdeci_exp      max vertical decimation supported (max is 
>>>> 2^value)
>>>> + * @format_list: Pointer to list of supported formats
>>>> + * @num_formats: Number of supported formats
>>>>     */
>>>>    struct dpu_caps {
>>>>        u32 max_mixer_width;
>>>> @@ -419,6 +421,8 @@ struct dpu_caps {
>>>>        u32 pixel_ram_size;
>>>>        u32 max_hdeci_exp;
>>>>        u32 max_vdeci_exp;
>>>> +     const u32 *format_list;
>>>> +     u32 num_formats;
>>>>    };
>>>>
>>>>    /**
>>
>>
>>

-- 
With best wishes
Dmitry


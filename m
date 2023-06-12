Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A25E72CE71
	for <lists+freedreno@lfdr.de>; Mon, 12 Jun 2023 20:31:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79C9110E1FB;
	Mon, 12 Jun 2023 18:31:34 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3F3510E1FB
 for <freedreno@lists.freedesktop.org>; Mon, 12 Jun 2023 18:31:32 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-4f611ac39c5so5754718e87.2
 for <freedreno@lists.freedesktop.org>; Mon, 12 Jun 2023 11:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686594690; x=1689186690;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=XScVbvMK8naiq0WTQIyZPP97RsyuNHqZwVMoGP97o5I=;
 b=UL8wGAiHFpspgFWVPIC0nU0QpvUaEHcg+2Ygbs7vNWxZ9Zf3d5+FQoO+Z5cHekGUHy
 98FUx/OgyUk2/m9VYQDEEfBuEhraR9o4VBzptOi+BHY7itqX2NIMwCbj34K7QCPMLVol
 wkAqVWLdT0fZlYAZXyUwoTiN2jFeS5WRJY4XhJVws26Nc3pwNH7Dt7PXM0+UwyuW82Nt
 3VS2gZyriZ5HWgqBohkvultVQAGsC/WFNLFbAzOmWsDnPFdMMdNRSYv2sn1qLbBKXfHI
 733k8S0uuHDVmu6+mxburjR13jbtyshpV5+Uqh84OJoqJkIHolm6adstRDJOg5AUTHg6
 Xfug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686594690; x=1689186690;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XScVbvMK8naiq0WTQIyZPP97RsyuNHqZwVMoGP97o5I=;
 b=Oc0qk86G1W6NTc/u3e7Mxi9mXK7vIF4nQxu+IW6fnha9KMIuonZ8BwxIdQy8nyoMLw
 TFDuRyLj9S08X1H95s8JebE3wEKG5Xpy9OINr4VtLjthW0SDLbjzG8cwpifGf8G1UsWA
 HeAsxXV/OQIMLL7PE80KQ78Jj1p2HRd3IpCdcYSjMxDwmfAuoTSUfTnSX2l+xwg0IQ7G
 INxPX/jesZN3v0kPI3skPsKc+Nialn/xgVpW3TEya6pihNx04y3mLtKl2uWg5UZwCYMU
 HBjuXp9WIiADuEc66PkHEDxqSPR6aLZehlGhuRVhec950VJDxTXm3VD6vsca1+s+8c7K
 oYfw==
X-Gm-Message-State: AC+VfDy2vi3bFxFbNT3LyIjTnwQ6yjpSvreJQ25WISlHLPEZAKACvu0L
 Sqk73Ot2uaZ35qQHpo9nN4SyTB0/a5Rmn0SlZVs=
X-Google-Smtp-Source: ACHHUZ4b1RUTPh0Ggn4dXQBeKT4VaRmUAQXrBywLquAONrI0hsDwjVR9+5xRYBXEbaibQOUmrg4u/A==
X-Received: by 2002:a05:6512:61c:b0:4f3:b242:aa90 with SMTP id
 b28-20020a056512061c00b004f3b242aa90mr4987547lfe.35.1686594690582; 
 Mon, 12 Jun 2023 11:31:30 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 w26-20020a19c51a000000b004edb8fac1cesm1496335lfe.215.2023.06.12.11.31.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Jun 2023 11:31:30 -0700 (PDT)
Message-ID: <14662d77-8a3b-b3c6-2250-5909608b8a37@linaro.org>
Date: Mon, 12 Jun 2023 21:31:29 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-GB
To: Thomas Zimmermann <tzimmermann@suse.de>,
 Marijn Suijten <marijn.suijten@somainline.org>
References: <20230612031616.3620134-1-dmitry.baryshkov@linaro.org>
 <aenzh4vscayeqvyjpbxifog7l3yuxv5lh5cizcie7dk7awx5z7@nuajlsildlw6>
 <1aaf5a23-541b-527d-25c3-55c94452390e@suse.de>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1aaf5a23-541b-527d-25c3-55c94452390e@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] [PATCH 1/2] drm/msm: provide fb_dirty implemenation
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
Cc: Degdag Mohamed <degdagmohamed@gmail.com>, freedreno@lists.freedesktop.org,
 Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org,
 Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 12/06/2023 13:48, Thomas Zimmermann wrote:
> Hi
> 
> Am 12.06.23 um 11:14 schrieb Marijn Suijten:
>> On 2023-06-12 06:16:15, Dmitry Baryshkov wrote:
>>> Since commit 93e81e38e197 ("drm/fb_helper: Minimize damage-helper
>>> overhead") the drm_fb_helper_funcs::fb_dirty helper is required for
>>> proper dirty/damage processing. The drm/msm driver requires that to
>>> function to let CMD panels to work. Use simplified version of
>>> drm_fbdev_generic_helper_fb_dirty() to fix support for CMD mode panels.
>>>
>>> Reported-by: Degdag Mohamed <degdagmohamed@gmail.com>
>>> Fixes: 93e81e38e197 ("drm/fb_helper: Minimize damage-helper overhead")
>>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>
>> Thanks, this solves the following warning:
>>
>>      msm_dpu ae01000.display-controller: 
>> drm_WARN_ON_ONCE(!helper->funcs->fb_dirty)
>>      WARNING: CPU: 0 PID: 9 at drivers/gpu/drm/drm_fb_helper.c:381 
>> drm_fb_helper_damage_work+0x1c0/0x20c
>>
>> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
>>
>> Note that drm_fb_helper_funcs documents this as "This callback is
>> optional": is it no longer optional, or are we enabling a damage feature
>> that makes it not-optional?
> 
> It is optional in the sense that most hardware and drivers don't require 
> damage handling. Those that do, also require this callback.

Can we please get this documented? I think it was really optional 
beforehand.

> 
> Best regards
> Thomas
> 
>>
>> - Marijn
>>
>>> ---
>>>   drivers/gpu/drm/msm/msm_fbdev.c | 20 ++++++++++++++++++++
>>>   1 file changed, 20 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/msm/msm_fbdev.c 
>>> b/drivers/gpu/drm/msm/msm_fbdev.c
>>> index fa9c1cbffae3..b933a85420f6 100644
>>> --- a/drivers/gpu/drm/msm/msm_fbdev.c
>>> +++ b/drivers/gpu/drm/msm/msm_fbdev.c
>>> @@ -139,8 +139,28 @@ static int msm_fbdev_create(struct drm_fb_helper 
>>> *helper,
>>>       return ret;
>>>   }
>>> +static int msm_fbdev_fb_dirty(struct drm_fb_helper *helper,
>>> +                  struct drm_clip_rect *clip)
>>> +{
>>> +    struct drm_device *dev = helper->dev;
>>> +    int ret;
>>> +
>>> +    /* Call damage handlers only if necessary */
>>> +    if (!(clip->x1 < clip->x2 && clip->y1 < clip->y2))
>>> +        return 0;
>>> +
>>> +    if (helper->fb->funcs->dirty) {
>>> +        ret = helper->fb->funcs->dirty(helper->fb, NULL, 0, 0, clip, 
>>> 1);
>>> +        if (drm_WARN_ONCE(dev, ret, "Dirty helper failed: ret=%d\n", 
>>> ret))
>>> +            return ret;
>>> +    }
>>> +
>>> +    return 0;
>>> +}
>>> +
>>>   static const struct drm_fb_helper_funcs msm_fb_helper_funcs = {
>>>       .fb_probe = msm_fbdev_create,
>>> +    .fb_dirty = msm_fbdev_fb_dirty,
>>>   };
>>>   /*
>>> -- 
>>> 2.39.2
>>>
> 

-- 
With best wishes
Dmitry


Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AA7F7AC788
	for <lists+freedreno@lfdr.de>; Sun, 24 Sep 2023 12:23:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF59510E119;
	Sun, 24 Sep 2023 10:23:21 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1D8810E114
 for <freedreno@lists.freedesktop.org>; Sun, 24 Sep 2023 10:23:17 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-533d9925094so1567155a12.2
 for <freedreno@lists.freedesktop.org>; Sun, 24 Sep 2023 03:23:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1695550996; x=1696155796; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NAyZdodbhEHxyvfq9t25K1kT6NpZjHkp5WFQo3bH0kU=;
 b=hh8qLqGpFjpa4t2WB4ZW+ljutF8Okf8o4otpSr8Er7HXqVrDCRREI9ksf6UqPXGxej
 wrHPpP/o5roHPCBuMDYp06bVFObV/vzz9OOMyNQ/ZkKLCZPOyWEPTvBVKzXHzU26xWeL
 LzjKEzNuSCiaj9rp3SEW6MnGTXp4f+H3clGyMr0eA6A2HnLXaR5pDQSEbNU0JpYoW38C
 9KPL6K+QEc9gvrat1FwebWIZxBKKAY10UOrcwj5T0+D2LyDKqlcxA4GuenEvIp93kNro
 q9lG/QmhNSVA6T5QvtaHE51tlQW8loPH3GoHGSpkh3UfOftUZVwG1OAv/u4ALOZDJ6FP
 ySZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695550996; x=1696155796;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NAyZdodbhEHxyvfq9t25K1kT6NpZjHkp5WFQo3bH0kU=;
 b=CTSqHLSHFsITGuaRFKhIoybW1HQVwofcL06+H6jwCTN119epxWlw2NT3jyc4dg6Gdz
 PJgWmj8GasbKWLKo3jInnsuPq6piFZN4kGwqf3nSwjHFsh/IYZYyCsFYKuqCACF857zS
 OrqFraQ0ARssh7qPGDN5mG+9Sep6QLINTIPQDvFCC5R+UHSdSLlSbIJtMM5PHSqTppTR
 3FK588F+J7ww5lm5AClWvGA8yBFZKK0+y0UPJDupwkeixHp+SRzdFRuhLnunpNv7NNES
 0uJJHrIqk8SFh0h/qnPs1sWu+OMEpcWIwyy2m/6OcaUTqhhv5/nCo5s16qBdYdM/23xR
 YoyQ==
X-Gm-Message-State: AOJu0Yxhasad2QwRAncrR0cOsWTJ2H6OiuQ3E11GewWuWhj6UccnJz6O
 Esm83xVK39B5rajSQDSekx0kNA==
X-Google-Smtp-Source: AGHT+IErimtHQwXCllH1LgG+MK0TOlPSL6e6E6XP+QbXRiZkmk5TFH/ytDFtnePyqJJQRL/OxC7FCg==
X-Received: by 2002:a17:907:7636:b0:9ad:99a8:7c53 with SMTP id
 jy22-20020a170907763600b009ad99a87c53mr3492921ejc.60.1695550996095; 
 Sun, 24 Sep 2023 03:23:16 -0700 (PDT)
Received: from [10.73.151.44] ([188.111.42.10])
 by smtp.gmail.com with ESMTPSA id
 lw13-20020a170906bccd00b0098884f86e41sm4809559ejb.123.2023.09.24.03.23.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Sep 2023 03:23:15 -0700 (PDT)
Message-ID: <6851b864-447f-453f-8b34-1fbb6e97eefe@linaro.org>
Date: Sun, 24 Sep 2023 13:23:13 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Jessica Zhang <quic_jesszhan@quicinc.com>,
 Pekka Paalanen <ppaalanen@gmail.com>
References: <20230828-solid-fill-v6-0-a820efcce852@quicinc.com>
 <20230828-solid-fill-v6-7-a820efcce852@quicinc.com>
 <20230829112230.7106a8bf@eldfell>
 <752176d8-23f4-4689-8bf4-db27f153fd39@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <752176d8-23f4-4689-8bf4-db27f153fd39@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] [PATCH RFC v6 07/10] drm/atomic: Loosen FB atomic
 checks
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
Cc: freedreno@lists.freedesktop.org, sebastian.wick@redhat.com,
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 contact@emersion.fr, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, wayland-devel@lists.freedesktop.org,
 Sean Paul <sean@poorly.run>, ville.syrjala@linux.intel.com,
 laurent.pinchart@ideasonboard.com
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 22/09/2023 20:49, Jessica Zhang wrote:
> 
> 
> On 8/29/2023 1:22 AM, Pekka Paalanen wrote:
>> On Mon, 28 Aug 2023 17:05:13 -0700
>> Jessica Zhang <quic_jesszhan@quicinc.com> wrote:
>>
>>> Loosen the requirements for atomic and legacy commit so that, in cases
>>> where pixel_source != FB, the commit can still go through.
>>>
>>> This includes adding framebuffer NULL checks in other areas to 
>>> account for
>>> FB being NULL when non-FB pixel sources are enabled.
>>>
>>> To disable a plane, the pixel_source must be NONE or the FB must be NULL
>>> if pixel_source == FB.
>>>
>>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>>> ---
>>>   drivers/gpu/drm/drm_atomic.c        | 20 +++++++++++---------
>>>   drivers/gpu/drm/drm_atomic_helper.c | 36 
>>> ++++++++++++++++++++----------------
>>>   include/drm/drm_atomic_helper.h     |  4 ++--
>>>   include/drm/drm_plane.h             | 29 +++++++++++++++++++++++++++++
>>>   4 files changed, 62 insertions(+), 27 deletions(-)
>>
>> ...
>>
>>> diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
>>> index a58f84b6bd5e..4c5b7bcdb25c 100644
>>> --- a/include/drm/drm_plane.h
>>> +++ b/include/drm/drm_plane.h
>>> @@ -992,6 +992,35 @@ static inline struct drm_plane 
>>> *drm_plane_find(struct drm_device *dev,
>>>   #define drm_for_each_plane(plane, dev) \
>>>       list_for_each_entry(plane, &(dev)->mode_config.plane_list, head)
>>> +/**
>>> + * drm_plane_solid_fill_enabled - Check if solid fill is enabled on 
>>> plane
>>> + * @state: plane state
>>> + *
>>> + * Returns:
>>> + * Whether the plane has been assigned a solid_fill_blob
>>> + */
>>> +static inline bool drm_plane_solid_fill_enabled(struct 
>>> drm_plane_state *state)
>>> +{
>>> +    if (!state)
>>> +        return false;
>>> +    return state->pixel_source == DRM_PLANE_PIXEL_SOURCE_SOLID_FILL 
>>> && state->solid_fill_blob;
>>> +}
>>> +
>>> +static inline bool drm_plane_has_visible_data(const struct 
>>> drm_plane_state *state)
>>> +{
>>> +    switch (state->pixel_source) {
>>> +    case DRM_PLANE_PIXEL_SOURCE_NONE:
>>> +        return false;
>>> +    case DRM_PLANE_PIXEL_SOURCE_SOLID_FILL:
>>> +        return state->solid_fill_blob != NULL;
>>
>> This reminds me, new UAPI docs did not say what the requirements are for
>> choosing solid fill pixel source. Is the atomic commit rejected if
>> pixel source is solid fill, but solid_fill property has no blob?
> 
> Hi Pekka,
> 
> Yes, if pixel_source is solid_fill and the solid_fill property blob 
> isn't set, the atomic commit should throw an error.
> 
> Will document this in the UAPI.

I don't see a corresponding error check in atomic_check() functions. 
Could you please check that there is one, as you are updating the uAPI.

> 
> Thanks,
> 
> Jessica Zhang
> 
>>
>> This should be doc'd.
>>
>>
>> Thanks,
>> pq
>>
>>> +    case DRM_PLANE_PIXEL_SOURCE_FB:
>>> +    default:
>>> +        WARN_ON(state->pixel_source != DRM_PLANE_PIXEL_SOURCE_FB);
>>> +    }
>>> +
>>> +    return state->fb != NULL;
>>> +}
>>> +
>>>   bool drm_any_plane_has_format(struct drm_device *dev,
>>>                     u32 format, u64 modifier);
>>>
>>

-- 
With best wishes
Dmitry


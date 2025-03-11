Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 689C2A5C2E5
	for <lists+freedreno@lfdr.de>; Tue, 11 Mar 2025 14:41:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 423B310E1E1;
	Tue, 11 Mar 2025 13:41:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="n92srBkW";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7E8710E1CF
 for <freedreno@lists.freedesktop.org>; Tue, 11 Mar 2025 13:41:47 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id
 a640c23a62f3a-ac250d158a8so80349466b.2
 for <freedreno@lists.freedesktop.org>; Tue, 11 Mar 2025 06:41:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741700506; x=1742305306; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=HdKPWEjQ9MubZzHzANAR1B1dJk3X5c8iz/F2XLpQWFQ=;
 b=n92srBkW5Gt82Y8z3mNLwOHgG1kgikKcQoVmhR9SIactnv85Gm4vdQzU5onrqutGzd
 E555P0g0MONOqLRM7TY+dVnfonS9tA1OeiP0RWz+4jY9WHDD+1Q9ViAlYlQnt+vWIRWx
 jsNja2Ye80XsQDioRYnlZKycl0nRJ4DDGjcTK/vkafZlm9E0rgGJROmQ1qle/0V/w4Gn
 d5YzkuCb8wj6kiLvEc8kuWDAgX6cug4nWxQ0UDGX0gypiWrs6lWU/+W4aexLQ4u8Xr37
 bwNN5pU/nFb0wWtHiio27xFp0EM/L8dZY0fls4pCWS8+ZygAzEoACtVmY+THa4ziZUrV
 xlxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741700506; x=1742305306;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HdKPWEjQ9MubZzHzANAR1B1dJk3X5c8iz/F2XLpQWFQ=;
 b=Zix6j+aHwCdfC2jHSeiiCyB3eX0IfTl/MEYKQwG/f6FBkfqlg+0jqcp1inVsqxRk2F
 vw7o1ztQCEy0cxYM2DKFEgoCtkc6nIM+HwAH1AwBu//ALuec03XVx90BB1h8T/Az1e0f
 Oit8HGEmvomHjKqkRm3uJWQiTHvulzkKInwBmvqvkkFFYYQAw74tbBXbTmvqTVEFTH/y
 3A84Kkb5JnDfv6QcCKdmSUexL1r7rhWuRZn7LbmXz5KS+WIlFU+Cdf4JJznsgJZQYBzy
 p3ql+fiVL7+gmHkAwXnbb1BlAW8BRXSISpstVq1w2yRBRD9uudja2VWW0eUoiCK3djbP
 xoxg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUXYWc0fBV6P0XpWlOxvv5DYMpkTd0S5CaGZkPud8ujWWFP/cRsyt3/N8YaQUwcVEEva/7kbV8gDVg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YycODqWacWVv/6uQPykjWQD1rfZmICPb5gdCNGYdVVtBubilMYe
 q+cdDovUK34n0oNJ/6Jj6JfUznt+BjN3IyuACRDafXkc79nN2MUj8g5oOeRmyPo=
X-Gm-Gg: ASbGncveh3hnDwRT/eOnBo63Jc8Cq74LhiL71FYZtVOM1jQ9uFBjkhwKuyWzzrJDNu/
 5YwheTazjmP7dFZpixt+FIRzHL2oxaeZ3s9hPUHkFJzaRdfpH1w7aSOmHxiQcM1wIBXPUlHcbo4
 Uuz3J03qWjCVasou9w4dpkC3/12WUwf+QMcflHbKmCYRvZeWvjhiFMRFrr2MpGsGf+sworB6+oP
 6kTfcMDN9aqaKqPijs1n8dHZWKJXeFwW0La0RUuEwCnnqOhw8q5F7BA9xAyYgZvURhdjQHZeoid
 ++zVv4C8cIIrq3u2OxgIfHZ+iXbW7molLYD4VRQAf2+vyY4AjMvHxdRWOg2OlBU=
X-Google-Smtp-Source: AGHT+IEqEAGnHplIQlC9/HTd3OQLI+WAu1AQWvDUyhIkVSadRnO3CylrdWWKlM5lhSqAt8Davw0wjg==
X-Received: by 2002:a17:906:7311:b0:abf:6f87:6730 with SMTP id
 a640c23a62f3a-ac2b9de959fmr168044566b.5.1741700506149; 
 Tue, 11 Mar 2025 06:41:46 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.198.86])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac239517802sm915329766b.86.2025.03.11.06.41.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Mar 2025 06:41:45 -0700 (PDT)
Message-ID: <5a88dc9e-3952-478e-840c-5d6dac1cd81d@linaro.org>
Date: Tue, 11 Mar 2025 14:41:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 18/21] drm/msm/dpu: Implement 10-bit color alpha for
 v12.0 DPU
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Srini Kandagatla <srinivas.kandagatla@linaro.org>,
 Rob Clark <robdclark@chromium.org>
References: <20250221-b4-sm8750-display-v3-0-3ea95b1630ea@linaro.org>
 <20250221-b4-sm8750-display-v3-18-3ea95b1630ea@linaro.org>
 <4y2nj6qxbbp7etuweoyarcg7vpbyemparzclj7ulb46rxk7k3s@s6wjrjebuc3g>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <4y2nj6qxbbp7etuweoyarcg7vpbyemparzclj7ulb46rxk7k3s@s6wjrjebuc3g>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 21/02/2025 17:25, Dmitry Baryshkov wrote:
>> -static void _dpu_crtc_setup_blend_cfg(struct dpu_crtc_mixer *mixer,
>> -		struct dpu_plane_state *pstate, const struct msm_format *format)
>> +static void _dpu_crtc_setup_blend_cfg(const struct dpu_hw_ctl *ctl,
>> +				      struct dpu_crtc_mixer *mixer,
>> +				      struct dpu_plane_state *pstate,
>> +				      const struct msm_format *format)
>>  {
>>  	struct dpu_hw_mixer *lm = mixer->hw_lm;
>>  	uint32_t blend_op;
>> -	uint32_t fg_alpha, bg_alpha;
>> +	uint32_t fg_alpha, bg_alpha, max_alpha;
>>  
>>  	fg_alpha = pstate->base.alpha >> 8;
>> -	bg_alpha = 0xff - fg_alpha;
>> +	if (ctl->mdss_ver->core_major_ver < 12)
>> +		max_alpha = 0xff;
>> +	else
>> +		max_alpha = 0x3ff;
> 
> So, CTL is passed only to get struct dpu_mdss_version? It can either be
> passed directly or fetched via dpu_kms->catalog->mdss_ver

Ack.

> 
>> +	bg_alpha = max_alpha - fg_alpha;
>>  
>>  	/* default to opaque blending */
>>  	if (pstate->base.pixel_blend_mode == DRM_MODE_BLEND_PIXEL_NONE ||
>> @@ -337,7 +343,7 @@ static void _dpu_crtc_setup_blend_cfg(struct dpu_crtc_mixer *mixer,
>>  	} else if (pstate->base.pixel_blend_mode == DRM_MODE_BLEND_PREMULTI) {
>>  		blend_op = DPU_BLEND_FG_ALPHA_FG_CONST |
>>  			DPU_BLEND_BG_ALPHA_FG_PIXEL;
>> -		if (fg_alpha != 0xff) {
>> +		if (fg_alpha != max_alpha) {
>>  			bg_alpha = fg_alpha;
>>  			blend_op |= DPU_BLEND_BG_MOD_ALPHA |
>>  				    DPU_BLEND_BG_INV_MOD_ALPHA;
>> @@ -348,7 +354,7 @@ static void _dpu_crtc_setup_blend_cfg(struct dpu_crtc_mixer *mixer,
>>  		/* coverage blending */
>>  		blend_op = DPU_BLEND_FG_ALPHA_FG_PIXEL |
>>  			DPU_BLEND_BG_ALPHA_FG_PIXEL;
>> -		if (fg_alpha != 0xff) {
>> +		if (fg_alpha != max_alpha) {
>>  			bg_alpha = fg_alpha;
>>  			blend_op |= DPU_BLEND_FG_MOD_ALPHA |
>>  				    DPU_BLEND_FG_INV_MOD_ALPHA |
>> @@ -482,7 +488,7 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
>>  
>>  		/* blend config update */
>>  		for (lm_idx = 0; lm_idx < cstate->num_mixers; lm_idx++) {
>> -			_dpu_crtc_setup_blend_cfg(mixer + lm_idx, pstate, format);
>> +			_dpu_crtc_setup_blend_cfg(ctl, mixer + lm_idx, pstate, format);
>>  
>>  			if (bg_alpha_enable && !format->alpha_enable)
>>  				mixer[lm_idx].mixer_op_mode = 0;
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
>> index 3bfb61cb83672dca4236bdbbbfb1e442223576d2..75bf3521b03c8e243ccfe1fc226aa71f23b296df 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
>> @@ -19,12 +19,20 @@
>>  
>>  /* These register are offset to mixer base + stage base */
>>  #define LM_BLEND0_OP                     0x00
>> +
>> +/* <v12 DPU with offset to mixer base + stage base */
>>  #define LM_BLEND0_CONST_ALPHA            0x04
>>  #define LM_FG_COLOR_FILL_COLOR_0         0x08
>>  #define LM_FG_COLOR_FILL_COLOR_1         0x0C
> 
> lowercase hex

Ack

> 
>>  #define LM_FG_COLOR_FILL_SIZE            0x10
>>  #define LM_FG_COLOR_FILL_XY              0x14
>>  
>> +/* >= v12 DPU */
>> +#define LM_BORDER_COLOR_0_V12		0x1C
> 
> lowercase hex
> 
>> +#define LM_BORDER_COLOR_1_V12		0x20
>> +
>> +/* >= v12 DPU with offset to mixer base + stage base */
>> +#define LM_BLEND0_CONST_ALPHA_V12	0x08
> 
> This doesn't seem to be aligned properly

That's only patch view... because I used tabs. I think existing code
uses spaces, so I will switch to spaces.


Best regards,
Krzysztof

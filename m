Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 144719FEF2E
	for <lists+freedreno@lfdr.de>; Tue, 31 Dec 2024 12:56:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3A5910E666;
	Tue, 31 Dec 2024 11:56:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="AAuC4ADd";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF23C10E668
 for <freedreno@lists.freedesktop.org>; Tue, 31 Dec 2024 11:56:34 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-436637e8c8dso100816225e9.1
 for <freedreno@lists.freedesktop.org>; Tue, 31 Dec 2024 03:56:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1735646133; x=1736250933;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kZ0cCTCCRfld4Ulk+wiogAmP056IVjuCCQi0SFVFq28=;
 b=AAuC4ADd1IqcqGflOcjA67Wl+oR1RVAvT8liSsRIw9kiffxnjajkbwn6Ssp3gkCGmi
 hHh9B7UmFoaRqSH0b2bMaoEOqGclOGekeEuD7cdouaOxoTFZlsgQu7RtxeUAPrgCsCwF
 UE8X59q7orcEMW7Sx93svzHJNIe/8AIrqux/4NeN3IsIYhVSp338NmjO1Qz+2NxtypDN
 Mf0NqXZPK9dXuwwOHQJdIXK8s8Z5CENGC0cOhw6s9pcLODqsbTriPBrCT2q+w4/0Zw90
 dGfMpwRsBo1+zwAbRgOJGEhdV+kHEvcDV2Yf+HXqya3RHKwq1SvNoK8H6ykzV+9UTGA5
 2iMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735646133; x=1736250933;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kZ0cCTCCRfld4Ulk+wiogAmP056IVjuCCQi0SFVFq28=;
 b=bd5P5UDUSKtk/mmc2fbv763xpQC/SJGqYwlDLLTUMCs7zxph6YcSYLqR5wGfCuXuKD
 aLgvL43mrdqhzpN4XAA6WMVCpIGmbl4cuyMmRweFP7NJA2zOV9C/zpJyWZOzbEtWcE1z
 kF+Eg7orOu5dv4uviazodLL+As5SqHuvVpeXJhWHd3dbTNUwI9k3UuwgoLdBDknRqQvY
 n3QQZutqWCY3VYeHXA4JLSpjELMQvk9pr56pZlcIgvV9LbfL28amJJgOzk+ExbK7uXxL
 iX/WeKRtoAvHyK0zdFbij5Dy1L1LA3neelUz0nPN6iMBM02jkJxNDJP2tX0TyN02K+4q
 RGwQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX70SSowTvAmFLtr5LhrLyyA/0xn0WzOAYsbcbzOmfZY+l7oUgUHJXQ6YxNi2IXHEHaoQvL0xrjoRc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxo5dKm2zTEkWcxfeetyUsdar9CiOK4A1+WrLAz2qKyX2o2NBYZ
 QThSWf3V77nia1mQ3E0JTdb7k2I8h4MWZfxEdV4MR0NusIqkqgswYDagDE9Cx2uBH4tbVoCWwgc
 J
X-Gm-Gg: ASbGnctpthaBg8F+ejL8OIs0WA0nhBiqMcXAh3SXTzcF/rb4EXWaGtcw2a3Adh9Yc9i
 nS3HdbjQQq63pQiz8ZyLYeCDxQp5phQ6ndepYATdVCMUGJT4X4LK3hjfTqcN9szyx8ZmGX0s9JL
 QvurumzTS+qrqMf3eGB1pWc+y2bZ7xVr6boC/eeH3r/OE3YXzma5PL+sFXf4KWXkM80W8nAuXbU
 2k3/OHExJYIkf4KCutgcFNoUOa8Mu/kkL6rvU59bjGmEZNqV4Ff/2ZRbK4QU7maQlaItKTD
X-Google-Smtp-Source: AGHT+IEonJCQkKfmUZRTTcQxMpQNh8v+hJ8WjpocKj3WTxQpFwWxDIM9bcA7O43AFVEzFIMvitFZLg==
X-Received: by 2002:a05:600c:4748:b0:434:f804:a9b0 with SMTP id
 5b1f17b1804b1-43668b78818mr314536595e9.29.1735646132934; 
 Tue, 31 Dec 2024 03:55:32 -0800 (PST)
Received: from [192.168.0.101] ([90.241.98.187])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-436611ea3e0sm390817235e9.7.2024.12.31.03.55.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 Dec 2024 03:55:32 -0800 (PST)
Message-ID: <1b5a3555-1094-404c-8b71-49dd07f59ac9@ursulin.net>
Date: Tue, 31 Dec 2024 11:55:31 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm: UAPI error reporting
To: Rob Clark <robdclark@gmail.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, Rob Clark <robdclark@chromium.org>,
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>
References: <20241121164858.457921-1-robdclark@gmail.com>
 <54601d79-4156-41f4-b1b7-250c5c970641@oss.qualcomm.com>
 <CAF6AEGtafQM7-mYy163Krry3OHgPNH3e9A=9VEhBpiQTADtULQ@mail.gmail.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <CAF6AEGtafQM7-mYy163Krry3OHgPNH3e9A=9VEhBpiQTADtULQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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


On 22/11/2024 15:51, Rob Clark wrote:
> On Fri, Nov 22, 2024 at 4:21 AM Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
>>
>> On 21.11.2024 5:48 PM, Rob Clark wrote:
>>> From: Rob Clark <robdclark@chromium.org>
>>>
>>> Debugging incorrect UAPI usage tends to be a bit painful, so add a
>>> helper macro to make it easier to add debug logging which can be enabled
>>> at runtime via drm.debug.
>>>
>>> Signed-off-by: Rob Clark <robdclark@chromium.org>
>>> ---
>>
>> [...]
>>
>>> +/* Helper for returning a UABI error with optional logging which can make
>>> + * it easier for userspace to understand what it is doing wrong.
>>> + */
>>> +#define UERR(err, drm, fmt, ...) \
>>> +     ({ DRM_DEV_DEBUG_DRIVER((drm)->dev, fmt, ##__VA_ARGS__); -(err); })
>>> +
>>>   #define DBG(fmt, ...) DRM_DEBUG_DRIVER(fmt"\n", ##__VA_ARGS__)
>>>   #define VERB(fmt, ...) if (0) DRM_DEBUG_DRIVER(fmt"\n", ##__VA_ARGS__)
>>
>> I'm generally not a fan of adding driver-specific debug prints..
>>
>> Maybe that's something that could be pushed to the drm-common layer
>> or even deeper down the stack?
> 
> Even if we had something like DRM_DBG_UABI_ERROR() I'd probably still
> just #define UERR() to be a wrapper for it, since line length/wrapping
> tends to be a bit of a challenge.  And I have a fairly substantial
> patch stack on top of this adding sparse/vm_bind support.  (Debugging
> that was actually the motivation for this patch.)
> 
> I noticed that xe has something similar, but slightly different shape,
> in the form of XE_IOCTL_DBG().. but that kinda just moves the line
> length problem into the if() conditional.  (And doesn't provide the
> benefit of being able to display the incorrect param.)

FWIW there is also a debug only builds hack in i915:

/* Catch emission of unexpected errors for CI! */
#if IS_ENABLED(CONFIG_DRM_I915_DEBUG_GEM)
#undef EINVAL
#define EINVAL ({ \
	DRM_DEBUG_DRIVER("EINVAL at %s:%d\n", __func__, __LINE__); \
	22; \
})
#endif

UERR functionality wise looks quite good to me. Better than the other 
two. The name is not scoped but I appreciate the readability line length 
challenges.

Regards,

Tvrtko

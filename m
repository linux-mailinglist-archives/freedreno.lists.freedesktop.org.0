Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90D21645D4B
	for <lists+freedreno@lfdr.de>; Wed,  7 Dec 2022 16:10:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D27B110E0CD;
	Wed,  7 Dec 2022 15:10:25 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A170D10E0CD
 for <freedreno@lists.freedesktop.org>; Wed,  7 Dec 2022 15:10:19 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id y25so6947288lfa.9
 for <freedreno@lists.freedesktop.org>; Wed, 07 Dec 2022 07:10:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Gz835eZGCRh+WN94zvl6mcTbQaOnylgv5MAXmXuctaA=;
 b=hLy25wjMTZVgYcoxzL3Cb7C8Pugw+mR3COLvCuzmqQrdWLQsAKElUAskEgYL8f7PWF
 U97C2da1LE1ja5UO+VT/v+WwoJKFBQUZC3GD/8oJH5ilIwgO7WuD0ehxLPSxyYuPuAL6
 WUgi843gP1R2xX5Y6RWNJq0hsS9tLn8UZQY8+0ejRyQzYTggH9SvG+r5AVhwE8MgJqPo
 Uk6/J4rgvut0WCS+AcPZ3M0eSQBSpPZVuzzX8lmyEJkTH8+Y8BVJv2CzJ7VDvCWHbWeC
 La2ZO0fBZS11c78YGu8OLRWALizkVgfvCd12ggGikVcFPl+zIUt5Q2us/g1l6JRRs8qP
 B1cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Gz835eZGCRh+WN94zvl6mcTbQaOnylgv5MAXmXuctaA=;
 b=LLBtyef+9ZNdL7Yi6BgE7zmmnH5vj/0a5kzmK0JTBWLLfV9JjZAffftUV4HjN5k4gx
 2u1uY1vmaO3TzfINuT4Vu0SImJmNfOrmYhLPul0L6vqy7KqxpOAeFEsh6bIn+btPxhMn
 FILLmBC4y3BgMOqYEPDPuFcUPlAHSAmEzL/vARO22vJ+e2iXJz7qhyb/ATmIgSrNKA/e
 2soMcbXANgzpddZdNCpLMPQtoZXUFDnDCQBbJnGZKGJ3aS6CIYr5k0HsLnX1vzK0uzYp
 ppAq+cPJAmLGaLKEzThvC5oFAtj+rmrn3ilHlWNiGT9yfiKl5se2oc59JD844uPmoyC6
 9K6Q==
X-Gm-Message-State: ANoB5pmqHPoicsxXyHC4t9TOhd05wLgIE2RQwHW9NQWGQyXWEwjWoYl4
 WjNv8gmPjpZNy4fycy5vna4EXA==
X-Google-Smtp-Source: AA0mqf6OCTBZrdnGnAV0vkexyBgE3U7veOZQevyMSaWAqlIRtTzXIxeaaUlEaUEDfDoQYoVt0dwl3Q==
X-Received: by 2002:a19:4f4a:0:b0:4b5:5c01:76c4 with SMTP id
 a10-20020a194f4a000000b004b55c0176c4mr6570229lfk.56.1670425817552; 
 Wed, 07 Dec 2022 07:10:17 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 f27-20020a19381b000000b0049fff3f645esm2877310lfa.70.2022.12.07.07.10.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Dec 2022 07:10:17 -0800 (PST)
Message-ID: <67c99b1b-5da1-861e-f5ad-d8db3e06b866@linaro.org>
Date: Wed, 7 Dec 2022 17:10:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Content-Language: en-GB
To: Kalyan Thota <quic_kalyant@quicinc.com>, dri-devel@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
References: <1669021695-4397-1-git-send-email-quic_kalyant@quicinc.com>
 <1669021695-4397-3-git-send-email-quic_kalyant@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1669021695-4397-3-git-send-email-quic_kalyant@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v4 2/3] drm/msm/disp/dpu1: add helper to
 know if display is builtin
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
Cc: robdclark@chromium.org, dianders@chromium.org, quic_abhinavk@quicinc.com,
 linux-kernel@vger.kernel.org, quic_vpolimer@quicinc.com, swboyd@chromium.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 21/11/2022 11:08, Kalyan Thota wrote:
> Since DRM encoder type for few encoders can be similar
> (like eDP and DP), get the connector type for a given
> encoder to differentiate between builtin and pluggable
> displays.
> 
> Changes in v1:
> - add connector type in the disp_info (Dmitry)
> - add helper functions to know encoder type
> - update commit text reflecting the change
> 
> Changes in v2:
> - avoid hardcode of connector type for DSI as it may not be true (Dmitry)
> - get the HPD information from encoder bridge
> 
> Changes in v3:
> - use connector type instead of bridge ops in determining
> connector (Dmitry)
> 
> Changes in v4:
> - get type from the drm connector rather from bridge connector (Dmitry)
> 
> Signed-off-by: Kalyan Thota <quic_kalyant@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 26 ++++++++++++++++++++++++++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |  6 ++++++
>   2 files changed, 32 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry


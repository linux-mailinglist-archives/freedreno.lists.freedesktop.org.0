Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3921699A79
	for <lists+freedreno@lfdr.de>; Thu, 16 Feb 2023 17:49:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E472910EE13;
	Thu, 16 Feb 2023 16:49:07 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50ECE10EE13
 for <freedreno@lists.freedesktop.org>; Thu, 16 Feb 2023 16:49:05 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id i18so1993510ljc.8
 for <freedreno@lists.freedesktop.org>; Thu, 16 Feb 2023 08:49:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bHKHX1HAZBr85iXwo+WtkQELZyFCk6BcVCrttzsLWZU=;
 b=zak29ERZiQt8Id07KJzutrFccKuEBZa/n53O2dbu5L2/sZ6mWojebQbhZTvmDUcjnp
 0ZFrq8l1JsgyqOH/UBUH9NRlfA5iIqSYZM6CWtFEZnCmabWQrXUkQHv1O6KsYdvsCEKw
 e2xOd4tfdbUtjBHZl5k/ZyfhoLGZYjNYo0Q6A2supNUwxbjY+qvtGk1BPUp8GAEKj0vO
 E0KsVX7CLDrgIw6j3mt0fBsZzJGip7/FK1kBKKBz7BeK5goIQjW2IkznvdTymyZjWsqR
 t7pJt4mMEdZQ8M3aHsn/E3dN91vR8mLYn97uaHy5DiX0NT6z07hRM+5LD5X8ZlNXcdyG
 i0Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bHKHX1HAZBr85iXwo+WtkQELZyFCk6BcVCrttzsLWZU=;
 b=r2o1F7zK9mSkg0iIbn7g1UFGS83Cf0rr0sDvEcFbBe9ZZTEY9xvku1MLswLMvMK4YY
 aPCLF68V0qLofEOKQPpkKdwuAYJzthlWMOV9zHNZkwRy2awNPBGqsnq9emu2BOWuxPv9
 PlVcewsy1Jh/dDOPkxu6pJJyfTE6EuwlO1OEcF+xtdGTd15XT4oqLaafOwUUZ8092zN3
 lUjX8Lv42bNg0aC6UJCW0JDH19ht48Eguq7EQub7jL0nWSdpnYudbKFz2HY2zZJj2r7j
 /KKN8iBci9JkVQfNkqCyjP0JOCEF37F3a7bO18P8gVQhG3HDYkQR3BhdMjJicCLxvOCk
 D3EQ==
X-Gm-Message-State: AO0yUKWs2bNt/avG7Wlk9sPRn1/bforC7LWldC0SIpS3Xem/pdH5MJLe
 QB8sJG6ghWGUrabvDoIDkFocpg==
X-Google-Smtp-Source: AK7set8MsvIGToSTGnh3xHzEOHexpm2Mv0MCDS0pFbnIcUwoVg9VY1ezx/Gcsdy3k2wE6PDGRUYaQg==
X-Received: by 2002:a05:651c:2220:b0:293:4e08:1aab with SMTP id
 y32-20020a05651c222000b002934e081aabmr2865284ljq.10.1676566143576; 
 Thu, 16 Feb 2023 08:49:03 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 o4-20020a2e9444000000b002935284f5a4sm274997ljh.13.2023.02.16.08.49.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Feb 2023 08:49:02 -0800 (PST)
Message-ID: <e2f5fb1d-b57f-4695-5345-c82faea127b0@linaro.org>
Date: Thu, 16 Feb 2023 18:49:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Content-Language: en-GB
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
References: <20230203182132.1307834-1-dmitry.baryshkov@linaro.org>
 <20230203182132.1307834-21-dmitry.baryshkov@linaro.org>
 <8e89bdc2-94ff-63b8-3089-c946e0226cff@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <8e89bdc2-94ff-63b8-3089-c946e0226cff@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] [PATCH v3 20/27] drm/msm/dpu: add dpu_hw_pipe_cfg
 to dpu_plane_state
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

On 06/02/2023 21:07, Abhinav Kumar wrote:
> 
> 
> On 2/3/2023 10:21 AM, Dmitry Baryshkov wrote:
>> Now as all accesses to pipe_cfg and pstate have been cleaned, re-add
>> struct dpu_hw_pipe_cfg back to dpu_plane_state, so that
>> dpu_plane_atomic_check() and dpu_plane_atomic_update() do not have a
>> chance to disagree about src/dst rectangles (currently
>> dpu_plane_atomic_check() uses unclipped rectangles, while
>> dpu_plane_atomic_update() uses clipped rectangles calculated by
>> drm_atomic_helper_check_plane_state()).
>>
> The title of the patch should now say "add dpu_hw_sspp_cfg"
> 
> I have a question on the commit text, why does it say "re-add" and not 
> "add".
> 
> dpu_hw_pipe_cfg/dpu_hw_sspp_cfg was not a part of dpu_plane_state even 
> before and I dont recall it was removed in this series and then added back.

Ack, I'll fix both items in v4.

> 
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 64 ++++++++++-------------
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h |  2 +
>>   2 files changed, 30 insertions(+), 36 deletions(-)-- 
With best wishes
Dmitry


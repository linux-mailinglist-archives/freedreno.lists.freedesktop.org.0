Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 737C36E85B1
	for <lists+freedreno@lfdr.de>; Thu, 20 Apr 2023 01:11:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AC6A10EB3B;
	Wed, 19 Apr 2023 23:11:40 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA16610EB3D
 for <freedreno@lists.freedesktop.org>; Wed, 19 Apr 2023 23:11:38 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2a8c28158e2so1462961fa.0
 for <freedreno@lists.freedesktop.org>; Wed, 19 Apr 2023 16:11:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681945897; x=1684537897;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=sfygpWcXD82nmdKO3aJpXpI9AXyY7qmWAlk2vCZOvBc=;
 b=sVIl/jhDZe96ic6Ugh+xb5APutIrMj6AJXc/AuoYLbyVZj7KFKWxM10TyW4/cmgiKu
 jaHSrB7skENraSGhUZKApGVXRr2OAK06da9ZtgzbJiuAhq7pJ6OYw4M9kktg3HRx+1qg
 a3F+5+oEJdhWyIWN9mcl9l//Ymgx8+Ic7rhmpVoeTdV4vixGNNnAbwT72QiJOSTa/aia
 KSHQwcYd0prAc3A8jr6M8IU9G+WDehumUWU15wk80w+OYCfWlAmhYuu/126p7bVJrCsd
 jwTvjBNuC6fvdTx+hLZwvjs8qRHe3WMuikSOFSyGi6ssb51mbYUTXHAg/8fuhZd+AZ1n
 zx1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681945897; x=1684537897;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sfygpWcXD82nmdKO3aJpXpI9AXyY7qmWAlk2vCZOvBc=;
 b=F6Gm8Z4blGBiqaWXMOfm5GqsegoEVVIHuVAgVxPyc/SsuM9lP6RJLtKZEOngBiysgh
 6kryX07h7wqpT8kFHgenPoT4B9/RH/NjPxDaj+IZ+iQ+z/E2sIZ1DevOCXN8t8Selvhw
 wFw1tfX0eSY4RcwTePEWrex+6bywIbII9JoPeloFaPj6vCavm2HksyRsA5QcNQkIQoGy
 suK/5zOODU3oT5cy5cfkyXBt50ZhUUyWd/xSJpKSOXf0q4+qM+kFtyFuBQGtM7yuRqi7
 kpeG9r6nC+V2ddunes8AQJIsI9leUZtpJLJPmSu7gDgY2kSzndEeZjzLpAcHVENaSoN2
 q5FQ==
X-Gm-Message-State: AAQBX9flU7622sLL/rdvlM0NjzJA8E2wDiCZfSDqRozuqYLG3BReUPqy
 hge/GKDD5JwamDXz8fOQ4KB3Lw==
X-Google-Smtp-Source: AKy350YqXP13dfiRQ0p8WHKOW0qK7OWHP0+B03Xc11I7kixmjk6LhtlLRu3bwG9cUdLhrVWN8ulzPQ==
X-Received: by 2002:a19:7403:0:b0:4ed:c471:6a7f with SMTP id
 v3-20020a197403000000b004edc4716a7fmr3462546lfe.17.1681945897054; 
 Wed, 19 Apr 2023 16:11:37 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 f2-20020ac25082000000b004eed63bc08csm36112lfm.131.2023.04.19.16.11.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Apr 2023 16:11:36 -0700 (PDT)
Message-ID: <9c0f922e-180a-930c-ac9a-04866b1b7bb1@linaro.org>
Date: Thu, 20 Apr 2023 02:11:35 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-GB
To: Arnaud Vrac <avrac@freebox.fr>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20230419-dpu-tweaks-v1-0-d1bac46db075@freebox.fr>
 <20230419-dpu-tweaks-v1-8-d1bac46db075@freebox.fr>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230419-dpu-tweaks-v1-8-d1bac46db075@freebox.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH 08/11] drm/msm/dpu: fix cursor block
 register bit offset in msm8998 hw catalog
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 19/04/2023 17:41, Arnaud Vrac wrote:
> This matches the value for both fbdev and sde implementations in the
> downstream msm-4.4 repository.
> 
> Signed-off-by: Arnaud Vrac <avrac@freebox.fr>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry


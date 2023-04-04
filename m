Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 630516D6F23
	for <lists+freedreno@lfdr.de>; Tue,  4 Apr 2023 23:43:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DB6510E21C;
	Tue,  4 Apr 2023 21:43:10 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5CB810E1F3
 for <freedreno@lists.freedesktop.org>; Tue,  4 Apr 2023 21:43:07 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id h25so44115042lfv.6
 for <freedreno@lists.freedesktop.org>; Tue, 04 Apr 2023 14:43:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680644586;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gSR45RkCkZAa6HfvzU+qpgIaeIB15LuPXZ7G+069NSk=;
 b=I7aAm/b8LBQTjsriGf5wlEn2paOkAC9x9Dffq5nPc8cgqqqPEsB8FNA7xP4SuDBuqX
 ZBNWGFAkDGwnWyRyLghIW+oj5MXhLqMBu2LLifNseSROmMkM7TNJ7CaJiXuAnKq5rckS
 dHJWrdlDfixUG5UqGeX5C4cCtf7Aoyy3HzRqTfPIi8ONNtEYGD+Xe4sMwq5mHd0qx6Rd
 /P/rCMcZJ1L1L5XiSBXxYQFWXiglGYypP8dY18PjTf1Adb6KVBKWFQexWeIl5jgaiuhE
 Id7H1GQiBKhH7yNPuJaCHCUCXxcf3pTPF4X14HDSEPWbljCBiPTDF+7cXVLsCcToocVO
 cEdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680644586;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gSR45RkCkZAa6HfvzU+qpgIaeIB15LuPXZ7G+069NSk=;
 b=B5zIyy2AEq53hgXwYuIwfv/zgXJL9UqM5XzGVvRaqLxmRA1zDwtTTUmJRic+cPblut
 wf9d4BG9Bx1mYSbbTL6npBz1c9Scdrf/VqOBtpnuQaLOeRY05LG6tsEKCvWab91lKvXW
 iOxz4YrrmeNUqwNH6nsOKereBQPD9JtW7O6mduKqNxKCnzmy7YJGeGBPKzyVhsYIW1Ib
 4xnfGv+TLmilgYrpRaCec3PocKDJH9/glxgQuPdyK7wxrbH/q95vBXyw90LTLLSJBhMB
 37UAl69RK/Ukev6nUziTkbbOWgV6y7h51Dqq6ZKWFiuwQH6MiALlKaSUNq1CY75rCV+N
 /baA==
X-Gm-Message-State: AAQBX9doJO4G0xNMdI+ME5U2Pk9L/OEquqsUeRcFemux52tNTzjqYkyf
 LhTkZVS72c2G8VB6dduUMdLrbg==
X-Google-Smtp-Source: AKy350aqwjn5ys3NOtAi47em7O+S8a0XsVjMCu5tyoY3tio0RsgoA26TA7qzZYrihV3AtEDGFEyNhg==
X-Received: by 2002:a19:c502:0:b0:4b4:8f01:f8b1 with SMTP id
 w2-20020a19c502000000b004b48f01f8b1mr1069888lfe.31.1680644585926; 
 Tue, 04 Apr 2023 14:43:05 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 o2-20020a2e9442000000b0029571d505a1sm2543919ljh.80.2023.04.04.14.43.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Apr 2023 14:43:05 -0700 (PDT)
Message-ID: <ad5207e8-50d8-98b1-cd07-f4ab0735d25d@linaro.org>
Date: Wed, 5 Apr 2023 00:43:05 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-GB
To: Thomas Zimmermann <tzimmermann@suse.de>, robdclark@gmail.com,
 quic_abhinavk@quicinc.com, sean@poorly.run, javierm@redhat.com,
 airlied@gmail.com, daniel@ffwll.ch
References: <20230403124538.8497-1-tzimmermann@suse.de>
 <20230403124538.8497-3-tzimmermann@suse.de>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230403124538.8497-3-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v2 2/8] drm/msm: Clear aperture ownership
 outside of fbdev code
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
 dri-devel@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 03/04/2023 15:45, Thomas Zimmermann wrote:
> Move aperture management out of the fbdev code. It is unrelated
> and needs to run even if fbdev support has been disabled. Call
> the helper at the top of msm_drm_init() to take over hardware
> from other drivers.
> 
> v2:
> 	* bind all subdevices before acquiring device (Dmitri)
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/msm/msm_drv.c   | 6 ++++++
>   drivers/gpu/drm/msm/msm_fbdev.c | 6 ------
>   2 files changed, 6 insertions(+), 6 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry


Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8829471714E
	for <lists+freedreno@lfdr.de>; Wed, 31 May 2023 01:07:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5350510E43F;
	Tue, 30 May 2023 23:07:44 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DA6F10E43F
 for <freedreno@lists.freedesktop.org>; Tue, 30 May 2023 23:07:42 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2af1e290921so53303121fa.3
 for <freedreno@lists.freedesktop.org>; Tue, 30 May 2023 16:07:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685488060; x=1688080060;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=aZBYZqm2QX9cYcGeEqnnE5rqTJSxRk4/JBiXuTiUxM0=;
 b=ulU+69wC13TRns9H2O4cl+nn9Tz8PwxPmBGH5PNA5IJHmcDcqr4OY3NcBQ5ialQbdJ
 bL9wumq+ipUUiEBgXf+dQO64M5/jlSPXdd9TOXfLDyi34sLTtdCae1lPq+Lov8MZTt11
 GPFB53UzyMHTv0GbSXrrQkVs2s7tRGqyyw5UiBm19a2fjdjsnwN/JZJn5WIM6tDvB0zy
 BSIGjGnT0AHRIdP/VKdLLE/EH5z8y36+GJWsh5R/nl/nbS5r36LdNEj0OrWN1WTVnEL3
 UzNufZw6i23RzNQIsWiLs+A1gUGcYNTSMFwQjelbwHM+OnEp/FOgYgpEzYp5JBD0blNU
 zUOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685488060; x=1688080060;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=aZBYZqm2QX9cYcGeEqnnE5rqTJSxRk4/JBiXuTiUxM0=;
 b=chaxte09YzZiMEpKfir4eWCugC0X3hhjN4fV9Hc13HCJG/4TZNUf2yZEP5rqnG8v5n
 e8+Z4+Gg3PplzILm7TOlUvTLhdYlK5QL5GSkUwIoDFePbv1RGYFl8nI1/H/qvel0HcgG
 KuhkUqZFKUY5Bpi5stka0AVYyc/k4kpkfs9uIEAbJbvJSayMjAO+zIJEiTj2ppfYsmdg
 lkTakoGG5iFuxzliz4FGZHHa/FXdzlYCBEw8wRwDi5w0gIc2jJEhay2HHbpSufZWukhW
 5VlwnCtyNQVRIghiLlKtwPddUqGEt1LQrd0Qv5ovMDmIa7rjPCAgFuzcn9I+NQ07DuPI
 KKMQ==
X-Gm-Message-State: AC+VfDxpaai5a6lbqdcLjKV74di6SKmeNLzYvTceJMoIZArWHc3dCiOO
 jUH+QM0s2QpPY9AYKxWv83H6FA==
X-Google-Smtp-Source: ACHHUZ5Ej9llgNKtAHQ57gkDu3OnNpoWD2Lx9icO+8TRpW35FdeXVdc2sZL1MNWqROBGbmmQgDUuwQ==
X-Received: by 2002:a05:651c:10b:b0:2af:d2ef:49d4 with SMTP id
 a11-20020a05651c010b00b002afd2ef49d4mr1515001ljb.1.1685488060177; 
 Tue, 30 May 2023 16:07:40 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 u3-20020a2e9b03000000b002aeee2a093csm3044298lji.59.2023.05.30.16.07.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 May 2023 16:07:39 -0700 (PDT)
Message-ID: <64fbc753-d8aa-6845-c530-f76999e8c7b9@linaro.org>
Date: Wed, 31 May 2023 02:07:38 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-GB
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, dri-devel@lists.freedesktop.org,
 robdclark@gmail.com, sean@poorly.run, swboyd@chromium.org,
 dianders@chromium.org, vkoul@kernel.org, daniel@ffwll.ch, airlied@gmail.com,
 agross@kernel.org, andersson@kernel.org
References: <1685464318-25031-1-git-send-email-quic_khsieh@quicinc.com>
 <1685464318-25031-4-git-send-email-quic_khsieh@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1685464318-25031-4-git-send-email-quic_khsieh@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v1 3/3] drm/msm/dpu: remove
 msm_dsi_get_dsc_config()
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
Cc: quic_sbillaka@quicinc.com, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, linux-kernel@vger.kernel.org,
 marijn.suijten@somainline.org, quic_jesszhan@quicinc.com,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 30/05/2023 19:31, Kuogee Hsieh wrote:
> Since msm_dsi_bridge_get_dsc_config() was added to retrieve DSI DSC
> info through DRM bridge, msm_dsi_get_dsc_config() become redundant
> and should be removed.
> 
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 2 --
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h | 2 --
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     | 2 --
>   drivers/gpu/drm/msm/dsi/dsi.c               | 5 -----
>   drivers/gpu/drm/msm/msm_drv.h               | 6 ------
>   5 files changed, 17 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry


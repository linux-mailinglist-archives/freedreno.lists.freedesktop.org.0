Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BFDA6D6F2F
	for <lists+freedreno@lfdr.de>; Tue,  4 Apr 2023 23:44:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2181910E7B0;
	Tue,  4 Apr 2023 21:44:23 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25A9E10E7B0
 for <freedreno@lists.freedesktop.org>; Tue,  4 Apr 2023 21:44:22 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id y15so44107942lfa.7
 for <freedreno@lists.freedesktop.org>; Tue, 04 Apr 2023 14:44:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680644660;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=z4cGrSZvJ2WwLk51+RNni7SQAM20J6HheQCudpB7xaI=;
 b=M0sbz1uuCT89qn8mrqMkXbXNWikGtg49Jkgysnu6s+BaRJa/bKa5er8cYQwnmIxAd+
 mEN/6DCUbYcpDDDGpHK7tReV4VEwOx98dimtsk0OAsxHPcHwr572j8QYewAdRHlewGcd
 C0MF8kB2W5IG6kEu5D6qW94TMt/mi7pl367otPHBWgnAqQ4PeLniehQ7cyw8i2Ptb0q4
 GF02Hr7PHugnDz/2N6aq7av18SCJpDHwvLDVQiYIXp6+dyWo9nrUr5gfcMCk4RaSAR2z
 8BwaWXcK00+uB70xgkep8LJjh9tJJ1omLWixZIzXh0dSpOMHA2IksHgjmpd7jo0+Ha/S
 grGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680644660;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=z4cGrSZvJ2WwLk51+RNni7SQAM20J6HheQCudpB7xaI=;
 b=kZXIKWFSYVzsMoaK9bFadQzEiBBxX2NCj62SoNRj36xCe5Zys2dzwHCBvcHwyn6y2N
 pziFqoOgB+mSU/SyTpRqtdnB4N4NtK9nG+UX5t84rTHti+zj0jGxh+rnCYoQBj5OBbVF
 nbEz2+x71A+FvMLchhyczUnLiSnHErJc5lHMM5TbJbfg4seMzS5c9N5SB8aI1WtMS7yQ
 wqJ/Z/qTCY+53UGQdmFR48oEpLWXCpaG/E/tZwZGQtaoQZgy8EMWs5ltjAQ9bKGIlr5v
 jVvgxAeA4BdOOxdQjcqOKWqnDOJ/l7nAOqlksmJ4hs/aLmwmC1dIolou1eMFinFcCZyt
 jQRA==
X-Gm-Message-State: AAQBX9fx6YIpckY5MbxhrbxYvoLG+1hno5VfzVrgqLUjpjfgLDjxtN/c
 cBFm/q0OR5AcIgak8FOpBuoL/w==
X-Google-Smtp-Source: AKy350ZGb14UqtpSccBCgE8DwAr/KcuNUeQz0853wDC2eMzAj64VPLGG1kiBiL/gqUrzz1/qQRCMgA==
X-Received: by 2002:a19:f60a:0:b0:4d8:5238:ae97 with SMTP id
 x10-20020a19f60a000000b004d85238ae97mr908396lfe.36.1680644660435; 
 Tue, 04 Apr 2023 14:44:20 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 l14-20020a2e99ce000000b0029f7d27b78bsm2559978ljj.110.2023.04.04.14.44.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Apr 2023 14:44:20 -0700 (PDT)
Message-ID: <a20bba42-db84-5e5e-e87f-c066e09c5775@linaro.org>
Date: Wed, 5 Apr 2023 00:44:19 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-GB
To: Thomas Zimmermann <tzimmermann@suse.de>, robdclark@gmail.com,
 quic_abhinavk@quicinc.com, sean@poorly.run, javierm@redhat.com,
 airlied@gmail.com, daniel@ffwll.ch
References: <20230403124538.8497-1-tzimmermann@suse.de>
 <20230403124538.8497-7-tzimmermann@suse.de>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230403124538.8497-7-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v2 6/8] drm/msm: Move module parameter
 'fbdev' to fbdev code
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
> Define the module's parameter 'fbdev' in fbdev code. No other code
> uses it. No functional changes, but simplifies the later conversion
> to struct drm_client.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/msm/msm_drv.c   | 10 ++--------
>   drivers/gpu/drm/msm/msm_fbdev.c |  7 +++++++
>   2 files changed, 9 insertions(+), 8 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry


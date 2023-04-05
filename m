Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1D1B6D86DB
	for <lists+freedreno@lfdr.de>; Wed,  5 Apr 2023 21:28:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70DCE10E34D;
	Wed,  5 Apr 2023 19:28:15 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92A3310E34D
 for <freedreno@lists.freedesktop.org>; Wed,  5 Apr 2023 19:28:13 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id x20so38357354ljq.9
 for <freedreno@lists.freedesktop.org>; Wed, 05 Apr 2023 12:28:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680722891;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xyk9gyqKSX6vf51KkISu7/1RBcf1YgJerL2mWO19eRY=;
 b=bYXu3+B/PyWJp+zFnlZik2M9E+r77gpb/zk/Qg4EZqIJ6OR3R4QS+FBi+JjpGDysqa
 f0blBODn8+/nC9cR33NyykP8JcVyLOIITM85DbVj/q10Dn3XgKI/Fs1iVciIFIBHGPOa
 m/WxBuUKolIGURPuW10+/HcTKD4SKYluIPw4QAVzJ78vwfXOefDz5RPoDJ2SWx5+CKqQ
 dGbfqrV/QKd44EguEQyf5TexzGxvwLRb+fBztZlvyhZbp+ZQImJU7jOwuPPmG9M7Qyxu
 VSca+glpxqHCVYugimVd+J5wjBkKzneA4rhAr1LfwdYuB6M8akN9VsiVAenj8TOhsoKA
 AjYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680722891;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xyk9gyqKSX6vf51KkISu7/1RBcf1YgJerL2mWO19eRY=;
 b=huUL9yNnVxPRvMc6y7aRFhsPGYfAbdQHEaDuaUdwcqHVfIo0Ro44xjsqT7vvQKw1eG
 viERxgSG8rehMRbzTEJRfx+WzBPQBEEOyp1ax/VGo7aAlF+S0ujJLsN9dyLiu/Y4RO7z
 O1ZmofXe74z9QVf8xxglxrGLItGqPdv2Uc9kiyDeCiNgQhSGjmXPopg+T/viaTEFkhsc
 0Us0bLvBczoZ6Ce4iG89Axe+Aq8S3T1hjBTIjhWej4o3vQFk/1SEX1wU0cu4yH4LCYEg
 z8W/2mu6l2GEAyYHA5UfdxPkifl7KBC++/yxi1Qa+UPdm6SSaufDK+3HFozp5H3a1zgp
 0fzw==
X-Gm-Message-State: AAQBX9cK2r882XdNSfCtTqeY8PpyGNhGnMoQdmSarx81DveXLOuKAXlP
 o8xWcRKpctvRMnIuDT7x7Ckwtw==
X-Google-Smtp-Source: AKy350YWoifUz5YIaBQr4oUdSmW/vD6IUu3npYLfDxTZR1FEKoc1AvoebpmcKPUSfBhTVMVGq2sCiA==
X-Received: by 2002:a05:651c:44f:b0:293:591d:d84f with SMTP id
 g15-20020a05651c044f00b00293591dd84fmr725395ljg.11.1680722891533; 
 Wed, 05 Apr 2023 12:28:11 -0700 (PDT)
Received: from [10.10.15.130] ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 v14-20020a2e990e000000b00295b59fba40sm2919806lji.25.2023.04.05.12.28.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Apr 2023 12:28:11 -0700 (PDT)
Message-ID: <2675ea9e-e13c-d78c-aaf7-0be4ae756ad9@linaro.org>
Date: Wed, 5 Apr 2023 22:28:10 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-GB
To: Jessica Zhang <quic_jesszhan@quicinc.com>, freedreno@lists.freedesktop.org
References: <20230329-rfc-msm-dsc-helper-v4-0-1b79c78b30d7@quicinc.com>
 <20230329-rfc-msm-dsc-helper-v4-5-1b79c78b30d7@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230329-rfc-msm-dsc-helper-v4-5-1b79c78b30d7@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v4 5/6] drm/msm/dsi: update hdisplay
 calculation for dsi_timing_setup
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
Cc: linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 05/04/2023 03:41, Jessica Zhang wrote:
> hdisplay for compressed images should be calculated as bytes_per_slice *
> slice_count. Thus, use MSM DSC helper to calculate hdisplay for
> dsi_timing_setup instead of directly using mode->hdisplay.
> 
> Changes in v3:
> - Split from previous patch
> - Initialized hdisplay as uncompressed pclk per line at the beginning of
>    dsi_timing_setup as to not break dual DSI calculations
> 
> Changes in v4:
> - Moved pclk_per_intf calculations to DSC hdisplay adjustments
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>   drivers/gpu/drm/msm/dsi/dsi_host.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry


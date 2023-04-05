Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AFEF6D71C5
	for <lists+freedreno@lfdr.de>; Wed,  5 Apr 2023 03:00:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33B0510E00F;
	Wed,  5 Apr 2023 01:00:06 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B50010E00F
 for <freedreno@lists.freedesktop.org>; Wed,  5 Apr 2023 01:00:04 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id br6so44558499lfb.11
 for <freedreno@lists.freedesktop.org>; Tue, 04 Apr 2023 18:00:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680656403;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=GcoiMrViDnZHlrKyL7yBvDwh3HgZ08tXcqNo5+Sq0gY=;
 b=IhVO4NXV9rPbDyCa4YIAqIVWEciYhWbG6JqaO5Qk9pT113glq332E9MZCWmHicRTms
 Roe+goawdwXsFvBDJq9fpq/q1C28ctHI5vmQJ3AbLTdVZgpbFH3itOZKc0TqBhJx1Jvh
 L0PRYGLb+/rs0C+j/UyzfTocqeBj0mPNaDQps7EtJegZ0OPv6KT/9ds5c90BtpHmyEKc
 Qr5uNO5eFNODRPWuY8Zp3dl+KDKaSyc0JHNa2ihMDoMAideoxkQtlLBSKdmnOqYVPcjj
 74tOPAsNd/pSB4kqFZvF7H1Ih8J3miAU/rnktCfh8idyPgNFzj88PXG31YHpOzwPU4eP
 dncA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680656403;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GcoiMrViDnZHlrKyL7yBvDwh3HgZ08tXcqNo5+Sq0gY=;
 b=AIiec463mFB7nbfKZ+UFS+bkg336cMY6HLmvQQM73XWIanJurOjZ1xaPlxF5hZP8K8
 t75Vp0UP4l+MVa1ZVSr/jik9nrypBupXB8uJkt7zgrr+hG8raK7EjVwmT3KIhJ4MEhMh
 VhCd7VJJPLfy3a6RcDbx3PqjAZF26mMcCb6JPXZQ8jCWdkOpE+cSS8lTIzyaZbnmnw+/
 CpOZMB74tJ+bPJOdcnQQWHYVfPiXK6kChbqQT//vGy3ePAUHjC9eHVy9MxtnpltX8pAd
 ddWzye6otPR2d57zkF/PBaGhYJmGbfh+GaXW1mxYErcnze51cmqCYexoXzhHvVbtnatJ
 IF7w==
X-Gm-Message-State: AAQBX9fw7UfjdbBT8bHOT1v/skz7HT9cP1QdKraoXUI9vftfk7sKYOjJ
 FqDsQt1QiRswvlT/CFECV7NSig==
X-Google-Smtp-Source: AKy350bk28Ecr3+zl0vqVdiKvr+VWBUTdlhCWa7xakZAat4a+MhCn21kqM0agi3rq3dRhXJewwoLgg==
X-Received: by 2002:a19:c50b:0:b0:4e9:a75b:cccb with SMTP id
 w11-20020a19c50b000000b004e9a75bcccbmr1149700lfe.28.1680656402964; 
 Tue, 04 Apr 2023 18:00:02 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 w9-20020ac24429000000b004eaf6181a32sm2570310lfl.75.2023.04.04.18.00.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Apr 2023 18:00:02 -0700 (PDT)
Message-ID: <8a87358e-e17e-eb2f-4a21-082bb272537c@linaro.org>
Date: Wed, 5 Apr 2023 04:00:01 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-GB
To: Colin Ian King <colin.i.king@gmail.com>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
References: <20230329093026.418847-1-colin.i.king@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230329093026.418847-1-colin.i.king@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH][next] drm/msm/mdss: Fix spelling mistake
 "Unuspported" -> "Unsupported"
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 29/03/2023 12:30, Colin Ian King wrote:
> There is a spelling mistake in a dev_error message. Fix it.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
>   drivers/gpu/drm/msm/msm_mdss.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry


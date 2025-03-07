Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DC55A55F04
	for <lists+freedreno@lfdr.de>; Fri,  7 Mar 2025 04:54:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B5E810EA8B;
	Fri,  7 Mar 2025 03:54:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ADN4WTb4";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86DC410EA55
 for <freedreno@lists.freedesktop.org>; Fri,  7 Mar 2025 03:54:31 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-5439a6179a7so1417864e87.1
 for <freedreno@lists.freedesktop.org>; Thu, 06 Mar 2025 19:54:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741319670; x=1741924470; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=m+OWx/yorY2+66tlAZHZ/irBDPLHhMdijI7doxLhFUI=;
 b=ADN4WTb4buD1/9aD6jPiMqhokkb1QNa0ihNM6uqbxN8oMwvl8p9h/zBVTlflbEqJSS
 V7RJzEmcXPS9mTYr6PC6nmcwOW/lhHVmWk5+s6f3aMus5shfhqDIHNzc/Y5auJR1sOeu
 LwkxOWb766kEVSbdsPFNm4gEq1JHhxY3MssWqyc/2Yhcgc6kLH2enVyWo5KCbcUG6fhC
 LFB0mWPJpGsiOgLr5RFqGTRSHVFuT2R9zfLgr+PWt4OAIMurOxgrufQOM2MBJ3zp8Iue
 ZyTpKkaptIf9Q4GyzmWZGdvJiR9J/qPGVGxbVL3TuPbLWgJ0hoK4ryte+mL4zCDwfWD9
 tomw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741319670; x=1741924470;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=m+OWx/yorY2+66tlAZHZ/irBDPLHhMdijI7doxLhFUI=;
 b=tJ/jOiQdW2V7FNYKOeao7VYqE2cyVGBqPUxyWYVik8Zq0m0T7skRUKfVQT19j0TbdB
 eOeHmssuqQgcDHCXvGTZVK6nWeN0KfTw3DQH1ZH1hPJJrpuZ1ZxRtfympCoHrNC/wPTU
 ZO1zIcpjHJbvcOPuyCqNwe1MKH1utG2Q8MTj7k4d2TccGkk3qc6UVex8sSKo4VIsXTj8
 e+Sfuqie8oZUoGimtbhVU4UHgOu3IT+RMfGrVxKiHvdkA6pK88WR63LytZL/6JHA6nki
 2euGw08i5zzCexo76F5D/oYM8rnxwBptZABSKYpMIb+kXPVGyqlR+5urmZjvDKd/oWSK
 Hhpg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWYcLxcRli8Ijf3C3NH8b1vKibtAtIhkdpjDQO0AIKOYXVEtG8tWjdflft2HF2kkGVDVEKNsHHmgas=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywa3qBy7t30I7w4maC5BxkDBJFMJEUkJgTQy1a7+jVWJBrDuY0G
 1EZfrUWwTUzAeFMxgtY8OagLkPHReH7teX4GXpC9Ep1HV8kRfacS7BJHQDNwYaY=
X-Gm-Gg: ASbGncuIXQxLEy6S9R+LkSdVJ+b/GpQ0v5tVKZhVq7wFx7M65zYC5Y/vh4TxTKVEYeL
 WK8d+OUsYI/ZvoLh8fcWGfXDpTmfvSB0r33LzF8cQAaZDRKbZrPAc5OHmuZp5tnzjv+gNqeUh2e
 Fs0JILUIDetPcSg6UBLwrHcxQBRDDeLuOX6A3q9v1RJqucGNKt5wpPkCVjiqNBE7fzMnT4+mXgM
 XAedpTFO+qqaMz89XfOq49ppbw0pRrzJ730K4/DNf+z7+VWjiwLYpt9u9NCYPm6Cd+czqapHyLO
 Fm7kzhAg9jOu6EVaKlNyPmCJ0igYvCwbnODOxHUuXZqHbBMuSzWFnnnJIkTB+L7jis6wBEidQRL
 W/BzG6t8AqqczH6UNSecozSs8
X-Google-Smtp-Source: AGHT+IEJgFAZPzs4rQ+GVKleLSPBx3Zx5gP9AGl5+VtS3eJ/TazNnZBeAYAWo60NeSqqg8te1ly9lQ==
X-Received: by 2002:a05:6512:ac8:b0:549:8999:8bc6 with SMTP id
 2adb3069b0e04-549903f6a22mr675684e87.6.1741319669653; 
 Thu, 06 Mar 2025 19:54:29 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5498ae4623asm358766e87.49.2025.03.06.19.54.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Mar 2025 19:54:29 -0800 (PST)
Date: Fri, 7 Mar 2025 05:54:26 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Cc: robdclark@gmail.com, quic_abhinavk@quicinc.com, sean@poorly.run, 
 marijn.suijten@somainline.org, airlied@gmail.com, simona@ffwll.ch, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Abaci Robot <abaci@linux.alibaba.com>
Subject: Re: [PATCH -next] drm/msm/dpu: Remove duplicate dpu_hw_cwb.h header
Message-ID: <wnqsl5clvbk3gdqlvnomsmif2zuzeuxzhmirz6wexr4ifn2e6k@yxd5fhty3vkc>
References: <20250307015030.86282-1-jiapeng.chong@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250307015030.86282-1-jiapeng.chong@linux.alibaba.com>
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

On Fri, Mar 07, 2025 at 09:50:30AM +0800, Jiapeng Chong wrote:
> ./drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c: dpu_hw_cwb.h is included more than once.
> 
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=19239
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 1 -
>  1 file changed, 1 deletion(-)
> 

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/r/202503070155.TuUngwD3-lkp@intel.com/


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

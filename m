Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69542BA28DE
	for <lists+freedreno@lfdr.de>; Fri, 26 Sep 2025 08:43:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 319A910E334;
	Fri, 26 Sep 2025 06:43:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="MuxhxgYl";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9286B10E334
 for <freedreno@lists.freedesktop.org>; Fri, 26 Sep 2025 06:42:59 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-46e317bc647so11818915e9.2
 for <freedreno@lists.freedesktop.org>; Thu, 25 Sep 2025 23:42:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758868978; x=1759473778; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=/hPWagNOQmEjTvnm5Z1LNkDjaoDSty3o7kgmSw7FvY0=;
 b=MuxhxgYlu3Y0rLiyq/DRdPG4R6SSGY4Ch8MeCe0Tr9+lHCcJqoWcfIrEmGpNYDh/VF
 6YWg5ifOAHvN8iX22yseRmdZH7cmVHIqFb0POmIX9HqeoTssnV4a4MgzaESKBprEaRrx
 l2zyFIX8BXa/1qn8OmSaw0LKaZPULsNEyr9GQUorZ+ZnnAc6MMog99wGF0CjY2JqHaMH
 q5Zuuww6YwqnDHY9IM/fysPmzqsOBEQJxkweG1e/w1ZcMwg5TEsd3XiMD3iLmf8f9z3M
 zNyvpTgA0WlPQGIWANlScT4Zw7x0laDn2NSf8ylyST+J9H3kdD1Afhpfe2an+L5tWPGN
 fqAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758868978; x=1759473778;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/hPWagNOQmEjTvnm5Z1LNkDjaoDSty3o7kgmSw7FvY0=;
 b=egiZSIwtQtoh2VoQ9/OTAEnDMHuOTCoM2Ct8eP9LQtPDIwC+An//lQ0IMxDYdmrFJk
 jAn2ivgnAhsZdXDpJRiqI6CNpATGWrrLW6JJ2cAurBEe9igvNwmUb8uqMfswFLe/gVPh
 WDLfl4erXEh76kxhQ4OHzulL1PmbRzFgNeBjq7rROh4HqHb9d4i7eqY76KWgKTz3b8Oy
 mFqf4NAsXmzZC+cBbWaGYEBfidTpS5ccYlXS+VfITUkUb95juZWh8TrFHjcvzW8urDYC
 tYsiw89+r6WbMw5xnnBnM/mtx+Vq/oRR49ffM6v1WI50HhCNqVV6ZxfpBZaKHS9vq6UM
 x5RQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVd3xETI5FpMqCcJhjUP7AHTnjo90PP/zd/fqr+R6LGRC+olAL1Cp7XZo4DJXQytBXlGwHXZqTYnvk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzgfdmQ0ERHm5odkYc8fFB4+fxUzT1ncnpBCNR+CWG0KJUTe4oZ
 q0QBFO5/aoznzTHLkvLwVOQdrANXuXBthJVBbdYd6Pby+sNl7lQE651O4t3T4tFIyPg=
X-Gm-Gg: ASbGncsUBZ2tRioYOfj48SODM/oWAdx+Tizc7CVaFmdCu+PyR2ieYMsWQIu9FPnx+AY
 gfPut1kIwxp9wxcy8I9mt6jNRTs26y//w+FhDFeXDKRpMRimBwk4FAY7D4dsiuLIYo9jbC1niA4
 9zrCMdDaB8Vz61mKaQs3o8CyYgTxHkSproT8Vfa/SdzfM+Wl+cqYxL44xYWxE4hOfAvKF0ljJ02
 HnuVYtO0ILS0AAwslNp8s6wASZRHtRghREF5u9HMU8WxsqLrd9birXICaEh+07qDtayLIbfvV2+
 cLl93dAWzpcn8THN8pbEo6yVGMkcaZhDWD3gv/96ZVwua0isu7vyeOxU2LYD22nPWY5cCiBNoy2
 Zenhqz9llGkuDkMNfiDxuxvL3kTK/IkqX
X-Google-Smtp-Source: AGHT+IE4RNDa+SBbyedMcpjrMBUEZfbXwj+HO0zplrjXyPKT4StsRppVNBzD/YjIofvWgF+YJsMPMg==
X-Received: by 2002:a05:600c:5297:b0:465:a51d:ab with SMTP id
 5b1f17b1804b1-46e329bbf5amr63328455e9.15.1758868977931; 
 Thu, 25 Sep 2025 23:42:57 -0700 (PDT)
Received: from linaro.org ([86.121.170.238]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e332070e5sm30629935e9.8.2025.09.25.23.42.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Sep 2025 23:42:57 -0700 (PDT)
Date: Fri, 26 Sep 2025 09:42:55 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/msm/dpu: Fix adjusted mode clock check for 3d merge
Message-ID: <co66vf57i4od7bpd4gwv5ztonjecvpp4nzkrvjjuwkwvp3xkar@3zatxwnwpzp5>
References: <20250923-modeclk-fix-v2-1-01fcd0b2465a@oss.qualcomm.com>
 <krinjfouhgak2fvrv4runtv4kbocvfjpwxq6y53no3ajo3ykih@ooucnj5peu7j>
 <g7kqqed625hlz7yq5uwxyimfupxryr2et5jxsrmgw7jk5x5zg7@zdrgqf63n4w5>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <g7kqqed625hlz7yq5uwxyimfupxryr2et5jxsrmgw7jk5x5zg7@zdrgqf63n4w5>
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

On 25-09-26 01:22:07, Dmitry Baryshkov wrote:
> On Thu, Sep 25, 2025 at 09:51:28AM +0300, Abel Vesa wrote:
> > On 25-09-23 16:03:50, Jessica Zhang wrote:
> > > Since 3D merge allows for larger modes to be supported across 2 layer
> > > mixers, filter modes based on adjusted mode clock / 2 when 3d merge is
> > > supported.
> > > 
> > > Reported-by: Abel Vesa <abel.vesa@linaro.org>
> > > Fixes: 62b7d6835288 ("drm/msm/dpu: Filter modes based on adjusted mode clock")
> > > Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> > 
> > Reviewed-by: Abel Vesa <abel.vesa@linaro.org>
> 
> Is it also a T-B? ;-)

It will be, by the end of the day. 

Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D66A4A55F1B
	for <lists+freedreno@lfdr.de>; Fri,  7 Mar 2025 05:03:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4C9F10E0AE;
	Fri,  7 Mar 2025 04:03:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="MLIEU11n";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEE2F10E0AE
 for <freedreno@lists.freedesktop.org>; Fri,  7 Mar 2025 04:03:54 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-549662705ffso1560200e87.0
 for <freedreno@lists.freedesktop.org>; Thu, 06 Mar 2025 20:03:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741320233; x=1741925033; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=q559lQVO0eqbcaMdE1cepZ7h+gw822oPb1VcWyT+D3k=;
 b=MLIEU11nm5nI3TEFAQISTqIMgYVNgfypWA3vzqnwxfSGYxd+Bjrmw8Jr7ixq9wYRvw
 7pgCmLaLOtemCdN+sMnlp3U4xxD1cW3FaCGD2SXCozBMFdgf6mPdU3yrxP0mbocfDlO/
 ledzbqlvGQAz5bpK6jawcOMIro212XxKIqfOOnbA2vsrIHAbeQLLNPY+rhOKaOMQZPab
 6Y/PLrcjTWlc8chibAw0VenZ+9MBBtS3QemZdtx0wmbhR+PH0M1Er3szB99a62sI6jC0
 Oy49R6gkXBbtqQnzEHbKyz3NTihEo9tnLUYGs66u7Fe/Z3lhiU4bvn5p5Uear95AqBJ/
 xlkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741320233; x=1741925033;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=q559lQVO0eqbcaMdE1cepZ7h+gw822oPb1VcWyT+D3k=;
 b=PvxBGoMom+LunQY5CebzjeaFTnrYa+HoyEC5OekRZL/NIo/KROUGWYX3bD/cJvlFf/
 Io4DkRLJ7YtZtmN/+dsUQdVW5ICknvyUPy50FH8qWO39q+wYXv7U7kxcOoUMp6rhwJqc
 we45s2602SRRfyKutqXM2ceupKwr+A6p6UFB+X4vlOpIgQ5qvyt5BZb1rAjId3oRQyL/
 IsW7Yu0barVDsdDWITKKfp8GOCBDGZjJVh+kimT3ToWZjs6vCtiV6SRG6UCVifP0L9rP
 u6VKtyDr0Q5hydsaSFtZV5X9stuTqjXugCQqklo/7XHoEnWOwPNXEKYTvKOAH5m3zKm7
 5K2Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVPrBzrO52MdnsPMZ4feBNrYtzs2QzCNcr5d8r7C70XPSIn3DNB0vAufx45thC2BYOdtUmGh7px5tc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzFbvM864fbGeMH7j//V02U50nqLP8HqTeEgc2xg7Vb9w8anNgJ
 U5eRSLtif9WkyNCaB8CbEo06UGom8E+a3lH0y9+P+EPvDJcmYxqwmt4qDFYQ15g=
X-Gm-Gg: ASbGnctYI0WGuXWpZnRLFS6ylHgWGJFN7Z0rI2X2f1Q3MX7/aXdkl4mYZ8PqQ3nppIY
 6X9vvqwv3Nj5KujSEdV98IHZ9kS/3+iAIQFWPINWzCrEhM3IcR0uEbzYNUEGIz/bnATV6eciOmK
 nnSqCTdNCmdMwB4/QABY9552DLefeYdyV6DOWEslEoFAK+kNpmZzwYOem3IycjkFECltszJuadv
 ccd3v+QtZJKSs1tp4jv2x89j7lwD+Gd3JNnweGSjp1EPnlNXE6pdUV3KlWXylM0p9dQFcqPbZzQ
 JY/lG0jgupRrTEEcELJz2TALGJOfdOUzskkSlTyx6faVt5q6DWbPS4nqkzJO/bez35UgtSZBzW0
 PPCCm6KJPVc0lV3iVJ7eECQMp
X-Google-Smtp-Source: AGHT+IFkU/H2JgQ+KzgwwZXcDnVmGrvz6WNb4Dvni6Bmcn4jgovRKWXORNDJCk42rS/+awsQtmG+NA==
X-Received: by 2002:a05:6512:3b14:b0:545:2c2c:5802 with SMTP id
 2adb3069b0e04-54990ec1da0mr569205e87.48.1741320233311; 
 Thu, 06 Mar 2025 20:03:53 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5498ae461edsm362946e87.38.2025.03.06.20.03.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Mar 2025 20:03:52 -0800 (PST)
Date: Fri, 7 Mar 2025 06:03:49 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Cc: robdclark@gmail.com, quic_abhinavk@quicinc.com, sean@poorly.run, 
 marijn.suijten@somainline.org, airlied@gmail.com, simona@ffwll.ch, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Abaci Robot <abaci@linux.alibaba.com>
Subject: Re: [PATCH -next] drm/msm/dpu: Remove duplicate dpu_hw_cwb.h header
Message-ID: <gs6zemh276kxuphyedsv445ujroazok6jq66mdljkrkd2f5fzf@zjumlvcebaix>
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

Also

Fixes: dd331404ac7c ("drm/msm/dpu: Configure CWB in writeback encoder")


-- 
With best wishes
Dmitry

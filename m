Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93680BFB773
	for <lists+freedreno@lfdr.de>; Wed, 22 Oct 2025 12:51:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D77E10E088;
	Wed, 22 Oct 2025 10:51:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="XsI1NHz7";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C54310E088
 for <freedreno@lists.freedesktop.org>; Wed, 22 Oct 2025 10:51:55 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-47112a73785so51071665e9.3
 for <freedreno@lists.freedesktop.org>; Wed, 22 Oct 2025 03:51:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761130314; x=1761735114; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=wj0NZFWJVRGALI2+fvxHBDNu33Sev5bvshrkRXRWHmY=;
 b=XsI1NHz70GANzW2HEftzbXwL1LQHbJC5FJUpU9bMxDLRfGZt7dHVxm3iAMO7eKP7Jp
 F2jsDuXNHUMIDxQKcgEQ6s1E5QCP5EF8xrIeLxq/t7f89kg49IrCAw9VeHHpnLd4bHyk
 0Ixj+CGOJ+LTRqszLPdM/+aOt0Z2RSqonNTvLzafmV+lbv/8ehgfC2DBMUq/porvIqUi
 fcvyYAw1hY1PNDfy0NxCfT3y1cm0hy5/H/7ipdtXeAg7gGe2cLDgHhdGVbmOP3t7sr3P
 O9monoXevAx/b01L9NC8zqfRhkNoby9k+DS4yT9uwAJnrkrfscOV/h5kIfEvo25gAFiq
 fzOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761130314; x=1761735114;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wj0NZFWJVRGALI2+fvxHBDNu33Sev5bvshrkRXRWHmY=;
 b=eyuUuuizFoHrBJ2UGCV8rZF/S0m56NKINY1Ssj81QaJndditnl5Q40tAtmcn4aVHJE
 84Gu9ptiwojY2yNmUDtym7q5bNBiD/W25QFgj4ws+LwUAYtL9diXI8bw1PX3k2qUhtXY
 WS3TA1/p7kqxcYyxMpC4GZKjknFzGYASdWbZh3ibKIocGQSIMsrLIAHkpOCg7R5YuMOQ
 p3EKapCR1uMKud51KYA5TZId/02Kk93XRjt+1yjskkn8Xg8y9kfcEi6FMoESvyepqaBa
 3eLYQfUUC2TpkdKYWktQmwlwWnc0xNn+5cW9FMZmEep3xpnbJctlmwc7SxLojJ7EfukL
 CiHQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUTQAyIqpBqwLGKIQncOBFPRd6CTkVMV6ftf+3yRw+k0zgym5TOLUW1GIzk5zVaakw8G38KI5HVo3s=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyyYo7oUCls5eHWaqZhXfolFoVYXY48LtCfPB6fQ8/6LL2gEcma
 j85go3fupjJ2iITSM+isjkWXpX8Vq05ZfMB/LoNovHEjeqaNsgz1KK5jljN1/srKpow=
X-Gm-Gg: ASbGnctOrS9FzlFpUmZzsRDrHxyttyxHlrNxCoq+ToG7XxYBcQ8wDK02L4ipJE6AZjd
 rBWIUb2cGLBKkEvjCBKodTyj3IMPZI/Ad1ODFqM3iSfb8im5+Hk05Ab0kIWpEfrupcoeaHxywnC
 iOQCMYw+il2mZzO0uZO39Mz2i7kXf1bE2uEfGRNhiY08mWikQUuIB5YlCKVBlAoUmd4Cb38AbFG
 U6tpwFKE5Xo2+Sk4QlniZxzXwrZ8p6auB4F11doHeXYBASVKEZGWfWHyw5rqFUzGPoE0e9y7AyO
 croKdoqHQzjmilTTva6A4ORJC37lh/vf35k3Zh7vMSBR82a8MS7/6BUKtBK3yFCWRTfdx0nZKv7
 fH3NO1M0ep9q7bDgIEjAjmiC05kRW7L9/0fJvVeX+MYhNcn8ebHP0BYjt9qYhUKJVxoErl/4C
X-Google-Smtp-Source: AGHT+IFqoTQ2HPqFhE+xoTH5Tzl+i0vK7I5FUuawS0A8siSroPNadoWtujMORQ1HXcf2sw7QAqJLcA==
X-Received: by 2002:a05:600c:548a:b0:46f:b42e:edce with SMTP id
 5b1f17b1804b1-47117925db7mr136759365e9.39.1761130313599; 
 Wed, 22 Oct 2025 03:51:53 -0700 (PDT)
Received: from linaro.org ([86.121.7.169]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-475c4342373sm43403635e9.12.2025.10.22.03.51.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Oct 2025 03:51:52 -0700 (PDT)
Date: Wed, 22 Oct 2025 13:51:50 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/7] drm/msm: Add display support for Glymur platform
Message-ID: <d6ivp57mh77gxybjvvwpmqoc5fsy52yydtvs23bepwdxgkxhzj@ahryeick6yaw>
References: <20251014-glymur-display-v2-0-ff935e2f88c5@linaro.org>
 <20251020-astonishing-zebra-of-respect-1c2eca@kuoka>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251020-astonishing-zebra-of-respect-1c2eca@kuoka>
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

On 25-10-20 12:40:24, Krzysztof Kozlowski wrote:
> On Tue, Oct 14, 2025 at 03:38:25PM +0300, Abel Vesa wrote:
> > The Glymur MDSS is based on the one found in SM8750, with 2 minor number
> > version bump. Differences are mostly in the DPU IP blocks numbers.
> > 
> > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > ---
> > Changes in v2:
> >  - Picked-up Krzysztof's and Dmitry's R-b tags.
> >  - Fixed the bindings check reported by Rob.
> >  - Fixed indentation reported by Krzysztof.
> >  - Re-worded the commits to better explain the incompatibility
> >    with previous platforms.
> >  - Add the UBWC config patch, as suggested by Dmitry.
> 
> Where are lore links? b4 provides them automatically.
> 

This patchset was enrolled with b4 due to logistical reasons
which lead to losing initial kernel tree.

I thought the b4 prep -e should be the one to use in this case,
but now I realized that has a different purpose. My bad.

Will make sure links are there in the next version.

Thanks for reviewing.

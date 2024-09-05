Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C913596D8D3
	for <lists+freedreno@lfdr.de>; Thu,  5 Sep 2024 14:40:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C2AF10E88A;
	Thu,  5 Sep 2024 12:40:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="nhVcv5ug";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com
 [209.85.128.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DFDF10E889
 for <freedreno@lists.freedesktop.org>; Thu,  5 Sep 2024 12:40:28 +0000 (UTC)
Received: by mail-yw1-f171.google.com with SMTP id
 00721157ae682-6d5893cd721so6369637b3.0
 for <freedreno@lists.freedesktop.org>; Thu, 05 Sep 2024 05:40:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725540027; x=1726144827; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=cAsWnhIXMINBCA2LD6vZLoTkLzPunHo5mBHMYdvy5yQ=;
 b=nhVcv5ughuNkDAPQOnDmixPZCMQ0qmCTw8MD/x+AZUPUsiIe73Fp1Qa2BPybssylN2
 QwwsJNh0b/5EKFw1UG2EVKG8MJZwjSBstGGFEjaI0wKtksUMzdddSly/Aw/srpWd+nbP
 6Y1rI8cVnLQwQHOKtIfdjA6FJTHiDZAe/oEolANoG23fEJqCcw2jMrIa56pgMhl5Upbi
 jDz+JPgB8kmTDNCmdNiPONUYitV6U7QkKy6a4myaCECl9r7wZFfs8oslIFFflw4dgezq
 iF7jkA+E4EPL61ObCa7pZiDTs/lJMSIrGejkyrO3T3G1T9R8BTYXweSwCsZLpvX460cb
 GGjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725540027; x=1726144827;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cAsWnhIXMINBCA2LD6vZLoTkLzPunHo5mBHMYdvy5yQ=;
 b=exeGmBud0n7Agml8lGhQHGjrm70t7DEtllgH905TtonOcZVuwIkJuC47Q3tmfzjrCe
 IoS4lvOzBsqnoNhQDBIPPGpfU61FSBVMaelmnrnFTDybRoUuRMPi3LHatqLExLAAhTRs
 oW+q1ySbMhbA9hm+MSb0PBzGBikX42zZ8wLYjtYTeqtbQQXmJw0K7F2mdAydELAj8uVJ
 mF0+xbNnJdYsIXq7hu7NVfmRCnixcBuhGm5Fr2uwUf438OEnM4eclem/BwInYJcvJlZV
 bMcUVG3o7/93MU04dN+4/lvVn3RFc7NnxnIfLjJPXDZ3XJfijh+JXleZ/j3RvQd/tEQ6
 qlHw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUBcNgA6uXwDAodUNfitQaM7olSPtyKgf3HpXU487J0yAFO11jIaaQL6h/5CiQTVP2uIYUWWOjMCeM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzV6u5c1RPGw+taNd0kWY71CNNJysloGdh3InO807WE9Pq9xF6g
 hi0AtTqhovaHGWBxBNL5AU9BW0rcu8krpHUEfy5zGy95++VmMpKoNynvKRGg5ErD0bRaGfl6fQe
 MbhS0b5Xdcp7crYppksjs0AfOW7q1uuEBLghPSA==
X-Google-Smtp-Source: AGHT+IFIWLL0YlxXEHzETETRS/4fXk/TAU6J/4Fvm95WECnhr++irvMb/d6wkqFe1PbO8tUu5xvRXYLr+luqmfEBPLA=
X-Received: by 2002:a05:690c:6481:b0:6d5:7b2f:60a0 with SMTP id
 00721157ae682-6d57b2f64f8mr207770997b3.34.1725540026953; Thu, 05 Sep 2024
 05:40:26 -0700 (PDT)
MIME-Version: 1.0
References: <20240905-fix-dsc-helpers-v1-0-3ae4b5900f89@linaro.org>
 <172552245933.2905944.14392896379200688443.b4-ty@kernel.org>
In-Reply-To: <172552245933.2905944.14392896379200688443.b4-ty@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 5 Sep 2024 15:40:15 +0300
Message-ID: <CAA8EJprBwTH8R9-b68g-U6yA-FN6z_pt4YComNCj-xvXwvzcCA@mail.gmail.com>
Subject: Re: [PATCH 0/2] drm: add two missing DRM_DISPLAY_DSC_HELPER selects
To: Maxime Ripard <mripard@kernel.org>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, 
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, intel-xe@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
 kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
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

On Thu, 5 Sept 2024 at 10:48, Maxime Ripard <mripard@kernel.org> wrote:
>
> On Thu, 05 Sep 2024 06:08:20 +0300, Dmitry Baryshkov wrote:
> > Add two selects for DRM_DISPLAY_DSC_HELPER which got missed in the
> > original commit ca097d4d94d8 ("drm/display: split DSC helpers from DP
> > helpers") and were later reported by LKP.
> >
> >
>
> Applied to misc/kernel.git (drm-misc-next).

Thanks!


-- 
With best wishes
Dmitry

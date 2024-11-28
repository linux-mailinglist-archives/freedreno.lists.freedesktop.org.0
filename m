Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 407699DB8AD
	for <lists+freedreno@lfdr.de>; Thu, 28 Nov 2024 14:30:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DF3D10E26D;
	Thu, 28 Nov 2024 13:30:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="LfZh7tK4";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BCE710E26F
 for <freedreno@lists.freedesktop.org>; Thu, 28 Nov 2024 13:30:16 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-53df1d1b726so949771e87.0
 for <freedreno@lists.freedesktop.org>; Thu, 28 Nov 2024 05:30:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732800614; x=1733405414; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=yCjaLIoqKd3bBOokmeosaZwBTg8Xdv4t4ZzkEjKsEdE=;
 b=LfZh7tK4aqIOojmhtZd++ImVWw1VQ81zEIdKl5zDZkcl6NYJemDjtSTwtDwAh7JK1B
 1dz8QIntbNYmu1f/sA8KXmGqsT9mhiplEAKHDelecRnRtMQ8ST+Qcf0AfYGt3UuB1q6h
 rMpRE02r3SlGEYjP0jlMHqb/leyjhl9AQeA3rUlelp61hqEZiL/rbVUjnQGgQXFoBgUw
 nMmj56qjvmI/hwikbB/gwaws1bnzu841TJWMkaxpWwIWkkhOw5W3W7J2l8OLFkBdEUO1
 W6Qh1yEDmigu+cPT0N0TGP6EU6PAvBYc5JifZXZgF1cF9MTvrtBeSYyHGVskWF2E/YHP
 qYhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732800614; x=1733405414;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yCjaLIoqKd3bBOokmeosaZwBTg8Xdv4t4ZzkEjKsEdE=;
 b=j8YnjUeJIVYzfNfJ3wSTpXArtTGAm92yOg6+V6QfaAZUtzd8YlBCvsEhCHgwTcwesw
 dtYQrsNiMjPXl1unQfA7HycsCb7wnhGuvq7m/7BNC/oCyG9LHVBIawv4NnkpAmo+dRvo
 ZxQqE6nLmptYypp6DAOsb/ZrswbvyhG/EYZ4hJ2ZlWq8/CcIURU/aFY8uxXuhwiBABYT
 vDzCC7QLF06s/V/Q7kA7rNd8/coR6tM9TMeExm7ChrxQRE57EY/A+MzOOSyQaMXLs4jd
 79qUMnhs6Ty/uKRqrwt2hfFm6JkcLsj/Q75ERy8oYyUIfkG1Fdt9kU1MR0stnrBV9Bke
 Um7A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVrYfh3WDk23rHKj57lpJkpRO0CLxn62/Fnkl76dfCUSx6JUcxA6PiU7SRwXNwUl2sF+xcIaO1eIbI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxxfuxbP06laS6ZXtgRU3RTakVgf1E35kmHUanTbw9TW4J995lN
 0IYuZM2Gg3WPFSm0DKgsbvE8OggivTUoBivnLeAc1dmsxNu6hlpPVke+2LQgXjg=
X-Gm-Gg: ASbGncsy2FCMo37dNpXWM+/w+1YMOIwJiWz2dL2fKpO7qlEFgBZOlIQN4NV5n4ean+i
 sSuojjvEZomNIBYwFUG0McTXReMLSfVR6Ano2b7703qYKpyXAFA7B/uGpUzUH76UOJ3qixXTVNz
 5ObG+okNZvsoJ5yVVsr4evONrv4aDGSjs/CncQFrfy7057BIex36QzdxYFMvB9/IqMSVAkFPBJO
 314FeQuoHJOGa4AWbBzM7LJgKFe3bDlS5fCv6xcTEvevOdm8dNEoMabGxrULWCHHDLFXmf1fqGc
 Nvsw1im5ZhKLCk8Dqd/4VEF1hDPpuQ==
X-Google-Smtp-Source: AGHT+IExPmce5P4ZT632z2IC0da+T/+lWJvFnMY6sShZcO7cz0kH9x97oQAlFQTrdXw86Rylra8OBQ==
X-Received: by 2002:a05:6512:238a:b0:53d:cb7e:2251 with SMTP id
 2adb3069b0e04-53df010471fmr3419369e87.36.1732800614564; 
 Thu, 28 Nov 2024 05:30:14 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53df64310d2sm178615e87.48.2024.11.28.05.30.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Nov 2024 05:30:13 -0800 (PST)
Date: Thu, 28 Nov 2024 15:30:10 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Bjorn Andersson <andersson@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Akhil P Oommen <quic_akhilpo@quicinc.com>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 5/7] drm/msm: adreno: enable GMU bandwidth for A740
 and A750
Message-ID: <lseuso7qmbgtt36jrpzipip2e5m6r4wbi4ixxss5mi6ssi3thx@dzt5tlsjbyu7>
References: <20241128-topic-sm8x50-gpu-bw-vote-v3-0-81d60c10fb73@linaro.org>
 <20241128-topic-sm8x50-gpu-bw-vote-v3-5-81d60c10fb73@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241128-topic-sm8x50-gpu-bw-vote-v3-5-81d60c10fb73@linaro.org>
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

On Thu, Nov 28, 2024 at 11:25:45AM +0100, Neil Armstrong wrote:
> Now all the DDR bandwidth voting via the GPU Management Unit (GMU)
> is in place, declare the Bus Control Modules (BCMs) and the
> corresponding parameters in the GPU info struct and add the
> GMU_BW_VOTE feature bit to enable it.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

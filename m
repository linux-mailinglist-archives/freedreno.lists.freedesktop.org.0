Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D14229D5CF9
	for <lists+freedreno@lfdr.de>; Fri, 22 Nov 2024 11:08:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE00510EB3D;
	Fri, 22 Nov 2024 10:08:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="eIh8980B";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com
 [209.85.208.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0389510EB3E
 for <freedreno@lists.freedesktop.org>; Fri, 22 Nov 2024 10:08:55 +0000 (UTC)
Received: by mail-lj1-f179.google.com with SMTP id
 38308e7fff4ca-2ffa12ad18cso17812561fa.2
 for <freedreno@lists.freedesktop.org>; Fri, 22 Nov 2024 02:08:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732270134; x=1732874934; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ozG0xW+TN6Pi4dywPncHsCDjL+EQbVR/bZYS04g6N7o=;
 b=eIh8980B1+BVXvv8iwvwju/mifvGeiujgZv+tB3HF7YQF91IbZjp9bmazz26RnJHMV
 NhmB9GS2se7bl5ruJQbSPF+k2J8E6LYrJPSladYQETqp2aex5Z18X/Ju+gEcJdcwMNp0
 lrRSAquhNCQGOJQ5lD2tAi2/M1969An/VRcByBYUCL9km5ZamsNxxqgoXd3sZi3uJuKy
 s+u9xXIc44J3CJ815vNIKLA0xo48Pvu2DKnQ5ZfXGhdzv/KslOWKIEqtgwsX3lMUbzPQ
 NEwXkzdiF0cbCPl6MhU6GaYLERCNo1nRxDgs6VMoEeFIKh3wcOtBXffmCCSLGx3VYOVp
 WD2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732270134; x=1732874934;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ozG0xW+TN6Pi4dywPncHsCDjL+EQbVR/bZYS04g6N7o=;
 b=acxsLBShr9A3cCOTNj+uLDZx8PD02NntgB9HeTRu+wNhCxWZ3a3qUYnf95lVYaVnJd
 oRxxo4ryqx1CQJbgZKG2C3cp9k/Z9twzJLI9ZXmCCm/dXpmjURs0utxfpM8gKDKuj8bx
 SiLTQ7wS7IrWw2bpGXydX8ki6F7qaQVEzorsW8YZdrNNUSY8J6C1835JA8CU8wjdSa1G
 O/pqe8MmGmVoMfwtC+LdIBSxCOXuna9nxVEKTVItexYdCgym0wQXpiu/IuVhw6RG5SNg
 LOvb2HCU11qTmgEONuqxsOoPavbcl01ALcs9Lxl3sMgJ1G2/vm2wq+LWH3Ou/Aem6+fh
 Uz+Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXZV9GPRZ2xi67o0iHwc757IeWJBaj3+EDvG1eF756t9NuN2/rdQ56gZfDcUkxTakUwSpoGU4SOBVI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwigSPg8n7+0eGkWZ+36CA0vQ3GnSR9UuaECR9hI9MxQJ740ukD
 wU3mdxxuVeVICxpBqqOhzPV2eX7V02PK5+DrHfurXkhx9XjPRQPm6I72tnVCQM8=
X-Gm-Gg: ASbGncuswn3BFhGBkxujf3gLgUwKTmJUQlK3eoRvPmgd5gHjPkiffwN/Q448YxqRrap
 zHuGPIx9xznyQ5w+d/3yTV27+hFTQfV+YZ9pLJEbGubfTqUldG4cG+slhsX01cCII+9mC7O2PYg
 vJ/kjOtwcfMkuu9iDU4FY5wBmSIbeB76pfyfxHCFjkClWxZn8f66X/OElVXlZ3iJY+oqRYeNxFS
 npxbdCJmPluGGBAvOSVkH1mlFZFWuEOWUlwL8jXcPv/Ie/see/UdEXLSu0dF3VlmB6xXNMt+Mdm
 EkbfJaYZCmrfWu0FC4Py5Mk25+TaHw==
X-Google-Smtp-Source: AGHT+IF1XEF/8Gyn2P+dzKuFrYGukbKDM9XOQg3PsZRAmJKFMQcRvEJoruUPypP/45RqggGEEbK2gw==
X-Received: by 2002:a2e:80ce:0:b0:2ff:a8e9:a64a with SMTP id
 38308e7fff4ca-2ffa8e9a6e6mr6070311fa.6.1732270134081; 
 Fri, 22 Nov 2024 02:08:54 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ffa4d58592sm2762491fa.68.2024.11.22.02.08.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Nov 2024 02:08:53 -0800 (PST)
Date: Fri, 22 Nov 2024 12:08:51 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Fange Zhang <quic_fangez@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Li Liu <quic_lliu6@quicinc.com>, 
 Xiangxu Yin <quic_xiangxuy@quicinc.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 6/9] drm/msm/dsi: Add dsi phy support for SM6150
Message-ID: <nwgfas7oxaumusdeoaheph6rj535szahfkfnbmv55y3nhhmf5p@3gg3ddjgaysr>
References: <20241122-add-display-support-for-qcs615-platform-v3-0-35252e3a51fe@quicinc.com>
 <20241122-add-display-support-for-qcs615-platform-v3-6-35252e3a51fe@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241122-add-display-support-for-qcs615-platform-v3-6-35252e3a51fe@quicinc.com>
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

On Fri, Nov 22, 2024 at 05:56:49PM +0800, Fange Zhang wrote:
> From: Li Liu <quic_lliu6@quicinc.com>
> 
> Add phy configuration for SM6150
> 
> Signed-off-by: Li Liu <quic_lliu6@quicinc.com>
> Signed-off-by: Fange Zhang <quic_fangez@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.c      |  2 ++
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.h      |  1 +
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c | 21 +++++++++++++++++++++
>  3 files changed, 24 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

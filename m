Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DAB0AA47492
	for <lists+freedreno@lfdr.de>; Thu, 27 Feb 2025 05:37:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B731B10EA2B;
	Thu, 27 Feb 2025 04:37:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ThkD3SFC";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BEDC10EA2C
 for <freedreno@lists.freedesktop.org>; Thu, 27 Feb 2025 04:37:45 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-54529e15643so1499871e87.1
 for <freedreno@lists.freedesktop.org>; Wed, 26 Feb 2025 20:37:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740631064; x=1741235864; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GYRdSFJ0y3J8w0/MIT9m/pNCngOvo9+w+cz68lIRPZQ=;
 b=ThkD3SFCW2anG7KXWamjpn8j531cN1eDsemSN/x0iXhdofkjFf0BdagfbZ6wXFfnaA
 ejzsYqblCurKp9A/dhP4SZMmwpnntpwC+fVUvrwekDNoNjSep+/hdAY3rneFCRdFyAub
 LdRz/apCrRql07buCbz9FxDBtiIU1I/gPtncZGTFAGSoVEuwCk4t/+/UInOfLdanVBWh
 pRiP+8nsj38m4F+zStutwibqqoQZ09tC5GLnlPzE68zmm93DXTcTkh7ye3Mb7i1zc7Fx
 Ow4rmgwem1jk9OvXF9nTn6bSTfZS/miG1XhAyjOTt0a9OwpBSqXRQ8J/XtxCgCnvQWAQ
 9adw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740631064; x=1741235864;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GYRdSFJ0y3J8w0/MIT9m/pNCngOvo9+w+cz68lIRPZQ=;
 b=iLNSWQwVRSIzdeN08Pu2jlgIIUM41a2RMZkynAV+0zRZLujWjYDPTxzuHfdZUys5rg
 3iBAhowz+jxNhcWtXV2Sc/ti4a9aojPKw8A39OuFfgrmhLxkhuRSwZogsF8TwGX2WeYp
 4e5+oj7FLNfmNepgaIBxEJUx9sA8PP9dAhWyFRI/HcUTbpkpWB1MyWe6RXkBvKS7uR8k
 w5dl4zIkx2Hmlld8/U77DDF+RgOMyYJaOcFhCCgUDS2wrMNiRF5l9smsRNAWCaDz5TeJ
 pWtwszWcjndcQ6BEbiOrQwW7jVeM/tfSvX6NNEcXbzl6SS7QdxVPdD4DgbvINZmhgL/s
 mIgg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUBIfurYm/7QRh8DBad5uLCEaXtxM5K7zESwtD0Z91e311dKEFOuIEASSoANQ4hKzhI9TR1PQugbus=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwCxs07rxlrAaR7+oT+gF60SNot91kmucoaSIsGr0XnvQjoaIbE
 97kAvOojOxwIKeXbOjyy3+TTc9q2TsAUzQ2cWZ+t99tw2hQWbJTCdhooeRfUDuA=
X-Gm-Gg: ASbGncvXYd7Fb6lJmjG5rbdlQntegSHKB8IkGkGP/ca/y6cIcA+oIpuvG32EcQ8mX2s
 ceEiyyHhg4XeniHBKnCbovOMtNOIPgSe0GRibGYAAr8spJRnuXpEPYT62z06t9D8c7lAh0B0zqd
 q9PIJ1KMQ6kvjlPGY61eijhE0XRPqtBcYk3u0/yvRcnlr0/smfoKxw8ihx/VHoJ+/YE15qiDuMN
 NVmkRB5WWjVcyrGjsBygx+0PkFUg5xowcgwbnuL4QfV+ckku4m2QhtLulH7oBGw12hs19rY1rGK
 ZhO2vkS4+wm7Y0kCWsZ1npgdRTBRCahdXrb71+DfCw==
X-Google-Smtp-Source: AGHT+IHInNYeeu7RJnY0u41TSawSb/sSqGvIZ8wxvnotJqXxQ14P4JT9/11iwOVMUCOL38JGxUNb9Q==
X-Received: by 2002:a05:6512:3054:b0:545:5d:a5c7 with SMTP id
 2adb3069b0e04-5494330bedcmr587647e87.21.1740631063830; 
 Wed, 26 Feb 2025 20:37:43 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.90])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-549443ccf45sm63485e87.229.2025.02.26.20.37.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Feb 2025 20:37:42 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: robdclark@gmail.com, quic_abhinavk@quicinc.com, sean@poorly.run,
 marijn.suijten@somainline.org, airlied@gmail.com, simona@ffwll.ch,
 jonathan@marek.ca, quic_jesszhan@quicinc.com, konradybcio@kernel.org,
 Haoxiang Li <haoxiang_li2024@163.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dsi: Add check for devm_kstrdup()
Date: Thu, 27 Feb 2025 06:37:24 +0200
Message-Id: <174063096227.3733075.13590017200932514746.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250219040712.2598161-1-haoxiang_li2024@163.com>
References: <20250219040712.2598161-1-haoxiang_li2024@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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


On Wed, 19 Feb 2025 12:07:12 +0800, Haoxiang Li wrote:
> Add check for the return value of devm_kstrdup() in
> dsi_host_parse_dt() to catch potential exception.
> 
> 

Applied, thanks!

[1/1] drm/msm/dsi: Add check for devm_kstrdup()
      https://gitlab.freedesktop.org/lumag/msm/-/commit/52b3f0e118b1

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

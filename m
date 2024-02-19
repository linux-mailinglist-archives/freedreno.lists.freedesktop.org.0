Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08B9685A34A
	for <lists+freedreno@lfdr.de>; Mon, 19 Feb 2024 13:31:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE39910E3B5;
	Mon, 19 Feb 2024 12:30:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="vRqbgX4M";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65E4310E3AB
 for <freedreno@lists.freedesktop.org>; Mon, 19 Feb 2024 12:30:53 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-5112bd13a4fso5678892e87.0
 for <freedreno@lists.freedesktop.org>; Mon, 19 Feb 2024 04:30:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708345851; x=1708950651; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kjMb4d1hbiL9rkEx3BrswRg3MQUneLIxmtF5Ztvz0jI=;
 b=vRqbgX4MY4PizADug5Zf5ddEAIwBFh1hRB65L4mO0d+p7+nlmuzkg/FOZJBHzF21RF
 Zmd/HKkzw5FeIrlv619iW3760kMQVEstn49rQuzYQQxgLqSB1nCpHYQN5jrcx/RNoK1p
 1uRHIUW+ja9j9XLd11R8FS/8UWJ1JZ6Mdo8ceTcj7pFdkaYQE0gSVIzQ13HZboD/KfrF
 0PNSVxR9KXkSdsS3gcAXW37+FbSaTQcGKJNVwoXZVynrxLRv4zMOtv+kJEjUCMt20EFd
 vhzC/Hpd2jaF6YP4ziLhg8g0PoYBvg86SMngWRmU5qbiMTQHkwiRA67Quv4FRLxqpBcc
 DKWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708345851; x=1708950651;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kjMb4d1hbiL9rkEx3BrswRg3MQUneLIxmtF5Ztvz0jI=;
 b=n9WkIpbKWMSDCgZg5pO6hhFaI9R2R19z0DHcGRqbMQXqRW5tm4X77RLUTniUh6u8j3
 uXbIRVmFp78fCE5uLV2RsbQ25WmD1umNJSlANd9/N5uq4aJveYnnbowcMCs/XiDpxeGk
 L3svx0DS5y/fwInIqo08zQPUnfmIJeerJ/l1FzSGt7W7exOXCYZ/X/nEq35yYgZCt0kj
 AnLgYNRKIsqBmE7h62fxSnEXPr0I107Fv+z4zAslnW11HVqX2aCrU9UDqukaaNLO9W3D
 L8OMlT8J9qh6i7tcFL64aIMKIywqCvHKFfzBHjuPU0YQUDG5WGbIBY4ifP4Ap1HAr/bE
 NMNQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW5CMhEe/uL515/ic+L8KCDtV5WhTR9mIWjQhFLzEXOR4l2S+WNUVx03qcwQPC22I1tPb23BvOtGPF6dkuQi1BFZiZuC1Nh0EINS+zAqjoo
X-Gm-Message-State: AOJu0Yz6lnAWHmDCZL/vhw6LbO0WAg87t0qhGR3uhWda5XhjwWswYcFD
 3NvDsgg9Iy2TvW5dSMWFOjy2fYZZQ+jqOoDqL9h6iU2fTmvvt7xRlxf5g0OlQLM=
X-Google-Smtp-Source: AGHT+IFsnM5T1SLVsoU88JG+DcwZETnLSFkjv32tNAhdISToncKjt/6wK4uHEKC7yxoH4WxJY1IvhQ==
X-Received: by 2002:a05:6512:b86:b0:512:b39b:9768 with SMTP id
 b6-20020a0565120b8600b00512b39b9768mr955071lfv.31.1708345851583; 
 Mon, 19 Feb 2024 04:30:51 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 i6-20020ac25226000000b00512bde4cddfsm90466lfl.148.2024.02.19.04.30.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Feb 2024 04:30:51 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dsi: Replace dsi_get_bpp() with mipi_dsi header
 function
Date: Mon, 19 Feb 2024 14:30:39 +0200
Message-Id: <170834569503.2610898.3555817415070936483.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240204-drm-msm-dsi-remove-open-coded-get-bpp-v1-1-c16212de7e86@somainline.org>
References: <20240204-drm-msm-dsi-remove-open-coded-get-bpp-v1-1-c16212de7e86@somainline.org>
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


On Sun, 04 Feb 2024 18:04:39 +0100, Marijn Suijten wrote:
> drm_mipi_dsi.h already provides a conversion function from MIPI_DSI_FMT_
> to bpp, named mipi_dsi_pixel_format_to_bpp().
> 
> 

Applied, thanks!

[1/1] drm/msm/dsi: Replace dsi_get_bpp() with mipi_dsi header function
      https://gitlab.freedesktop.org/lumag/msm/-/commit/99d519fed75b

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

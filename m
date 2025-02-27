Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DEC6A47496
	for <lists+freedreno@lfdr.de>; Thu, 27 Feb 2025 05:37:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA2DC10EA33;
	Thu, 27 Feb 2025 04:37:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="VSK5NKfj";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51B5410EA2C
 for <freedreno@lists.freedesktop.org>; Thu, 27 Feb 2025 04:37:50 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-5485646441cso497089e87.2
 for <freedreno@lists.freedesktop.org>; Wed, 26 Feb 2025 20:37:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740631069; x=1741235869; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=0yVVoncMUtyJrD71yPvbIabSZ+QZVXWPqdiViPaHHO8=;
 b=VSK5NKfj4TEupsJYu/pHxgkV4I5qxyAE1Sh5BXF65KWAc3LeRAX3J3jNebvXrIgnEL
 B8FnbbzI2vQ16KPhgJCsAMmazVF/3IbNUZRKfMGxilhY1t5wq1jEPldZzUhNKkCgQSt0
 kOhQYgFjyjBn0aerbvAN0iTtkS+Kq0TTSnAGEYUnYI1PBc5qDFKrEmwtXuEo9VDy4P6/
 8t81gOtqKr8L4YX+1H7PaWYSpnUV2Njes4bMQ79G8ctDkIJLCG9csflFFVGKhs57U8w7
 3/o760V3SUfxWMl39uzFNWvzbi4rJVigQJKAtRCx86YsNDCOmwGGdCdWtKEtr7kTuATf
 Dg/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740631069; x=1741235869;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0yVVoncMUtyJrD71yPvbIabSZ+QZVXWPqdiViPaHHO8=;
 b=vZcEITjArJullhuzQTb4pof4DCwj/MAUsja48LyVBfENoKASu2ucVbmyQ5bQqdSNrg
 WXbbcm5Hu0uFsdAwuiz0OTggIcNYOg4ZB1b8GzEY+A9YlCluOPMG/qH0A8cfOcRHzWp/
 jqJvJH0pQVk5L6F8ImMC6Iq8jFVNrAwDWNGBsFJ7A22l95Vhk33mUdJQtvUS47Yu4DU7
 KOwDaWYx0IeTCb1Diz0PVf/BJqnxophu8Z8hVNJR7Pd8AV06rb4HwbEbHRgk1xp9mpN7
 Nnn0utGNNE/CjoHP1OHi1DTxaxGAqtsprgUPkadnOnPUUyjcEsgZIg2mZCXTUbcq4Epy
 tcpw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVSf2eGFErVIZmNRomX660mxKw3dWpsDDoNLqTTR9gs3UbRN5dsOwxtoOEe0mMbggb0AS+PHnsIaFA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxhjFKL/RB0vewX332xQRg5RjtvU2m0k5s3M1Tkh+mZC9mRO366
 ekcQejZJ2ECjEB+CMcGL1UCZWskSWTvvq04ztz1GeUgPh2esK0YypcMXuz6tY88=
X-Gm-Gg: ASbGncuoHyQ8DRAuUyJkiR1QJTpBtG/O2w36bPJCdz7CBSXNC1wrImt18sGA2XfY7MX
 Pr7XSIftRWC+EZ8C9K+pO+qNdxIslSIVhzce4ShYfMUxxwjENK9vkFpVFP7z+FfaVdLE9m8eBxp
 HCDzhFSCyo9Jf009tGugdRLwpzwT/R/koekS5zibYGKvZJV9+cqzHSdAQ9iJSYxtFJA6XU4AZxY
 RiWKNUZMbit1LTH8tmDdhNr/pP3nU6kYwIzinrbmnIrWqYLfku4IX6T9PfK7KOI46dhxYGa1pPW
 mRNYcUINoDwxeBbskQn7Bmi+wqNwS6M3sgg9mp4+Ww==
X-Google-Smtp-Source: AGHT+IHhHacgUFUOWqaFKwGeZCIyQGRHzXtNQqLQR6DH/wWVs2+qKt/6fID2W1fIzlPqkwNrqTa2aQ==
X-Received: by 2002:a05:6512:2814:b0:545:60b:f38c with SMTP id
 2adb3069b0e04-548510ed080mr5489768e87.41.1740631068697; 
 Wed, 26 Feb 2025 20:37:48 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.90])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-549443ccf45sm63485e87.229.2025.02.26.20.37.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Feb 2025 20:37:47 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] drm/msm/dpu: Simplify using local 'ctl' variable
Date: Thu, 27 Feb 2025 06:37:26 +0200
Message-Id: <174063096235.3733075.7263678647140432875.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250114155959.583889-1-krzysztof.kozlowski@linaro.org>
References: <20250114155959.583889-1-krzysztof.kozlowski@linaro.org>
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


On Tue, 14 Jan 2025 16:59:59 +0100, Krzysztof Kozlowski wrote:
> In few places we store 'phys_enc->hw_ctl' to local 'ctl' variable so use
> it everywhere.  No functional change.
> 
> 

Applied, thanks!

[1/1] drm/msm/dpu: Simplify using local 'ctl' variable
      https://gitlab.freedesktop.org/lumag/msm/-/commit/629ac9f0a68c

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

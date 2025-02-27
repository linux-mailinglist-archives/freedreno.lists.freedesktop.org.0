Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AF18A47499
	for <lists+freedreno@lfdr.de>; Thu, 27 Feb 2025 05:37:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02A0A10EA2E;
	Thu, 27 Feb 2025 04:37:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="kEkxzLyq";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BC8810EA35
 for <freedreno@lists.freedesktop.org>; Thu, 27 Feb 2025 04:37:54 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-548878c6a5aso499078e87.3
 for <freedreno@lists.freedesktop.org>; Wed, 26 Feb 2025 20:37:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740631073; x=1741235873; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=jQXAVAgDJ6BKpu5knilW0G0eInEdBbGOYFBZny+389w=;
 b=kEkxzLyqhdOix8fsPle9Jwfu8PbMCLVZaeoVAZ6AU5BZrBewRjpqxaUZw63wb0e4iM
 kYdHEXnpIfFg7MMPM7kpvD9AvE1Nbd7Eiz8JxGT6QFFLX3jjkgDG4c022G+o2vap3WnH
 ZQ9ujelmTvDUeRG87k5h3MO4ll3hVaTlyDg+avJUqpHhbV49EAmMvASOOzayT6R+2kd3
 ZUN4G85T5/7snLP0dIXM5wyYoge2KsK1E/FXB+qiS+gS8wa7vCeOUZ+f8SQ7W9lAJVUC
 6zol/xUX71UmWGffojeYN4dcJLw0sroQb2QU4fW4HvE77OlhAW//fm+b3QfC2U7JuJ1q
 dtaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740631073; x=1741235873;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jQXAVAgDJ6BKpu5knilW0G0eInEdBbGOYFBZny+389w=;
 b=Uf878tI7PD+Ac7pCR6pGL8LodP3SYra4OG9OUhXgagsOFHIaG5NqoQ7scATOosJkyn
 E4LRIKiRp4Yem7qcJ7sYRRhq4N7fT9cCkylP1NQjSkNkWyBxFne/O+5Cu8Js6MtIC6D8
 1MnpqA+4T1b5NKCvojp5AljhBt8zMMv9m29i5dvYNGZWDwR+fqjtDyc9CpVyOZPjb2p3
 xtjbgAFriQcEAe/pV+xJy3HdJWLyULrUXPI73goKl9xSQqDDYTSaCTOFkufeEilT1X0M
 Z0e5dxBDwXbzqrEmRMuzpXNSGfY3P0kGMvgpP9bekNeyRBrl1aks1zfQRpot6BkcIuex
 cLzg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUtqz9HfUR+QyTyKfSVpEeJC5z1xjrf0UTInU+35FJ6rauPkCHTEkpyHkdoxB/A2s+anrMGS8pF99s=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy0MeFSSL9RK+yB7e5XqWEaNRirxpZTLCNlgJ51D835vl4wNRCP
 x2DF0tiDqgfug9SlVmmsSsMONyH/zo5VXUkT/R4qYVy1yXaVqMyi95P38PamRFU=
X-Gm-Gg: ASbGncsmkWE17jKbL85NNYvRmXz/2PiKck03t80zpbeiHuPk5KEoCsWyuq4Fp4cekj2
 XKzO6122IhWwPr7ViUedDC0ntiaA++8DR1htc3LT6f3ODWCQFLiOBcFdCzNWUcmGmiXMPQP2YBy
 bF5GbbIjcy5Qgjj5E5zyyK6znVNGYFmIEM0ivL3sHcfX1GZ8QcVebTPMIGP8LxRR2wGSvxcvdk5
 sdt8OK+Mbz3w3iJQpmFqxYbor0G2/K3RpDECY/RHEIvELb6J2dQui+bW0fmxdfSDYJRpDKruF7k
 5hF7Y+erS5lH/vG/7ix4cSXrhpBlIExpBQB9sxx4CQ==
X-Google-Smtp-Source: AGHT+IE/BaugbmI5byqUClykJvO63QUq6xSxLwwkVKoSd9babs5cKTzcwdFko7WC+SL5Xw2OEWmMdQ==
X-Received: by 2002:a05:6512:31c9:b0:545:981:1bc4 with SMTP id
 2adb3069b0e04-548392598d7mr10071939e87.38.1740631072721; 
 Wed, 26 Feb 2025 20:37:52 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.90])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-549443ccf45sm63485e87.229.2025.02.26.20.37.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Feb 2025 20:37:51 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH RFC] drm/msm/dsi/phy: Program clock inverters in correct
 register
Date: Thu, 27 Feb 2025 06:37:28 +0200
Message-Id: <174063096232.3733075.4572201293177555361.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250129115504.40080-1-krzysztof.kozlowski@linaro.org>
References: <20250129115504.40080-1-krzysztof.kozlowski@linaro.org>
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


On Wed, 29 Jan 2025 12:55:04 +0100, Krzysztof Kozlowski wrote:
> Since SM8250 all downstream sources program clock inverters in
> PLL_CLOCK_INVERTERS_1 register and leave the PLL_CLOCK_INVERTERS as
> reset value (0x0).  The most recent Hardware Programming Guide for 3 nm,
> 4 nm, 5 nm and 7 nm PHYs also mention PLL_CLOCK_INVERTERS_1.
> 
> 

Applied, thanks!

[1/1] drm/msm/dsi/phy: Program clock inverters in correct register
      https://gitlab.freedesktop.org/lumag/msm/-/commit/baf490728777

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

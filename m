Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 32C91803E6E
	for <lists+freedreno@lfdr.de>; Mon,  4 Dec 2023 20:34:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D15AF10E206;
	Mon,  4 Dec 2023 19:34:23 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B60CE10E206
 for <freedreno@lists.freedesktop.org>; Mon,  4 Dec 2023 19:34:20 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-50bf69afa99so1809948e87.3
 for <freedreno@lists.freedesktop.org>; Mon, 04 Dec 2023 11:34:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701718459; x=1702323259; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eR9FOP7osfeybp7nocEf0/oeWGeApIfG0zb/HJjjao0=;
 b=oNiKiQ5kkFdeYhE8ye8uuywLDMZxb1abHvTkAevVs2lMLqRuo31l9HLE6FrcNEzCwO
 P9XRPooIfvuqmFU4831hSWwSzlQjEiHK8IMxX/A+31BxIurKyEz6voYBsaGtKZV1pL57
 Wek5ze/qa9cv9WKaJPVIUmFvPx8IkVA1L5f4TLU1mfZjx7bobgXD+MFdE6s26dJtTLQ2
 6CaHe+S5Y2h14/kLrdSzEvyD/4t4Q6dbZtMV79pw9w4Sh0b4o6sUqhpBQouvdwe8GDTD
 P7Ju7u+UJNkoroprOXjf7hjkDcvBjDIcIa35rir2NSrtK5JcASk8lVHZkSFWcRQoFhfU
 K2bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701718459; x=1702323259;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eR9FOP7osfeybp7nocEf0/oeWGeApIfG0zb/HJjjao0=;
 b=ifS25BNc5G2WOFX1YTMyzYuPGGERIjiUL0OfntZrLlsOiPhhkDNJcqJOTqVbzH2eJL
 EKdlYm/8dbqIgyCSNrp3YMmRpglNZ5N2SmwN7ahJUZJFNGQC3xP/mCGVwdC2V1WJpUUA
 or1YGRfrWfdDgPADFOuv2Q4Lrd9IECAfPY7xAtLuadi7BzVSjptxapWO+anihN/Le/Xs
 lzW/PgdUCkqD+zsoyxwmofyXvFBGW7DIVO/W1IkSmVWgShTCf628+Sozk4O3KUmb3xfG
 UI5YNUNLccYvPAGfRzwlogV4K10xIWUj3/qBwVcFYoRMdqfL+RyYHBsg9VFZ7s0aPwFX
 /ONg==
X-Gm-Message-State: AOJu0Yx8dA/iJTfu6VCYsExx82morLjA4Bz4MkQ3LUYx1Xb5Et1IGusm
 0Ksfds1UYOV15ZupcmY8i3KAGQ==
X-Google-Smtp-Source: AGHT+IHOmXl4JU0d0Bxq4l5fPTOsy3vUVBtyOQtd7qdMhfNrKvXx/vrAWXI5B2yerw2W4IfVhw+6EQ==
X-Received: by 2002:a05:6512:2803:b0:50b:f913:c338 with SMTP id
 cf3-20020a056512280300b0050bf913c338mr1436639lfb.16.1701718458839; 
 Mon, 04 Dec 2023 11:34:18 -0800 (PST)
Received: from eriador.lan (dzdqv0yyyyyyyyyyyykxt-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::227]) by smtp.gmail.com with ESMTPSA id
 j15-20020a056512344f00b0050be956ade1sm777798lfr.278.2023.12.04.11.34.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Dec 2023 11:34:17 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon,  4 Dec 2023 21:34:16 +0200
Message-ID: <170171844607.100324.5132284596400452217.b4-ty@linaro.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231204131455.19023-1-dmitry.baryshkov@linaro.org>
References: <20231204131455.19023-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] [PATCH 0/7] drm: revert solid fill support
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
Cc: linux-arm-msm@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 freedreno@lists.freedesktop.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Mon, 04 Dec 2023 15:13:47 +0200, Dmitry Baryshkov wrote:
> Altough the Solid Fill planes patchset got all reviews and
> acknowledgements, it doesn't fulfill requirements for the new uABI.
> Merging it was a fault of mine.
> 
> It has neither corresponding open-source userspace implementation nor
> the IGT tests coverage. Revert this patchset until userspace obligations
> are fulfilled.
> 
> [...]

Applied to drm-misc-next, thanks!

[1/7] Revert "drm/atomic: Loosen FB atomic checks"
      commit: 1c0a80f160965c88f16e73ff69015db2f044c486
[2/7] Revert "drm/atomic: Move framebuffer checks to helper"
      commit: b881ba8faa5c7689eb1cb487ad891c46dbbed0e8
[3/7] Revert "drm/atomic: Add solid fill data to plane state dump"
      commit: a513f095b941e9e96196f04f11f253d763310c08
[4/7] Revert "drm/atomic: Add pixel source to plane state dump"
      commit: fe28421d4fedb90cadcef4932be0e8364f79283d
[5/7] Revert "drm: Add solid fill pixel source"
      commit: 5fb1ad3f5725c5c4d1a0c24ba4f82f239dc6878d
[6/7] Revert "drm: Introduce solid fill DRM plane property"
      commit: e5fba1ada1c1d676438138d815acd8f427a1eaf0
[7/7] Revert "drm: Introduce pixel_source DRM plane property"
      commit: 90422201f8f2b4e26ab7bd43b92786a11c1ffebf

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

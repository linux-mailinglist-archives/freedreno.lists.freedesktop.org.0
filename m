Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42CC9A47491
	for <lists+freedreno@lfdr.de>; Thu, 27 Feb 2025 05:37:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C978710EA29;
	Thu, 27 Feb 2025 04:37:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="C+klNGWk";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05A1010EA26
 for <freedreno@lists.freedesktop.org>; Thu, 27 Feb 2025 04:37:43 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-545fed4642aso475629e87.0
 for <freedreno@lists.freedesktop.org>; Wed, 26 Feb 2025 20:37:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740631061; x=1741235861; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zLdVuzI2TCYgAh/XWLKAjlWKrpOk/yX1LLIu0K4lYkg=;
 b=C+klNGWk221TZ8whcQGxma65TNktBoefXYpQAUcROKnqmjdplgD3D9iNTj7eza6VeR
 gTPT5qgw3CA5scDofsyCO9d8PmYqfpdFs5/pP6LltK0w+E8qHyHYj2/MXoNClT2Rmc0H
 XoTH5rFRBf8pcAljImTV384G68qBZt5cwGft2f1XlNou0CAkPyKkfL4sl+GWKyaV5h5X
 sfnL3HgMxRPvQG782lgI8g9l+Vqe4s2FgwKpFxw0XQfejXCxiJwK9cb+VIOktgWNRUT6
 U1TcrSR21BoKbiIk+o6+0knqMDxqTfJ8I1V5z2cHFiSRiobGlrKd++vMpEne0jfo/7jT
 Pi1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740631061; x=1741235861;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zLdVuzI2TCYgAh/XWLKAjlWKrpOk/yX1LLIu0K4lYkg=;
 b=X6sGacLN7A8Bi/GxuPJyrl2hwkqY7JFAjfIgdGaT9wgmuRYXfUHQQfVm3SbJX6Womg
 Rm/BNEG/4G9Id1xShXVE4EaZA3fs++CorGRf36dKuO3eVV7UE1eigCEsw7uRjVqbF7EA
 3Z4KDeAM0Ctr1WcC+Yi/7v+aVSBrZPprEsxIr/l4XXRQNslW44E65cSlykg8cvAni1Wt
 lcGKFTwvW0fSwYu6OoG6wG78lTA5irdeyD2eCs0fjjA36cSREqYtIb5pK7FACN06f3vf
 56/xU9MAeZDnJHcVmTeJJueAPqHMgAqX26iRwcKZQeNQNQHk9eayfu65bTDJMonrFkmb
 xwLA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVM7y7PG88Fc+L8MC8eRjJXi7ENdxlZFkvTV1XXUVAKudBpaSue6zWJEmRfo6VMiQKW5IvyzWdFXAA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxZoxqG/Mxk0ssEGbAKM3it+rnFF2HfcdHIPo/F7P1ea9Yk7dVy
 HPqQCH7N13WfkFIAoXKvd5c8G3Nfja70HY89wVp1g6Nao/y22gKh4exMZuMfTiE=
X-Gm-Gg: ASbGncszxFuVD7FXA/rExAWG/4Oq0xsHa6FpR2UsdosT5uiVEPzMFzWHTyMurrrikxr
 sQ4KO5JMLy5wyGo8FpyalLs6+02jyou/rcZhuHBlTbp5hNqEpM3jwgrUcwwY2jQ9eXxegzEPMrw
 /oK2YvtYo7HEAxF+B0ncNWgOW5BF2RO6YkoQDvd9+vvlTrebEri9PzmNOu0pLi018YRT4Z2B2W9
 hsXm+KZNl8qzZHe8cOrpbMXsLDtn/7wfpquxHeP4adbqM+sxOGOmxx8h82S0jEpVyrpuuSGa2AZ
 OftUMZAQKNJx6Bc8zvzTWBuSv/Ggv5qt3HrmWS0KfQ==
X-Google-Smtp-Source: AGHT+IGacFctMBxLdHDN1tWIihRZ45naAvEO/U64ZOz8X8unMaO6oCxI4XQ+wFwgv3egNhj+8j8tPA==
X-Received: by 2002:a05:6512:10d4:b0:545:ae6:d740 with SMTP id
 2adb3069b0e04-54838f4c919mr10727963e87.41.1740631061326; 
 Wed, 26 Feb 2025 20:37:41 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.90])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-549443ccf45sm63485e87.229.2025.02.26.20.37.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Feb 2025 20:37:40 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Chandan Uddaraju <chandanu@codeaurora.org>,
 Jeykumar Sankaran <jsanka@codeaurora.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Sravanthi Kollukuduru <skolluku@codeaurora.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Archit Taneja <architt@codeaurora.org>,
 Rajesh Yadav <ryadav@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, Simona Vetter <simona.vetter@ffwll.ch>
Subject: Re: [PATCH v2 0/4] drm/msm/dpu: follow rules for
 drm_atomic_helper_check_modeset()
Date: Thu, 27 Feb 2025 06:37:23 +0200
Message-Id: <174063096234.3733075.6920964252450515341.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250123-drm-dirty-modeset-v2-0-bbfd3a6cd1a4@linaro.org>
References: <20250123-drm-dirty-modeset-v2-0-bbfd3a6cd1a4@linaro.org>
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


On Thu, 23 Jan 2025 14:43:32 +0200, Dmitry Baryshkov wrote:
> As pointed out by Simona, the drm_atomic_helper_check_modeset() and
> drm_atomic_helper_check() require the former function is rerun if the
> driver's callbacks modify crtc_state->mode_changed. MSM is one of the
> drivers which failed to follow this requirement.
> 
> Rework the MSM / DPU driver to follow the requirements of the
> drm_atomic_helper_check_modeset() helper function.
> 
> [...]

Applied, thanks!

[1/4] drm/msm/dpu: don't use active in atomic_check()
      https://gitlab.freedesktop.org/lumag/msm/-/commit/25b4614843bc
[2/4] drm/msm/dpu: move needs_cdm setting to dpu_encoder_get_topology()
      https://gitlab.freedesktop.org/lumag/msm/-/commit/7d39f5bb82c0
[3/4] drm/msm/dpu: simplify dpu_encoder_get_topology() interface
      https://gitlab.freedesktop.org/lumag/msm/-/commit/41921f231abf

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

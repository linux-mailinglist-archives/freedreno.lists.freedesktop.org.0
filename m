Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2839FA446C9
	for <lists+freedreno@lfdr.de>; Tue, 25 Feb 2025 17:49:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F24A010E763;
	Tue, 25 Feb 2025 16:49:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="eoRX8dAK";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9160B10E763
 for <freedreno@lists.freedesktop.org>; Tue, 25 Feb 2025 16:49:39 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-546210287c1so5921835e87.2
 for <freedreno@lists.freedesktop.org>; Tue, 25 Feb 2025 08:49:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740502178; x=1741106978; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0mgWZibQMuHj44S/S8PoDTRgBr00ghmQvGRAk6+vKs4=;
 b=eoRX8dAKzZZXlynfyIAwCHv7NDiGxATa1HbDJ0Cf7qm7qDe1AdRjOEt3+PT6xz8ROX
 tVEPpXq7AK7diZFRjebygpSLc59tLee0smwdRtKYMqEiS6sW//RjPtgvRpOOkvEhY3mW
 +EGKy4cDvAxASbAnrM4SpjV31YlH/USmnS+yPJbqvwaW6Ki6TwmxsFv3+NMGY54nlKCd
 zbGBL6B674Y7WwgL1v7miwocs3aP3n4p/892tg/p2G2C01Di8Ghzf0+Ifq3mjA9ScDGI
 g/LQU5T1rijBQan5nfnMWj9agdAjuTpgsrDsd8OtS7/h8RK0xhbAH6AvvLy0/igjXaz1
 qBhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740502178; x=1741106978;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0mgWZibQMuHj44S/S8PoDTRgBr00ghmQvGRAk6+vKs4=;
 b=ndWOZ19g0qTzyRiie1wUpsseEVb+NKzC7dClXd2H0QYw9lePXk6o1l7zKVX4B2tA2s
 ftdAAXY6PYtdFH0Uhw6tOyoESCF22r0ZUfW3xqwIqgnvHY97IjCchwGhu1n5DvIqpHGE
 46fEPYIavXA+W5+gjDm+VIwX9PGrSEHru9JDf/3Q7g8DhKtEIWldUHCGOPSkeRPEqkVe
 RglQIqGYMhgzbKx37Kodry/7etx28MrXMVP6q3CXYOE98CkWNnZsNkEmATONMLd4Jmkh
 0bVKWoHMIFFTbKn6cpL4JD2rOr78xwZ59T5mW7/ysClojGhEkcdCyhgiwzQIYXP55zz5
 hq7A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUQASZ9VDsuw2nR4Ko8JhHlIeUT9PWFy2NU6AOyKm0UvO4CmXZoPS0Q+WYZBSIig0QaIfMzOUNukiE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwbTf2ZfF9lZbcYkIn2UmXJao/+GmW99goSj8udTLB+CZSmj95n
 Us9iUMIC0ffVm/TrpdUEXhummRU3hVTue2QbLqM1K36HzRUheaGZlHuxmlVd+m8=
X-Gm-Gg: ASbGnctKwVy9yqlZeil4uDpBA5+BHysA77W9IH5E8v2iwHrxjs9X4LGMVUDhtDqOc0Q
 BWfSrkCLg0VwETLBlGUFM/zTyHifDEWui9kT4+9/pLhAvK0FxpcUh9527GsvCMcW0G6cmereluX
 0jkXOq7uWRpIaqEGihW3EHT7QAFpjXL8gh50WYnxYd6D9cfxJYNJv56AN/TpfOHczokAo9SvOlU
 weNRxfEugvEoE/iaB5/zlU0OYe4hnO/xG4VNxtvdRm+zhLH+uMN5iS+2AAs3s+CyGN+WkCNMoSY
 zPsgu9uPM7+QkJqCouu4JsLsunP4rCnoN4N+x400MKejcPTNrrUqjPMVp9pLAfQHT2qwow==
X-Google-Smtp-Source: AGHT+IFORbfzYSemq6WfOCUglMYdhzTg71XD6K2L6XeaH8kQIvUGNHFObPzSD2MUJfic2yxCajAruA==
X-Received: by 2002:a05:6512:b0a:b0:545:1d96:d701 with SMTP id
 2adb3069b0e04-548392598eamr7478215e87.36.1740502177754; 
 Tue, 25 Feb 2025 08:49:37 -0800 (PST)
Received: from eriador.lan (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00::7a1]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-548514b25e6sm220407e87.7.2025.02.25.08.49.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2025 08:49:37 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Karol Herbst <kherbst@redhat.com>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@redhat.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Abel Vesa <abel.vesa@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Johan Hovold <johan@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, Johan Hovold <johan+linaro@kernel.org>,
 Imre Deak <imre.deak@intel.com>
Subject: Re: [PATCH v5 0/4] drm/dp: Rework LTTPR transparent mode handling and
 add support to msm driver
Date: Tue, 25 Feb 2025 18:49:35 +0200
Message-ID: <174050217098.2377948.2211237197268827323.b4-ty@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250203-drm-dp-msm-add-lttpr-transparent-mode-set-v5-0-c865d0e56d6e@linaro.org>
References: <20250203-drm-dp-msm-add-lttpr-transparent-mode-set-v5-0-c865d0e56d6e@linaro.org>
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

On Mon, 03 Feb 2025 12:57:55 +0200, Abel Vesa wrote:
> Looking at both i915 and nouveau DP drivers, both are setting the first
> LTTPR (if found) in transparent mode first and then in non-transparent
> mode, just like the DP v2.0 specification mentions in section 3.6.6.1.
> 
> Being part of the standard, setting the LTTPR in a specific operation mode
> can be easily moved in the generic framework. So do that by adding a new
> helper.
> 
> [...]

Applied to drm-misc-next, thanks!

[1/4] drm/dp: Add helper to set LTTPRs in transparent mode
      commit: 5e7715478c273e5b17b08942182bc0350b7ef3a6
[2/4] drm/nouveau/dp: Use the generic helper to control LTTPR transparent mode
      commit: 226a0baf9098841ceb92ab7804a07426540663c7
[3/4] drm/i915/dp: Use the generic helper to control LTTPR transparent mode
      commit: 6dcc3c5121b72c3633592db761e76083cf7623a3
[4/4] drm/msm/dp: Add support for LTTPR handling
      commit: 72d0af4accd965dc32f504440d74d0a4d18bf781

Best regards,
-- 
With best wishes
Dmitry

